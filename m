Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA45CD13D9
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41C10E3C3;
	Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DEi+i1kY";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456E110E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 99D28C108F0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13AD0606F5;
 Mon, 10 Nov 2025 13:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1233C10371904; Mon, 10 Nov 2025 14:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782001; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2YAoSn1IMv2ocpfTpo1a+GLeedjYd/9ARZlZ4hij6To=;
 b=DEi+i1kYOaK3J5XfyXFkQuEm8K7CpV0ehrTujwxYjHoN8dUfenZHtUGodpmHT7Q1V5KKgq
 EW8Mu9hEgr/MQQoGZgQ1KUwAzQ4CQWxrqX/0vw8HUltRrCWkUtwkptnGeGFkTflTdnop0q
 oXTJq8DATbAehTVyv8qP06FcIC3WZk7xJg9vuaPrGImu9d4bJXKTXm5aTcR7wrjAwBKbqZ
 hwgZLmwnODUde1AfCW/1qyg4SDq2ELmn6bPqZAF1Yz+Jsip69ZkVntyv+4DbTgxJW+gkzz
 N0i2ZaQ+pZ48f4SDOr5cwpQCY8yERCqfLH794FIvP4uGvWeMKF2mjIsNH4IoPQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:36 +0000
Subject: [PATCH i-g-t v4 34/46] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-34-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2309;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oonEPWE+1dgMu7M5JdFaIie8DXMuQ2SfJIGu+2Uafm8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesS2knJsFNeMbAZcG0m+2DHgC3lJgaSs5flE
 K05Vc5WlOOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEgAKCRAgrS7GWxAs
 4mrmD/4tYkCWmkEp3bmbcuHG4b5DSqg0bugZ78t4YrWXdblfG85vzVxm/VgIiGlpv8meZsji3rN
 j/U3irStjeRSDgvd8Rm8UJr3U5jWSGu17EADShXN/Vr8pyvC1BJAF0vt2MBAhr4hgg1U60uM4TS
 OgvX1738IdKCUObiL7bowSq5r9QbmG8Chu4Lk9H0QuhXnEji4ywKtWtQnZHJtjrb2CmikdOIG2m
 z0m/MCCCpChU2Nmf3GhHmQk/AojX+AyKGRKuVoF7fzH5xIZgRRgS5LfzZ31ozsiBBWuFa5Ru+2X
 WjcqJGanKTZDl1V/NWnuZCmDqipRxV5OgiO5tD02J2RZ83Hti2yjnXya+mldGBWPTufgY7xWxY+
 Cvv0ujsDp5CCZba41uMaVKbjeIMZVLQMSyqswKTx5oAYAH5GA1cE+9ouEPPYPUOoYAr0GEbg0Ym
 Qcd5wswFCYZu2EDcm6JEVbjVqhJN+nKjDKNZKgYx8aTCrwdPOTOSUyTzERtvciwFNGRBP4bCnYT
 3IYF6aocmzH7Uf13g/Hk9pKEKz6IyEBoPwGt0GTM1Eez5ObytdrOeDuVmM2hs30UWKLtlluI623
 QP0xosvupdwHlz5F4eNi3kbQ2x+s+7Qu4DOMERHrBbm7b09KoUgFL3LagIIYQkklDA/hyq/k6Cc
 6Yc7SD3xYMqKX3Q==
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
---
 lib/unigraf/unigraf.c | 29 +++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 7770d3a86ad1..51f1f13af354 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -647,3 +647,32 @@ bool unigraf_use_crc(void)
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
index f870843cc7b5..d0d547db9a9d 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -189,4 +189,12 @@ bool unigraf_use_crc(void);
  */
 int unigraf_get_connector_by_stream(int drm_fd, int stream_id);
 
+/**
+ * unigraf_assert_stream_timings() - Assert that the received stream on unigraf
+ * matches the mode_info
+ * @stream: Stream id on the unigraf
+ * @mode_info: Mode to compare with
+ */
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
+
 #endif // UNIGRAF_H

-- 
2.51.0

