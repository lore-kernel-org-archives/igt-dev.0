Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89114E7DEF3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359FC10E4E7;
	Mon,  2 Feb 2026 14:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wYC8pF74";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A010E4EC
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CB0121A2C19
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A160760767;
 Mon,  2 Feb 2026 14:33:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 77853119A8914; Mon,  2 Feb 2026 15:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2di1bQdcd4sRkyh5VePAiRCLuW6HNLvFhRYZwEV5xRs=;
 b=wYC8pF74KdcPzCZiMdaVydyttotp/UMoIVx00138jfNZw3Jhb7oRtfgb0XpnwUmQr/DA0O
 7B+t3wk/svqSWRpu7ACbjPm7X7QW5A1HJWfpZZvf7TFeAd0oGyFk2K1vvnjguFB331zgg3
 neOvulHpkrJjGp4EdsMb1S5r5yzDlOi4nxonJtXgQj0iOYirB6Zr+lwAED1lI3Y4NcB4ZE
 maugIt8NUX/o9M6Dv6MInmH57bgTX/pK8Puz+RGnNvC2wfacFWCclKU2SQj59AUgzexrcR
 pLrFcJwrjyM6m+p95CLvvGS90j3pb73K3oiz0q5tcYNwoKaadoiZ44DWhS5AoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:23 +0100
Subject: [PATCH i-g-t v6 44/48] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-44-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vyKVy8PO47x1X6NmHUF/+LkJ1mu5ABTqRlygp/A0/OA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWUu/ZPQABNZrCP5ys16ozUxBWCaDFkMYgk+
 +adeD9Y90iJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJWhg//SiJLu2d09yFdiQX3bBZU3mrcE9DalD1
 QfgIw72fvImTfxxn5qFJwTLhKVyYIVO9Vd9/87rroR7nINeOpmGkEv594OcszBAZt/6GOyyafeA
 UVMamjBmZnTPH/wputdQ/9oW3TIVaQ7xOBNfTi93qD8xWgBFWyvGgsu3OUft43ScutfZ20VSFHQ
 XbumUIlPkDNry7iUJ3dQMOetuZGV13ub6W2is5sz3A1v1Jbfs5ZUD8Js/naNcg28NHcF3JZ+Xy0
 MzP7nyQOZOLwVRHH9HyWhj/bTU+7szIkFdad6ocvep7xHVnbLv9zxS58Bg1gQP3gW9PjujBwcPI
 yB+LUz5Un/+Cgta6PEwCbgpfRJxA8sCQNyAYREjFnFaPIhSkvh4i6Qh+oZZ/K0LaeOC3k2jdJcG
 d3pIlsAgvYN4/ZbZZRufq8tMBWRdU9/VK7ZvGCUmvuyUDhkGBoCOlOQQif9C0ybF0IAVN2p79A3
 qiUgMrOdPz2PD59cTBhzgtUdHFSlns4fSe1poRC26zSZPYzWpFhE+DQS9LBQBT3KtzGhzdGKzf3
 r+N4uQpDmH/PgnxBBIqQmVqUecYD0yxSrvbzAU67cTqg240ntyEJAmG5unnboH7vfkJm492SwHl
 fnZbqxlmxWJCSxsVXinZTwVxXYvGyE7HQLf3OGYWLtwNjkUeLs9A=
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

As unigraf can emulate 1, 2 or 4 lanes display port connections, add
helpers to configure the number of lanes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 29 +++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index fbff4aeccba2..98cac5d7e929 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -564,6 +564,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 	sleep(1);
 }
 
@@ -824,3 +825,31 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
 	igt_assert_eq(mode_info->vsync_start, unigraf_read_u32(TSI_DPRX_MSA_VSTART_R));
 	igt_assert_eq(mode_info->hsync_start, unigraf_read_u32(TSI_DPRX_MSA_HSTART_R));
 }
+
+/**
+ * unigraf_set_max_lane_count() - Set the maximum number of lanes advertised to the DUT
+ * @count: The maximum number of lanes to configure on the device
+ *
+ * This function sets the maximum number of lanes that the device will advertise on the DP link.
+ * The actual number of lanes used may be less than the requested count if the
+ * DUT does not support/use it.
+ */
+void unigraf_set_max_lane_count(uint32_t count)
+{
+	unigraf_write_u32(TSI_DPRX_MAX_LANES, count);
+}
+
+/**
+ * unigraf_get_max_lane_count() - Get the maximum number of lanes supported by the device
+ *
+ * Returns: The maximum number of lanes supported by the device.
+ */
+int unigraf_get_max_lane_count(void)
+{
+	int max_lanes;
+
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_MAX_LANES,
+					     &max_lanes, sizeof(max_lanes)));
+	return max_lanes;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 07fb681a357a..a10a45dfb395 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -74,4 +74,8 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
 void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
 
+int unigraf_get_max_lane_count(void);
+
+void unigraf_set_max_lane_count(uint32_t count);
+
 #endif // UNIGRAF_H

-- 
2.52.0

