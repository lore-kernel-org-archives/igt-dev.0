Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DA2D25B5C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD8810E6F3;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QIJNEPQO";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF710E6E6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A53724E422FC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A26B6071F;
 Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A75EA119A8801; Wed, 28 Jan 2026 14:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iWFbVpCzmpfmVx722T9voMzfX2XjcQACG6gONR3rnZc=;
 b=QIJNEPQOBQE2/sZ6eoT24uEIwOizi3PoFSIOBsDChYKqcmgLOnzsu+aD8nLdHpdW1QKQaC
 +/V9hAa8xFHRNWRgaSjoue7Ndhr2MKDf0Tyul8OpXRShCM5hujc6giNmBMQtBfjrTnbMiQ
 xbEPh2ipT5oMrpCzeEVulLVyO4w4KjG5ddOc3We6l47umzIFSz42c645FUyEdUkrNka2Fy
 S5ee33j8U+MKMYRvZmqZwld/nlHNKBYL56qNYMXhq4D/tXj+o6s/slbTJmFWTxSvAWu2Xg
 tC2+tYMHbTxPlZgN7EYmuYIr0XBSv+Pv3BwvGldWardqanYntnjvqfHEGcVKVg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:17 +0100
Subject: [PATCH i-g-t v5 46/48] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-46-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3063;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=y/Tk7h9Ot1cftKV46OldIqvpKgxzsdgkeSGz4dSiY7Y=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvNx4cIr1TTxlmfNatclI6+johsf2f21LKsO
 Qdn3t3Z9+iJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIChg/9EydL65RyewqAzUvb5sY29jAQQS3U1sr
 7JmlcgZnLTtqMCSQVTeJfaM2p4dvOyfTiTPFj4pIyBN5t0A2nlTvy1Pp1lsJINEAuLqsx0XtlHW
 Yyjf7l+2jKZr2/2kSs2reGPQed21hQ26k69Qqv2wFrgoa9KSheI4wlPOy0ipEp24yONUqYMitxr
 bBK/R0O6VfP9uS40YSJooE4f04ncE/Tu9naL8WJ9XL7IO3g6j8Fx2I+7bPINCObGNGA0uAptkcE
 xu1AGkuqu6Fd5Ih3fjRv5uaVTjB3ywDhDPzaZpZ1aySPcDjFhLOU/hb+ge7HHRNAyx4BhgPUTP1
 EU4xeF2nAdbK6Gqlzn/t5JdhyXZaDd9HA8xgcolucmKHz2ELEqJ8Aw9d4lxnonfMvKVixV7yVSZ
 xYV+lt1KmnaiWJSSyu3Tgk7IKLF5o01oUI1bP5nxD6TopZW5Ca1SMz40XKWBhcKovASjegMXX8C
 FrVmuz9VjkR6snWQQwqJ9N/2ItEsn6BHN3jPrlCQ7sgNZKMuJlfKKJxoqRHrA8YU2zfnvqt1PGw
 ghm36khXlUm6W01m9Ofo//uGjxy9JDqbAZDlCa2Vw/mv4yqCN2jMLQQxlUBLUqlTlrOJ+7QzmTz
 a0OplWWyMU9rs38OWOvW6oscm0SvVK5zWLpgD9PrABkS6fsCmpe8=
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
 lib/unigraf/unigraf.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 14 ++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 98cac5d7e929..e1f77a959a93 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -565,6 +565,7 @@ void unigraf_reset(void)
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
 	unigraf_set_max_lane_count(4);
+	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
 	sleep(1);
 }
 
@@ -853,3 +854,55 @@ int unigraf_get_max_lane_count(void)
 					     &max_lanes, sizeof(max_lanes)));
 	return max_lanes;
 }
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
+void unigraf_set_max_link_rate(int bandwidth)
+{
+	unigraf_write_u32(TSI_DPRX_MAX_LINK_RATE, bandwidth);
+}
+
+/**
+ * unigraf_get_max_link_rate() - Get the maximum link rate supported by the device
+ *
+ * Returns: The maximum link rate supported by the device. The value returned must be multiplied by
+ *          270000 to get the value in kHz.
+ */
+int unigraf_get_max_link_rate(void)
+{
+	return unigraf_read_u32(TSI_DPRX_MAX_LINK_RATE);
+}
+
+/**
+ * unigraf_rate_to_kbs - Convert a rate value to kilobits per second
+ * @rate: The rate value to convert
+ *
+ * This function converts a rate value to kilobits per second (kbps).
+ *
+ * Returns: The converted rate in kilobits per second
+ */
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
index a10a45dfb395..34d00de2786a 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -78,4 +78,18 @@ int unigraf_get_max_lane_count(void);
 
 void unigraf_set_max_lane_count(uint32_t count);
 
+enum unigraf_rate {
+	UNIGRAF_RATE_1_62_GHZ = 6,
+	UNIGRAF_RATE_2_7_GHZ = 10,
+	UNIGRAF_RATE_5_4_GHZ = 20,
+	UNIGRAF_RATE_6_75_GHZ = 25,
+	UNIGRAF_RATE_8_10_GHZ = 30,
+};
+
+void unigraf_set_max_link_rate(int rate);
+
+int unigraf_get_max_link_rate(void);
+
+int unigraf_rate_to_kbs(enum unigraf_rate rate);
+
 #endif // UNIGRAF_H

-- 
2.52.0

