Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85263E7DEF4
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3539110E4F8;
	Mon,  2 Feb 2026 14:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="uxCatRnY";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5A210E4F6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 458B94E423C9;
 Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C70360767;
 Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D61D1119A88F7; Mon,  2 Feb 2026 15:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=d7KRWsrSDrTcIL7qWmJjjiL38qNLEkmCUW54jBPFcs8=;
 b=uxCatRnYfTHZ8DL4besb5GU9/ibIdJTpEU0ZcjKfpJC46PYryztHu2+bCY0Axmd8DiC3pu
 adBnZq04GPRW438vJMIn2uTyZGO0Ldo+5Fjt52m/8vGz9a/XaoR5M4bZmQ46di1l6CzAIs
 Vv24V1G6AcRJkIKmSJQm2vkDPKDuwrLkNGy4htexwfB7QJt1uZiaNGKgwQl7uW4Ztb2jSm
 t4WTdLUe//7t7mHOuWPrOxo+lqjdjZYP50cSzU0lQpXfAJZzuZ7SXC6/tVOijuj0pykb6I
 aSD7ryD/xdfuHAgpnX5Cw8820pvB5FnW0GhgGwVLFcG61bYHdhhX/5HYVdtZiw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:13 +0100
Subject: [PATCH i-g-t v6 34/48] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-34-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Yyzh2PjEqWRS8n2PcKUC5gLT5eopX/JsCp6qbIWpRyE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWTmLXBtgqx6MMd+WStoZ+YZNP8EfLXhSRCp
 Hhok/lNdFWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKEoA//aN7Af7FuSFSDId5QVcFnv9du5h94c9F
 4L7Iw9wttWmuCUq7EVxPh8EIGXSDZxaxTXG+DKTs4iuL3r0Xk+SH+YOnRe6ULRVIgGXp3vhWTtt
 aRVY1LBHJK7pzHVsbkK5+MM/zltLuzUx1U17pOSjDNpZRB+eAAdb+Qc+C2xuxAi3gHajjWZJ+4p
 jmJy2SrqqiLL/eAckGy1hm4T8afTBC7jUc1V8nXo1ttq0+IghVaL11nfi/NF2h+ZJl8triyG82m
 8J379pikCf9dAKSfM0CgyKhvyBfG5xJxnDd/1sSr+45xCnpChGOUS+DcF3lnyAwNNRpxTQ+rlXG
 PbgIUTMjicowmLag6s2CvDzfaVyKcN10EyQpLUZIhYP+7bvtH2ae/766B5ZuRW/tIM6ht/cENq1
 oSd/0R6Wy4ATEAlJDBisowowmwPD1s8DVjjwazJ2NQsVy6oxN2tzi4Kls7U/zNG1tcP/CC1SKzJ
 sP/JU8le50NzrgcWmYdfkczgqlCQa3zxbV96c5q/xufwIDakrtClVi5sH0JKsxovdu2j93pBeXb
 /O5mwO1c7Gt3QtxhHNG5TG5GHL1jgSRYAGdsOn7FQqMTTsZLyLgdK7v7vsix1Tx09WNS5/VJStB
 k0Lw9Bo1EMXxCxJozEBhuqHe1vm5OSvdqBYTl0+vdqGNnRXp0o7I=
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

