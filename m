Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B960DFED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706FE10F645;
	Fri, 24 Apr 2026 17:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="brJN8Kdv";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B188961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7CAEAC5EF2B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A9114604EB;
 Fri, 24 Apr 2026 16:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E515810720A33; 
 Fri, 24 Apr 2026 18:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tpvZ5v/4V6R6tUDGI7CzOU1BI9Kg67bjEoTg2BzsaXs=;
 b=brJN8KdvFbwjc0/qvSEhJJuny0Z6AcjSNfxFqby0rrzfUjI5BN1Za2pa9wChKLb7SzrB5r
 +XoAJVQGwCrMQl0d2S0jtVkkcx69GNy5cv+rqDraHv4eJy6RKUXF7IizTH+pBfIm6gz4Ff
 2Jk253kVI7Mh5tE7Jp/wJW8i7y2qZ5p0z6MQjQU1iVdpMKyVhZQ1/zP6cVRNnKWwGVx9ku
 YadMM3nhUKJrkfGGT4Gdi4g9X6MouLz+AD/WExibaq2YZdWwLcMWLFBXzVkB0LaWg4gEJR
 H0IEkLB/5DGcBR8/ETF0E+6IBxVizbKpFM6uShs5P8t7QIsjZxWyUVpYWxs0vg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:10 +0200
Subject: [PATCH i-g-t v11 35/49] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-35-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 35 +++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 8779cac0dd26..8a12fc624c64 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -752,3 +752,38 @@ bool unigraf_use_crc(void)
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index e07ca6745292..f3ea499292be 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -79,4 +79,6 @@ bool unigraf_use_crc(void);
 
 int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
+
 #endif // UNIGRAF_H

-- 
2.54.0

