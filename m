Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF7FC5B555
	for <igt-dev@archiver.kernel.org>; Sun,  1 Jun 2025 19:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA5810E09C;
	Sun,  1 Jun 2025 19:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QIYehdcf";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994B910E09C
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Jun 2025 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R3leol52goW0tLYyYNdnxexjluxty283vGS5SD4XSY4=; b=QIYehdcfwDJtlXxAr3gj/ZKsXj
 g50Vf2+hdJkbk2KtSm7UhfnRUAkaPOVXN3DFDG5hApKsEny5e1ENPH+RA43Lx4Yy0liuOshavCi+o
 3qDLB21LdCl2d5kdxjq54ch6Fbek2/ZdmwPI/XZkXHkLhjBbifrLTT+vygw8ACYTlOc0e6/dkja0y
 FyusrODYieyAnAMZMs/o1y7PKoDT/0dIZJqT5kEUglH2eqTvh9156PCtSvyjTHim2MGzz1FJdU32g
 KxlE1jM9OQXSUHoo/P30u+6NPstyhkqsfnZHgthRkYhYEie5ViFXfdmX2YEYHW7TAWcpib8piw8XO
 skf6UIPQ==;
Received: from [191.195.103.116] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uLoAT-00FzVn-90; Sun, 01 Jun 2025 21:16:25 +0200
From: Melissa Wen <mwen@igalia.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 2/3] test/amdgpu/amd_color: check CRTC color LUTs with
 cursor plane
Date: Sun,  1 Jun 2025 16:14:45 -0300
Message-ID: <20250601191459.46759-3-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250601191459.46759-1-mwen@igalia.com>
References: <20250601191459.46759-1-mwen@igalia.com>
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

CRTC degamma on AMD uses pre-blending degamma block applied to all
planes before blending in which we expect similar results as a
post-blending degamma. There is also a cursor attribute that can apply
implict degamma ROM only to its plane if set which may cause unexpected
results. To validate that there is no implict degamma ROM on hw cursor,
expand CRTC LUT accuracy test to also check if cursor and primary with
equal colors continue the same after applying CRTC degamma and CRTC
gamma. The goal to avoid regressions, as reported in [1][2] and fixed by
[3][4].

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/1513
[2] https://gitlab.freedesktop.org/drm/amd/-/issues/4144
[3] https://lore.kernel.org/amd-gfx/20230731083505.1500965-1-mwen@igalia.com/
[4] https://lore.kernel.org/amd-gfx/20250422150427.59679-1-mwen@igalia.com/

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/amdgpu/amd_color.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index e34d11ef0..45760e9ab 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -41,6 +41,7 @@ typedef struct color {
 typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
+	igt_plane_t *cursor;
 	igt_output_t *output;
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
@@ -193,6 +194,9 @@ static void test_init(data_t *data)
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
+	data->cursor =
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -307,9 +311,12 @@ static void test_crtc_linear_regamma(data_t *data)
 
 /*
  * Tests LUT accuracy. CRTC regamma and CRTC degamma should produce a visually
- * correct image when used. Hardware limitations on degamma prevent this from
- * being CRC level accurate across a full test gradient but most values should
- * still match.
+ * correct image, not only with primary but also cursor plane. It validates
+ * that using pre-blending degamma block for CRTC degamma with multiple planes
+ * deliver expect results and there is no implicit ROM curve on cursor when
+ * using CRTC atomic color mgmt properties. Hardware limitations on degamma
+ * prevent this from being CRC level accurate across a full test gradient but
+ * most values should still match.
  *
  * This test skips on DCE because it doesn't support user degamma.
  */
@@ -331,7 +338,7 @@ static void test_crtc_lut_accuracy(data_t *data)
 	};
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
-	igt_fb_t afb;
+	igt_fb_t afb, cfb;
 	lut_t lut_degamma, lut_regamma;
 	int i;
 
@@ -354,16 +361,19 @@ static void test_crtc_lut_accuracy(data_t *data)
 
 	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
 	igt_plane_set_fb(data->primary, &afb);
+	igt_create_fb(data->fd, 64, 64, DRM_FORMAT_ARGB8888, 0, &cfb);
+	igt_plane_set_fb(data->cursor, &cfb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/* Test colors. */
 	for (i = 0; i < ARRAY_SIZE(colors); ++i) {
 		color_t col = colors[i];
 
-		igt_info("Testing color (%.2f, %.2f, %.2f) ...\n", col.r, col.g,
+		igt_info("Testing color (%.2f, %.2f, %.2f) with primary and cursor plane...\n", col.r, col.g,
 			 col.b);
 
 		draw_color(&afb, col.r, col.g, col.b);
+		draw_color(&cfb, col.r, col.g, col.b);
 
 		set_regamma_lut(data, NULL);
 		set_degamma_lut(data, NULL);
@@ -384,10 +394,12 @@ static void test_crtc_lut_accuracy(data_t *data)
 	set_regamma_lut(data, NULL);
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
+	igt_remove_fb(data->fd, &cfb);
 	lut_free(&lut_regamma);
 	lut_free(&lut_degamma);
 }
 
+
 igt_main
 {
 	data_t data;
-- 
2.47.2

