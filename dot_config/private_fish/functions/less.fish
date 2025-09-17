function less
    if test (count $argv) -eq 0
        echo "less: missing filename"
        return 1
    end

    set file $argv[1]

    if not test -f "$file"
        echo "less: file '$file' not found"
        return 1
    end

    # Lowercase file extension
    set ext (string lower (path extension $file))

    # Use fx for supported structured formats
    switch $ext
        case '.json' '.yaml' '.yml' '.toml'
            fx "$file"
            return $status
    end

    # Heuristic check for structured data (likely JSON/YAML/TOML)
    set first_line (head -n 1 $file | string trim)
    if echo "$first_line" | string match -qr '^\s*[\{\[]'
        if fx "$file" >/dev/null 2>&1
            fx "$file"
            return $status
        end
    end

    # Fallback to ov
    ov $argv
end
