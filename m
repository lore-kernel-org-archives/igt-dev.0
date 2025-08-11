Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EE3CA0EC0
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 08:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF36C10E2F1;
	Mon, 11 Aug 2025 08:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUznSobT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BD010E2F1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754900193; x=1786436193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZWmpTonaFDXVVUsXMF3kh2hZd9iM/PBPn5uAaWFeK8=;
 b=IUznSobT6n+q1KhdPnrIw1rh7b3dXmRNdSFWPQNcYcgSUNmWApyX4NRG
 dZ6I6MFoSZOlKpySHbVPQ2bLnjVW6eHPAJDQIS9nSbuEkyu/QkOau2yFK
 yJKvosyPgOH1V1+rEyTSDyByVLjyLpaQVj19nCjjJO3nR6nan4iFJAOGZ
 BEAUc2pBlO0ThzCKV6pIpKa4Y7DwBj4ewUyawR+P//84kOSUNXpv/HPGk
 Ik2NornYmOR7AQnENijgMHr2rAkYnvJCOUeUSmnh4IFi68bJOfL5KBT7g
 tNiags3cNNNphUsBsdR67zEjwkXobx0Q+Ekz6Gfm3+kJw7QGFXrCRzUDG A==;
X-CSE-ConnectionGUID: 193lQPCeSUmbLDgmMrbt9Q==
X-CSE-MsgGUID: SHwR520bTyunQE8BW3GkQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79715239"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="79715239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 01:16:33 -0700
X-CSE-ConnectionGUID: 4ZnDsc49Tu2c+cQip6Kutg==
X-CSE-MsgGUID: D2x8ZcDSRFO35QeGr9CbOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="196850157"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 01:16:32 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t 2/3] tests/kms_hdr: Set HDR meta-data while testing for
 panel capability
Date: Mon, 11 Aug 2025 13:28:49 +0530
Message-Id: <20250811075850.28146-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
References: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
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

Checking if the panel supports a max_bpc of 10 is not enough to tell
if the panel supports HDR. Set HDR metadata on the connector before
going through the modes. Reset after done.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_hdr.c | 114 ++++++++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 53 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 33b6c42a6..76e103ac4 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -153,6 +153,59 @@ static void draw_hdr_pattern(igt_fb_t *fb)
 	igt_put_cairo_ctx(cr);
 }
 
+/* Converts a double to 861-G spec FP format. */
+static uint16_t calc_hdr_float(double val)
+{
+	return (uint16_t)(val * 50000.0);
+}
+
+/* Fills some test values for ST2048 HDR output metadata.
+ *
+ * Note: there isn't really a standard for what the metadata is supposed
+ * to do on the display side of things. The display is free to ignore it
+ * and clip the output, use it to help tonemap to the content range,
+ * or do anything they want, really.
+ */
+static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
+
+	/* Rec. 2020 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		calc_hdr_float(0.708); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		calc_hdr_float(0.292);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		calc_hdr_float(0.170); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		calc_hdr_float(0.797);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		calc_hdr_float(0.131); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		calc_hdr_float(0.046);
+	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance =
+		1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.min_display_mastering_luminance =
+		500;				   /* 0.05 nits */
+	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
+}
+
+/* Sets the HDR output metadata prop. */
+static void set_hdr_output_metadata(data_t *data,
+				    struct hdr_output_metadata const *meta)
+{
+	igt_output_replace_prop_blob(data->output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? sizeof(*meta) : 0);
+}
+
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
@@ -380,15 +433,6 @@ static bool is_panel_hdr(data_t *data, igt_output_t *output)
 	return ret;
 }
 
-/* Sets the HDR output metadata prop. */
-static void set_hdr_output_metadata(data_t *data,
-				    struct hdr_output_metadata const *meta)
-{
-	igt_output_replace_prop_blob(data->output,
-				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
-				     meta ? sizeof(*meta) : 0);
-}
-
 /* Sets the HDR output metadata prop with invalid size. */
 static int set_invalid_hdr_output_metadata(data_t *data,
 					   struct hdr_output_metadata const *meta,
@@ -401,50 +445,6 @@ static int set_invalid_hdr_output_metadata(data_t *data,
 	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
-/* Converts a double to 861-G spec FP format. */
-static uint16_t calc_hdr_float(double val)
-{
-	return (uint16_t)(val * 50000.0);
-}
-
-/* Fills some test values for ST2048 HDR output metadata.
- *
- * Note: there isn't really a standard for what the metadata is supposed
- * to do on the display side of things. The display is free to ignore it
- * and clip the output, use it to help tonemap to the content range,
- * or do anything they want, really.
- */
-static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
-{
-	memset(meta, 0, sizeof(*meta));
-
-	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
-	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
-
-	/* Rec. 2020 */
-	meta->hdmi_metadata_type1.display_primaries[0].x =
-		calc_hdr_float(0.708); /* Red */
-	meta->hdmi_metadata_type1.display_primaries[0].y =
-		calc_hdr_float(0.292);
-	meta->hdmi_metadata_type1.display_primaries[1].x =
-		calc_hdr_float(0.170); /* Green */
-	meta->hdmi_metadata_type1.display_primaries[1].y =
-		calc_hdr_float(0.797);
-	meta->hdmi_metadata_type1.display_primaries[2].x =
-		calc_hdr_float(0.131); /* Blue */
-	meta->hdmi_metadata_type1.display_primaries[2].y =
-		calc_hdr_float(0.046);
-	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
-	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
-
-	meta->hdmi_metadata_type1.max_display_mastering_luminance =
-		1000; /* 1000 nits */
-	meta->hdmi_metadata_type1.min_display_mastering_luminance =
-		500;				   /* 0.05 nits */
-	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
-	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
-}
-
 static void adjust_brightness(data_t *data, uint32_t flags)
 {
 	igt_backlight_context_t context;
@@ -652,6 +652,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
+	struct hdr_output_metadata hdr;
 
 	igt_display_reset(display);
 
@@ -701,6 +702,9 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 			prepare_test(data, output, pipe);
 
+			fill_hdr_output_metadata_st2048(&hdr);
+			set_hdr_output_metadata(data, &hdr);
+
 			if (is_intel_device(data->fd) &&
 			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
 				igt_info("%s: No suitable mode found to use 10 bpc.\n",
@@ -710,6 +714,10 @@ static void test_hdr(data_t *data, uint32_t flags)
 				break;
 			}
 
+			set_hdr_output_metadata(data, NULL);
+			igt_display_commit2(display, display->is_atomic ?
+					    COMMIT_ATOMIC : COMMIT_LEGACY);
+
 			data->mode = igt_output_get_mode(output);
 			data->w = data->mode->hdisplay;
 			data->h = data->mode->vdisplay;
-- 
2.25.1

