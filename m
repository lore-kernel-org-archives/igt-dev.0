Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B8EF89251
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 11:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E3210EC2D;
	Tue, 21 Apr 2026 11:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imdBSbpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877D210E1A1
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776770254; x=1808306254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oL5onf+IWZFy8Bu85P2nwkQpXlsqVSOIbWy/FvOfmEA=;
 b=imdBSbpJKuFKewQd9WttZq36AVaAWF5E+qUC4J5Ko6+9KdhccuoIudeX
 gUbrxTQhdRR+emMlOhm7O20u8PDf2vLYR/XT7wv7+bx27wqg7AEsvyK7+
 ar1gy8f2YszMKanKR+qof5fVhUVJjTmVDWtJg5GzYVk+nvGqQQm26+9o4
 SBvTG94S1CTaq3l7N0HuUWWYZtiHwQxB/NiURHSvGoe7H685A717s2aOZ
 PuSa80Iv9w42K4eRjqENAQVz3ZcsjKRTSPNz0M2PyjOdnexk3jVaoI8Zq
 Vj3mFJOO5hZF6aCcJCLQ1pSb2cgaCQt0yK9hnA0a2aihxABzrss+8qNRs g==;
X-CSE-ConnectionGUID: YCiJwmU1Rq6SBDmvRNLypQ==
X-CSE-MsgGUID: aBiwLnveRyKtabWgvfqOyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77401543"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77401543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:26 -0700
X-CSE-ConnectionGUID: 85bFYOigTIOKR07d0z/gvw==
X-CSE-MsgGUID: Rw5xw66NSuO3APWHhXAwLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="229340703"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:25 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t 3/4] intel-ci/hooks: Add hooks-wrapper and aux
 scripts/allowlists
Date: Tue, 21 Apr 2026 13:17:13 +0200
Message-ID: <20260421111709.3163253-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
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
 tests/intel-ci/hooks/common.helper.sh         | 53 +++++++++++++++++++
 .../hooks/copy_guc_log_on_fail.allowlist      |  2 +
 tests/intel-ci/hooks/copy_guc_log_on_fail.sh  | 24 +++++++++
 tests/intel-ci/hooks/hook-date.allowlist      |  2 +
 tests/intel-ci/hooks/hook-date.sh             | 18 +++++++
 tests/intel-ci/hooks/hooks-wrapper.sh         | 15 ++++++
 tests/intel-ci/meson.build                    | 11 ++++
 7 files changed, 125 insertions(+)
 create mode 100755 tests/intel-ci/hooks/common.helper.sh
 create mode 100644 tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
 create mode 100755 tests/intel-ci/hooks/copy_guc_log_on_fail.sh
 create mode 100644 tests/intel-ci/hooks/hook-date.allowlist
 create mode 100755 tests/intel-ci/hooks/hook-date.sh
 create mode 100755 tests/intel-ci/hooks/hooks-wrapper.sh

diff --git a/tests/intel-ci/hooks/common.helper.sh b/tests/intel-ci/hooks/common.helper.sh
new file mode 100755
index 0000000000..1dbc0cbd2e
--- /dev/null
+++ b/tests/intel-ci/hooks/common.helper.sh
@@ -0,0 +1,53 @@
+# Common helper for hooks executed from igt_runner
+#
+# Usually ALLOWLIST=<filename> is set in the hook, then this helper is
+# sourced allowing arg parsing and being overwritten by --allowlist.
+
+for arg in "$@"; do
+	case $arg in
+	--help)
+		echo "Usage: $0 [--help] [--allowlist <name.allowlist>]"
+		echo
+		echo "If name.allowlist is not passed default '${ALLOWLIST}' is used."
+		exit 0
+		;;
+
+	--allowlist)
+		ALLOWLIST=$2
+		shift 2
+		;;
+
+		*)
+		shift
+		;;
+	esac
+done
+
+if [ "${ALLOWLIST}" == "" ]; then
+	echo "No ALLOWLIST was provided. Exiting..."
+	exit 0
+fi
+
+if [ -z "${IGT_RUNNER_ATTACHMENTS_DIR}" ]; then
+	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
+	exit 0
+fi
+
+# Look for allowlist in following places:
+# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
+# 2. Try in <SCRIPTDIR>
+
+if [ ! -z "${IGT_HOOK_ALLOWLIST_DIR}" ]; then
+	ALLOWLIST_PATH="${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
+else
+	ALLOWLIST_PATH="${SCRIPTDIR}/${ALLOWLIST}"
+fi
+
+if [ ! -e "${ALLOWLIST_PATH}" ]; then
+	echo "Missing ${ALLOWLIST_PATH}"
+	exit 0
+fi
+
+if ! echo "${IGT_HOOK_TEST_FULLNAME}" | grep -q -f "$ALLOWLIST_PATH"; then
+	exit 0
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
index 0000000000..2a60d28164
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
+. "${SCRIPTDIR}/common.helper.sh"
+
+cd "${IGT_RUNNER_ATTACHMENTS_DIR}"
+
+for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
+	attout=$(echo ${log:23} | sed -e 's/\//_/g')
+	mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
+	cp "$log" "${IGT_HOOK_TEST_FULLNAME}/${attout}"
+done
diff --git a/tests/intel-ci/hooks/hook-date.allowlist b/tests/intel-ci/hooks/hook-date.allowlist
new file mode 100644
index 0000000000..54cbc0a1d4
--- /dev/null
+++ b/tests/intel-ci/hooks/hook-date.allowlist
@@ -0,0 +1,2 @@
+igt@xe_exec_basic@once-basic@rcs0
+igt@xe_exec_basic@once-basic@ccs0
diff --git a/tests/intel-ci/hooks/hook-date.sh b/tests/intel-ci/hooks/hook-date.sh
new file mode 100755
index 0000000000..6b0049cea5
--- /dev/null
+++ b/tests/intel-ci/hooks/hook-date.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+# Example hook which stores current date in <testname>/current-date.txt
+# in attachments dir
+#
+# Suggested usage with:
+# --hook 'post-subtest:tests/intel-ci/hooks/hook-date.sh' \
+# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hook-date.sh'
+# or within hooks-wrapper.sh
+
+ALLOWLIST="hook-date.allowlist"
+SCRIPTDIR=$(dirname "$(realpath "$0")")
+. "${SCRIPTDIR}/common.helper.sh"
+
+cd "${IGT_RUNNER_ATTACHMENTS_DIR}"
+
+mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
+date > "${IGT_HOOK_TEST_FULLNAME}/current-date.txt"
diff --git a/tests/intel-ci/hooks/hooks-wrapper.sh b/tests/intel-ci/hooks/hooks-wrapper.sh
new file mode 100755
index 0000000000..64512624ca
--- /dev/null
+++ b/tests/intel-ci/hooks/hooks-wrapper.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+# Hooks wrapper
+# Suggested usage with:
+# --hook 'post-subtest:tests/intel-ci/hooks/hooks-wrapper.sh' \
+# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hooks-wrapper.sh'
+
+SCRIPTDIR=$(dirname "$(realpath "$0")")
+cd "${SCRIPTDIR}"
+
+# Example hook which stores current date
+#./hook-date.sh
+
+# Copy GuC logs for tests which are failing and are in the allowlist
+./copy_guc_log_on_fail.sh
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 2b3266bbd9..0bb58072cd 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -34,8 +34,19 @@ intelci_files = [
   'xe.wcl.core.blocklist.txt',
 ]
 
+hooks_files = [
+  'hooks/common.helper.sh',
+  'hooks/copy_guc_log_on_fail.sh',
+  'hooks/copy_guc_log_on_fail.allowlist',
+  'hooks/hook-date.sh',
+  'hooks/hook-date.allowlist',
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

