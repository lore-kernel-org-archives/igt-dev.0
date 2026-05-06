Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A0FCD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 04:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBF110EC7F;
	Wed,  6 May 2026 04:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtfF6dui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B77110E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 04:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778040280; x=1809576280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZOyuHSmz/sDL93xy+o3GrdSxkyQgRWe9zRqaiU49ps=;
 b=YtfF6duiwjsgRxG41raw9mX6rhCOB4wj+zWQv9Gr/67I5hfyn6kS6joG
 lriqwZlETiNG8ZZoiLqty/s4zmEA05JK0QPlLdUzvH9ruhIKbd7yyf0LL
 ZWTnxrCg8apSZxJ/oWBMTRp8eyM0aNG7/qwB6VM+b+qgxcXwBJmpQmq+H
 qoHUeFxgjbgybGQUIP+srR8BXgWrPw40VJu2K88VSvIbC5ffatI23pB9+
 NrkaIE71pF8QkOc7CtFCu4j+9IomOgKquQ4QBfAfKmbmLIdtdJJANAbhW
 LtTzyN1W3KwBVU9keX7QpM85briymJFhc6T8aHGt2qfbeklbdOh2HEC+y A==;
X-CSE-ConnectionGUID: 6xGymNYQTwekNDX7a5r2Qw==
X-CSE-MsgGUID: 59ycIMO1QfGV1bCgDT/SfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104381084"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104381084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 21:04:40 -0700
X-CSE-ConnectionGUID: XoVs6XT5RMG7mPqMnnYCUQ==
X-CSE-MsgGUID: LG3jym8sRxy3YoW/Y6Wiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235010136"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa006.jf.intel.com with ESMTP; 05 May 2026 21:04:39 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/3] tests/kms_hdr: Move framebuffer into data_t for
 centralized cleanup
Date: Wed,  6 May 2026 09:45:25 +0530
Message-Id: <20260506041527.56862-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506041527.56862-1-pranay.samala@intel.com>
References: <20260506041527.56862-1-pranay.samala@intel.com>
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

Move igt_fb_t afb from local variable in test functions into the
shared data_t struct, and add igt_remove_fb() to test_fini() so the
framebuffer is always freed during cleanup, even when a test exits
early.

v2:
- Update commit message (Karthik)

v3:
- Rebase

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_hdr.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 876c1c03a..3cd14c074 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -108,12 +108,14 @@ typedef struct data {
 	int fd;
 	int w;
 	int h;
+	igt_fb_t afb;
 } data_t;
 
 /* Common test cleanup. */
 static void test_fini(data_t *data)
 {
 	igt_pipe_crc_free(data->pipe_crc);
+	igt_remove_fb(data->fd, &data->afb);
 	igt_display_reset(&data->display);
 }
 
@@ -176,20 +178,19 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
-	igt_fb_t afb;
 	int afb_id, ret;
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       format, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &data->afb);
 	igt_assert(afb_id);
 
-	draw_hdr_pattern(&afb);
+	draw_hdr_pattern(&data->afb);
 
 	/* Plane may be required to fit fullscreen. Check it here and allow
 	 * smaller plane size in following tests.
 	 */
-	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_fb(data->primary, &data->afb);
 	if (igt_crtc_num_scalers(crtc) >= 1)
 		igt_plane_set_size(data->primary, data->w, data->h);
 	else
@@ -197,8 +198,8 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	if (!ret) {
-		data->w = afb.width;
-		data->h = afb.height;
+		data->w = data->afb.width;
+		data->h = data->afb.height;
 	}
 
 	/* Start in 8bpc. */
@@ -237,7 +238,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
 	test_fini(data);
-	igt_remove_fb(data->fd, &afb);
 }
 
 /* Returns true if an output supports max bpc property. */
@@ -347,20 +347,19 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	igt_display_t *display = &data->display;
 	struct hdr_output_metadata hdr;
 	igt_crc_t ref_crc, new_crc;
-	igt_fb_t afb;
 	int afb_id;
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       format, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &data->afb);
 	igt_assert(afb_id);
 
-	draw_hdr_pattern(&afb);
+	draw_hdr_pattern(&data->afb);
 
 	igt_hdr_fill_st2084(&hdr);
 
 	/* Start with no metadata. */
-	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_fb(data->primary, &data->afb);
 	igt_plane_set_size(data->primary, data->w, data->h);
 	igt_hdr_set_metadata(data->output, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
@@ -423,7 +422,6 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 
 cleanup:
 	test_fini(data);
-	igt_remove_fb(data->fd, &afb);
 }
 
 static void test_static_swap(data_t *data, igt_crtc_t *crtc,
@@ -431,19 +429,18 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
-	igt_fb_t afb;
 	int afb_id;
 	struct hdr_output_metadata hdr;
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
-			       format, DRM_FORMAT_MOD_LINEAR, &afb);
+			       format, DRM_FORMAT_MOD_LINEAR, &data->afb);
 	igt_assert(afb_id);
 
-	draw_hdr_pattern(&afb);
+	draw_hdr_pattern(&data->afb);
 
 	/* Start in SDR. */
-	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_fb(data->primary, &data->afb);
 	igt_plane_set_size(data->primary, data->w, data->h);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 
@@ -516,7 +513,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	}
 
 	test_fini(data);
-	igt_remove_fb(data->fd, &afb);
 }
 
 static void test_invalid_metadata_sizes(data_t *data)
-- 
2.34.1

