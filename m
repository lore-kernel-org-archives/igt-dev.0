Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A94FF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 07:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418010EEAB;
	Wed, 29 Apr 2026 07:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvkRLEOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B8F10EEAB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777449056; x=1808985056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Blqt4Oc2hnE2kG7cdieFw4qr3AKaJMusyZH2Gg14DdI=;
 b=QvkRLEOt3inFcd0wU3y+bsSKT7866obnKVzzKrcYgf4UjylFjNB9bHm2
 lXI10IaUwAJa3cyU2+MrVM74Bo+fUHJFCk3L6GwW6qfQ7/8U6g2M5tOYe
 FBeJw2ZgBYP6aWUdAw23g2u/wJBvOHtMUNXFBsJks02IXW93iQOXxtiVi
 LwcIfaoviWIiucfrWF95qjNmxa2iD1h5hJE3jcjAFpbg7YVmcSig7KIW0
 gMUVQg++HHLlaL5mViPaW9mh5zOtW71a0NMEYFuPfOjMEVqC+pFTOevh3
 tO08cWUbHE8nDO6/flRAnxRIzsnALeMshKjWMM3Hz5NzU6rCTE19LTYSi w==;
X-CSE-ConnectionGUID: KIN/e8jDQt62B//fDhhLrA==
X-CSE-MsgGUID: ZahCKNGNQK2ve4FZmMMONA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78081432"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78081432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 00:50:56 -0700
X-CSE-ConnectionGUID: gWnpXVG/TBumj+9c/ajQIA==
X-CSE-MsgGUID: TcE66Fj/QzWSHmgUPUaWyg==
X-ExtLoop1: 1
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 00:50:53 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com, mika.kuoppala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 1/1] scripts/bash-autocomplete: Create autocompletion
 for tests
Date: Wed, 29 Apr 2026 09:56:37 +0200
Message-ID: <20260429075637.434026-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add installation and uninstallation scripts for bash autocompletion
for tests.

To install: run './meson.sh install-completions'.

To uninstall: run './meson.sh uninstall-completions'.

By default autocompletions are installed to
~/.local/share/bash-completion/completions and use
build/tests/test_list.txt directory as list of what completions
to install.

In order to install them as root to
/usr/share/bash-completion/completions, run
./install_completions.sh --install from scripts/bash_autocompletion
directory. It uses /usr/local/libexec/igt-gpu-tools/test_list.txt as
list of what completions to install.

Please note that these completions might be unavailable due to
.bashrc configuration, for example Ubuntu root does not
source bash_completion because it is commented out.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---

v2: applied nits from previous review and added reviewed-by.

---
 meson.sh                                      |  6 ++
 .../install_completions.sh                    | 88 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100755 scripts/bash_autocompletion/install_completions.sh

diff --git a/meson.sh b/meson.sh
index 1563a85b1f..e5fbdcc0cf 100755
--- a/meson.sh
+++ b/meson.sh
@@ -60,6 +60,12 @@ install: build/build.ninja
 uninstall: build/build.ninja
 	\$(Q)ninja -C build uninstall \$(quiet_build)
 
+install-completions: all
+	./scripts/bash_autocompletion/install_completions.sh --local-install
+
+uninstall-completions: all
+	./scripts/bash_autocompletion/install_completions.sh --local-uninstall
+
 docs:
 	\$(Q)ninja -C build igt-gpu-tools-doc \$(quiet_build)
 
diff --git a/scripts/bash_autocompletion/install_completions.sh b/scripts/bash_autocompletion/install_completions.sh
new file mode 100755
index 0000000000..88998ae66e
--- /dev/null
+++ b/scripts/bash_autocompletion/install_completions.sh
@@ -0,0 +1,88 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+# Copyright © 2025 Intel Corporation
+# Author: Jan Sokolowski <jan.sokolowski@intel.com>
+
+usage() {
+echo "install_completions.sh - creates bash autocompletion scripts for installed igt gpu tools tests."
+echo "Usage: "
+echo "--install : installs completions for installed /usr/local/libexec/igt_gpu_tools tests to ~/.local/share/bash-completion/completions"
+echo "--local-install : uses ../../build/tests as list of completions to install to ~/.local/share/bash-completion/completions"
+echo "--uninstall : uninstalls completions installed to /usrl/local/libexec/igt_gpu_tools from ~/.local/share/bash-completion/completions"
+echo "--local-uninstall : uses ../../build/tests as list of completions to uninstall from ~/.local/share/bash-completion-completions"
+}
+
+__generate_completion() {
+
+cat <<EOF > $1
+_$1()
+{
+	local cur prev words cword
+	_init_completion || return
+	case \$prev in
+		--run-subtest | --dynamic-subtest)
+			local IFS=$'\n\b'
+			LIST_OF_TESTS="\`\$1 --list-subtest\`"
+			COMPREPLY=(\$(compgen -W "\$LIST_OF_TESTS" -- "\$cur"))
+			return
+			;;
+		--device)
+			COMPREPLY=(\$(compgen -o nospace -W "sys: pci: sriov: drm:" -- "\$cur"))
+			;;
+	esac
+
+	if [[ \$cur == * ]]; then
+		COMPREPLY=(\$(compgen -W '\$(_parse_help "\$1")' -- "\$cur"))
+	fi
+
+} &&
+
+complete -F _$1 $1
+EOF
+
+}
+
+__install_completions() {
+	mkdir -p ~/.local/share/bash-completion/completions
+	cd ~/.local/share/bash-completion/completions
+
+	echo "Installing bash autocompletion scripts to ~/.local/share/bash_completion/completions"
+	for ENTRY in `sed -n 2p $1/test-list-full.txt`;
+	do
+		TEST=`echo $ENTRY | rev | cut -f1 -d'/' | rev`
+		__generate_completion $TEST
+	done
+	cd - > /dev/null
+}
+
+__uninstall_completions() {
+	cd ~/.local/share/bash-completion/completions
+	echo "Unnstalling bash autocompletion scripts from ~/.local/share/bash_completion/completions"
+	for ENTRY in `sed -n 2p $1/test-list-full.txt`;
+	do
+		TEST=`echo $ENTRY | rev | cut -f1 -d'/' | rev`
+		rm -f ~/.local/share/bash-completion/completions/$TEST
+	done
+	cd - > /dev/null
+}
+
+case "$1" in
+	"--install")
+		__install_completions "/usr/local/libexec/igt-gpu-tools"
+		;;
+	"--local-install")
+		__install_completions "$PWD/build/tests"
+		;;
+	"--uninstall")
+		__uninstall_completions "/usr/local/libexec/igt-gpu-tools"
+		;;
+	"--local-uninstall")
+		__uninstall_completions "$PWD/build/tests"
+		;;
+	"--help")
+		usage
+		;;
+	*)
+		__install_completions "/usr/local/libexec/igt-gpu-tools"
+		;;
+esac
-- 
2.43.0

