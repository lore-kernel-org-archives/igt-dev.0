Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A4CCCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ED110E3CA;
	Mon, 10 Nov 2025 13:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UEpE1LyG";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8185010E3C2
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 634E44E4160A;
 Mon, 10 Nov 2025 13:40:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 39D25606F5;
 Mon, 10 Nov 2025 13:40:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5AAB010371919; Mon, 10 Nov 2025 14:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZaEVLDMWd1ERmHrgt+B44lo47gKhlTXiLuvSttDUejI=;
 b=UEpE1LyG8uZj5x64IvruvOQDuY6qNNtPjwx3fWBfPmUoc0XPr1IB6FYJmJTXIiKSEL566I
 dPZqodDM4bntf2l4hQ4tV4vvcEsDQG+n3RB2zTTKdTv5rgwk84lt30YTo/wwUawe5R0kDh
 HgQgpDFNA93RZduhw4n8FgP1sfuiFVIIzQniKL3SA7QJVRXTlcfXMKLB3U15bmq/VYP0bh
 Fu4ivweYOoALnsPBxGwL4gpHGivV/3Wh9tIx2FCwVWAqNq00wXwE2T/qVTixSQV8nkVBOk
 BRPeolB/3yZjh/kiKqzymvZ2tcB5u/SqXrxgaw6O0m4R84dUKt9fIxQj1MtC0w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:40 +0000
Subject: [PATCH i-g-t v4 38/46] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-38-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RB9YnrLTOVI5LEcmyV30PynigbB+mBQMWS99ZKFjCGU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesTilCZxs/D8+hsu6reV5/eACSeETkZSVBb2
 mZ2HzALs66JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEwAKCRAgrS7GWxAs
 4vwkEACpFG7Baw+2DI9Pz0cL762NivhrescO7K2ZzTJ4ZGasf83LOyEx94iVZKA2/hEld/Esxp9
 Xa5QEC/Z8v3zmYYv0x0lAmJB0CmW7CXdqE+82xA9yM13+GxsEJlhlrJ9qZTrSwryHzWkOE+wnKV
 PSBFcnjtxbkhaao/UJmaEvwEGIvDOp5OaUbeGvfaOhnGcl6/nCrhw/uBAcsTt1P8t8ZEAOrlfRT
 JjPTJFhN9nRmkKuPqDmPxYlTPQeck4bJVoof6K8Y/LTBYlmROt7/3Qkv/nyhtA9pURkNjq3cg85
 iuKdrHJIjEsZV1A6wlzgsnVk2nq24xpp6qbYHjkLX6jjj0j1znyOS0TOmrysb4kfl3XeQNp1V0y
 E1jY+Bdc2iyAqR57yzoHcUEtQoeJAvzx4c94ojyasVqPAvsbvuXD1O+ndvITfmj5TyvjYQHF70/
 bQBVb1W1kZFPBPH4wQBvfc2TWJ2j0rdzndZGjUO0i5bEg6hzsklh6pAjwgvvCV7xwgcpCj61/6w
 OgG9iA1QFZAkMo3xqN3I0L1BidpusdgMdXK9u6spuV5XZQCh05fRvJ47L60CFlBwdZdRTxzVmrN
 Y6Onc12LjSYPRpeoAK14cyFrQIyqNtREGu5LQzRza4zrHLl9HyBM2RgYF7nR0QgfiaZZt6lx4fb
 4Og080NhEB3WK9A==
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

As link rate can vary on a display port link, add a way
to change advertised link rate from unigraf.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 30 ++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 5b5e01cb8f58..f1d6d809e216 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -537,6 +537,7 @@ void unigraf_reset(void)
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
 	unigraf_set_max_lane_count(4);
+	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
 	sleep(1);
 }
 
@@ -716,3 +717,32 @@ int unigraf_get_max_lane_count(void)
 					     &max_lanes, sizeof(max_lanes)));
 	return max_lanes;
 }
+
+void unigraf_set_max_link_rate(int bandwidth)
+{
+	unigraf_write_u32(TSI_DPRX_MAX_LINK_RATE, bandwidth);
+}
+
+int unigraf_get_max_link_rate(void)
+{
+	return unigraf_read_u32(TSI_DPRX_MAX_LINK_RATE);
+}
+
+int unigraf_rate_to_kbs(enum unigraf_rate rate)
+{
+	switch (rate) {
+	case UNIGRAF_RATE_1_62_GHZ:
+		return 1620000;
+	case UNIGRAF_RATE_2_7_GHZ:
+		return 2700000;
+	case UNIGRAF_RATE_5_4_GHZ:
+		return 5400000;
+	case UNIGRAF_RATE_6_75_GHZ:
+		return 6750000;
+	case UNIGRAF_RATE_8_10_GHZ:
+		return 8100000;
+	default:
+		igt_assert_f(0, "Unknown rate %d\n", rate);
+		return 0;
+	}
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 84f59e843fd5..721fd025924e 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -214,4 +214,41 @@ int unigraf_get_max_lane_count(void);
  */
 void unigraf_set_max_lane_count(uint32_t count);
 
+enum unigraf_rate {
+	UNIGRAF_RATE_1_62_GHZ = 6,
+	UNIGRAF_RATE_2_7_GHZ = 10,
+	UNIGRAF_RATE_5_4_GHZ = 20,
+	UNIGRAF_RATE_6_75_GHZ = 25,
+	UNIGRAF_RATE_8_10_GHZ = 30,
+};
+
+/**
+ * unigraf_set_max_link_rate() - Set the maximum link rate advertised to the DUT
+ * @rate: The maximum link rate to configure on the device. Actual value is
+ *        @rate * 270000 kHz. Common values can be found in enum unigraf_rate
+ *
+ * This function sets the maximum link rate that the device will advertise on the DP link.
+ * The actual link rate used may be less than the requested value if the DUT does not
+ * support/use it.
+ */
+void unigraf_set_max_link_rate(int rate);
+
+/**
+ * unigraf_get_max_link_rate() - Get the maximum link rate supported by the device
+ *
+ * Returns: The maximum link rate supported by the device. The value returned must be multiplied by
+ *          270000 to get the value in kHz.
+ */
+int unigraf_get_max_link_rate(void);
+
+/**
+ * unigraf_rate_to_kbs - Convert a rate value to kilobits per second
+ * @rate: The rate value to convert
+ *
+ * This function converts a rate value to kilobits per second (kbps).
+ *
+ * Returns: The converted rate in kilobits per second
+ */
+int unigraf_rate_to_kbs(enum unigraf_rate rate);
+
 #endif // UNIGRAF_H

-- 
2.51.0

