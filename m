Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC920C25B4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 12:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5917B10EFA5;
	Tue,  7 May 2024 12:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mB0qdzng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788810EFA5
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715085039; x=1746621039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2bUG7WP79S2A3dQIWPiIHnYI/PCvqcSgHmMFkU0ITug=;
 b=mB0qdzngmMXoBOyf26iZmve5Fto1DCg+J2J7d2NOOki1NqFK6SqbnOlP
 aBBljFBhC1jtD0nmY0dG3gBzRCShbNsBRQSIZ1ADyMV+koV9/gcrQ1dZV
 XzY16sngXZ5edQvnAOrXjB/JhCVlWxM941mzaI+q3sWZ68eawnpmHjsw3
 UW58A97wRMUHHzzwEGXYgjuVY+vf4Aw4GwQ57elgxXS+MH9EbxPoQGEf1
 Kp5UPyvzTtTBYpZ281E6qZyVE/kSPcbRJ0HDQ7BES+KxyWUsOw7pnDOfL
 ppG62icDIifBdIfRmzuUtIg0JifVwOJlnSY3+m5Rcz2Ps63oiJWohVb9e w==;
X-CSE-ConnectionGUID: 4w+U012rSQOIDfYSk6jAEg==
X-CSE-MsgGUID: 3LhQaU9/TCaZWhWnMMTDvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21544071"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="21544071"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:30:38 -0700
X-CSE-ConnectionGUID: dBgEfnXWR1+Q5nBBqdH60g==
X-CSE-MsgGUID: /4JV/R7vSw65tK0fqeLETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="28490412"
Received: from dfava-mobl.ger.corp.intel.com (HELO vgovind2-mobl3.intel.com)
 ([10.251.209.202])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:30:35 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, bhanuprakash.modem@intel.com,
 juha-pekka.heikkila@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_big_fb: Fix width calculation while
 creating the intel buf
Date: Tue,  7 May 2024 15:30:26 +0300
Message-Id: <20240507123026.57575-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/igt_draw.c           | 2 +-
 tests/intel/kms_big_fb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 2c01d7b02..97a7e6b37 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -650,7 +650,7 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
 	uint64_t size = from->size;
 
-	width = from->width;
+	width = from->stride / (from->bpp / 8);
 	height = from->height;
 	if (driver == INTEL_DRIVER_XE)
 		size = ALIGN(size, xe_get_default_alignment(fd));
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index f7f303d41..1e45d8e42 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -199,7 +199,7 @@ static struct intel_buf *init_buf(data_t *data,
 	tiling = igt_fb_mod_to_tiling(fb->modifier);
 	bpp = fb->plane_bpp[0];
 	size = fb->size;
-	width = fb->width;
+	width = fb->strides[0] / (bpp / 8);
 	height = fb->height;
 
 	name = gem_flink(data->drm_fd, fb->gem_handle);
-- 
2.34.1

