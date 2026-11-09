#!/usr/bin/env bash
# WorkBuddy 技能一键安装脚本（macOS / Linux）
# 用法：bash install-skills.sh
set -e
DEST="$HOME/.workbuddy/skills"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$DEST"

echo "下载 awesome-openclaw-skills ..."
curl -sSL "https://codeload.github.com/sundial-org/awesome-openclaw-skills/tar.gz/refs/heads/main" -o "$TMP/aos.tar.gz"
tar -xzf "$TMP/aos.tar.gz" -C "$TMP"
for s in find-skills agent-browser skill-vetter ontology humanizer proactive-agent; do
  cp -R "$TMP/awesome-openclaw-skills-main/skills/$s" "$DEST/"
  echo "已安装 $s"
done

echo "下载 openclaw-all ..."
curl -sSL "https://codeload.github.com/AI-leowsir/openclaw-all/tar.gz/refs/heads/main" -o "$TMP/oca.tar.gz"
tar -xzf "$TMP/oca.tar.gz" -C "$TMP"
for s in self-improving-agent web-tools-guide; do
  cp -R "$TMP/openclaw-all-main/workspace/skills/$s" "$DEST/"
  echo "已安装 $s"
done

echo "下载 myskills（编程专家 Pro，约 90MB，稍等）..."
curl -sSL "https://codeload.github.com/guoqinchen/myskills/tar.gz/refs/heads/main" -o "$TMP/ms.tar.gz"
tar -xzf "$TMP/ms.tar.gz" -C "$TMP"
cp -R "$TMP/myskills-main/dev-expert-pro" "$DEST/"
echo "已安装 dev-expert-pro"

echo ""
echo "全部完成！9 个技能已安装到 $DEST"
echo "重启 WorkBuddy 后生效。"
