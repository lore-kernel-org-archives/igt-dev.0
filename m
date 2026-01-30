Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0CAE6BF0B
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 13:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93B110E9E1;
	Fri, 30 Jan 2026 13:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQSe4JDM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A6D10E9E1
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769778422; x=1801314422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srvHhuOTOa6co+4M92I1j84pCGwOXlxez9UsTlLyDk0=;
 b=KQSe4JDMElP92H5zSbqbtSSCxkYJ1ZAEh8kJcY8PKVxxhI8uM5i9GZ9Z
 icIPeOUkhlAit/Rol96AMioX4PDZFUacghRKfE67cmx2rwaLamlnFUdto
 3cPAap+zsrRwntEqUxECUnZ+lgmQHRau4DG0zQW8N0od2g7wW8eC5LGk5
 DRaXLUqG328+yTfTnRexhYL0XAeSfm1s22y4nrfFawjU/JD+GTSMV8WcZ
 sH/q8wHKz4AQTU2cbYtL90XUzjeeMS2sfJnJUV48VUVh7EuMhWX19Klxr
 O6UZUZ8BFv3abVuqnfyphPbVlk0CSLYvYnG6s0Eglb3DLAq4UY+o/cWUe g==;
X-CSE-ConnectionGUID: Qfkta3EGTriqtgbLutHoEw==
X-CSE-MsgGUID: F1BD9GbESAa44LSdf4I8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71115132"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71115132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:07:02 -0800
X-CSE-ConnectionGUID: ddQkUxkgTL6edsMbeiKRNA==
X-CSE-MsgGUID: Otx/7mLZR8+MGZQ++v6OzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="246473477"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:07:01 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 1/1] RFC /scripts/bash-autocomplete: Create bash
 autocompletion scripts for tests
Date: Fri, 30 Jan 2026 14:11:22 +0100
Message-ID: <20260130131122.5655-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130131122.5655-1-jan.sokolowski@intel.com>
References: <20260130131122.5655-1-jan.sokolowski@intel.com>
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

To install: run 'make install-completions' after generating Makefile via
meson.sh.

To uninstall: run 'make uninstall-completions'.

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
.bashrc configuration, refer to distribution documentation.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 meson.sh                                      |  6 ++
 .../install_completions.sh                    | 85 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100755 scripts/bash_autocompletion/install_completions.sh

diff --git a/meson.sh b/meson.sh
index 1563a85b1..7f1f8b987 100755
--- a/meson.sh
+++ b/meson.sh
@@ -60,6 +60,12 @@ install: build/build.ninja
 uninstall: build/build.ninja
 	\$(Q)ninja -C build uninstall \$(quiet_build)
 
+install-completions:
+	./scripts/bash_autocompletion/install_completions.sh --local-install
+
+uninstall-completions:
+	./scripts/bash_autocompletion/install_completions.sh --local-uninstall
+
 docs:
 	\$(Q)ninja -C build igt-gpu-tools-doc \$(quiet_build)
 
diff --git a/scripts/bash_autocompletion/install_completions.sh b/scripts/bash_autocompletion/install_completions.sh
new file mode 100755
index 000000000..5aa739f2e
--- /dev/null
+++ b/scripts/bash_autocompletion/install_completions.sh
@@ -0,0 +1,85 @@
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
+	for ENTRY in `sed -n 2p $1/test-list-full.txt`;
+	do
+		TEST=`echo $ENTRY | rev | cut -f1 -d'/' | rev`
+		rm ~/.local/share/bash-completion/completions/$TEST
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

