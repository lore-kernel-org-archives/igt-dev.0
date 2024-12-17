Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925A9E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 13:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD458913D;
	Tue, 17 Dec 2024 13:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfE/bPHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9DA8913D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734443974; x=1765979974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKRps8YNaeaI2DX0+x1GcpHtSV0spFebh9+pnNWVAwg=;
 b=BfE/bPHbh87RLYivyIb9ff/YbpAPUaKQX8GCo4Gd15lc55/d6NbrroUd
 25XpaubfMIS/y/ddanAm107jJbQthMi5gfJeX5W7HB5C7OVDlGiKY9fVe
 2dgmLnsUFHtTq6TtN0zy1dJASC/PnGDCh7GHWzAnX4Ia0Y3T1zfeN+zTD
 nC++3EggkOEWuuSNpoyZ3dOxeCsuhOYIs0ezcz7vuV3rJYAGTf+MoEzQf
 qEAs3TFb3Isww6rzSuDW6L+0q4mEKU9gmbHvkNM3bQaqrMCymyOPVGnlW
 0kQd23JA4Q+UjV7+EsPrRef7FzRouuyvNPqp3X1+gFhhiEThleSPzoC31 w==;
X-CSE-ConnectionGUID: OJwxkMabQd6fMbrLRevk5Q==
X-CSE-MsgGUID: Qavho/nCR3yy3/eM28JADA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34748866"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34748866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:59:34 -0800
X-CSE-ConnectionGUID: RXytRTdURM+ANiW9mVN3+Q==
X-CSE-MsgGUID: cNcqYldoQpiSYb+bIggfjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="98110917"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 05:59:33 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Date: Tue, 17 Dec 2024 19:26:59 +0530
Message-Id: <20241217135659.673564-1-pravalika.gurram@intel.com>
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
hwconfig"

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_debugfs.c | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 700575031..bcbb5036a 100644
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
@@ -194,6 +204,42 @@ test_gt(int fd, int gt_id)
 	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
 	igt_debugfs_dump(fd, name);
 
+	sprintf(name, "gt%d/ggtt", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/register-save-restore", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/workarounds", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
+	sprintf(name, "gt%d/hwconfig", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
 	sprintf(name, "gt%d/uc/guc_info", gt_id);
 	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
 	igt_debugfs_dump(fd, name);
-- 
2.34.1

