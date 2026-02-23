Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50A7EA4FB4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFE010E384;
	Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RHLcaga4";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBF410E374
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6FFB0C143C5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2B0FD5FD43;
 Mon, 23 Feb 2026 12:09:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11A9610368FAA; Mon, 23 Feb 2026 13:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6m/pPzhSHGG5ISY7yvbvFwVfSHlV8ImyJySEJDmdozQ=;
 b=RHLcaga4Q8efsbE1/sV0L3GB7tqkqavXCo2l6iiVXIMb3kayG4/O/DRQubulI1OtxPdV3G
 cIdvecbG4GcR7+Av3KIYm5gKmeeOQ3D7Hvp9ITtCN1Fs9H7wUdKbMQzCT3u9VIFy1v6ZVo
 rXqCRnm2FLcg/PWnG54dhpDMJW9FeJWi3vbjNUoE7RUV138tkW8msAHnKXRQIaIAALSLXe
 xdDLq6aMxZWbAsj12daO210X1wwCaoqJi9lS12oPHLIbHbZyEuKk8tnPj9D+EjQOTioph/
 IHHTJVWdH7WY4tFhnFuiXwUXowjSXwgt8//Gl3tJZQktJWQNXAfk6V/iDX1xDg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:41 +0100
Subject: [PATCH i-g-t v7 34/48] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-34-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8EefMKieiUQZp02sE2l8C8zbLXMF6q2jZakGih4aJ3s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENrv1k42r9AxwL/r53fdNPAV0uv2BtUZxg+d
 RdSFiFLYDKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLXKhAAigief0nnJs0w5m8t/2iQ/1Jj24gal0z
 Axg+3pboorYojh9PA7WKNdpX9KNflFIlkDbP+vVpNLe8Zq21ZCZ3Swt8O5tx2jxL7NlEkxePsKP
 cfoAGCP6lkFjrMVHtccoTOqpyNI+4D6n0WVhY4PyIsW+bRVFhqyEIETVVxidODEWH2sYzSTFVPE
 n6PhLXQ/z2/PXmspAaci/PFupTp6GfFHJ35mfeVQax8jIieZj70/UHZKg4a1xWA/J1bC+qP9GRA
 Gb4qWQ1BMUn551A03x3qNQKWfXgCv3GJxLxPnuoNS0TI1U2CLyptXn9ynFqOI2swoLFaA+LezIQ
 6bPSGgGdHA7oJfipOZVH4NP6IRh09JK6UNKhYbzttk7aACaR7KQBTBYmqogF3azB/yTdzJ5vh9c
 6Uv2s4XoeP4p158dYSUkH696Q1DywDOfIKotRl5RZREcefC0RZGxuyu17umFRTiOewrJws5ySiS
 8XCapUhfMcWHvMyje85XNNJA3a0IPRjHFGgptiQCM0w/RDvfcY346xoaOPMr1RKNdE7PGfuZIM/
 40MzM7yLzTMLYQ5yBCn14th42h5QoKVbTqZa1O+nL09E/AtIPWysjACeCjpDVXLjYAySF83QGOv
 XziBFOm2njfefkbSCPkurnKZK4rCNmEizCSoKabP7bT0elYAdg94=
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
index 5d9edb8cd069..f30205bbed0b 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -746,3 +746,38 @@ bool unigraf_use_crc(void)
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

