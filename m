Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A6ACCFA13
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 09:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5917810EEEA;
	Wed, 29 Apr 2026 09:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVPz9vZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F9810EF12
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454948; x=1808990948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G88YfrU6R2LZ7A0AKJVohwPsbnLUCz6anGGmEagK+0k=;
 b=FVPz9vZ90r5CE6C//zPI10DqfMQCPuM73e94vpMj/M3xdO+PlRz66YxE
 fJsPdCcQK5kP8LUd2SCz2sqKIzAPnwHghS91licJ8wJ6VWLRbNxRlS13M
 kwh0fz2wyhG7xlKaFlgE4XznFq40iHIztp2oUXaRWLZAxZPkW3B2FJTN8
 N8DyxJB9LmJHNchIG+itvF+srUINaeeSC9xOLhXxINR5ZW2WI+B6A7bKd
 e5z+G/m5Kw7BhkPAEUMBpX4zED1FvBIKPQJiI0k/8J/Hfb82iRYB2vXKH
 967EvpItztbr6ciB+0HtdqyJmTdq8JEkQblXIBinisWlnJFjHhT+eekmo g==;
X-CSE-ConnectionGUID: MuTVtssBTqmujhy9/4ej5A==
X-CSE-MsgGUID: D248jN99QNCqLgIfaCO5hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95798158"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95798158"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:29:08 -0700
X-CSE-ConnectionGUID: w1QoSxyHRGismiN5PxDnRg==
X-CSE-MsgGUID: 5iNgWtSlQv+FrEIgJE0QYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234223134"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 02:29:07 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/3] tests/kms_hdr: Move framebuffer into data_t for
 centralized cleanup
Date: Wed, 29 Apr 2026 15:09:53 +0530
Message-Id: <20260429093955.3726263-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429093955.3726263-1-pranay.samala@intel.com>
References: <20260429093955.3726263-1-pranay.samala@intel.com>
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
shared data_t struct. Add igt_remove_fb() to test_fini() so the
framebuffer is always freed during cleanup, even when a test exits
early.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_hdr.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index b215b0e6c..c4680298a 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -123,12 +123,14 @@ typedef struct data {
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
 
@@ -244,20 +246,19 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
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
@@ -265,8 +266,8 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	if (!ret) {
-		data->w = afb.width;
-		data->h = afb.height;
+		data->w = data->afb.width;
+		data->h = data->afb.height;
 	}
 
 	/* Start in 8bpc. */
@@ -305,7 +306,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
 	test_fini(data);
-	igt_remove_fb(data->fd, &afb);
 }
 
 /* Returns true if an output supports max bpc property. */
@@ -490,20 +490,19 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
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
 
 	fill_hdr_output_metadata_st2084(&hdr);
 
 	/* Start with no metadata. */
-	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_fb(data->primary, &data->afb);
 	igt_plane_set_size(data->primary, data->w, data->h);
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
@@ -566,7 +565,6 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 
 cleanup:
 	test_fini(data);
-	igt_remove_fb(data->fd, &afb);
 }
 
 /* Fills some test values for HDR metadata targeting SDR. */
@@ -605,19 +603,18 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
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
 
@@ -690,7 +687,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	}
 
 	test_fini(data);
-	igt_remove_fb(data->fd, &afb);
 }
 
 static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
-- 
2.34.1

