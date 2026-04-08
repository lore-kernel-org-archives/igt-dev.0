Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEF210F9972
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA49F10E3BE;
	Wed,  8 Apr 2026 20:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7j5qMRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9810E260
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679690; x=1807215690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=McP98sB7lOXQbn8JRA/u7kYtWiQ1sUmOm8CjEFMIXPM=;
 b=X7j5qMREF11i6Ntn1Kap4qgSmslH51jgTjQMRnrgOp3Y5YN49Wmt2fqC
 XkIVSPL82jJM/wtkouRubTQV09vkuszikC30kEoEJQl8RbLgFCu5xtGCP
 R3oUOF+hrgBdoYApZoDC8QemkSzKeHJTgDNt3oX0jvHEwG8Ll//1cKl09
 IoOeSVFcARaEWs2OItd1vICjv42GV5jI1nQ/zeOx/urME3ksJhDeGxTAM
 RBdiYeg1s3t/6JctjM7IRm9+eoKT93aIYNnvFiWOVWAEwTDsS/pgPpIYL
 fybiTlKoEV3OLkwKCk3btyRA/+rP9Osel1ZeE3Wj9sPYiEaOD19H5lkZD A==;
X-CSE-ConnectionGUID: uXch+7hoTzKh4HYHNc1tSw==
X-CSE-MsgGUID: IsKOdFW6Siqx9HwFByr12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75713379"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75713379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:30 -0700
X-CSE-ConnectionGUID: v1lq83b8SkWg3DHEFngOYw==
X-CSE-MsgGUID: qoTqddr4Q861hotUO4cIeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223810504"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 2/7] tests/intel/kms_dp_linktrain_fallback: remove mode
 from data
Date: Wed,  8 Apr 2026 23:21:08 +0300
Message-ID: <03424800c9ea0e5f3cb4c1fa8de62e5a58f79b21.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775679624.git.jani.nikula@intel.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The data->mode member is only used within the mode loop. Just remove it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index c09e9ce36928..2db5422c211d 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -38,7 +38,6 @@ static int traversed_mst_output_count;
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-	drmModeModeInfo *mode;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	struct igt_fb fb;
@@ -477,12 +476,11 @@ static void test_dsc_sst_fallback(data_t *data)
 
 	/* Find a mode that doesn't require DSC initially */
 	for_each_connector_mode(data->output, mode) {
-		data->mode = mode;
-		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
-				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+		igt_create_color_fb(data->drm_fd, mode->hdisplay,
+				    mode->vdisplay, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
 				    &data->fb);
-		igt_output_override_mode(data->output, data->mode);
+		igt_output_override_mode(data->output, mode);
 		igt_output_set_crtc(data->output,
 				    data->crtc);
 		data->primary = igt_output_get_plane_type(data->output,
@@ -495,8 +493,8 @@ static void test_dsc_sst_fallback(data_t *data)
 						    NULL);
 		if (ret != 0) {
 			igt_debug("Skipping mode %dx%d@%d on %s\n",
-				 data->mode->hdisplay, data->mode->vdisplay,
-				 data->mode->vrefresh,
+				 mode->hdisplay, mode->vdisplay,
+				 mode->vrefresh,
 				 igt_output_name(data->output));
 			continue;
 		}
-- 
2.47.3

