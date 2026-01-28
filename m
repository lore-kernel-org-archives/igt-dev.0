Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D703D25B5E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B2310E6DF;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="y4iR25tr";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3BD10E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6018B4E422FC;
 Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 35CDE6071F;
 Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F50D119A8801; Wed, 28 Jan 2026 14:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606095; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=d7KRWsrSDrTcIL7qWmJjjiL38qNLEkmCUW54jBPFcs8=;
 b=y4iR25trC6geap0eegjoimcshpEU9AE7cHSwTILVyT5uVcNxQy0WJKU2Gv3FcKlGj2qNHK
 AqWPoPVSIrTjsO0hCobuygfruHfJXYBQE7W8b+ONbfGnn9mhusmUnLpZjOP7lAC7LwHAqR
 sYUYsMJ42cYaqCmBU05y7yVHq4dCI3zYtGENO534aBQHNKJ05ujBZJvy+h7WpUXKYnlvgQ
 gYG9Pj3XPAM8NSdZOEiLUWwcelJYqk2wwJPLDM38YmMP0fnJyX1Ny67R9CXasNawb7Q7XZ
 jCWlmHTuiS0cBlUZ9vkpSr4wD9lhWlJan/e9zkmAShUH4Xe2KmmiF/nPQFbwuw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:05 +0100
Subject: [PATCH i-g-t v5 34/48] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-34-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Yyzh2PjEqWRS8n2PcKUC5gLT5eopX/JsCp6qbIWpRyE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvMVtDInVKINDTviVEPV5oFlfAHhCwnjMiyd
 WMYesFWz9yJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJnGhAAjpgK5gENjgB15hG6eNOuY/FZ2VoANQ2
 FL6EUQaeTZ92NoP7llL2ue8NpoYqAaBggHqjeFD+1QMxNNoEKaAdZeMU2bOAXrNS3+cGxnwpgCS
 Qp28Ag0BvnyOnpwX/edo3SpSa20jxIq7dnwItCbGUiJ9AyQiSO0uSSQ+lq6Sii8g2gTD0YxQdq1
 AhGeXBF75P1g89Ll92sg0Zx03tcJ1gJf23Xc0cvEuwTFQH6qmPfyTtK5g2IecqlKymlLdhdQQ+1
 +AjS6/yAQh9rNWKcn/34GmE3SCzHwIIlkcuj3xWTbxP23TEVMH61D5VILorCxi+ieE2GQ/k501c
 hZntU679tMaGbqjyL3W8WVlLr1DpeGiDxSjY/975+xtTSkZb1xuRwCnlf6884W96OnCVLtroVs/
 Z6fOtkwL1xyc3yIYyhT15f7szOVzk5e72zg/DUuDsnZiu2ZyqqucUH2aWVVDSyXTmoZVw9YV3j8
 C1QE0JZD0lLW2lbei1HBVbQ/LAWNnCNR+wH5jaeC76LKciSGMxTv2KZfN9luIDppn1HslMOeAfH
 9528Gy9KrpYzEjCVBnPuPn4YwSdOKaD83S5o2h7aUl7ugvKdWx7Ch/cGECXUxALG0jU2eYkGglM
 Gm2tKWMqVfFIwu59bOuQ/UtaTGwZ+eRdFmpRcJ1IzExnvHQFSW60=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Unigraf device can check that some input video parameters.
Add a function to compare a mode with the actual signal
received by the unigraf.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 35 +++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 63dd7f62cc20..f39eb2ac1942 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -766,3 +766,38 @@ bool unigraf_use_crc(void)
 {
 	return unigraf_crc;
 }
+
+static void unigraf_read_msa(void)
+{
+	uint32_t data = 1;
+
+	unigraf_write_u32(TSI_DPRX_MSA_COMMAND_W, data);
+}
+
+/**
+ * unigraf_assert_stream_timings() - Assert that the received stream on unigraf
+ * matches the mode_info
+ * @stream: Stream id on the unigraf
+ * @mode_info: Mode to compare with
+ */
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
+{
+	uint32_t stream_count;
+
+	igt_assert(mode_info);
+
+	unigraf_read_msa();
+	stream_count = unigraf_read_u32(TSI_DPRX_MSA_STREAM_COUNT_R);
+	igt_assert_lt(stream, stream_count);
+	unigraf_write_u32(TSI_DPRX_MSA_STREAM_SELECT, stream);
+	igt_assert_eq(mode_info->htotal, unigraf_read_u32(TSI_DPRX_MSA_HTOTAL_R));
+	igt_assert_eq(mode_info->vtotal, unigraf_read_u32(TSI_DPRX_MSA_VTOTAL_R));
+	igt_assert_eq(mode_info->hdisplay, unigraf_read_u32(TSI_DPRX_MSA_HACTIVE_R));
+	igt_assert_eq(mode_info->vdisplay, unigraf_read_u32(TSI_DPRX_MSA_VACTIVE_R));
+	igt_assert_eq(mode_info->hsync_end - mode_info->hsync_start,
+		      unigraf_read_u32(TSI_DPRX_MSA_HSYNC_WIDTH_R));
+	igt_assert_eq(mode_info->vsync_end - mode_info->vsync_start,
+		      unigraf_read_u32(TSI_DPRX_MSA_VSYNC_WIDTH_R));
+	igt_assert_eq(mode_info->vsync_start, unigraf_read_u32(TSI_DPRX_MSA_VSTART_R));
+	igt_assert_eq(mode_info->hsync_start, unigraf_read_u32(TSI_DPRX_MSA_HSTART_R));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 43b74306d11f..07fb681a357a 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -72,4 +72,6 @@ bool unigraf_use_crc(void);
 
 int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
+
 #endif // UNIGRAF_H

-- 
2.52.0

