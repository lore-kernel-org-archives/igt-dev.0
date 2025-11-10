Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D70DCD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825410E3BB;
	Mon, 10 Nov 2025 13:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="x7jhk/FP";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACCA10E3C6
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A2BAC4E41608;
 Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7345F606F5;
 Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F07810371911; Mon, 10 Nov 2025 14:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sJZW932Eg4cGU0hthIP/8T5SiiMMF0zJjXGzx5ehLvs=;
 b=x7jhk/FPV3hmsiNa5ZfpJZFpuvjuxpDC88/YKlni/94mDFh4lB1G2DJU9FY1L4hD5iJUlO
 6S5PpKhCOLrQPbk9NxNyI0+YrAqnOitZX9r7XJSgb+tN6vtkJfF6loXcCAg6WMVB24EnLi
 bWmgnjfkW3JNkVG38XSruwNKwlhvXqbVjlV9SEKMqqRDBExazK4eWg6jOlNBPFuPFyHqHV
 MWL5bqM+9kXs+WP4CZNEyTSWomjzbH8nD40NPXOPs8qpjeiPMxYI6L5V7B1aREQlDRdzme
 BW9os7EavYDzeOARolo+hoK7t5djumKiMKZtgCZWZu3y5pWsTYCHoJJh+oQEEA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:38 +0000
Subject: [PATCH i-g-t v4 36/46] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-36-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0SCuLIpJVGIwOlqlhftiNrVv3tCaABIRZObgulgEJlo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesSJBkKJSAnUEQzYRZMcuPiATy5+jtX5CoEf
 uJMumruWJ2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEgAKCRAgrS7GWxAs
 4m1cD/sE5S7RKD7BnwiOI4iZOnFLZdwGP+fcDQIHPxAe0/ArrbwQ8gh/tpn+UfZerDrtZEyjZq9
 VbK7eLt8usyen9F8keIetWKfabFvt4r/3ThMs1k7Bk8TYwwHiG90Crja1oc83uZR0gva+X+NLum
 UX56LiLf8NfaSZAauzEvLPmvF3RV5feC8nENU4kzBsSAiz/ZkbR/gxxbf5bLiPWlSkn04iSD6dW
 LWtc2KoR0/hZKVbYrBFIq07eYuvuDWHHnPp1YubodYB1VKQpuxB/dtJQCEZ7tvStuQgopard6rB
 eHRvesaFIl/fduMA/D9lsySiIG2Kg4lQi+AE4jtI+46BhX2z+Q33+1l8rjse9uccoPvRpTEB636
 eB//sPKOSYL/MCYgf3R2OJwdMhK/JX6VcMnQOe8AWImNs1122dm6mrsWmm52ddpf+07hceL2wvL
 G4HNpoe+YQ5rBuELzd6oHe94M+99Fhg/nseRpMHbZu7IiGbns1ekQyu9MtZVQV7MmRVliGB+lnX
 A4Io/i5Dr+PN/z8S2q0fJslEP8032UmBPbKZGkCf7S0YG2uLmyRkM+TOrUFvmxJSHcJWxwOtAgv
 Fhh8tLV5n+SZGk9+YqAfPxnJFYUOpo6f3mQr2vxADFJSRLne9yEIKLPAiUt9ZRT78+5msivpuqJ
 YRCn6frF8iC9Zaw==
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
 lib/unigraf/unigraf.c | 16 ++++++++++++++++
 lib/unigraf/unigraf.h | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 74bc9b2137d1..5b5e01cb8f58 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -536,6 +536,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 	sleep(1);
 }
 
@@ -700,3 +701,18 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
 	igt_assert_eq(mode_info->vsync_start, unigraf_read_u32(TSI_DPRX_MSA_VSTART_R));
 	igt_assert_eq(mode_info->hsync_start, unigraf_read_u32(TSI_DPRX_MSA_HSTART_R));
 }
+
+void unigraf_set_max_lane_count(uint32_t count)
+{
+	unigraf_write_u32(TSI_DPRX_MAX_LANES, count);
+}
+
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
index d0d547db9a9d..84f59e843fd5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -197,4 +197,21 @@ int unigraf_get_connector_by_stream(int drm_fd, int stream_id);
  */
 void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
 
+/**
+ * unigraf_get_max_lane_count() - Get the maximum number of lanes supported by the device
+ *
+ * Returns: The maximum number of lanes supported by the device.
+ */
+int unigraf_get_max_lane_count(void);
+
+/**
+ * unigraf_set_max_lane_count() - Set the maximum number of lanes advertised to the DUT
+ * @count: The maximum number of lanes to configure on the device
+ *
+ * This function sets the maximum number of lanes that the device will advertise on the DP link.
+ * The actual number of lanes used may be less than the requested count if the
+ * DUT does not support/use it.
+ */
+void unigraf_set_max_lane_count(uint32_t count);
+
 #endif // UNIGRAF_H

-- 
2.51.0

