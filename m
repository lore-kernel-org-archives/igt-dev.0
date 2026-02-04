Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D1DE9D3FF
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 15:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4928010E692;
	Wed,  4 Feb 2026 15:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bN3Wna9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DD610E692
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770219041; x=1801755041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nm2/+Eo2981EbfO/9eoR9mzekx4BF74H/BC6RR/6gBM=;
 b=bN3Wna9ogKvY90mnHR1pcr7ucu3avZjJ3cefcyAYNKEJ1WJDoMo57BsC
 6xwFo6N0+33dO/h7ZfILzPqa5Zj49J329xIO+15WuPVK8eu+7yRJVzMHu
 Z4eIWF6roqznbOncQMcvpMTCJFyI1sW9mbhqXyYIZbEKCCz+eRGY3itvE
 K4AQlzvKSCLmxBONzNM9FtS5PdTCoeG71AzyCY1fm+HkAvkO/UaS+gZB+
 6s1krH3t843MdNInw5ld+LoELci03oMRW2Gb1chJdRcEb4DnMMxbmg3qN
 gQXGm6sNW8dNAzWQs7CzVNJQmCJSfNSkjselENK4s5cFUqTp+pmFHpXAt Q==;
X-CSE-ConnectionGUID: V3Moxh5nQ7mlMKhYH0UXIQ==
X-CSE-MsgGUID: gALU7rQARYSFC1ACW3+zoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75029590"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75029590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:30:40 -0800
X-CSE-ConnectionGUID: KBu+Hj1qQV+MlxeRUZvXkA==
X-CSE-MsgGUID: BzgIlu3TTVS3zBFTv9FOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247794939"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa001.jf.intel.com with ESMTP; 04 Feb 2026 07:30:39 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: Reset configfs group after each
 subtest
Date: Wed,  4 Feb 2026 21:33:09 +0530
Message-ID: <20260204160308.107154-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The xe_configfs test uses a shared configfs group across all subtests.
When subtests modify configfs attributes without resetting them, the
modified values persist and affect subsequent subtests. For example,
ctx-restore-mid-bb reports register value mismatches due to stale
batch buffer data from previous subtests.

Fix by removing the configfs device directory after each subtest and
letting the next subtest recreate it to get default values as
hardcoded in the driver.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6204
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
v1->v2:
  Instead of manually resetting each attribute,
  it's cleaner to remove and recreate the configfs group after
  each subtests. (Michal)

 tests/intel/xe_configfs.c | 47 +++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index d2dfd2e87..aa3435392 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -361,7 +361,6 @@ int igt_main()
 
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		igt_install_exit_handler(restore);
 	}
 
@@ -369,39 +368,69 @@ int igt_main()
 	igt_subtest("survivability-mode") {
 		igt_require(IS_BATTLEMAGE(devid));
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_survivability_mode(configfs_device_fd);
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
-	igt_subtest("engines-allowed-invalid")
+	igt_subtest("engines-allowed-invalid") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_engines_allowed_invalid(configfs_device_fd);
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_describe("Validate engines_allowed");
-	igt_subtest("engines-allowed")
+	igt_subtest("engines-allowed") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_engines_allowed(configfs_device_fd);
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_describe("Validate gt_types_allowed");
-	igt_subtest("gt-types-allowed")
+	igt_subtest("gt-types-allowed") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_gt_types_allowed(configfs_device_fd);
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
-	igt_subtest("ctx-restore-post-bb-invalid")
+	igt_subtest("ctx-restore-post-bb-invalid") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "post");
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_describe("Validate ctx_restore_post_bb");
-	igt_subtest("ctx-restore-post-bb")
+	igt_subtest("ctx-restore-post-bb") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "post");
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
-	igt_subtest("ctx-restore-mid-bb-invalid")
+	igt_subtest("ctx-restore-mid-bb-invalid") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "mid");
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_describe("Validate ctx_restore_mid_bb");
-	igt_subtest("ctx-restore-mid-bb")
+	igt_subtest("ctx-restore-mid-bb") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "mid");
+		close(configfs_device_fd);
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	}
 
 	igt_fixture() {
-		close(configfs_device_fd);
 		close(configfs_fd);
 	}
 }
-- 
2.50.1

