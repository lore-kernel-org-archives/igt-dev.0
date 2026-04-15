Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F32F41995
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 18:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D641D10E72F;
	Wed, 15 Apr 2026 18:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fedvk/c/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF5610E72F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776276161; x=1807812161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fJ4oXT5QfRIitL+EVuy144t6jpfts4J9d5/vQ3Gww6s=;
 b=Fedvk/c/f5GvIN8oYmrWiK0bbUSRKuNdye77XxE3suGnRH20PS5DbQK3
 OlBelklpvSxF4N4mzxnkrROeq1kH7Gv89q/yRw7DudKil2WNVUEd51vGD
 ta3AhKfDRx8NaBpByhv1FBMfTTumLoHbGGFhlcBXmvwWYMptTEBd8o3Jg
 noiOG4hVSDMBjLd6EIsr43bKBFW1oiBNB7Cx/WEYCrQYU8ymvM7z+0mK2
 xlwQkFypSlC4H/N+FepenuoA1zGY8TzdSk21TyVxPfFpLcIqbs4MXhv7I
 Kd5FkjgWTefe1NonBWzdy1lcFWh4QkskiaVRvlb+OEUmTjZUuJxxZfpOS A==;
X-CSE-ConnectionGUID: FEoKHrUXSN+SUGR9aarFpQ==
X-CSE-MsgGUID: Qi+ar00eTfCYMUAPVUIdRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77379629"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77379629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 11:02:40 -0700
X-CSE-ConnectionGUID: 7HE24VnCRMuJ8TvUTy4lCQ==
X-CSE-MsgGUID: P2VpMB41Qgi7169f5fz4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="223990327"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:02:39 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,v2] tests/kms_hdr: add FP16 format coverage
Date: Wed, 15 Apr 2026 23:41:22 +0530
Message-Id: <20260415181122.1044599-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Extend kms_hdr to exercise FP16 framebuffers in addition to
10bpc formats. All HDR metadata, toggle, swap and bpc-switch tests
now run with both XRGB2101010 and XRGB16161616F. This ensures
HDR handling paths are validated with half-float surfaces as
well as packed 10bpc.

v2: -rebase
    -move pipe break outside format loop to test all formats

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_hdr.c | 154 ++++++++++++++++++++++++++----------------------
 1 file changed, 84 insertions(+), 70 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f30902b72..b215b0e6c 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -88,6 +88,12 @@ enum hdmi_eotf {
 	HDMI_EOTF_SMPTE_ST2084,
 };
 
+/* HDR test formats: 10bpc + FP16 */
+static const uint32_t hdr_test_formats[] = {
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XRGB16161616F,
+};
+
 /* Test flags. */
 enum {
 	TEST_NONE = 1 << 0,
@@ -233,6 +239,7 @@ static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 
 static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 				      igt_output_t *output,
+				      uint32_t format,
 				      uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -242,7 +249,7 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &afb);
 	igt_assert(afb_id);
 
 	draw_hdr_pattern(&afb);
@@ -337,28 +344,31 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 				continue;
 			}
 
-			prepare_test(data, output,
-				     crtc);
+			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
+				prepare_test(data, output,
+					     crtc);
 
-			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, crtc, output, 10)) {
-				igt_info("%s: No suitable mode found to use 10 bpc.\n",
-					 igt_output_name(output));
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						  igt_output_name(output));
 
-				test_fini(data);
-				break;
+					test_fini(data);
+					break;
+				}
+
+				data->mode = igt_output_get_mode(output);
+				data->w = data->mode->hdisplay;
+				data->h = data->mode->vdisplay;
+
+				igt_dynamic_f("pipe-%s-%s-%s",
+					      igt_crtc_name(crtc), output->name,
+					      igt_format_str(hdr_test_formats[i]))
+					      test_bpc_switch_on_output(data,
+								       crtc,
+								       output, hdr_test_formats[i], flags);
 			}
 
-			data->mode = igt_output_get_mode(output);
-			data->w = data->mode->hdisplay;
-			data->h = data->mode->vdisplay;
-
-			igt_dynamic_f("pipe-%s-%s",
-				      igt_crtc_name(crtc), output->name)
-				test_bpc_switch_on_output(data,
-							  crtc,
-							  output, flags);
-
 			/* One pipe is enough */
 			break;
 		}
@@ -475,7 +485,7 @@ static void adjust_brightness(data_t *data, uint32_t flags)
 
 static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output,
-			       uint32_t flags)
+			       uint32_t format, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	struct hdr_output_metadata hdr;
@@ -485,7 +495,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &afb);
 	igt_assert(afb_id);
 
 	draw_hdr_pattern(&afb);
@@ -590,7 +600,8 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
 }
 
 static void test_static_swap(data_t *data, igt_crtc_t *crtc,
-			     igt_output_t *output, uint32_t flags)
+			     igt_output_t *output,
+			     uint32_t format, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
@@ -600,7 +611,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &afb);
 	igt_assert(afb_id);
 
 	draw_hdr_pattern(&afb);
@@ -756,55 +767,58 @@ static void test_hdr(data_t *data, uint32_t flags)
 				continue;
 			}
 
-			prepare_test(data, output,
-				     crtc);
-
-			/* Signal HDR requirement via metadata */
-			fill_hdr_output_metadata_st2084(&hdr);
-			set_hdr_output_metadata(data, &hdr);
-			if (igt_display_try_commit2(display, display->is_atomic ?
-						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
-				igt_info("%s: Couldn't set HDR metadata\n",
-					 igt_output_name(output));
-				test_fini(data);
-				break;
-			}
+			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
+				prepare_test(data, output,
+					     crtc);
+
+				/* Signal HDR requirement via metadata */
+				fill_hdr_output_metadata_st2084(&hdr);
+				set_hdr_output_metadata(data, &hdr);
+				if (igt_display_try_commit2(display, display->is_atomic ?
+							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
+					igt_info("%s: Couldn't set HDR metadata\n",
+						  igt_output_name(output));
+					test_fini(data);
+					break;
+				}
 
-			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, crtc, output, 10)) {
-				igt_info("%s: No suitable mode found to use 10 bpc.\n",
-					 igt_output_name(output));
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						  igt_output_name(output));
 
-				test_fini(data);
-				break;
-			}
-
-			if (igt_is_dsc_enabled(data->fd, output->name))
-				flags |= TEST_NEEDS_DSC;
-			else
-				flags &= ~TEST_NEEDS_DSC;
-
-			set_hdr_output_metadata(data, NULL);
-			igt_display_commit2(display, display->is_atomic ?
-					    COMMIT_ATOMIC : COMMIT_LEGACY);
-
-			data->mode = igt_output_get_mode(output);
-			data->w = data->mode->hdisplay;
-			data->h = data->mode->vdisplay;
-
-			igt_dynamic_f("pipe-%s-%s",
-				      igt_crtc_name(crtc), output->name) {
-				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
-					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
-					test_static_toggle(data,
-							   crtc,
-							   output, flags);
-				if (flags & TEST_SWAP)
-					test_static_swap(data,
-							 crtc,
-							 output, flags);
-				if (flags & TEST_INVALID_METADATA_SIZES)
-					test_invalid_metadata_sizes(data, output);
+					test_fini(data);
+					break;
+				}
+
+				if (igt_is_dsc_enabled(data->fd, output->name))
+					flags |= TEST_NEEDS_DSC;
+				else
+					flags &= ~TEST_NEEDS_DSC;
+
+				set_hdr_output_metadata(data, NULL);
+				igt_display_commit2(display, display->is_atomic ?
+						    COMMIT_ATOMIC : COMMIT_LEGACY);
+
+				data->mode = igt_output_get_mode(output);
+				data->w = data->mode->hdisplay;
+				data->h = data->mode->vdisplay;
+
+				igt_dynamic_f("pipe-%s-%s-%s",
+					       igt_crtc_name(crtc), output->name,
+					       igt_format_str(hdr_test_formats[i])) {
+					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
+						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
+						test_static_toggle(data,
+								   crtc,
+								   output, hdr_test_formats[i], flags);
+					if (flags & TEST_SWAP)
+						test_static_swap(data,
+								 crtc,
+								 output, hdr_test_formats[i], flags);
+					if (flags & TEST_INVALID_METADATA_SIZES)
+						test_invalid_metadata_sizes(data, output);
+				}
 			}
 
 			/* One pipe is enough */
-- 
2.25.1

