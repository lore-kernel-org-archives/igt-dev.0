Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993D8E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 03:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5174110E046;
	Thu, 19 Dec 2024 03:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="is+LC6ew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EA410E046
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 03:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734580727; x=1766116727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+5a0n05G28Pcxhr4M7qB5sPYUNTnfIYH4kC2fwH6aQw=;
 b=is+LC6ewg4uT8xupscbtlwRj8hQxm/44VCxZMyX6hk4bh3K45BpuICIS
 Nr0AiwFk0+f+EgLj2HdgWDsI6DrbPpdSSM6S3SI/jKf5Jxxg6w1BUSS6h
 lKElozfmBYc0MNfZq2Z1bESWIiccDMjGRFyazQwYoV7lOKQWEYETk5TRU
 cTHzZ7exudeGdAVEBwtu1Et8fz0NtuPgiMV1OaaV3apmoUoBMJ8Hiy33x
 LRYqy0vfDK0gA/p1xs7XCpfzRXwg+9lULA6nXhRM1dWQOoK0jH3BJXUZm
 yJPMahhpl9OXj+seGFlSb5jAOqjJ8OcNQsiReNEluQdM5DnKeglBFNfkl A==;
X-CSE-ConnectionGUID: nECO91edTkuMJpJvb7aQIw==
X-CSE-MsgGUID: 2Dof0FJjRdGha+WreOOTGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46496535"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="46496535"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 19:58:47 -0800
X-CSE-ConnectionGUID: J5fMoCAgQFOPdbUuCrE8Xg==
X-CSE-MsgGUID: 3K/4EgvXQDyXjQvPJug7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103150571"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 18 Dec 2024 19:58:45 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@linux.intel.com, matthew.brost@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Date: Thu, 19 Dec 2024 09:26:09 +0530
Message-Id: <20241219035609.680347-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Read and dump  below debugfs entries.
ggtt
register-save-restore
workarounds
default_lrc_rcs
default_lrc_ccs
default_lrc_bcs
default_lrc_vcs
default_lrc_vecs
hwconfig

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_debugfs.c | 50 ++++++++++++----------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 700575031..a31de41a4 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
 		"pat",
 		"mocs",
 //		"force_reset"
+		"ggtt",
+		"register-save-restore",
+		"workarounds",
+		"default_lrc_rcs",
+		"default_lrc_ccs",
+		"default_lrc_bcs",
+		"default_lrc_vcs",
+		"default_lrc_vecs",
+		"hwconfig"
+
 	};
 	static const char * const expected_files_uc[] = {
 		"huc_info",
@@ -170,41 +180,11 @@ test_gt(int fd, int gt_id)
 //		"guc_ct_selftest"
 	};
 
-	sprintf(name, "gt%d/hw_engines", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/sa_info", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/steering", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/topology", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/pat", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/mocs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/uc/guc_info", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/uc/huc_info", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/uc/guc_log", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
+	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
+		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+		igt_debugfs_dump(fd, name);
+	}
 
 	sprintf(name, "/gt%d", gt_id);
 	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
-- 
2.34.1

