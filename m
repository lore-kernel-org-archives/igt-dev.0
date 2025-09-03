Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E54CA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 05:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9D910E86F;
	Wed,  3 Sep 2025 05:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtHKNP+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FE810E86F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 05:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756877090; x=1788413090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpYAgDULrPhkQdfIxlHeuv8pCyTax8E9AnfwAbf85OU=;
 b=MtHKNP+GFb1+buPrWjFqv0HsgHqgtx0NWTf2BIPWXzWuHFLyl5vOYrl6
 gQCdBca+M3w2L/yJCbAUqz6p8R2AD6RkbNK6E3BlNXuBznlPHw55ZjPEx
 FJi2IfX4XcQJpTwBvVCmIj8vWsGy0/EpCUfZkptl8SnUBMAyu9XPz3BnI
 gSSLxgbf1oSzb3eE1FO9oRQIB3rFNgGTu93lYI/GtMMh6S70RRONXmmdW
 d7CnItix0dy7UO0mk5LaSlqjC4/t448/IRNIgb8P1VWzV6py7Y9I2u52k
 ol3eIvF/shgiuoODu3pC8PYMt1UE4cMtOWbmsVwBwyESbzBqY4NMF5Wy0 w==;
X-CSE-ConnectionGUID: XBc8cl5wTwS6VATebLinfw==
X-CSE-MsgGUID: W+BlsOzlTASxEkUgOxGGNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69881340"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69881340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:24:50 -0700
X-CSE-ConnectionGUID: lVfwVlikRne2OgpcU1oUOg==
X-CSE-MsgGUID: cg/JdWL2QTaUZzmDOQ1U+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="176743686"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2025 22:24:48 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH v4 i-g-t 2/4] tests/kms_hdr: Set HDR meta-data while testing
 for panel capability
Date: Wed,  3 Sep 2025 10:37:16 +0530
Message-Id: <20250903050718.1976201-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903050718.1976201-1-chaitanya.kumar.borah@intel.com>
References: <20250903050718.1976201-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Setting max_bpc simply configures the pipeline to drive
10 bits per color channel, but HDR requires more than higher bit
depth. HDR also depends on metadata such as EOTF, peak luminance,
and colorimetry.

Update the test to set HDR metadata on the connector to signal that
we need an HDR pipeline, before running through the modes. Reset
it afterwards.

If setting HDR metadata fails for all advertised modes on a supported
panel, it implies the kernel cannot drive HDR — for example, due to
bandwidth limitations.

v2:
	- Update commit message (Swati)
	- Add comment on why we set HDR meta data (Swati)
	- Commit after setting HDR meta data (Swati)

v3:
	- Handle error while committing meta data (Swati)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 122 +++++++++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 53 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 33b6c42a6..41fbf3766 100644
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
 
@@ -701,6 +702,17 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 			prepare_test(data, output, pipe);
 
+			/* Signal HDR requirement via metadata */
+			fill_hdr_output_metadata_st2048(&hdr);
+			set_hdr_output_metadata(data, &hdr);
+			if (igt_display_try_commit2(display, display->is_atomic ?
+						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
+				igt_info("%s: Couldn't set HDR metadata\n",
+					 igt_output_name(output));
+				test_fini(data);
+				break;
+			}
+
 			if (is_intel_device(data->fd) &&
 			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
 				igt_info("%s: No suitable mode found to use 10 bpc.\n",
@@ -710,6 +722,10 @@ static void test_hdr(data_t *data, uint32_t flags)
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

