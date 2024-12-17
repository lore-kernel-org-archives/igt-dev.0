Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC87EE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 06:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852A110E414;
	Tue, 17 Dec 2024 06:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhrvZeBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EF210E414
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734418227; x=1765954227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9tgBBvNz1BhqFcnwRWgM36OeVG6I+fxUMepjOFoUg0=;
 b=jhrvZeBy9O3RzUobP3qXGlHBNy2tRz97FSFN/T6ZekdFzKxIb6YcTk3s
 MCSvFIosp7skz4sJbzp7rblrNzdpWOjmdrXidDissM4rGC0kqlbZ+AC8v
 fdE9mgcBNXCMRqP7dMcxyTstKGGawZLEj9VH2G3VDjFsIo2dauGwM4VXi
 Rfv0TO3a3JC24Wbl3qQ5rfGR+Fs0ZhOkya2f0ucrslhaWz+QVKVpbDKJ3
 H66IEzmVLJYtFD+sIKDpWQF2/636kNqrUyvrS9VsjSgGZuwTx6Bq/33Fl
 mbs1of7gSGac5I1wAk/aIJrHYJ+2w0tJisLLd9+DqBjmZU3ojFkD3xtPa Q==;
X-CSE-ConnectionGUID: 9y5n9CyNQrekpznoVme2ag==
X-CSE-MsgGUID: KBiw2pfQT6u67/2eCuJSRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45523656"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="45523656"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 22:50:27 -0800
X-CSE-ConnectionGUID: 3rxkyfj7RZe0erzsnvKLwA==
X-CSE-MsgGUID: u8jd2NAMQLiPQH4N7NeCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97337483"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 22:50:25 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add support to retrieve async
 modifiers
Date: Tue, 17 Dec 2024 12:14:12 +0530
Message-Id: <20241217064413.2301301-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
References: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
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
 lib/igt_kms.c | 39 ++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  7 ++++++-
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3d061abc5..80885badc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5724,11 +5725,14 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 
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
@@ -5788,6 +5792,39 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 
 	igt_assert_eq(idx, plane->format_mod_count);
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
index 8810123fb..56f37a6bb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
        IGT_PLANE_SIZE_HINTS,
-       IGT_NUM_PLANE_PROPS
+       IGT_PLANE_IN_FORMATS_ASYNC,
+       IGT_NUM_PLANE_PROPS,
 };
 
 /**
@@ -438,6 +439,9 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	uint64_t *async_modifiers;
+	int async_format_mod_count;
 } igt_plane_t;
 
 /*
@@ -1270,5 +1274,6 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+bool igt_get_supported_async_modifier(igt_plane_t *plane);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

