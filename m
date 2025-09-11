Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A652CAC587
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 18:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C3B10EB7B;
	Thu, 11 Sep 2025 18:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYPAmIOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C7410EB7B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757616822; x=1789152822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m5PKNEeI/QfC2XsuxRn0BdOOPqWzS6XsOsF1Mezx4MM=;
 b=EYPAmIOtIkk7VgdXwxaM6//GJsI+SgQszyv/Vn4NXFohg5oqsLunnWnl
 bHV2mOOcAgDTr8Thh3Saom53FR8hkJdjf/r21iz6u+NsKpOH1oEh4kxAk
 g7DN56CoaJSM+MnzalbffK637fIR6GcZVk52X9dtvUtf9Qd9yaq05c9VD
 PGVTvYYSB1GiZAoBfP3cT0L56SVxOC/wSWwVahwyAYGlMCVvQy4APxBwr
 rtOHJBTem6T9rwMhNB11Q8TkSr3/sdUG96UV0Lw77ezWtWInLJyfVFvFE
 VsRiqKsv4pt4HE//uDtjJWUuAI338B61X5ZrF04CwfU+brHVp8nIFfAWu w==;
X-CSE-ConnectionGUID: XZKMJllrQtasjJOmDRdQOQ==
X-CSE-MsgGUID: Bqb7KXvET22A0pQG5xuUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59896977"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59896977"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 11:53:42 -0700
X-CSE-ConnectionGUID: CTopoyVqTyiCyJSTMVvROg==
X-CSE-MsgGUID: ASaNENlLRHySSYwRoiNFMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173064870"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 11:53:41 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: add FP16 format coverage
Date: Fri, 12 Sep 2025 00:30:30 +0530
Message-Id: <20250911190030.356543-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 143 ++++++++++++++++++++++++++----------------------
 1 file changed, 79 insertions(+), 64 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index efa5964cf..37da709c1 100644
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
@@ -239,6 +245,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 				      igt_output_t *output,
+				      uint32_t format,
 				      uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -248,7 +255,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &afb);
 	igt_assert(afb_id);
 
 	draw_hdr_pattern(&afb);
@@ -335,24 +342,28 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 				continue;
 			}
 
-			prepare_test(data, output, pipe);
+			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
+				prepare_test(data, output, pipe);
 
-			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
-				igt_info("%s: No suitable mode found to use 10 bpc.\n",
-					 igt_output_name(output));
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						  igt_output_name(output));
 
-				test_fini(data);
-				break;
-			}
+					test_fini(data);
+					break;
+				}
 
-			data->mode = igt_output_get_mode(output);
-			data->w = data->mode->hdisplay;
-			data->h = data->mode->vdisplay;
+				data->mode = igt_output_get_mode(output);
+				data->w = data->mode->hdisplay;
+				data->h = data->mode->vdisplay;
 
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe), output->name)
-				test_bpc_switch_on_output(data, pipe, output, flags);
+				igt_dynamic_f("pipe-%s-%s-%s",
+					      kmstest_pipe_name(pipe), output->name,
+					      igt_format_str(hdr_test_formats[i]))
+					      test_bpc_switch_on_output(data, pipe, output,
+					      hdr_test_formats[i], flags);
+			}
 
 			/* One pipe is enough */
 			break;
@@ -470,7 +481,7 @@ static void adjust_brightness(data_t *data, uint32_t flags)
 
 static void test_static_toggle(data_t *data, enum pipe pipe,
 			       igt_output_t *output,
-			       uint32_t flags)
+			       uint32_t format, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	struct hdr_output_metadata hdr;
@@ -480,7 +491,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &afb);
 	igt_assert(afb_id);
 
 	draw_hdr_pattern(&afb);
@@ -581,7 +592,8 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 0;
 }
 
-static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
+			     uint32_t format, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
@@ -591,7 +603,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &afb);
 	igt_assert(afb_id);
 
 	draw_hdr_pattern(&afb);
@@ -743,54 +755,57 @@ static void test_hdr(data_t *data, uint32_t flags)
 				continue;
 			}
 
-			prepare_test(data, output, pipe);
-
-			/* Signal HDR requirement via metadata */
-			fill_hdr_output_metadata_st2048(&hdr);
-			set_hdr_output_metadata(data, &hdr);
-			if (igt_display_try_commit2(display, display->is_atomic ?
-						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
-				igt_info("%s: Couldn't set HDR metadata\n",
-					 igt_output_name(output));
-				test_fini(data);
-				break;
-			}
-
-			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
-				igt_info("%s: No suitable mode found to use 10 bpc.\n",
-					 igt_output_name(output));
+			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
+				prepare_test(data, output, pipe);
+
+				/* Signal HDR requirement via metadata */
+				fill_hdr_output_metadata_st2048(&hdr);
+				set_hdr_output_metadata(data, &hdr);
+				if (igt_display_try_commit2(display, display->is_atomic ?
+							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
+					igt_info("%s: Couldn't set HDR metadata\n",
+						  igt_output_name(output));
+					test_fini(data);
+					break;
+				}
 
-				test_fini(data);
-				break;
-			}
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						  igt_output_name(output));
 
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
-				      kmstest_pipe_name(pipe), output->name) {
-				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
-					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
-					test_static_toggle(data, pipe, output, flags);
-				if (flags & TEST_SWAP)
-					test_static_swap(data, pipe, output, flags);
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
+					       kmstest_pipe_name(pipe), output->name,
+					       igt_format_str(hdr_test_formats[i])) {
+					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
+						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
+						test_static_toggle(data, pipe, output, hdr_test_formats[i], flags);
+					if (flags & TEST_SWAP)
+						test_static_swap(data, pipe, output, hdr_test_formats[i], flags);
+					if (flags & TEST_INVALID_METADATA_SIZES)
+						test_invalid_metadata_sizes(data, output);
+				}
+
+				/* One pipe is enough */
+					break;
 			}
-
-			/* One pipe is enough */
-			break;
 		}
 	}
 }
-- 
2.25.1

