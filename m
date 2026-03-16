Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD10AF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FF110E25E;
	Mon, 16 Mar 2026 10:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yu8kyKyC";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C08010E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 869264E42627;
 Mon, 16 Mar 2026 10:24:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 59F795FC4A;
 Mon, 16 Mar 2026 10:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68F4910369F4E; Mon, 16 Mar 2026 11:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dNequfOAbzpPS1C9G94e5CCyJgic3nfPmyEbGIfVdQg=;
 b=yu8kyKyCXTVuSVQYlisaTDoOa8nzqCFu2yxw+sb94OR/bUOh7THYXp00L47k9ciiW6cmeR
 wnKoMvamx8cJoCuALZWSY/G672NPnHGNoudw3KEwHIxgYzT5Z5lMKk9BxtD3+tdoXzw8ve
 jOpkEZ14mN3zIOI6cCiuGclrWRqxw8f7Z/ZEEcKA0E8HCkZC6LsDNFLBVFsfLGlOPkr01A
 rq9IAVABD7jP9ElD+ah5SZ4GP9lvd3BTf/cRKOxM0leESIDfxHf/Uj1BPDFujnX5Oav8sY
 1wrAhcW81fp/FYcy+cu2zx5ek/S9DDsjUXr9VUosXgoj9lSxoCzBey04csLL+A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:55 +0100
Subject: [PATCH i-g-t v8 47/49] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-47-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=L81vBf9VXnxP+LQ7qzxyDqZOyXAhbkM3GoS1Xh0Hitk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pVIvoYbbDQKCkd3NVTV8LFoPb3MWAvLDW+2
 bZB+R1iknSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJgGQ/8DEPYpQUBSBGFnY2cYjNe4pX5z1jvcSP
 NTZU/5A5Ps5rbqznkHfsFpy/7rAyj1aNKp1jIyTnj7GPmDJcRowEWWffVaHbtHYNx71yiQl1OTR
 JuiUOkL6ZAk/MviWVEJcOFp9nBv3HnABXhMSg60tZYfaeiLcw3IOH2pL6dh73tNiPdmMWsd5ClR
 BrXLPiDjydIItsPqQxPAoK34KHFDvobcEC+37sGDJlEkDRzpT3JsYQPWP9ybUZzYXIEePnRxqgL
 2DUCm9mru1fK2MNqNG7wypXRglK1l0xYajswIN33Z3l3I7fXYrM8xbmaoXl3HxkgGf/ZUI9jzT2
 2AEZCizH0VJ+01jj6NWl5BK67Uo7pdoYgRHCytZEIdP+YWq0nu9M6OkgItSZcxt2KPFgV7fOqDj
 DDBsp1uGqA1DaXQ9CdquOLhlqEMhTrO2r9Z3K8olmC/YC22LhvvLotb866wylGb3PTlYnHJVp6o
 rVuuuGfjA44JvoZxlZBEDcCGG21S8bzSjmAb1JGE5uMXz75InNhVx/r+ZmN9wLQ5cPuHfo3nWtG
 MD+LMFxd2Cj4ubZ35Cn0HWlL7AoQmthjaDfVdoxRj90LH9jU81L2jOP2UczXokXUO+U/xuu2rO2
 eDGqKqcCpqZKUJ7e7MuvWwATPSAATIm3w6JE08iwIK3dUQO6w35Y=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 14 ++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index e046fa5bc4fe..74957b6b3f5d 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -547,6 +547,7 @@ void unigraf_reset(void)
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
 	unigraf_set_max_lane_count(4);
+	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
 }
 
 /**
@@ -834,3 +835,55 @@ int unigraf_get_max_lane_count(void)
 					     &max_lanes, sizeof(max_lanes)));
 	return max_lanes;
 }
+
+/**
+ * unigraf_set_max_link_rate() - Set the maximum link rate advertised to the DUT
+ * @bandwidth: The maximum link rate to configure on the device. Actual value is
+ *        @bandwidth * 270000 kHz. Common values can be found in enum unigraf_rate
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
index e926855dd059..3cba15732daa 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -84,4 +84,18 @@ int unigraf_get_max_lane_count(void);
 
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

