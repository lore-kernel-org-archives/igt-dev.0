Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755BCF53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2435E10E29A;
	Mon, 16 Mar 2026 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zEld+Gmt";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D212610E3FE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B4AE74E42609
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 85FF15FC4A;
 Mon, 16 Mar 2026 16:23:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CCCE10372211; Mon, 16 Mar 2026 17:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3EbGKJKrKUuurLVp+7tB8Q5lX6A0R90zcFIBJqRPfvI=;
 b=zEld+GmtHCvF9dLoPvfEDgKz+XrtIHkjPjlH1gprbl6E6/S9O+/T+pcnL5DvZIPhuCcCU2
 ZAxdjFmzUCGO7roXksUMBdTOP9d+uIuiKaj9sdmCnmiNrXBE/6oIc9P91D9NDGRXf5bOyr
 iAGDViCtmuVLOUbZX0/9+6R9JnglYFMFAq4Rt2OBeQBTY1gAiSVenZ60DmkYVmnn3SkYkG
 FeQdEBBgYrc06eZVSrY3wakK/JQTNmWmppf0PwhN9z0AAJZhfKWeOqgFFLIXCNVWm9LQKL
 kP2NcLQ+v7Ewvh5NduCKlkOmJFdeBUBf0r2IpEIIaOVt17gCv1B0YPBndxc5xA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:56 +0100
Subject: [PATCH i-g-t v9 35/49] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-35-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2cBzXqk90tyqprreOeCwZtAFKVdu1J+7vwkfQjKFSY4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6OlPGsqlCcHk2t3nDI7O7NJMFvHcXJszQoS
 W+vOhVaEVmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLFmw//VIxo3dZZzNutEqNX6vKCnnRGP97G2V/
 a3c2J+AqEJy7gpT508nlUrlW58uU/HU1B2rK0Af/lW4wXYYKChJZtWByKHep7BkcvruJ6LIxJTl
 /0JsodIuhjmx0qPLWe/NAI1PGfk1ZJjeJuDKs0RzqicTNE9t6t7Y8mPHsPoTjpkUPCbBU6SCTEJ
 taduDcpMbrJdsquT0SK3Y6+JkbNA2wf3f+KNMhXft4mDhmnlSdXTp43YbjIBf2WZkvYyCAjO7gQ
 k3t2MQ1omEkmqQuhXtduIr5HUPZa+6d7HURDcSL+MM6Q6CMbI67nqH9w4TXpzt5KLHZ6l+F6p5U
 eUsdCmSmBEphIup2lwMOJTEt+SE0ksVbalc9VI1wx8af9JKyMLb+mh2Q7I7MdrqLGyAEbrKazsP
 nkPIzt6bvOFUgNfFrlKHhD9ldrB/xoX8ZhJtVWSg8fXXMNk6OzhraTgXjuEXREqO7x7oKN7ze+i
 cxEqI2FFtg3UXu9AN22Ggi5oExixhQCasF4W328Cs57aaw4BOukdyUMcxc3ZrU9YC7f5O4RyKnc
 yLY51UENDTkExFX4qtT2o/B7e6ttKwElWSJn/KJAnW85H86xlT5S7INPJxpmOdQD4gmEGLoNDwD
 0Kmc7qts4VHcBkSTGSc84VvqsO0VCk2f0F/2wGkIPbzc7A1XAG5c=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 35 +++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 6d192ffe36b5..3970c1071cc8 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -748,3 +748,38 @@ bool unigraf_use_crc(void)
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
index 0ed6d1eb2713..65f00c8d4948 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -78,4 +78,6 @@ bool unigraf_use_crc(void);
 
 int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
+
 #endif // UNIGRAF_H

-- 
2.52.0

