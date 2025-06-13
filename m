Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30114C71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C9510E993;
	Fri, 13 Jun 2025 10:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcsVD+uM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB3E10E993
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749811929; x=1781347929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=34EkzDNpNpFBARjyVCYbhSSaFaOeHGG/7SzU/SCtOEU=;
 b=UcsVD+uM9DduY4htrd0+y8dwpFfgylyDXQNNHyh2ZB/Q2GActgUUdQvW
 DvAkw1h3cg/GXeb8F6P3ufYFII00+V8COWzTR0pLHNprm00lCLO+mL9Gw
 gszD5oQErcoh/29NFUYlC9qZN/hExBsthbZVmmmpnacHiEtfTWAT0Eejm
 1yG7VM+MlJpBwrXHejnhQT4H7S+873gZPjnx5iyfxkXB3Mb0ccPk5iSVY
 OwvX/Qdpp12b0KlLL+sogrrp/VKiH9zCa2k3xDX/N3bIj6M0cBi0rRcqs
 MSDDIPqCaD4VL9M4rW81GjLbfjSrdHooY2YFqZVq2vjzKEvCFbmT9KAqV A==;
X-CSE-ConnectionGUID: gYurWOWuQCKZ6rRmthLP7g==
X-CSE-MsgGUID: oc+jvA9JTNKuLiOtBOirjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69467212"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69467212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:09 -0700
X-CSE-ConnectionGUID: 8/B7XQnrR/q6h8hpJfpPXQ==
X-CSE-MsgGUID: F/qfmg2UQQqSEkAA4M8lzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="178772198"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:06 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH v2 i-g-t 2/6] tests: Add core_debugfs
Date: Fri, 13 Jun 2025 12:51:41 +0200
Message-ID: <20250613105146.106581-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613105146.106581-1-peter.senna@linux.intel.com>
References: <20250613105146.106581-1-peter.senna@linux.intel.com>
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

Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v2:
 - changed style of comparison to NULL
 
 docs/code_coverage.md                    | 18 ++++----
 scripts/code_cov_selftest.sh             |  2 +-
 tests/core_debugfs.c                     | 54 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist    |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/meson.build                        |  1 +
 6 files changed, 67 insertions(+), 10 deletions(-)
 create mode 100644 tests/core_debugfs.c

diff --git a/docs/code_coverage.md b/docs/code_coverage.md
index 031611e69..236dbc70b 100644
--- a/docs/code_coverage.md
+++ b/docs/code_coverage.md
@@ -162,23 +162,23 @@ For each script, the igt_runner passes just one parameter: the results
 directory + the test name.
 
 For instance, if it is needed to run a test called
-`intel_sysfs_debugfs (i915-debugfs-read-all-entries)` using `code_cov_capture`
+`core_debugfs (debugfs-read-all-entries)` using `code_cov_capture`
 parameter, e. g.:
 
 ```
-$ echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > my.testlist
+$ echo "igt@core_debugfs@debugfs-read-all-entries" > my.testlist
 $ ./scripts/run-tests.sh -T my.testlist -k ~/linux -c code_cov_capture -P
 Found test list: "/basedir/igt/build/tests/test-list.txt"
-[31410.499969] [1/1] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
+[31410.499969] [1/1] core_debugfs (debugfs-read-all-entries)
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
+echo "igt@core_debugfs@debugfs-read-all-entries" > $TESTLIST
 echo "igt@core_auth@basic-auth" >> $TESTLIST
 echo "igt@gem_exec_basic@basic" >> $TESTLIST
 
@@ -401,8 +401,8 @@ genhtml -q -s --legend --branch-coverage $OUT_DIR/results.info
 Running such script produces the following output:
 
 ```
-[3622.993304] [1/3] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
-[3631.95]     Code coverage wrote to results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
+[3622.993304] [1/3] core_debugfs (debugfs-read-all-entries)
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
index bc5ef7458..374068140 100755
--- a/scripts/code_cov_selftest.sh
+++ b/scripts/code_cov_selftest.sh
@@ -13,7 +13,7 @@ if [ -z "$IGT_KERNEL_TREE" ] ; then
         exit 1
 fi
 
-TEST="igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries"
+TEST="igt@core_debugfs@debugfs-read-all-entries"
 
 TESTLIST="my_tests.testlist"
 GATHER="scripts/code_cov_gather_on_test.py"
diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
new file mode 100644
index 000000000..278cb4f6d
--- /dev/null
+++ b/tests/core_debugfs.c
@@ -0,0 +1,54 @@
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
+ * SUBTEST: debugfs-read-all-entries
+ * Description: Read all entries from debugfs path validating debugfs entries
+ */
+
+IGT_TEST_DESCRIPTION("Read entries from debugfs");
+
+igt_main
+{
+	int debugfs = -1;
+	int fd = -1;
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs >= 0);
+
+		igt_dir = igt_dir_create(debugfs);
+		igt_require(igt_dir);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Read all entries from debugfs path.");
+	igt_subtest("debugfs-read-all-entries") {
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_fixture {
+		igt_dir_destroy(igt_dir);
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..7902bbdae 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -53,6 +53,7 @@ igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
 igt@intel_hwmon
+igt@core_debugfs@debugfs-read-all-entries
 igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries
 igt@kms_addfb_basic@addfb25-4-tiled
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9d180d87..5fb233fb4 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,6 +7,7 @@ igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@core_debugfs@debugfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-base
 igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-forcewake
diff --git a/tests/meson.build b/tests/meson.build
index 55bcf57ec..fa62cbeb9 100644
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

