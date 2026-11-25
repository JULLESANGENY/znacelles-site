#!/usr/bin/env bash
set -euo pipefail

NS="znacelles-fr-33"
API="https://abacus.jasoncameron.dev/get/${NS}"
MONTH_KEY=$(date +"%Y_%m")
DAY_KEY=$(date +"%Y_%m_%d")

get_count() {
  local key="$1"
  local res
  res=$(curl -sL --max-time 5 "${API}/${key}" 2>/dev/null || echo "")
  local val
  val=$(echo "$res" | grep -o '"value":[0-9]*' | cut -d':' -f2 || true)
  if [ -z "$val" ]; then
    echo "0"
  else
    echo "$val"
  fi
}

echo "========================================================"
echo "📊 STATISTIQUES EN DIRECT — Z NACELLES (znacelles.fr)"
echo "📅 Date du relevé : $(date '+%d/%m/%Y à %H:%M')"
echo "========================================================"
printf "%-28s | %-10s | %-10s | %-10s\n" "Indicateur" "Aujourd'hui" "Ce mois" "Total"
echo "--------------------------------------------------------"
printf "%-28s | %-10s | %-10s | %-10s\n" "👀 Pages vues (visites)" "$(get_count "visites_${DAY_KEY}")" "$(get_count "visites_${MONTH_KEY}")" "$(get_count "visites_total")"
printf "%-28s | %-10s | %-10s | %-10s\n" "👤 Visiteurs uniques" "$(get_count "visiteurs_${DAY_KEY}")" "$(get_count "visiteurs_${MONTH_KEY}")" "$(get_count "visiteurs_total")"
printf "%-28s | %-10s | %-10s | %-10s\n" "📞 Clics appel (07 67...)" "$(get_count "appels_${DAY_KEY}")" "$(get_count "appels_${MONTH_KEY}")" "$(get_count "appels_total")"
printf "%-28s | %-10s | %-10s | %-10s\n" "📩 Demandes de devis" "$(get_count "devis_${DAY_KEY}")" "$(get_count "devis_${MONTH_KEY}")" "$(get_count "devis_total")"
echo "========================================================"
