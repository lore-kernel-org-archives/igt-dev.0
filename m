Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98531CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4940D10E0E5;
	Tue, 12 May 2026 12:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iS4j3xsM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54D610E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588519; x=1810124519;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BN5XwBirGBFxpqkEORNcKDeiMHUkoFfBEt0uLYJdzA8=;
 b=iS4j3xsMLU0M62EUjRn04fpbKFPKsSVqj0jwgV1G7YOpSULtj1RQCyft
 ZdFsE51zyLd5A2V+PeKEWxf55+YsZLabassAG6ZJhPgboVGu+X9qR9vfn
 4NfKt1l6Pg20DxLhYrqZgVnLu7yBdDPs1VJS/gC/raw94RonY7AySoCmH
 +tnTW/YTMzfwoIdSi3hB+E/hMe+zTvtGaqINPk4xv7fJMAylZZHL2qL4S
 tuR0P4B/EvujM7F6XIu05cEdnbnqMCLYOA9N1imz77eyy5vRogGCPAtMZ
 fkmufaiUpZtoVJiW88L9mJje56ryrUP2ASEU+qgx7rHbMdG63VtjB4sgO w==;
X-CSE-ConnectionGUID: yQHgf83jROaIrRInznzxpw==
X-CSE-MsgGUID: gGOOHYT3R3ytp5cGkWC8Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525673"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:59 -0700
X-CSE-ConnectionGUID: odT5SEVQThuEanvUw2yMvg==
X-CSE-MsgGUID: oI81++HSTHmHMcJ9XfuGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091363"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:59 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/25] lib/kms: Introduce struct igt_format_mods
Date: Tue, 12 May 2026 15:21:21 +0300
Message-ID: <20260512122143.11013-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Wrap the forma+modifier arrays in a structure that can be passed
around. Having a real type for this will make the code less messy
and fragile, not to mention that it'll be easier to share all the
code that operates on these arrays.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                          | 60 +++++++++++++-------------
 lib/igt_kms.h                          | 19 ++++----
 tests/chamelium/kms_chamelium_frames.c | 22 +++++-----
 tests/intel/kms_flip_tiling.c          | 12 +++---
 tests/kms_async_flips.c                | 26 +++++------
 tests/kms_plane.c                      | 14 +++---
 6 files changed, 76 insertions(+), 77 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99fc9fa05c96..b60bfa033bcd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6225,19 +6225,19 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 
 		count = p->count_formats;
 
-		plane->format_mod_count = count;
-		plane->formats = calloc(count, sizeof(plane->formats[0]));
-		igt_assert(plane->formats);
-		plane->modifiers = calloc(count, sizeof(plane->modifiers[0]));
-		igt_assert(plane->modifiers);
+		plane->format_mods.count = count;
+		plane->format_mods.formats = calloc(count, sizeof(plane->format_mods.formats[0]));
+		igt_assert(plane->format_mods.formats);
+		plane->format_mods.modifiers = calloc(count, sizeof(plane->format_mods.modifiers[0]));
+		igt_assert(plane->format_mods.modifiers);
 
 		/*
 		 * We don't know which modifiers are
 		 * supported, so we'll assume linear only.
 		 */
 		for (int i = 0; i < count; i++) {
-			plane->formats[i] = p->formats[i];
-			plane->modifiers[i] = DRM_FORMAT_MOD_LINEAR;
+			plane->format_mods.formats[i] = p->formats[i];
+			plane->format_mods.modifiers[i] = DRM_FORMAT_MOD_LINEAR;
 		}
 
 		return;
@@ -6249,7 +6249,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 		return;
 
 	blob_data = (const struct drm_format_modifier_blob *)blob->data;
-	igt_parse_format_mod_blob(blob_data, &plane->formats, &plane->modifiers, &plane->format_mod_count);
+	igt_parse_format_mod_blob(blob_data, &plane->format_mods.formats, &plane->format_mods.modifiers, &plane->format_mods.count);
 	drmModeFreePropertyBlob(blob);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
@@ -6259,7 +6259,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 			return;
 
 		blob_data = (const struct drm_format_modifier_blob *)blob->data;
-		igt_parse_format_mod_blob(blob_data, &plane->async_formats, &plane->async_modifiers, &plane->async_format_mod_count);
+		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async.formats, &plane->format_mods_async.modifiers, &plane->format_mods_async.count);
 		drmModeFreePropertyBlob(blob);
 	}
 }
@@ -6277,9 +6277,9 @@ bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
 {
 	int i;
 
-	for (i = 0; i < plane->format_mod_count; i++) {
-		if (plane->formats[i] == format &&
-		    plane->modifiers[i] == modifier)
+	for (i = 0; i < plane->format_mods.count; i++) {
+		if (plane->format_mods.formats[i] == format &&
+		    plane->format_mods.modifiers[i] == modifier)
 			return true;
 
 	}
@@ -6297,7 +6297,7 @@ static int igt_count_display_format_mod(igt_display_t *display)
 
 		for_each_plane_on_crtc(crtc,
 				       plane) {
-			count += plane->format_mod_count;
+			count += plane->format_mods.count;
 		}
 	}
 
@@ -6310,16 +6310,16 @@ igt_add_display_format_mod(igt_display_t *display, uint32_t format,
 {
 	int i;
 
-	for (i = 0; i < display->format_mod_count; i++) {
-		if (display->formats[i] == format &&
-		    display->modifiers[i] == modifier)
+	for (i = 0; i < display->format_mods.count; i++) {
+		if (display->format_mods.formats[i] == format &&
+		    display->format_mods.modifiers[i] == modifier)
 			return;
 
 	}
 
-	display->formats[i] = format;
-	display->modifiers[i] = modifier;
-	display->format_mod_count++;
+	display->format_mods.formats[i] = format;
+	display->format_mods.modifiers[i] = modifier;
+	display->format_mods.count++;
 }
 
 static void igt_fill_display_format_mod(igt_display_t *display)
@@ -6330,21 +6330,21 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 	if (!count)
 		return;
 
-	display->formats = calloc(count, sizeof(display->formats[0]));
-	igt_assert(display->formats);
-	display->modifiers = calloc(count, sizeof(display->modifiers[0]));
-	igt_assert(display->modifiers);
+	display->format_mods.formats = calloc(count, sizeof(display->format_mods.formats[0]));
+	igt_assert(display->format_mods.formats);
+	display->format_mods.modifiers = calloc(count, sizeof(display->format_mods.modifiers[0]));
+	igt_assert(display->format_mods.modifiers);
 
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
 		for_each_plane_on_crtc(crtc,
 				       plane) {
-			for (int i = 0; i < plane->format_mod_count; i++) {
+			for (int i = 0; i < plane->format_mods.count; i++) {
 				igt_add_display_format_mod(display,
-							   plane->formats[i],
-							   plane->modifiers[i]);
-				igt_assert_lte(display->format_mod_count, count);
+							   plane->format_mods.formats[i],
+							   plane->format_mods.modifiers[i]);
+				igt_assert_lte(display->format_mods.count, count);
 			}
 		}
 	}
@@ -6363,9 +6363,9 @@ bool igt_display_has_format_mod(igt_display_t *display, uint32_t format,
 {
 	int i;
 
-	for (i = 0; i < display->format_mod_count; i++) {
-		if (display->formats[i] == format &&
-		    display->modifiers[i] == modifier)
+	for (i = 0; i < display->format_mods.count; i++) {
+		if (display->format_mods.formats[i] == format &&
+		    display->format_mods.modifiers[i] == modifier)
 			return true;
 
 	}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a58cb5cd3430..35923f94d7ff 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -423,6 +423,12 @@ typedef struct {
 
 } igt_colorop_t;
 
+struct igt_format_mods {
+	uint64_t *modifiers;
+	uint32_t *formats;
+	int count;
+};
+
 typedef struct _igt_plane {
 	/*< private >*/
 	igt_crtc_t *crtc;
@@ -453,13 +459,8 @@ typedef struct _igt_plane {
 	uint32_t props[IGT_NUM_PLANE_PROPS];
 	uint64_t values[IGT_NUM_PLANE_PROPS];
 
-	uint64_t *modifiers;
-	uint32_t *formats;
-	int format_mod_count;
-
-	uint64_t *async_modifiers;
-	uint32_t *async_formats;
-	int async_format_mod_count;
+	struct igt_format_mods format_mods;
+	struct igt_format_mods format_mods_async;
 
 	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
 	int num_color_pipelines;
@@ -533,9 +534,7 @@ struct _igt_display {
 	bool has_plane_color_pipeline;
 	bool first_commit;
 
-	uint64_t *modifiers;
-	uint32_t *formats;
-	int format_mod_count;
+	struct igt_format_mods format_mods;
 };
 
 typedef struct {
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 1cd3b34b9d65..3a59c2b51a9b 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -302,13 +302,13 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
 				  uint64_t *modifier, bool allow_yuv)
 {
 	int min_dim;
-	uint32_t idx[plane->format_mod_count];
+	uint32_t idx[plane->format_mods.count];
 	unsigned int count = 0;
 	unsigned int i;
 
 	/* First pass to count the supported formats. */
-	for (i = 0; i < plane->format_mod_count; i++) {
-		uint32_t f = plane->formats[i];
+	for (i = 0; i < plane->format_mods.count; i++) {
+		uint32_t f = plane->format_mods.formats[i];
 
 		if (igt_fb_supported_format(f) &&
 		    (allow_yuv || !igt_format_is_yuv(f)))
@@ -318,8 +318,8 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
 	igt_assert(count > 0);
 
 	i = idx[rand() % count];
-	*format = plane->formats[i];
-	*modifier = plane->modifiers[i];
+	*format = plane->format_mods.formats[i];
+	*modifier = plane->format_mods.modifiers[i];
 
 	update_tiled_modifier(plane, *width, *height, *format, modifier);
 
@@ -1041,9 +1041,9 @@ int igt_main()
 				output, DRM_PLANE_TYPE_PRIMARY);
 			igt_assert(primary);
 
-			for (k = 0; k < primary->format_mod_count; k++) {
-				uint32_t format = primary->formats[k];
-				uint64_t modifier = primary->modifiers[k];
+			for (k = 0; k < primary->format_mods.count; k++) {
+				uint32_t format = primary->format_mods.formats[k];
+				uint64_t modifier = primary->format_mods.modifiers[k];
 
 				if (!igt_fb_supported_format(format))
 					continue;
@@ -1080,9 +1080,9 @@ int igt_main()
 				output, DRM_PLANE_TYPE_PRIMARY);
 			igt_assert(primary);
 
-			for (k = 0; k < primary->format_mod_count; k++) {
-				uint32_t format = primary->formats[k];
-				uint64_t modifier = primary->modifiers[k];
+			for (k = 0; k < primary->format_mods.count; k++) {
+				uint32_t format = primary->format_mods.formats[k];
+				uint64_t modifier = primary->format_mods.modifiers[k];
 
 				if (!igt_fb_supported_format(format))
 					continue;
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 14cc68c3b890..bccacfa7b229 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -244,16 +244,16 @@ int igt_main()
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-			for (int i = 0; i < plane->format_mod_count; i++) {
-				format[0] = plane->formats[i];
-				modifier[0] = plane->modifiers[i];
+			for (int i = 0; i < plane->format_mods.count; i++) {
+				format[0] = plane->format_mods.formats[i];
+				modifier[0] = plane->format_mods.modifiers[i];
 
 				if (format[0] != data.testformat)
 					continue;
 
-				for (int j = 0; j < plane->format_mod_count; j++) {
-					format[1] = plane->formats[j];
-					modifier[1] = plane->modifiers[j];
+				for (int j = 0; j < plane->format_mods.count; j++) {
+					format[1] = plane->format_mods.formats[j];
+					modifier[1] = plane->format_mods.modifiers[j];
 
 					if (format[1] != data.testformat)
 						continue;
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 61cebf3ba6fe..6a56aaa48ecd 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -664,11 +664,11 @@ static void test_invalid(data_t *data)
 
 	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
 
-	mod1 = data->plane->async_modifiers[0];
-	mod2 = data->plane->async_modifiers[data->plane->async_format_mod_count - 1];
+	mod1 = data->plane->format_mods_async.modifiers[0];
+	mod2 = data->plane->format_mods_async.modifiers[data->plane->format_mods_async.count - 1];
 
 	/* Need at least 2 different modifiers to test invalid case */
-	igt_require_f(data->plane->async_format_mod_count >= 2 && mod1 != mod2,
+	igt_require_f(data->plane->format_mods_async.count >= 2 && mod1 != mod2,
 		      "Need at least 2 different async modifiers for invalid test\n");
 
 	igt_info("using modifier1 %s and modifier2 %s\n",
@@ -876,8 +876,8 @@ static void require_linear_modifier(data_t *data)
 		return;
 	}
 
-	for (int i = 0; i < data->plane->async_format_mod_count; i++) {
-		uint64_t modifier = data->plane->async_modifiers[i];
+	for (int i = 0; i < data->plane->format_mods_async.count; i++) {
+		uint64_t modifier = data->plane->format_mods_async.modifiers[i];
 
 		if (modifier == DRM_FORMAT_MOD_LINEAR) {
 			data->modifier = DRM_FORMAT_MOD_LINEAR;
@@ -968,13 +968,13 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 		data->crtc = crtc;
 		test_init(data);
 
-		igt_assert_f(data->plane->async_format_mod_count > 0,
+		igt_assert_f(data->plane->format_mods_async.count > 0,
 			     "No async format/modifier supported\n");
 
-		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+		for (int i = 0; i < data->plane->format_mods_async.count; i++) {
 			struct format_mod f = {
-				.format = data->plane->async_formats[i],
-				.modifier = data->plane->async_modifiers[i],
+				.format = data->plane->format_mods_async.formats[i],
+				.modifier = data->plane->format_mods_async.modifiers[i],
 			};
 
 			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
@@ -1022,12 +1022,12 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 		data->crtc = crtc;
 		test_init(data);
 
-		igt_require_f(data->plane->async_format_mod_count > 0,
+		igt_require_f(data->plane->format_mods_async.count > 0,
 			     "No async format/modifier supported\n");
 
-		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
-			uint64_t modifier = data->plane->async_modifiers[i];
-			uint32_t format = data->plane->async_formats[i];
+		for (int i = 0; i < data->plane->format_mods_async.count; i++) {
+			uint64_t modifier = data->plane->format_mods_async.modifiers[i];
+			uint32_t format = data->plane->format_mods_async.formats[i];
 
 			if (format != DRM_FORMAT_XRGB8888)
 				continue;
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 0e00db014426..5990adabf175 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1126,8 +1126,8 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	bool result = true;
 	bool found = false;
 
-	for (int i = 0; i < plane->format_mod_count; i++) {
-		uint64_t modifier = plane->modifiers[i];
+	for (int i = 0; i < plane->format_mods.count; i++) {
+		uint64_t modifier = plane->format_mods.modifiers[i];
 
 		if (data->mod == modifier) {
 			found = true;
@@ -1192,9 +1192,9 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	 */
 	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
 
-	for (int i = 0; i < plane->format_mod_count; i++) {
-		uint32_t format = plane->formats[i];
-		uint64_t modifier = plane->modifiers[i];
+	for (int i = 0; i < plane->format_mods.count; i++) {
+		uint32_t format = plane->format_mods.formats[i];
+		uint64_t modifier = plane->format_mods.modifiers[i];
 		struct format_mod f = {
 			.format = format,
 			.modifier = modifier,
@@ -1264,8 +1264,8 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	int index = plane->index;
 	int i;
 
-	for (i = 0; i < plane->format_mod_count; i++) {
-		uint64_t modifier = plane->modifiers[i];
+	for (i = 0; i < plane->format_mods.count; i++) {
+		uint64_t modifier = plane->format_mods.modifiers[i];
 
 		if (IS_AMD_FMT_MOD(modifier) &&
 		    (AMD_FMT_MOD_GET(DCC, modifier) ||
-- 
2.52.0

