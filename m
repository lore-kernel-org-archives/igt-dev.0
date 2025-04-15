Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184EAC369B4
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFB310E6EB;
	Tue, 15 Apr 2025 10:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5asXNhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CCC10E6EB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744711573; x=1776247573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huMWGkbCl8Ley+xj9CwU4Mbvty6lAa1Nh2ORvtk3XPw=;
 b=m5asXNhmhG1iI96m1x8g6mEtKSHoRmr/6oYbtkI0sIuPEeNo4VWm/nWk
 CC5q8z+QtFtzGiK8WFw6NkxEcYMaM+GILPd5D+5RawxPzwaX9PfoghA8I
 v2TC3zpGH4/3OcIehGPR+KSSzJTtr1aDRIADmsH+smpEDfTy6cHx46jlZ
 BsmszL8x/3NqpfDhSPTfUk1Q/q4+WGV8KtZY38+egzVUvCBgg+ccREvbF
 K6+2kCjfTcmArw1HwH8hqIW/u6uwTKHJK6K3oC+f8V/qwBHk4zg3ee4gw
 82nc84XSSKhc+oSSieyq0E02UEzNLm2uVbnzKW/1f/R9fQTCwVR8Am/jA g==;
X-CSE-ConnectionGUID: AneJojHHS3i00WvCRR0yJg==
X-CSE-MsgGUID: 2WRdYcJ3TJ+tueNVc45wZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="33826729"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="33826729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:06:13 -0700
X-CSE-ConnectionGUID: 2eiAttqcQnyg1PBMpX7ptA==
X-CSE-MsgGUID: ymKIw/MlS4OKEjAqCZOrbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130403774"
Received: from daksoyx-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.97.247])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:06:10 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, matthew.brost@intel.com,
 pravalika.gurram@intel.com, kamil.konieczny@linux.intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
Date: Tue, 15 Apr 2025 12:05:42 +0200
Message-ID: <20250415100542.477399-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410090315.4201-1-peter.senna@linux.intel.com>
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
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

The intel_sysfs_debugfs test now includes functionality to read all Xe
debugfs files, making the older xe-gt test redundant. Additionally,
xe-gt causes issues when testing Virtual Functions (VFs) in SR-IOV
setups, as some of the debugfs files it expects are not present for VFs.

Rather than extending the overlapping and problematic xe-gt, this commit
removes it entirely. Also removes xe-gt from xe-fast-feedback and from
xe-sriov-vf.blocklist.

Cc: marcin.bernatowicz@intel.com
Cc: matthew.brost@intel.com
Cc: pravalika.gurram@intel.com
Cc: kamil.konieczny@linux.intel.com
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v2:
 - remove unused variables
 - remove xe-gt from lists

 tests/intel-ci/xe-fast-feedback.testlist |  1 -
 tests/intel-ci/xe-sriov-vf.blocklist.txt |  4 --
 tests/intel/intel_sysfs_debugfs.c        | 68 ------------------------
 3 files changed, 73 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index adc0c1b21..d9d180d87 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -10,7 +10,6 @@ igt@fbdev@write
 igt@intel_sysfs_debugfs@xe-base
 igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-forcewake
-igt@intel_sysfs_debugfs@xe-gt
 igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
index 3ee71bd83..03371d80c 100644
--- a/tests/intel-ci/xe-sriov-vf.blocklist.txt
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -5,7 +5,3 @@
 # Prevent potential module reloads during tests
 #
 igt@xe_module_load
-#
-# Blocked because of abort
-#
-igt@intel_sysfs_debugfs@xe-gt
diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
index 6beb94109..dfd8d52d8 100644
--- a/tests/intel/intel_sysfs_debugfs.c
+++ b/tests/intel/intel_sysfs_debugfs.c
@@ -322,63 +322,6 @@ xe_test_base(int fd, struct drm_xe_query_config *config)
 	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
 }
 
-/**
- * SUBTEST: xe-gt
- * Description: Check all gt debugfs devnodes
- * TODO: add support for ``force_reset`` entries
- */
-static void
-xe_test_gt(int fd, int gt_id)
-{
-	char name[256];
-	static const char * const expected_files[] = {
-		"uc",
-		"steering",
-		"topology",
-		"sa_info",
-		"hw_engines",
-		"pat",
-		"mocs",
-//		"force_reset"
-		"ggtt",
-		"register-save-restore",
-		"workarounds",
-		"default_lrc_rcs",
-		"default_lrc_ccs",
-		"default_lrc_bcs",
-		"default_lrc_vcs",
-		"default_lrc_vecs",
-		"hwconfig"
-
-	};
-	static const char * const expected_files_uc[] = {
-		"huc_info",
-		"guc_log",
-		"guc_info",
-//		"guc_ct_selftest"
-	};
-
-	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
-		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
-		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
-			continue;
-		igt_debugfs_dump(fd, name);
-	}
-
-	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
-		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
-		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-		igt_debugfs_dump(fd, name);
-	}
-
-	sprintf(name, "/gt%d", gt_id);
-	xe_validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
-
-	sprintf(name, "/gt%d/uc", gt_id);
-	xe_validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
-}
-
 /**
  * SUBTEST: xe-forcewake
  * Description: Check forcewake debugfs devnode
@@ -416,9 +359,7 @@ static int opt_handler(int option, int option_index, void *input)
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	int debugfs = -1;
-	char devnode[PATH_MAX];
 	int fd = -1;
-	int gt;
 	int sysfs = -1;
 
 	igt_subtest_group {
@@ -475,15 +416,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			xe_test_base(fd, xe_config(fd));
 		}
 
-		igt_describe("Check all gt debugfs devnodes");
-		igt_subtest("xe-gt") {
-			xe_for_each_gt(fd, gt) {
-				snprintf(devnode, sizeof(devnode), "gt%d", gt);
-				igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
-				xe_test_gt(fd, gt);
-			}
-		}
-
 		igt_describe("Check forcewake debugfs devnode");
 		igt_subtest("xe-forcewake") {
 			xe_test_forcewake(fd);
-- 
2.43.0

