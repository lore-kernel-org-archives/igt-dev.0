Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3DDF531CA
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47210E52D;
	Mon, 13 Apr 2026 20:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmeTzPpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BDE10E530
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776111469; x=1807647469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGpgB0RCnyU95xwnC/heIchk7Cu46yi5/XpDqSskGqw=;
 b=QmeTzPpnC9dS7Q4k3aplw8QXpLRSNK5/0CXytG9x+TrSeU+m0aw97CdO
 qgb6o4/EJLtFRuZa8le+2+6/JHeycVlEXuJZgrN8W/xddYLvw9wChL1WA
 zxhCgLCjheJjLEfOQ8genfC14Y6H+XFG/qHVHgUtQxJWCgrEWCNx8HfUQ
 +zD6Ygo7eVko6PYQJPkqlbUiPqTMZb/8lRK73Pi9pmgTGbpZA80+QpOvd
 +dJjVN42xNADm5dzy4iZcITzz0+SXKnWTftHwfBsGneLvE1t4L7QeoWCa
 0Fp+vGfytqcPnhWvyUQPeLKqTwaXf4bdMqTNPP/PnxeCogrcEqrJ324ij Q==;
X-CSE-ConnectionGUID: 52RBDBPIT/WFMr/aTlZfGg==
X-CSE-MsgGUID: ALjO0bf6QPOei6EdlXT+yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80918921"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80918921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:49 -0700
X-CSE-ConnectionGUID: LqwVA31qSiWjrWqZKXbiEg==
X-CSE-MsgGUID: kidlUbM7QiSekpMaHw9aJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229816446"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:48 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script and
 allowlist
Date: Mon, 13 Apr 2026 22:17:26 +0200
Message-ID: <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
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

We need to explicitly extract guc logs for failed tests so add hook
script which does it after subtest/dynsubtest execution. As copying to
attachments takes a lot of time do it only for failing subtests.

Adding this hook script to CI will extend execution time much and
using allowlist is necessary. Instead of allowlist argument in the
runner (previous attempt) now script filters such list on its own and
decides when to move forward and do some post-test actions. Such
approach is more flexible but moves decision to script what causes
it is more prone buggy.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
v2: install hook to datadir/hooks
v3: migrate allowlist from runner to script
---
 scripts/hooks/guc_copy.allowlist  |  2 ++
 scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++++++++++++++++
 scripts/meson.build               |  3 ++
 3 files changed, 52 insertions(+)
 create mode 100644 scripts/hooks/guc_copy.allowlist
 create mode 100755 scripts/hooks/guc_copy_on_fail.sh

diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_copy.allowlist
new file mode 100644
index 0000000000..04cb3f8298
--- /dev/null
+++ b/scripts/hooks/guc_copy.allowlist
@@ -0,0 +1,2 @@
+igt@xe_compute@compute-square
+igt@xe_exec_basic@once-basic@ccs0
diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_copy_on_fail.sh
new file mode 100755
index 0000000000..595cf5205e
--- /dev/null
+++ b/scripts/hooks/guc_copy_on_fail.sh
@@ -0,0 +1,47 @@
+#!/bin/bash
+
+# Hook script for copying guc.log.
+# Suggested usage with:
+# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook 'post-dyn-subtest:scripts/hooks/guc_copy_on_fail.sh'
+
+# Copy only for failed subtests as this is time-consuming
+if [ "${IGT_HOOK_RESULT}" != "FAIL" ]; then
+	exit 0
+fi
+
+# Process and copy guc logs only for those specified in allowlist
+ALLOWLIST="guc_copy.allowlist"
+scriptdir=$(dirname $(realpath $0))
+
+if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
+	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
+	exit 0
+fi
+
+cd "$IGT_RUNNER_ATTACHMENTS_DIR"
+
+# Look for allowlist in following places:
+# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
+# 2. Try in <scriptdir>
+
+if [ ! -z "$IGT_HOOK_ALLOWLIST_DIR" ]; then
+	ALLOWLIST_PATH="${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
+else
+	ALLOWLIST_PATH="${scriptdir}/${ALLOWLIST}"
+fi
+
+if [ ! -e "${ALLOWLIST_PATH}" ]; then
+	exit 0
+fi
+
+STNAME="${IGT_HOOK_TEST_FULLNAME}"
+echo "${STNAME}" | grep -q -f "${ALLOWLIST_PATH}"
+if [ $? -ne 0 ]; then
+	exit 0
+fi
+
+for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
+	attout=$(echo ${log:23} | sed -e 's/\//_/g')
+	mkdir -p "${STNAME}"
+	cp "$log" "${STNAME}/${attout}"
+done
diff --git a/scripts/meson.build b/scripts/meson.build
index 6e64065c5e..2ce961898d 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -15,3 +15,6 @@ endif
 igt_doc_script = find_program('igt_doc.py', required : build_testplan)
 gen_rst_index = find_program('gen_rst_index', required : build_sphinx)
 generate_iga64_codes = find_program('generate_iga64_codes')
+
+install_data('hooks/guc_copy_on_fail.sh', install_dir : datadir / 'hooks')
+install_data('hooks/guc_copy.allowlist', install_dir : datadir / 'hooks')
-- 
2.43.0

