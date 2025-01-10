Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E533E7719E
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 06:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009410EFE4;
	Fri, 10 Jan 2025 06:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WV2jmtVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B710EFDE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736491189; x=1768027189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ElH2UcVNeUY+A1VfemeU3awFe/ShiV2Pk6JIDtBdeU=;
 b=WV2jmtVY6cQTlt4ul5Fhrnpkfk4wgZZsKD2vmXPBqhpdT8TkFvM01AJx
 q7ZabxQuxs7ez3CmSllmo6/dGlbcZEpVdOIM/O33q8+hNJZDk/N8Rr20b
 JBEweNcDRDfeRedpyHrKKj1GH7tNfprQPGANRBaQ7r36Jk0aDsyMz9BIW
 DdmGtDMwMDTamGgrBY0heYalcTnga2oDeTOc2HyuJAmptm0pNqdzUN0DH
 qU1AV2TUOUQ8PglhkiMHTgW9w01Q5ScgBfZV7D4qwZ0Lkhc8qFkLmn/mk
 5pHfBmMGbE98Dt/hWl+LFYvYh9r3n0altrhzLs7EBi07fEw9wsos4PUu4 w==;
X-CSE-ConnectionGUID: 0fEVK7oESWulBdZaeCnuZw==
X-CSE-MsgGUID: /ncb9XZWS1aTUcSH2MyBIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36800579"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36800579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:39:49 -0800
X-CSE-ConnectionGUID: 7NJecmTwQXauu476gbOWKA==
X-CSE-MsgGUID: UAfDLgxSRyuGwHM0baBKPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104526785"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:39:48 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add support to retrieve async
Date: Fri, 10 Jan 2025 12:09:08 +0530
Message-Id: <20250110063909.34042-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110063909.34042-1-santhosh.reddy.guddati@intel.com>
References: <20250110063909.34042-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces async_blob_data to handle asynchronous format
modifiers.Processes asynchronous format modifiers and update plane's
format and modifiers.

Handles 'IN_FORMATS_ASYNC' property.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  7 ++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 95e3059f7..d7a50b663 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5747,11 +5748,14 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
 {
-	const struct drm_format_modifier_blob *blob_data;
+	const struct drm_format_modifier_blob *blob_data, *async_blob_data;
+	const struct drm_format_modifier *async_modifiers;
 	drmModePropertyBlobPtr blob;
 	uint64_t blob_id;
 	int idx = 0;
 	int count;
+	int async_count;
+	const uint32_t *async_formats;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
 		drmModePlanePtr p = plane->drm_plane;
@@ -5811,6 +5815,42 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 
 	igt_assert_eq(idx, plane->format_mod_count);
+
+	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
+		return;
+
+	blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC);
+	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
+
+	if (!blob)
+		return;
+
+	async_blob_data = (const struct drm_format_modifier_blob *)blob->data;
+	async_count = igt_count_plane_format_mod(async_blob_data);
+
+	if (!async_count)
+		return;
+
+	plane->async_format_mod_count = async_count;
+	plane->async_modifiers = calloc(async_count, sizeof(plane->async_modifiers[0]));
+	igt_assert(plane->async_modifiers);
+
+	for (int i = 0; i < async_blob_data->count_modifiers; i++) {
+		for (int j = 0; j < 64; j++) {
+			async_modifiers = modifiers_ptr(async_blob_data);
+			async_formats = formats_ptr(async_blob_data);
+
+			if (!(async_modifiers[i].formats & (1ULL << j)))
+				continue;
+
+			plane->formats[idx] = async_formats[async_modifiers[i].offset + j];
+			plane->async_modifiers[idx] = async_modifiers[i].modifier;
+			idx++;
+			igt_assert_lte(idx, plane->async_format_mod_count);
+		}
+	}
+
+	igt_assert_eq(idx, plane->async_format_mod_count);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e2a927ab..130dc8f53 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -368,7 +368,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
        IGT_PLANE_SIZE_HINTS,
-       IGT_NUM_PLANE_PROPS
+       IGT_PLANE_IN_FORMATS_ASYNC,
+       IGT_NUM_PLANE_PROPS,
 };
 
 /**
@@ -441,6 +442,9 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	uint64_t *async_modifiers;
+	int async_format_mod_count;
 } igt_plane_t;
 
 /*
@@ -1275,5 +1279,6 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+bool igt_get_supported_async_modifier(igt_plane_t *plane);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1

