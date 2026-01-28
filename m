Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC1D25B63
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA92A10E6E5;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I3pxA0D2";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B6610E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EB6B91A2AC0;
 Wed, 28 Jan 2026 13:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C27B16071F;
 Wed, 28 Jan 2026 13:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC484119A880F; Wed, 28 Jan 2026 14:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2di1bQdcd4sRkyh5VePAiRCLuW6HNLvFhRYZwEV5xRs=;
 b=I3pxA0D2XzrEJy0pk7uJc+BNjLzXH0ua15uCaaOlurNSsv31VhM4SPaRXvuIZF3jPMxHBm
 Gt5T2gbQK8HYmhFUJfk0p5fI3TyMdLNGpyTXFi+U3twh+DmrLFFcIilRRHvEaTTVLtpZe0
 mJSyeEh2/sCISWAI/pTp3DcCd26p0oqu1rfBY3FfYXO6qllXk2pISXKFSglCippuA/5Zmo
 VfCmhOUQmf9m7uGlFxvgB4wI/RCl2PihEOBXsSIwDXvmAhuZLMrco4c83BE/oQPaE+Ij05
 W8f8vsKXIASa/56TeFy3HO3eQ5pFWzPGD9fPYcINzf49/ZPiu7pRPODLxVSbfg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:15 +0100
Subject: [PATCH i-g-t v5 44/48] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-44-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vyKVy8PO47x1X6NmHUF/+LkJ1mu5ABTqRlygp/A0/OA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvNgzK4QMdRuoY6XD1K0bRvO+6Q4ellM7iTs
 ON8djMXUveJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ8aRAAu+25gZK4Q3JHr212pnU0fjvxUsVuNQT
 YYALXUNsU43hyeFk1bX/9vcAFwbhXHQ6Y7QNVeBLERyEY16Ut3Go0EVTNrLf5+G59HyrGYO/A2t
 C9JA+WSmSK1EpnphM+2ZVifOiOwUKfCRwBvOE3WNxMA9UyxidFis1gjzQT6+Oy5iQDvVYxNsTZ+
 bFgj3gBc0QyG5vA8+YZ4Kv9whmiNvZaIOKZaNwPUSeUuhE676g29qEb76ht2yKjt45TlR9FmN6y
 ZdigPxqJbBU8fcuuDkHQV3NdpMK8awYOLufKgSWn6HgCf6vybvqALUY3hK8Q4fcQ9sFsAAHDsbI
 KGRZd7HXyp4yf4bp0NPD1v/zqpkzxqufRpB8LUstncyGe8D3OQZKtMgJ8Ld39kNest1Itk4XCwy
 vdcVfc6JrmrJUKCaOPaNsrppIvEdIptq3QrIJVGwJfAca2lYGq1PZIOtOkiBuBV0yC85jKHjpQY
 VPMsg7gD9DDFTYJgNgBOBUjyvCT2ZAH0Zzd1L52N7szUvAGb0Py0NIc3MLjxSnWMT1qW2adePu0
 GkbbVUH9vHvh2ILIH0Pc8BvOfYjuTlbFYaSmFqp01stJtovkrhUK0RxVEhjccFefISZOQhZbzpd
 /Z7EqNEo50qLLpMQEKH1r8mc2CcsUBUarJR2E1VcCIOYj3204vQg=
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

