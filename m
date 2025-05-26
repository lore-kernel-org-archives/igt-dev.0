Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C579C54FC6
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 05:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198D10E0D3;
	Mon, 26 May 2025 05:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzVTco8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8AB10E0D3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 05:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748238723; x=1779774723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xi9fshlGpF4I/xIwOhTSBDrvInQ9PTmyXLdXKHEWNmQ=;
 b=GzVTco8HMowLag+f3PrEPTCSXOLndkcK7wm/1Aqbpd1hzkKtAq4uuZnf
 o81ekNH22vXyO7WENc4sHuB8omc5RPsNP6KkjWiRntJoOadqF4WSp2qxp
 Z9K4m07ICwjozNCF+5F5OP9TF943rxVGn1sbgsrZwUclqpYen63hrN7mo
 li9u0t53Hqt1nYS7r97HPW2nCdoeX62xupjVtKtZnRbAzxEgViDxiR8jp
 bDQeu2kDKp35rzo5VlkxSaYa3MQXUMf0UdmyPcDVqFNIx3bW8DCxTYZGm
 6akejhFeJY0T4BsXmXbbaXGCEIu+Y64aSKfq1opTWXW7M0WY5zNQy1t5q A==;
X-CSE-ConnectionGUID: ErCTquLYRlSilRWdBr2WVg==
X-CSE-MsgGUID: B6OGAVZkSha5ZEvBC/yzdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="75595087"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="75595087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:52:03 -0700
X-CSE-ConnectionGUID: WO/sIiaATDOE2Hq9fj1McA==
X-CSE-MsgGUID: c+2gX4r1QIW7VtW1HRoPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142135666"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:52:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v11 1/5] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Date: Mon, 26 May 2025 11:12:13 +0530
Message-Id: <20250526054217.127802-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526054217.127802-1-santhosh.reddy.guddati@intel.com>
References: <20250526054217.127802-1-santhosh.reddy.guddati@intel.com>
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

V6: Initialize async_modifiers and async_formats to NULL. (Chaitanya)

V7: Fix async format count to return 0 on failures (Chaitanya)

V8: Refactor parsing blob to a common function. (Ville)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c | 73 +++++++++++++++++++++++++++++++--------------------
 lib/igt_kms.h |  7 ++++-
 2 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ee03e870..599901ee8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5786,13 +5787,43 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 	return count;
 }
 
+static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blob_data,
+				      uint32_t **formats, uint64_t **modifiers, int *count)
+{
+	const struct drm_format_modifier *m = modifiers_ptr(blob_data);
+	const uint32_t *f = formats_ptr(blob_data);
+	int idx = 0;
+
+	*count = igt_count_plane_format_mod(blob_data);
+	if (*count == 0)
+		return;
+
+	*formats = calloc(*count, sizeof((*formats)[0]));
+	igt_assert(*formats);
+	*modifiers = calloc(*count, sizeof((*modifiers)[0]));
+	igt_assert(*modifiers);
+
+	for (int i = 0; i < blob_data->count_modifiers; i++) {
+		for (int j = 0; j < 64; j++) {
+			if (!(m[i].formats & (1ULL << j)))
+				continue;
+
+			(*formats)[idx] = f[m[i].offset + j];
+			(*modifiers)[idx] = m[i].modifier;
+			idx++;
+			igt_assert_lte(idx, *count);
+		}
+	}
+
+	igt_assert_eq(idx, *count);
+}
+
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
 {
 	const struct drm_format_modifier_blob *blob_data;
 	drmModePropertyBlobPtr blob;
 	uint64_t blob_id;
-	int idx = 0;
-	int count;
+	int count = 0;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
 		drmModePlanePtr p = plane->drm_plane;
@@ -5818,40 +5849,24 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 
 	blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS);
-
 	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
 	if (!blob)
 		return;
 
-	blob_data = (const struct drm_format_modifier_blob *) blob->data;
-
-	count = igt_count_plane_format_mod(blob_data);
-	if (!count)
-		return;
-
-	plane->format_mod_count = count;
-	plane->formats = calloc(count, sizeof(plane->formats[0]));
-	igt_assert(plane->formats);
-	plane->modifiers = calloc(count, sizeof(plane->modifiers[0]));
-	igt_assert(plane->modifiers);
+	blob_data = (const struct drm_format_modifier_blob *)blob->data;
+	igt_parse_format_mod_blob(blob_data, &plane->formats, &plane->modifiers, &plane->format_mod_count);
+	drmModeFreePropertyBlob(blob);
 
-	for (int i = 0; i < blob_data->count_modifiers; i++) {
-		for (int j = 0; j < 64; j++) {
-			const struct drm_format_modifier *modifiers =
-				modifiers_ptr(blob_data);
-			const uint32_t *formats = formats_ptr(blob_data);
-
-			if (!(modifiers[i].formats & (1ULL << j)))
-				continue;
+	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
+		blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC);
+		blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
+		if (!blob)
+			return;
 
-			plane->formats[idx] = formats[modifiers[i].offset + j];
-			plane->modifiers[idx] = modifiers[i].modifier;
-			idx++;
-			igt_assert_lte(idx, plane->format_mod_count);
-		}
+		blob_data = (const struct drm_format_modifier_blob *)blob->data;
+		igt_parse_format_mod_blob(blob_data, &plane->async_formats, &plane->async_modifiers, &plane->async_format_mod_count);
+		drmModeFreePropertyBlob(blob);
 	}
-
-	igt_assert_eq(idx, plane->format_mod_count);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a85fee515..7bc1a6886 100644
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

