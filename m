Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E312CD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 09:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1C710F21B;
	Thu, 21 May 2026 09:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T18D+yMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2BA10F21B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779357048; x=1810893048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+shdKdSFPO1x5A++FEBITroTmYrHjC75g2ZWoIwiQZY=;
 b=T18D+yMGZ/zUu09XyJMkeu3cLtMNx38dh1mh66qzIOrFsUwYNBmAOcK3
 LrZJsIDhyoNnwqMGJ3hYKpcXH6jkXh1aK5Yn83eZuKjZU+avshKKBQEIK
 YDv4QWhrte6SxH56kAPHLQInakXlrnb/49S3vgMQVl1aDYduRVc+f/TFg
 yT8crAGfr8sa3UhTRerVbTJJFbU3a5b2y32VHQA3pkSf6YxQMoW/ASilB
 ihHVY7zXQUJTaXqbzrLlYc3tVoK0kzMEK9cmNrDxjW9IvRScNXJySldEe
 R3nl3DDoCZuYQGRu3zh7UsYeJnDWBzch8yO+YGs6m67/ouaiC9ITHtaWv w==;
X-CSE-ConnectionGUID: 9PyhKjTKSweqA/18m467NA==
X-CSE-MsgGUID: rpzkpStDQ1+ZWZD/dLgrIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80237857"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80237857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 02:50:47 -0700
X-CSE-ConnectionGUID: Q6xcB1K1R86qIzOhGLIKXQ==
X-CSE-MsgGUID: ZpEdtpIbTfW/FJ2baQSnXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="240348410"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa008.jf.intel.com with ESMTP; 21 May 2026 02:50:46 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Alex Hung <alex.hung@amd.com>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH i-g-t] tests/kms_colorop_helper: clear assigned_color_pipeline
 on bypass
Date: Thu, 21 May 2026 14:56:20 +0530
Message-Id: <20260521092620.3637270-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

set_color_pipeline_bypass() didn't clear plane->assigned_color_pipeline,
so colorop property updates were still sent for an inactive pipeline.

Allow igt_plane_set_color_pipeline() to take NULL as an argument to disable
a pipeline, use it in set_color_pipeline_bypass()

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c              | 7 ++++++-
 tests/kms_colorop_helper.c | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99fc9fa05..b10059e7a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4405,6 +4405,10 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
 	int i;
 	bool found = false;
 
+	/* For Bypass */
+	if (colorop == NULL)
+		return true;
+
 	for (i = 0; i < plane->num_color_pipelines; i++) {
 		if (plane->color_pipelines[i] == colorop) {
 			found = true;
@@ -4427,7 +4431,8 @@ void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
 
 	plane->assigned_color_pipeline = colorop;
-	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE,
+				colorop ? colorop->name : "Bypass");
 }
 
 /**
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567..af46f70a6 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -398,7 +398,7 @@ void set_color_pipeline(igt_display_t *display,
 
 void set_color_pipeline_bypass(igt_plane_t *plane)
 {
-	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+	igt_plane_set_color_pipeline(plane, NULL);
 }
 
 static void reset_colorop(kms_colorop_t *colorop)
-- 
2.25.1

