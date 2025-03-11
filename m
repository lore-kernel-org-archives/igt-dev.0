Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA5DC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 08:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE710E536;
	Tue, 11 Mar 2025 08:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LohfMttK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463810E53C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741683542; x=1773219542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJ2VyEbWKw+YJXufhzp8YGaw+HlhdLaVruFb/D+GIdU=;
 b=LohfMttKML1YCssYzW0VLVnUtmCPThpullkSXIdDpKHNf/5Vh1F1nw+s
 uDUvQ+vKBJghoxvRuoO2ph1/X0p8t2HFRv98Fti6wyoVPDYO2JNesXYqI
 g03P3eRZSLM4BHA2WDO40IJ1HcsTX1CeIIxC/ClAiIRnPkALtueDMJSub
 uNCMGFLrj0VOQsF7fo1kdO34ln4AOo0t/5fFTcYnAbJObTlu0qOWnHMka
 szn576RHWhRSbPdD0g9UAaEbr/sCTeTKN5r7OQ5QAHCd8HYB+PA2PWOT9
 WTUShlf47TjDPTYepgmPpxSCilZwFUC8juIceysZ2A8dHAuIFH1El3x0y w==;
X-CSE-ConnectionGUID: SunIwHEjTQ6Ljj60RjJ0pg==
X-CSE-MsgGUID: JwmUxv8NTf+xZafmXqwnYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42822032"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42822032"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:59:02 -0700
X-CSE-ConnectionGUID: sAm4fOU/SfOJi/dncIBt4A==
X-CSE-MsgGUID: 3tP3jaRYSrOJKcwDsD7dcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120211245"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:59:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Date: Tue, 11 Mar 2025 14:24:21 +0530
Message-Id: <20250311085422.2573860-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
References: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
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

Parse "IN_FORMATS_ASYNC" plane property to identify supported
format modifier pairs for async flips

V2: Add new fields async_formats and reset idx.

V3: Improve commit message , remove unused declaration (Chaitanya)
    Introduce structure to hold a format modifier and its
    associated format list.

V4: Implement format+modifier tuples for async similar to IN_FORMATS
    (Chaitanya).

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  7 ++++++-
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc3bb3ae7..dfb23c45e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5758,11 +5759,14 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 
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
@@ -5822,6 +5826,46 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
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
index 27b545f52..78d6a7ee4 100644
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
-- 
2.34.1

