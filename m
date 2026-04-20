Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C1BF557EB
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 08:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C9610F4A6;
	Mon, 20 Apr 2026 08:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2ETNuAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0B410F4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776675431; x=1808211431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vmoDb1SQjNHCKP1h/vXPwNE436n/fzvpjreMs9a/nlY=;
 b=R2ETNuAzXbWkPD3hp+VctuFVHhZNQXA2eAquJlCuDQsxpxT3vhTZcwya
 UWawUG4HWImUOWs5vW0qSsViDur1ig8+8wFrJHQRDhoHGiN2cRv9LbhML
 MQeKZc0RhYhl6wB/x4dhEbvelu3fZJuFlZ1wrxhwrK32Mi28gtFBVCdWP
 ho94SzBIzkJIWhOkD7cwDOpR8pmWq9pQAkLdC205eDDWiX96Wy68E6Lln
 N83m0L1pe7DZpyadP80G3jmIuNQ9AwxKviMi0uBrIg7LWC9pr4GzCNOX4
 W4sk6toFARiJNmXsRipQniG27i6fkFZ0+yC2LWEU+tVdh0EheErgT0Yf7 w==;
X-CSE-ConnectionGUID: 0ehDWXHmRLe4GP7+w23uSQ==
X-CSE-MsgGUID: JG90dWiMRYybms3mMECTHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76613856"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="76613856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:57:10 -0700
X-CSE-ConnectionGUID: ktdn6P4STZu5d8WGLvd2Lg==
X-CSE-MsgGUID: 4T+n6iXlSKOcfNIi3JUMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231539696"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:57:09 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v4 3/4] intel-ci/hooks: Add hooks-wrapper and aux
 scripts/allowlists
Date: Mon, 20 Apr 2026 10:56:57 +0200
Message-ID: <20260420085653.2587750-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
References: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
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

CI currently lacks useful GuC logs when some tests are failing. For some
failed executions (not all as copying guc-log is time consuming) using
hook script which will copy it to attachments directory seems to be
simplest solution.

Add copy_guc_log_on_fail.sh script which copies GuC log when test/subtest
is failing. It requires an allowlist to specify for which tests hook
will copy GuC log. It is time consuming process so doing this for all
failed test would extend CI execution time too much.

Apart of this introduce hooks-wrapper.sh which might be main script for
executing hooks. Instead of adding --hook for each script separately it
may be used as a central point of hooks execution. It assumes it will
be executed after test/subtest completion - called hook scripts depends
on the IGT_HOOK_RESULT env var.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
v2: install hook to datadir/hooks
v3: migrate allowlist from runner to script
v4: adding hooks-wrapper.sh, helpers, etc
---
 tests/intel-ci/hooks/common.helper            | 47 +++++++++++++++++++
 .../hooks/copy_guc_log_on_fail.allowlist      |  2 +
 tests/intel-ci/hooks/copy_guc_log_on_fail.sh  | 24 ++++++++++
 tests/intel-ci/hooks/hook-example.allowlist   |  2 +
 tests/intel-ci/hooks/hook-example.sh          | 17 +++++++
 tests/intel-ci/hooks/hooks-wrapper.sh         | 12 +++++
 tests/intel-ci/meson.build                    | 11 +++++
 7 files changed, 115 insertions(+)
 create mode 100755 tests/intel-ci/hooks/common.helper
 create mode 100644 tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
 create mode 100755 tests/intel-ci/hooks/copy_guc_log_on_fail.sh
 create mode 100644 tests/intel-ci/hooks/hook-example.allowlist
 create mode 100755 tests/intel-ci/hooks/hook-example.sh
 create mode 100755 tests/intel-ci/hooks/hooks-wrapper.sh

diff --git a/tests/intel-ci/hooks/common.helper b/tests/intel-ci/hooks/common.helper
new file mode 100755
index 0000000000..a3f913f8e8
--- /dev/null
+++ b/tests/intel-ci/hooks/common.helper
@@ -0,0 +1,47 @@
+# Common helper for hooks executed from igt_runner
+#
+# Provide ALLOWLIST="..." as a default, it might be overwritten by --allowlist
+
+for arg in "$@"; do
+    case $arg in
+    --help)
+        echo "Usage: $0 [--help] [--allowlist <name.allowlist>]"
+        echo
+        echo "If name.allowlist is not passed default '${ALLOWLIST}' is used."
+        exit 0
+        ;;
+
+    --allowlist)
+        ALLOWLIST=$2
+        shift 2
+        ;;
+
+        *)
+        shift
+        ;;
+    esac
+done
+
+if [ -z "${IGT_RUNNER_ATTACHMENTS_DIR}" ]; then
+        echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
+        exit 0
+fi
+
+# Look for allowlist in following places:
+# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
+# 2. Try in <SCRIPTDIR>
+
+if [ ! -z "${IGT_HOOK_ALLOWLIST_DIR}" ]; then
+        ALLOWLIST_PATH="${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
+else
+        ALLOWLIST_PATH="${SCRIPTDIR}/${ALLOWLIST}"
+fi
+
+if [ ! -e "${ALLOWLIST_PATH}" ]; then
+        echo "Missing ${ALLOWLIST_PATH}"
+        exit 0
+fi
+
+if ! echo "${IGT_HOOK_TEST_FULLNAME}" | grep -q -f "$ALLOWLIST_PATH"; then
+        exit 0
+fi
diff --git a/tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist b/tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
new file mode 100644
index 0000000000..04cb3f8298
--- /dev/null
+++ b/tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
@@ -0,0 +1,2 @@
+igt@xe_compute@compute-square
+igt@xe_exec_basic@once-basic@ccs0
diff --git a/tests/intel-ci/hooks/copy_guc_log_on_fail.sh b/tests/intel-ci/hooks/copy_guc_log_on_fail.sh
new file mode 100755
index 0000000000..c44c9a5004
--- /dev/null
+++ b/tests/intel-ci/hooks/copy_guc_log_on_fail.sh
@@ -0,0 +1,24 @@
+#!/bin/bash
+
+# Hook script for copying guc.log.
+# Suggested usage with:
+# --hook 'post-subtest:tests/intel-ci/hooks/copy_guc_log_on_fail.sh' \
+# --hook 'post-dyn-subtest:tests/intel-ci/hooks/copy_guc_log_on_fail.sh'
+# or within hooks-wrapper.sh
+
+# Copy only for failed subtests as this is time-consuming
+if [ "${IGT_HOOK_RESULT:-FAIL}" != "FAIL" ]; then
+	exit 0
+fi
+
+ALLOWLIST="copy_guc_log_on_fail.allowlist"
+SCRIPTDIR=$(dirname "$(realpath "$0")")
+. "${SCRIPTDIR}/common.helper"
+
+cd "${IGT_RUNNER_ATTACHMENTS_DIR}"
+
+for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
+	attout=$(echo ${log:23} | sed -e 's/\//_/g')
+	mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
+	cp "$log" "${IGT_HOOK_TEST_FULLNAME}/${attout}"
+done
diff --git a/tests/intel-ci/hooks/hook-example.allowlist b/tests/intel-ci/hooks/hook-example.allowlist
new file mode 100644
index 0000000000..54cbc0a1d4
--- /dev/null
+++ b/tests/intel-ci/hooks/hook-example.allowlist
@@ -0,0 +1,2 @@
+igt@xe_exec_basic@once-basic@rcs0
+igt@xe_exec_basic@once-basic@ccs0
diff --git a/tests/intel-ci/hooks/hook-example.sh b/tests/intel-ci/hooks/hook-example.sh
new file mode 100755
index 0000000000..512e123567
--- /dev/null
+++ b/tests/intel-ci/hooks/hook-example.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+
+# Hook example, touch <testname>/current-date.txt in attachments dir
+#
+# Suggested usage with:
+# --hook 'post-subtest:tests/intel-ci/hooks/hook-example.sh' \
+# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hook-example.sh'
+# or within hooks-wrapper.sh
+
+ALLOWLIST="hook-example.allowlist"
+SCRIPTDIR=$(dirname "$(realpath "$0")")
+. "${SCRIPTDIR}/common.helper"
+
+cd "${IGT_RUNNER_ATTACHMENTS_DIR}"
+
+mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
+date > "${IGT_HOOK_TEST_FULLNAME}/current-date.txt"
diff --git a/tests/intel-ci/hooks/hooks-wrapper.sh b/tests/intel-ci/hooks/hooks-wrapper.sh
new file mode 100755
index 0000000000..263b81a8b7
--- /dev/null
+++ b/tests/intel-ci/hooks/hooks-wrapper.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+# Hooks wrapper
+# Suggested usage with:
+# --hook 'post-subtest:tests/intel-ci/hooks/hooks-wrapper.sh' \
+# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hooks-wrapper.sh'
+
+SCRIPTDIR=$(dirname "$(realpath "$0")")
+
+cd "${SCRIPTDIR}"
+./hook-example.sh
+./copy_guc_log_on_fail.sh
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 2b3266bbd9..4a04b6aef8 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -34,8 +34,19 @@ intelci_files = [
   'xe.wcl.core.blocklist.txt',
 ]
 
+hooks_files = [
+  'hooks/common.helper',
+  'hooks/copy_guc_log_on_fail.sh',
+  'hooks/copy_guc_log_on_fail.allowlist',
+  'hooks/hook-example.sh',
+  'hooks/hook-example.allowlist',
+  'hooks/hooks-wrapper.sh',
+]
+
 if meson.version().version_compare('<1.3.0')
   install_data(sources : intelci_files, install_dir : datadir)
+  install_data(sources : hooks_files, install_dir : datadir + '/hooks')
 else
   install_data(sources : intelci_files, install_dir : datadir, follow_symlinks : false)
+  install_data(sources : hooks_files, install_dir : datadir + '/hooks', follow_symlinks : false)
 endif
-- 
2.43.0

