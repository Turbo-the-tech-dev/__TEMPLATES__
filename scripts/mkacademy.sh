#!/bin/bash
# Usage: ./mkacademy.sh <AcademyName> [num_modules] [type]
# Example: ./mkacademy.sh JSON-ACADEMY 8 academy

NAME=${1:-New-Academy}
MODULES=${2:-8}
TYPE=${3:-academy}   # academy | tool | electrician

echo "🛠️  Creating $TYPE → $NAME ($MODULES modules)"

mkdir -p "$NAME"

# Main README
cat > "$NAME/README.md" << EOF
# $NAME

**Turbo Fleet Academy** — Official Learning Path

## Week Overview
| Module | Focus                  | Status |
|--------|------------------------|--------|
EOF

for i in $(seq -f "%02g" 1 $MODULES); do
  echo "| $i     | Module $i — Foundations | ⬜     |" >> "$NAME/README.md"
done

cat >> "$NAME/README.md" << EOF

## Quick Start
1. Clone this repo
2. Start with \`01-foundations/\`
3. Complete exercises → push solutions
4. Report feedback with \`gh issue create\`

## Structure
- \`0X-*/\` → Each module has README, exercises/, cheat-sheet.md
- Follow the standard template in __TEMPLATES__/academy-template
EOF

# Create modules
for i in $(seq -f "%02g" 1 $MODULES); do
  MOD="Module $i"
  DIR="$NAME/${i}-foundations"
  mkdir -p "$DIR/exercises" "$DIR/solutions"

  cat > "$DIR/README.md" << EOF
# ${i} — Foundations

## Learning Objectives
• 
• 

## Exercises
1. 
2. 

## Cheat Sheet
$(cat <<'CHEAT'
Quick commands / syntax reference
CHEAT
)

## Submission
Push your work to your fork → open PR or issue
EOF
done

echo "✅ $NAME generated with $MODULES modules"
echo "   cd $NAME && ls -R"
