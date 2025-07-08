Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7CEC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 14:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F4C10E66E;
	Tue,  8 Jul 2025 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmX2lgIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C46210E66E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751985662; x=1783521662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=plQy9AOF5REiixmLEtJcOwodPCv1s5EKBOV40soK/Q0=;
 b=hmX2lgIj33kXJVLN2/NONlebggqiNzUeoCJeMsLdTnbBC1UufshQFgxn
 XkULpEa+DP2IK5qP3FyN6AlZ+f7QTB2G+othOE0EZ/Auhi/MaVORn5bsO
 lYDbssEzlTjcEs/0VEjD2nsQYQ+uydj+bzq0o+9jl5Cd3oXoo8SRJLuVb
 69BZHvmBRZ4T+csAQj9YWOv/GSZdL0WqzzZse/l9xnbmwk/2VYkgnlpez
 hv89VWMfgkI0g90Ks1l35vFdT5QAoEDvc++XKvzw5b+fc9PTC6Yxila+N
 VXs9sUP3zMbQcCWtFBPmqhfsgS77SSTg2PPinbO+KffHnJspvFTHDYO5z g==;
X-CSE-ConnectionGUID: OgvW+0RkSgy8jcNLary2qw==
X-CSE-MsgGUID: xtZG46o+SEC1pc6S1beFpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56837423"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="56837423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:41:02 -0700
X-CSE-ConnectionGUID: FfjOPSKnRceaEZmoKC9D7g==
X-CSE-MsgGUID: wA9EOkLcQOqEFctL3XHBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="161065252"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:41:00 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
Subject: [PATCH v5,resend i-g-t 2/6] tests: Add core_debugfs
Date: Tue,  8 Jul 2025 16:40:34 +0200
Message-ID: <20250708144039.53482-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708144039.53482-1-peter.senna@linux.intel.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
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

Introduce core_debugfs that is expected to work with any GPU, not
limited to i915 and Xe. The test attempts to open every file in debugfs
associated with the GPU.

Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v5:
 - use igt_dir_process_files_simple()
v4:
 - unchanged from v3
v3:
 - removed "debugfs" from subtest name (Thanks Michal Wajdeczko)
v2:
 - changed style of comparison to NULL

 docs/code_coverage.md                    | 18 ++++-----
 scripts/code_cov_selftest.sh             |  2 +-
 tests/core_debugfs.c                     | 48 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist    |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/meson.build                        |  1 +
 6 files changed, 61 insertions(+), 10 deletions(-)
 create mode 100644 tests/core_debugfs.c

diff --git a/docs/code_coverage.md b/docs/code_coverage.md
index 031611e69..8c4857412 100644
--- a/docs/code_coverage.md
+++ b/docs/code_coverage.md
@@ -162,23 +162,23 @@ For each script, the igt_runner passes just one parameter: the results
 directory + the test name.
 
 For instance, if it is needed to run a test called
-`intel_sysfs_debugfs (i915-debugfs-read-all-entries)` using `code_cov_capture`
+`core_debugfs (read-all-entries)` using `code_cov_capture`
 parameter, e. g.:
 
 ```
-$ echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > my.testlist
+$ echo "igt@core_debugfs@read-all-entries" > my.testlist
 $ ./scripts/run-tests.sh -T my.testlist -k ~/linux -c code_cov_capture -P
 Found test list: "/basedir/igt/build/tests/test-list.txt"
-[31410.499969] [1/1] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
+[31410.499969] [1/1] core_debugfs (read-all-entries)
 [31411.060446] Storing code coverage results...
-[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
+[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/core_debugfs_debugfs_read_all_entries.info
 Done.
 ```
 
 The script will be called as:
 
 ```
-code_cov_capture results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries
+code_cov_capture results/code_cov/core_debugfs_debugfs_read_all_entries
 ```
 
 Please notice that any character that it is not a number nor a letter at the
@@ -376,7 +376,7 @@ OUT_DIR="${HOME}/results"
 
 mkdir -p $OUT_DIR/html
 
-echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > $TESTLIST
+echo "igt@core_debugfs@read-all-entries" > $TESTLIST
 echo "igt@core_auth@basic-auth" >> $TESTLIST
 echo "igt@gem_exec_basic@basic" >> $TESTLIST
 
@@ -401,8 +401,8 @@ genhtml -q -s --legend --branch-coverage $OUT_DIR/results.info
 Running such script produces the following output:
 
 ```
-[3622.993304] [1/3] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
-[3631.95]     Code coverage wrote to results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
+[3622.993304] [1/3] core_debugfs (read-all-entries)
+[3631.95]     Code coverage wrote to results/code_cov/core_debugfs_debugfs_read_all_entries.info
 [3626.217016] Storing code coverage results...
 [3631.957998] [2/3] core_auth (basic-auth)
 [3638.03]     Code coverage wrote to results/code_cov/core_auth_basic_auth.info
@@ -419,7 +419,7 @@ core_auth_basic_auth.info:
 Ignored......: non-drm headers and source files where none of its code ran.
 Source files.: 23.27% (165 of 709 total), 29.57% (165 of 558 filtered)
 
-intel_sysfs_debugfs_i915_debugfs_read_all_entries.info:
+core_debugfs_debugfs_read_all_entries.info:
   lines......: 19.3% (20266 of 104802 lines)
   functions..: 17.5% (1922 of 10971 functions)
   branches...: 12.7% (9462 of 74555 branches)
diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
index bc5ef7458..6f3a6db55 100755
--- a/scripts/code_cov_selftest.sh
+++ b/scripts/code_cov_selftest.sh
@@ -13,7 +13,7 @@ if [ -z "$IGT_KERNEL_TREE" ] ; then
         exit 1
 fi
 
-TEST="igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries"
+TEST="igt@core_debugfs@read-all-entries"
 
 TESTLIST="my_tests.testlist"
 GATHER="scripts/code_cov_gather_on_test.py"
diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
new file mode 100644
index 000000000..8ce305c40
--- /dev/null
+++ b/tests/core_debugfs.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_dir.h"
+
+/**
+ * TEST: debugfs test
+ * Description: Read entries from debugfs
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: read-all-entries
+ * Description: Read all entries from debugfs path validating debugfs entries
+ */
+
+IGT_TEST_DESCRIPTION("Read entries from debugfs");
+
+igt_main
+{
+	int debugfs = -1;
+	int fd = -1;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs >= 0);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Read all entries from debugfs path.");
+	igt_subtest("read-all-entries") {
+		igt_dir_process_files_simple(debugfs);
+	}
+
+	igt_fixture {
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..3ec1b95cf 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -3,6 +3,7 @@ igt@i915_module_load@load
 
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
+igt@core_debugfs@read-all-entries
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9d180d87..ac3177ae9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,6 +7,7 @@ igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@core_debugfs@read-all-entries
 igt@intel_sysfs_debugfs@xe-base
 igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-forcewake
diff --git a/tests/meson.build b/tests/meson.build
index 9b87a0d24..99d7d95be 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,5 +1,6 @@
 test_progs = [
 	'core_auth',
+	'core_debugfs',
 	'core_getclient',
 	'core_getstats',
 	'core_getversion',
-- 
2.43.0

