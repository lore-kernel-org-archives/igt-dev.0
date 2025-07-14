Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CFC83F21
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 12:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5641310E17A;
	Mon, 14 Jul 2025 12:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXggN72s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AA610E17A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752494401; x=1784030401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uflDG+8ldjGdkKQPjCWzH/N7cUU3/LMygg5suKWwRqE=;
 b=gXggN72sPSF3ZuJMiFG2t2qG58Mofkx0qMSP2dQR+0evES2jbuNtJyB5
 zasDrakket+TZGz/LCtbxk7oTM/mNSa/QIWqhkpSDFOCBKBrJki9Bsgyr
 XtO1Lx8GbMBu7p8H9Anb/a3WyzXyswu4GFwAKtRhJRSB90kKNn55bAv+9
 qAcDXyRjCPq7L5orcf8sdxfZaWXICas0fS/eLVNEBQxs2YuU8bO+TGanx
 +Tx1IjIwa0xbmjEFmyPEQK5NoETqQDazIw9Ax/7ZCZRD4SKe7ADSAG49T
 3XM6WJ5ZfJG3FeUChvUESmuy2UtU4GPyhzutpudQyofhdJJamMYSCfkMH A==;
X-CSE-ConnectionGUID: oyYeaCEuQOaEywMeCYB4/g==
X-CSE-MsgGUID: lSMcCSIMSiuFb1PBo75H3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77220231"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="77220231"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 05:00:01 -0700
X-CSE-ConnectionGUID: 29nIWCbWRxubHCE5un2GWQ==
X-CSE-MsgGUID: sHrA+YC0Qsa9VQALjjaBoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156333446"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:59:59 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v1 1/2] RFC /scripts/bash-autocomplete: Create bash
 autocompletion scripts for tests
Date: Mon, 14 Jul 2025 12:01:29 +0000
Message-Id: <20250714120130.464545-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714120130.464545-1-jan.sokolowski@intel.com>
References: <20250714120130.464545-1-jan.sokolowski@intel.com>
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

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../install_completions.sh                    | 47 +++++++++++++++++++
 .../uninstall_completions.sh                  |  9 ++++
 2 files changed, 56 insertions(+)
 create mode 100755 scripts/bash_autocompletion/install_completions.sh
 create mode 100755 scripts/bash_autocompletion/uninstall_completions.sh

diff --git a/scripts/bash_autocompletion/install_completions.sh b/scripts/bash_autocompletion/install_completions.sh
new file mode 100755
index 000000000..40cc87403
--- /dev/null
+++ b/scripts/bash_autocompletion/install_completions.sh
@@ -0,0 +1,47 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+# Copyright © 2025 Intel Corporation
+# Author: Jan Sokolowski <jan.sokolowski@intel.com>
+
+__generate_completion() {
+
+cat <<EOF > $1
+_$1()
+{
+	local cur prev words cword
+	_init_completion || return
+
+	case \$prev in
+		--run-subtest | --dynamic-subtest)
+			local IFS=$'\n\b'
+			LIST_OF_TESTS="echo -e \`/usr/local/libexec/igt-gpu-tools/$1 --list-subtest\`"
+			COMPREPLY=(\$(compgen -W "\$LIST_OF_TESTS" -- "\$cur"))
+			return
+			;;
+		--device)
+			COMPREPLY=(\$(compgen -o nospace -W "sys: pci: sriov: drm:" -- "\$cur"))
+			;;
+	esac
+
+	if [[ \$cur == -* ]]; then
+		COMPREPLY=(\$(compgen -W '\$(_parse_help "/usr/local/libexec/igt-gpu-tools/$1")' -- "\$cur"))
+	fi
+
+} &&
+complete -F _$1 $1
+EOF
+
+cp $1 /usr/share/bash-completion/completions/
+
+}
+
+mkdir /tmp/igt-gpu-tools-bash-completion-installer
+cd /tmp/igt-gpu-tools-bash-completion-installer
+
+for TEST in `find /usr/local/libexec/igt-gpu-tools -type f | grep -v intel-ci-tests | rev | cut -d'/' -f1 | rev`;
+do
+__generate_completion $TEST
+done
+
+cd -
+rm -rf /tmp/igt-gpu-tools-bash-completion-installer
diff --git a/scripts/bash_autocompletion/uninstall_completions.sh b/scripts/bash_autocompletion/uninstall_completions.sh
new file mode 100755
index 000000000..26345d6e2
--- /dev/null
+++ b/scripts/bash_autocompletion/uninstall_completions.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+# Copyright © 2025 Intel Corporation
+# Author: Jan Sokolowski <jan.sokolowski@intel.com>
+
+for TEST in `find /usr/local/libexec/igt-gpu-tools -type f | grep -v intel-ci-tests | rev | cut -d'/' -f1 | rev`;
+do
+rm /usr/share/bash-completion/completions/$TEST
+done
-- 
2.34.1

