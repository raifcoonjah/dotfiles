#!/usr/bin/env python3
import subprocess
import argparse
import sys
from pathlib import Path

def sync_files(sources, destination, options=None):
    """
    Sync multiple source paths to a single destination using rsync
    
    Args:
        sources: List of source paths
        destination: Single destination path
        options: Additional rsync options as a list
    """
    if options is None:
        options = ['-av', '--progress']  # Archive mode, verbose, show progress
    
    # Ensure all sources exist
    for source in sources:
        if not Path(source).exists():
            print(f"Error: Source path '{source}' does not exist")
            return False
            
    # Ensure destination directory exists
    dest_path = Path(destination)
    dest_path.mkdir(parents=True, exist_ok=True)
    
    # Build rsync command
    cmd = ['rsync'] + options + sources + [str(dest_path)]
    
    try:
        # Run rsync command
        process = subprocess.run(cmd, check=True, text=True)
        return process.returncode == 0
    except subprocess.CalledProcessError as e:
        print(f"Error running rsync: {e}")
        return False

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description='Sync multiple sources to one destination')
    parser.add_argument('sources', nargs='+', help='Source paths to sync')
    parser.add_argument('destination', help='Destination path')
    parser.add_argument('--dry-run', action='store_true', help='Show what would be transferred')
    
    args = parser.parse_args()
    
    # Build rsync options
    rsync_options = ['-rsvpP']
    if args.dry_run:
        rsync_options.append('--dry-run')
    
    # Perform the sync
    success = sync_files(args.sources, args.destination, rsync_options)
    sys.exit(0 if success else 1)

if __name__ == '__main__':
    main()
