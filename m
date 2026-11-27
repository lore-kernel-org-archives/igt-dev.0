Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E8606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 05:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Simz3zw3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941AF10E2AB;
	Fri, 27 Nov 2026 05:14:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC04610E869
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 05:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795756207; x=1827292207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IEk6n0uKhWxmXnMdfOhhvTeIu+wJ1LHiy802zpcKTc=;
 b=Simz3zw3WJNn1ikezKnkeqFh22U2evwDEi/JpVdlFFj2Mv84+nuRWZ78
 w5h4lQ/zyALPUgmbRvOZ4lLOlKphbiYpgAevPLbvpA6XIqThwR9jYnkEP
 o9IF/dZsfaxmLdoA3R4s0G+EykkWna1d/5bdBHubdOS5EtDzEG8lOHJD/
 ZmuvSKTuF2IBeLyDTNjNWwEJM1vXKTyJht/6VMfIiirxg81vUalpr6WEj
 8WEI0lBMKkJXinn0VBuy9QUJPSkGNKdMto7pz89BF1lROqOs+UkvbXIfS
 iMqx5fqeINoVatDhYqHn/yHzsYFJ2uq48OVlqcR3BMylDxyxewVXTWumo Q==;
X-CSE-ConnectionGUID: hiD2L6izT2qqAyR25jwZ7A==
X-CSE-MsgGUID: FL9OcPmESaO29NgVpNYNxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4669958"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4669958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:10:07 -0800
X-CSE-ConnectionGUID: n19dVWTgQryUfzdYwMeXfw==
X-CSE-MsgGUID: Dm70L0GsTPmTbGt+VJzdBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12099047"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:10:05 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v3 2/3] tests/kms_plane_multiple: Fix reference frame
 buffer and plane frame buffer
Date: Fri, 27 Nov 2026 10:40:09 +0530
Message-ID: <20261127051010.937287-3-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127051010.937287-1-avandhica.s.r@intel.com>
References: <20261127051010.937287-1-avandhica.s.r@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reference frame buffer in get_reference_crc() and
plane frame buffer in prepare_plane() are kept separate
to avoid over writing reference framebuffers and fixed
frame buffer cleanups.

v2:
- separate fix and feature patch (kamil)

v3:
- keep fix for reference frame buffer and its cleanup as
separate patch (kamil)
- use prefix for test in subject (kamil)

Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
---
 tests/kms_plane_multiple.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1d53eba92..9db3e891d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -88,7 +88,7 @@ typedef struct {
 	igt_crc_t ref_crc1, ref_crc2;
 	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
 	igt_plane_t **plane1, **plane2;
-	struct igt_fb *fb1, *fb2;
+	struct igt_fb *fb1, *fb2, ref_fb1, ref_fb2;
 } data_t;
 
 /* Command line parameters. */
@@ -138,7 +138,7 @@ static void
 get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 		  igt_pipe_crc_t *pipe_crc,
 		  color_t *color, igt_plane_t **plane, uint64_t modifier,
-		  igt_crc_t *ref_crc)
+		  igt_crc_t *ref_crc, struct igt_fb *ref_fb)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -156,9 +156,9 @@ get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 			    DRM_FORMAT_XRGB8888,
 			    modifier,
 			    color->red, color->green, color->blue,
-			    &data->fb1[primary->index]);
+			    ref_fb);
 
-	igt_plane_set_fb(plane[primary->index], &data->fb1[primary->index]);
+	igt_plane_set_fb(plane[primary->index], ref_fb);
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	igt_skip_on(ret != 0);
@@ -354,7 +354,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 	get_reference_crc(data, output,
 			  crtc,
 			  data->pipe_crc1, &blue,
-			  data->plane1, modifier, &data->ref_crc1);
+			  data->plane1, modifier, &data->ref_crc1, &data->ref_fb1);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
@@ -408,6 +408,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 
 		i++;
 	}
+	igt_remove_fb(data->drm_fd, &data->ref_fb1);
 	test_fini(data, output);
 }
 
@@ -498,11 +499,11 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	get_reference_crc(data, output1,
 			  crtc1,
 			  data->pipe_crc1, &blue,
-			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1);
+			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1, &data->ref_fb1);
 	get_reference_crc(data, output2,
 			  crtc2,
 			  data->pipe_crc2, &blue,
-			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2);
+			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2, &data->ref_fb2);
 
 	prepare_planes(data, crtc1, &blue,
 		       data->plane1,
@@ -557,6 +558,17 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 							      crtc1, crtc2,
 							      output1, output2,
 							      modifier);
+			igt_output_set_crtc(output1, NULL);
+			igt_output_set_crtc(output2, NULL);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			for (int x = 0; x < crtc1->n_planes; x++)
+				igt_remove_fb(data->drm_fd, &data->fb1[x]);
+
+			for (int x = 0; x < crtc2->n_planes; x++)
+				igt_remove_fb(data->drm_fd, &data->fb2[x]);
+
+			igt_remove_fb(data->drm_fd, &data->ref_fb1);
+			igt_remove_fb(data->drm_fd, &data->ref_fb2);
 			test_fini_2_display(data);
 		}
 	}
-- 
2.53.0

