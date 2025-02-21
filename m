Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C089CC021B5
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 06:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B71410EA21;
	Fri, 21 Feb 2025 06:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKsn2sr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183A410E997
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 06:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740117621; x=1771653621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4vlXB6jlm9Xp8pK3z8HRUtiwiWELRfjcFdlejnLY5I=;
 b=HKsn2sr7TriKkHqJMtR8nq9IS2teeS1T8eFANTc8OiaTM4jnDgiAisG/
 I0Y0PZ0I9b9xW+6n7kw/qzz2y5KhEaFARRQZSLUHtyFAPPfW/R2DP6AXb
 DBJuoGclKbMayDMhhnR09AH9kRjoRQPyz2F1ZBkIIn7hi5RBolO5NRBfE
 HNRFooUQh+Vw2xREzA2HjcmW1SorUnzmrBvr3OrfPd8vRd2a+Fy8LhGq1
 qcYgV7j4uVnMWfZnCq5vUv478+QmZNh7Q4cO1adWBCUpEZoMcuO97c63S
 ZPSfakxtH8hs5ONbqBhWCsxwqmmbgD7HHH0AJwIkOEE80uun+QlbPtLMF g==;
X-CSE-ConnectionGUID: AWc3TNLURPeiCgNrHGXwkw==
X-CSE-MsgGUID: OrAKvJz1QZahIPPEwAjjLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28520835"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="28520835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:00:20 -0800
X-CSE-ConnectionGUID: 0kLUkX+XRpiN9gRQ8Prbuw==
X-CSE-MsgGUID: 0LiqtmHlQU25aQOSBluuMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146173894"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:00:14 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Date: Fri, 21 Feb 2025 11:26:46 +0530
Message-Id: <20250221055647.2014355-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
References: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
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

V2: Add new fields async_formats and reset idx.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  8 +++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0ba1afb08..8623235a9 100644
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
@@ -5788,6 +5792,46 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
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
+	plane->async_formats = calloc(async_count, sizeof(plane->async_formats[0]));
+	igt_assert(plane->async_formats);
+
+	idx = 0;
+	for (int i = 0; i < async_blob_data->count_modifiers; i++) {
+		for (int j = 0; j < 64; j++) {
+			async_modifiers = modifiers_ptr(async_blob_data);
+			async_formats = formats_ptr(async_blob_data);
+
+			if (!(async_modifiers[i].formats & (1ULL << j)))
+				continue;
+
+			plane->async_formats[idx] = async_formats[async_modifiers[i].offset + j];
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
index 7227f0b0e..7bc5fc06c 100644
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
@@ -438,6 +439,10 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	uint64_t *async_modifiers;
+	uint32_t *async_formats;
+	int async_format_mod_count;
 } igt_plane_t;
 
 /*
@@ -1273,5 +1278,6 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+bool igt_get_supported_async_modifier(igt_plane_t *plane);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1

