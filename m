Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDAAE77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 11:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F8210ED66;
	Thu,  9 Jan 2025 11:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4A1+uY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382110ED66
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736420430; x=1767956430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jvLwmzRUfBs3VtrbkePwMB50jFLy51v4PbCOZRuimr0=;
 b=k4A1+uY4HBbFMV507a2tYWnbZjdTnpRPQ6iPTvRAvXxCDCSvFdKY0gk0
 N1KO5qCIvl47uPsh2+iOR/XafMSM0E3wgbZ3jPM9AHUvjo6txqPg1zZQD
 t93u5CDW3d4Ev3WWl65sJajZGhmv+ja/SF2kQvJHtLnpz9E4/LcD7n4Rf
 F2oy+ZIJgd41UpYRtASD02j4yD7xDT74WGhBW70VjjfFozf0tAu+KHat6
 6R5jjr8+GyHqRmiZSjyVJrLMFuuqfNTIs5mnk7hOLBavRzhxZoqyqsNkr
 UMRWHdtJglr0Df8BJIFgoy5OkEr9mtFoDpp4+ePhF+wsciRzx8QkamXQH w==;
X-CSE-ConnectionGUID: PsdoGrc7TmGOnsy2ENJvBg==
X-CSE-MsgGUID: tOdNx/m/Tk6NDd40Zv3lvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36562383"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="36562383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 03:00:30 -0800
X-CSE-ConnectionGUID: N8WGRLhrRUOviDXZDaPc8w==
X-CSE-MsgGUID: aic+F6i6TZ++Mt72iil2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108481926"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 03:00:28 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
Date: Thu,  9 Jan 2025 16:27:21 +0530
Message-Id: <20250109105721.914096-1-pravalika.gurram@intel.com>
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

Read the debugfs entries in the loop to improve
the readability.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_debugfs.c | 84 +++++++---------------------------------
 1 file changed, 13 insertions(+), 71 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index bcbb5036a..3d8c17921 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -180,77 +180,19 @@ test_gt(int fd, int gt_id)
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
-	sprintf(name, "gt%d/ggtt", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/register-save-restore", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/workarounds", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/hwconfig", gt_id);
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
+		if (!strstr(name, "uc")) {
+			igt_debugfs_dump(fd, name);
+		} else {
+			for (int j = 0; j < ARRAY_SIZE(expected_files_uc); j++) {
+				sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[j]);
+				igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+				igt_debugfs_dump(fd, name);
+			}
+		}
+	}
 
 	sprintf(name, "/gt%d", gt_id);
 	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
-- 
2.34.1

