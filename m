Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCBC35FF8
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 05:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112F010E065;
	Tue, 18 Mar 2025 05:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUE0E51U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B6D10E065
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 05:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742276756; x=1773812756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rJVQbkCuAd3UyG0Au1/FlwgrJXtOFyXgHl2WnJuiLI=;
 b=SUE0E51UhHWflYxSvkVyk5un0EDsDTdwwvxGxTmfBV1WjgWgoMi3cD1H
 RPrTPXElr4UYlpXo1GP6M6t+Czr8Qm35Rc8PH6KDp0Of1k8FBbKwJcmlt
 TcFPPydd1Ek+CL4gdhmOYepUnG2d8HYW8qjy65UwdCBy9GwE+9vp49+01
 jtxBckYLoEDAMxj4k/uQia/ZzkeGUaiMLcefZY3Bmds0MlmyBpAMhQHLc
 bqCbdZhP8hXECX/nTjYFsRTS+0c/SQeWr3RVAhS2f0Zz1Aa/K1LH/umBk
 rjhFpgUPGh7oey9/MVDesOPWog/B5Zc4cj7ZKNZc4rf0RRSVFwOYw52NB g==;
X-CSE-ConnectionGUID: N5rd56iyTCm5s9MxEnOMQQ==
X-CSE-MsgGUID: gKmzqZE6QDSVUZS8ANWYig==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="30983411"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="30983411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:45:56 -0700
X-CSE-ConnectionGUID: cEVovDQESq6AKjw+yYV2bg==
X-CSE-MsgGUID: hpRFtizPQtqlG4Lec3I1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="122905271"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:45:54 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Date: Tue, 18 Mar 2025 11:10:44 +0530
Message-Id: <20250318054045.2611239-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318054045.2611239-1-santhosh.reddy.guddati@intel.com>
References: <20250318054045.2611239-1-santhosh.reddy.guddati@intel.com>
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

V5: Re use local variables for async formats and free blob after
    usage(Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  7 ++++++-
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc3bb3ae7..35e385a41 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5759,10 +5760,12 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
 {
 	const struct drm_format_modifier_blob *blob_data;
+	const struct drm_format_modifier *async_modifiers;
 	drmModePropertyBlobPtr blob;
 	uint64_t blob_id;
 	int idx = 0;
 	int count;
+	const uint32_t *async_formats;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
 		drmModePlanePtr p = plane->drm_plane;
@@ -5796,8 +5799,10 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	blob_data = (const struct drm_format_modifier_blob *) blob->data;
 
 	count = igt_count_plane_format_mod(blob_data);
-	if (!count)
+	if (!count) {
+		drmModeFreePropertyBlob(blob);
 		return;
+	}
 
 	plane->format_mod_count = count;
 	plane->formats = calloc(count, sizeof(plane->formats[0]));
@@ -5822,6 +5827,52 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 
 	igt_assert_eq(idx, plane->format_mod_count);
+
+	drmModeFreePropertyBlob(blob);
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
+	blob_data = (const struct drm_format_modifier_blob *)blob->data;
+	count = igt_count_plane_format_mod(blob_data);
+
+	if (!count) {
+		drmModeFreePropertyBlob(blob);
+		return;
+	}
+
+	plane->async_format_mod_count = count;
+	plane->async_modifiers = calloc(count, sizeof(plane->async_modifiers[0]));
+	igt_assert(plane->async_modifiers);
+
+	plane->async_formats = calloc(count, sizeof(plane->async_formats[0]));
+	igt_assert(plane->async_formats);
+
+	idx = 0;
+	for (int i = 0; i < blob_data->count_modifiers; i++) {
+		for (int j = 0; j < 64; j++) {
+			async_modifiers = modifiers_ptr(blob_data);
+			async_formats = formats_ptr(blob_data);
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
+
+	drmModeFreePropertyBlob(blob);
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

