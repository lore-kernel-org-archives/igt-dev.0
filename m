Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869B7606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Q8jBHuSC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1E21126AC;
	Thu, 26 Nov 2026 19:53:27 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0A1126C7
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 19:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1795722696;
 bh=2rGLwbdqVDVwadDaLrf/jgeNvuQ6BUAVdAvOWMY/RE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q8jBHuSCVCpky4MWhskQXM+Ew3DjEB7viajxpyxXjNbKXZdkX57o4Hpd07k88tNXF
 R7xLIuQgHZJZVvdpA8VuDKPNInAObj3cU2OiX28DhxlCsXcb+RTmAzKMacCIlcuB7Q
 lzrzRX6LiYSRaamajPWCIMVckaIrfugY3wRNrHHuXSxFYY2BTjPhz9uo8zu2Z+68jr
 VfyU+mVtLV09GY5eSXD4O5cBIVmrVsGSMOLCugBiUMgEm1lRcxsoqCgfgc3ezM14Zb
 drYVQ7BrJ0naoionegP7r7w5GSqSq9bMgEk24DKn8ic7EqQMLooJiSEiEsC0eMc5yd
 WihRcyu2Jr4qQ==
Received: from vileplume (unknown [100.64.0.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: simonz)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CC8A17E0183;
 Thu, 26 Nov 2026 20:51:36 +0100 (CET)
From: simon.zeni@collabora.com
To: igt-dev@lists.freedesktop.org
Cc: Simon Zeni <simon.zeni@collabora.com>
Subject: [PATCH i-g-t v2 3/3] tests/kms_plane: compare DRM_FORMAT_Y8 plane
 with greyscale reference CRC
Date: Thu, 26 Nov 2026 14:50:59 -0500
Message-ID: <20261126195103.53198-3-simon.zeni@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126195103.53198-1-simon.zeni@collabora.com>
References: <20261126195103.53198-1-simon.zeni@collabora.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Simon Zeni <simon.zeni@collabora.com>

The format DRM_FORMAT_Y8 is a specific YUV format that can't properly represent colours, so
comparing the tested plane against the existing reference CRC would yield a mismatch warning.

This introduced a new capture format CRC consisting of a solid grey colour aimed specifically at
greyscale colours which can't represent the full colour spectrum.

Signed-off-by: Simon Zeni <simon.zeni@collabora.com>
---
 tests/kms_plane.c | 58 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 388b869ea..0c6b98321 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -789,6 +789,36 @@ static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
 }
 
+static void capture_format_crcs_greyscale(data_t *data, igt_crtc_t *crtc,
+					  igt_plane_t *plane,
+					  uint32_t format, uint64_t modifier,
+					  int width, int height,
+					  enum igt_color_encoding encoding,
+					  enum igt_color_range range,
+					  igt_crc_t crc[], struct igt_fb *fb)
+{
+	struct igt_fb old_fb = *fb;
+	const color_t grey = { 0.5f, 0.5f, 0.5f };
+
+	prepare_format_color(data, plane, format, modifier,
+			     width, height, encoding, range, &grey, fb, false);
+
+	igt_display_commit2(&data->display, data->display.is_atomic ?
+			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
+
+	igt_remove_fb(data->drm_fd, &old_fb);
+
+	/*
+	 * On MediaTek hardware, CRC generation needs time to stabilize after
+	 * a pixel format change. Wait for at least one vblank to ensure the
+	 * CRC hardware has updated for the new format.
+	 */
+	if (is_mtk_device(data->drm_fd))
+		igt_wait_for_vblank(crtc);
+
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
+}
+
 static void capture_format_crcs_multiple(data_t *data, igt_crtc_t *crtc,
 					 igt_plane_t *plane,
 					 uint32_t format, uint64_t modifier,
@@ -939,6 +969,13 @@ static bool test_format_plane_colors(data_t *data, igt_crtc_t *crtc,
 					     width, height, encoding, range, crc,
 					     fb);
 		total_crcs = data->num_colors;
+	} else if (format == DRM_FORMAT_Y8) {
+		capture_format_crcs_greyscale(data,
+					   crtc,
+					   plane, format,
+					   modifier,
+					   width, height, encoding, range, crc,
+					   fb);
 	} else {
 		capture_format_crcs_single(data,
 					   crtc,
@@ -1049,6 +1086,7 @@ static bool test_format_plane_yuv(data_t *data, igt_crtc_t *crtc,
 
 enum crc_set {
 	SINGLE_CRC_SET,
+	GREYSCALE_CRC_SET,
 	MULTIPLE_CRC_SET,
 	MAX_CRC_SET,
 };
@@ -1133,6 +1171,7 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	struct igt_vec tested_formats;
 	struct format_mod ref = {};
 	struct format_mod f = {};
+	enum crc_set set;
 	igt_crc_t* crcset;
 	bool result = true;
 
@@ -1178,6 +1217,14 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 				   IGT_COLOR_YCBCR_LIMITED_RANGE,
 				   ref_crc[SINGLE_CRC_SET], &fb);
 
+	capture_format_crcs_greyscale(data,
+				   crtc,
+				   plane, ref.format,
+				   ref.modifier,
+				   width, height, IGT_COLOR_YCBCR_BT709,
+				   IGT_COLOR_YCBCR_LIMITED_RANGE,
+				   ref_crc[GREYSCALE_CRC_SET], &fb);
+
 	capture_format_crcs_multiple(data,
 				     crtc,
 				     plane, ref.format,
@@ -1219,8 +1266,15 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 				continue;
 		}
 
-		crcset = ref_crc[use_multiple_colors(data, f.format) ?
-				 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
+		if (use_multiple_colors(data, f.format)) {
+			set = MULTIPLE_CRC_SET;
+		} else if (f.format == DRM_FORMAT_Y8) {
+			set = GREYSCALE_CRC_SET;
+		} else {
+			set = SINGLE_CRC_SET;
+		}
+
+		crcset = ref_crc[set];
 
 		if (igt_format_is_yuv(f.format))
 			result &= test_format_plane_yuv(data,
-- 
2.53.0

