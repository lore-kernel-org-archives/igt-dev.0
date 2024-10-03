Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8585CF856D
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 08:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705F10E7D5;
	Thu,  3 Oct 2024 08:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN6IBwtd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A52110E7D5
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727945129; x=1759481129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R4cOBs9CHz5fdhmS3mLtmjSUiPC+FmlJ67CQugs0jIc=;
 b=JN6IBwtdQRIA0QvG3Vd0dTUrGtY+JO1jBpbhyd3/3r33eoBbY6WLakRW
 m8zbSaLByNPuhNG1wnaYDKNzTCoRCygaz+DM885A0Am/CtOZlb1Aqtowi
 sxiCW7mWhZyq9Ybj6WynPjcy2UXtSsc4hZITrPqcN0AksBvJ7SeQ4r3ok
 wmpk7Ph5B7CLv3V9ldydAzeN/kay42M9xvsXOHTJ47chAKXaVyoEsoVSE
 e4k5HVQLGxGdy4lfZroM2Vnb8PQig7gVwPcyVri+IIOakLF4rDSoRISEI
 Q2hJZiFKyIosyqmHaOr8XzCprc3xvmtR00fc2A83iPU12pcdEJe5dxhKJ A==;
X-CSE-ConnectionGUID: 5zlY3et8So6gtkRkSHCtKQ==
X-CSE-MsgGUID: jRJLHK4xQRWRCLrIF7KyPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38489074"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38489074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 01:45:29 -0700
X-CSE-ConnectionGUID: zPjXpTlTQ1qPXmTi3JFvyQ==
X-CSE-MsgGUID: yGPWFhTmRtqB2qr5fhnr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78828294"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 01:45:26 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, arun.r.murthy@intel.com,
 vandita.kulkarni@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add support to get list of async
 modifiers
Date: Thu,  3 Oct 2024 14:14:19 +0530
Message-Id: <20241003084420.2547152-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003084420.2547152-1-santhosh.reddy.guddati@intel.com>
References: <20241003084420.2547152-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 38 +++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  9 ++++++++-
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3269ec58f..efbdd6bb9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -687,6 +687,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5688,11 +5689,12 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
 {
-	const struct drm_format_modifier_blob *blob_data;
+	const struct drm_format_modifier_blob *blob_data, *async_blob_data;
 	drmModePropertyBlobPtr blob;
 	uint64_t blob_id;
 	int idx = 0;
 	int count;
+	int async_count;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
 		drmModePlanePtr p = plane->drm_plane;
@@ -5752,6 +5754,40 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 
 	igt_assert_eq(idx, plane->format_mod_count);
+
+	 if (igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
+ 
+		 blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC);
+
+                 blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
+                 if (blob) {
+                         async_blob_data = (const struct drm_format_modifier_blob *)blob->data;
+                         async_count = igt_count_plane_format_mod(async_blob_data);
+                         if (async_count) {
+                                 plane->async_format_mod_count = async_count;
+                                 plane->async_modifiers = calloc(async_count, sizeof(plane->async_modifiers[0]));
+                                 igt_assert(plane->async_modifiers);
+
+                                 for (int i = 0; i < async_blob_data->count_modifiers; i++) {
+                                         for (int j = 0; j < 64; j++) {
+                                                 const struct drm_format_modifier *async_modifiers =
+							 modifiers_ptr(async_blob_data);
+                                                 const uint32_t *formats = formats_ptr(async_blob_data);
+
+                                                 if (!(async_modifiers[i].formats & (1ULL << j)))
+                                                         continue;
+                                                 plane->formats[idx] = formats[async_modifiers[i].offset + j];
+                                                 plane->async_modifiers[idx] = async_modifiers[i].modifier;
+                                                 idx++;
+                                                 igt_assert_lte(idx, plane->async_format_mod_count);
+                                         }
+                                 }
+                                igt_assert_eq(idx, plane->async_format_mod_count);
+                         }
+                         drmModeFreePropertyBlob(blob);
+                 }
+         }
+
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2461fa47c..e1ebeabf1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -359,7 +359,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_SCALING_FILTER,
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
-       IGT_NUM_PLANE_PROPS
+	   IGT_PLANE_IN_FORMATS_ASYNC,
+       IGT_NUM_PLANE_PROPS,
 };
 
 /**
@@ -432,6 +433,9 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	uint64_t *async_modifiers;
+	int async_format_mod_count;
 } igt_plane_t;
 
 /*
@@ -1241,5 +1245,8 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
+//bool igt_get_supported_async_modifiers(igt_plane_t *plane, uint32_t *formats,
+//			int num_formats, uint64_t **modifiers, int *num_modifiers);
+bool igt_get_supported_async_modifier(igt_plane_t *plane);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

