Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BD610F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEDC10EC6E;
	Tue, 31 Mar 2026 17:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="w1TtsnLP";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D0010EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 81A314E42889
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 590936029D;
 Tue, 31 Mar 2026 17:11:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8238010450448; 
 Tue, 31 Mar 2026 19:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zIlermJUK50FFWEheIPbvWplW09xZQVTZRxThpsq8+c=;
 b=w1TtsnLPNGVYfTuXKuvxwBNPweBUVI+g51jjTo7fehZZzUxkc7hTeXDwLQ7nB1jcQP+ZlH
 30/mf8SIeI4xOilyjcFGu18pFMvChdTxQlB1Olnu8yI8e+c/hpbAL0Cbi8jgBkuLq0W49U
 oLTbi+zC3A3Sox+g/UmW9zRBKxBBqargRRkyhfSS4O0K+S/4TZVSMMeF2pz4rTkSI+0JoD
 HMYIA4wrBDMRRrZFW5efCLTmroAQs+8zzQrR9iimiDnR7ItRSKfnzo49XiHmt5js8rWmj5
 W4vYsSAj9obDBpZQblTHpOo8MMwAGHXoNm5pGUyofYHdWFZh2p6pCsGF5U+eEQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:52 +0200
Subject: [PATCH i-g-t v10 35/49] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-35-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1Qbi7IhVUyrUfTh5VSM45YqPox2tI+byllPjvY0WQyg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABAmeVTGaTGpQTbydDx9G/igFu2U/Ubu7Nre
 hSjC7/aSaeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKaWw/+KAsDMb718iedi4zEP0HZxDnbUfMarQm
 jS+FSTuE8wni4TKflqEYUZm9yV3B0HHZbRtDqFF7sHJnbzzeH9iEECstcDuXMJkgYt5sNigAmjp
 pEbU63BqNP62eM1l0pKE2R8d7ZtSTof1hZQnTwExOh3KYwQLnYty2t8dRA1Vff1qVpL8sCFUZw/
 rh5kem0bvlxLy1QLBCoMW8WQp8gUbe0mmyZD7QwT6KJx/+s3Rr2d26xxP6R/QD9/Qjws+4yKXPe
 xoOmYu5Prp8kx1rRBN2ciyqUYK+0v03//wZY4CIElGGC/rOBChj85ttICuCGR9dkA45pBCN00Q2
 6GI1Y29HjF8mOu4c6ofiU0cB4WeG0o0k2vMwlLxBAFHZ1fcKXi2rb4XzNvwfgHqH5x7Jzeu66jV
 AMocXOzZmwYMgZhwUFh3f6CBmsd+cx8JlarK4fJsqVjyikW//tr9HA+7nL5bzqDHYjiXU1AOizQ
 Jd8R++HgC1SkvrU8+K9CFXbcQetF6mJUZJIwlkKIvhhmPSiENcICjwVvn/mV8/HU3mZ/r7C+2jt
 OIVprPVHUtv+thGqfmepT9eCFTW3ISJbG3fhDMDyiocWk+pJXythMrvoY+8aiP0+O6UQi4h0DFw
 NGqgS6MVNGSm8bh+JNygGpU7Bbi/Dtxu/yL59Xs71tLxOrHOSS2c=
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
 lib/vendor/unigraf/unigraf.c | 35 +++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index dd7d3cbadd2f..29db564b2ce4 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -753,3 +753,38 @@ bool unigraf_use_crc(void)
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
2.52.0

