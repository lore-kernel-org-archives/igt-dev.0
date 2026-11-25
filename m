Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C25606A326
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=S8DDly7s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20BA112177;
	Thu, 26 Nov 2026 08:48:04 +0000 (UTC)
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Wed, 25 Nov 2026 19:53:49 UTC
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com
 [165.173.180.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C133E10E012
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 19:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1795635524; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LlARoYbxZGF5h9V7tB4HXlahva0pKs2BdJTi6trSVDIO5p0kk/yqfBirsmYV0gN8ficQ9ZmEX7X3eiF2xztnUl3pkqOdKVBdRQfKyKkr0121X56fxdV7/Oc+KXbl70N/OWPqJJgvDOV83E3YBztcwaALa2LFkCOdxlNv74Vxdyk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1795635524;
 h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=uZIEueVOJYjFYDRH882NewU6PeRlPZylGDUS1+IvLXo=; 
 b=C3/tsS7bAkc7dLCoIPXVa8NlmU1xLM5gAMeUyRhf8De/U72o+rXVbIo4hMlkpVi/olzgIjLfVvWXq2eFvTQxJjMuuDKiVIcuy4OyebYzt2QYqXecYromwQgzXKhzVd1CGMi6HWAXmmv8F4ZBfT3IwPndYmn9mW7tm6gFwvR1Qc8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=simon.zeni@collabora.com;
 dmarc=pass header.from=<simon.zeni@collabora.com>
DKIM-Signature: a=rsa-sha256;
 b=S8DDly7sjZXJ5G5lWgqnFTF71aJzSHqW+r4qcXAjSdr3xmgKUo4DTlzAMEauUaGodmd9pTq94p1D57Ji/Rz7w1/BjvIbRSShuUy6eNKXyWWJeFd4Yk7u0etX4VeDrKAcuTCfPFViAkpiJNuYfLsF+NXTmDYGYgmNPvQ0TeUZJak=;
 c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1;
 bh=uZIEueVOJYjFYDRH882NewU6PeRlPZylGDUS1+IvLXo=;
 h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179563552335058.34305330101006;
 Wed, 25 Nov 2026 11:38:43 -0800 (PST)
From: Simon Zeni <simon.zeni@collabora.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/kms_plane: compare DRM_FORMAT_Y8 plane with
 greyscale reference CRC
Date: Wed, 25 Nov 2026 14:37:10 -0500
Message-ID: <20261125193826.57420-3-simon.zeni@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125193826.57420-1-simon.zeni@collabora.com>
References: <20261125193826.57420-1-simon.zeni@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 26 Nov 2026 08:45:46 +0000
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

