Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C8E7DEEE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DAB10E4F1;
	Mon,  2 Feb 2026 14:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="blaYpbHa";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347310E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 76BA11A2C16;
 Mon,  2 Feb 2026 14:33:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 46A2B60767;
 Mon,  2 Feb 2026 14:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B70D119A8916; Mon,  2 Feb 2026 15:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042787; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iWFbVpCzmpfmVx722T9voMzfX2XjcQACG6gONR3rnZc=;
 b=blaYpbHalPlW09mh3XZKDtp12S4XCV3FPp6ht0EgoyGiycCGiyZz+BKmCBbLAW+03dC8AY
 g7DeeOFOz2rBZNZX03go1IfKhq7BaOGbEsnnhSihYksgWIXnsZhD5om0lNwhnMSSVLJ6Y7
 2zN/ei0MyF7L2lQIfQXA0u13rnnxjGezYPf2np8rwjfPwZ/G38UMkQJEZcj10uw6DQJ2JZ
 bNlGdHusJjUBw/Te76Bx6PxwxRr1Kvxn6gduFRx1X89RG7TeFmQBSXsv8VsEfUIf1Fa5gh
 yPL4YG9x+uHL/vAM9w6XLEsbrIwrzFxkqhC/hBaG4m7dA7V1LO2etn9eQHbjSg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:25 +0100
Subject: [PATCH i-g-t v6 46/48] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-46-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3063;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=y/Tk7h9Ot1cftKV46OldIqvpKgxzsdgkeSGz4dSiY7Y=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWVqsyol4gte2iw43piZCQg7j87YGr3QJbR8
 w30klJ7nhOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK7KhAArII67IPz4d1gZL/HpKSvr4VhhPL0pRE
 L/HccpWVPqVZNj4FCAJk/LKRonuhMql4jU7WIhIi5xoRdZplBKlC2fOHldQRz3qZtYlv3KtZFDs
 QHjhJVT83Mhzw9yy5YNDrYw3xiZOsHJbzNN5sVmEptkdbNWt3J/sIk9qr5poza0hJd/Bd2F2Lqd
 d7B1RavwfaZxf+mEAKHk+7jmhmRY+RxtbyMGZf3F4c0vjIZ88+zBJzc6ODC7ZaednWzR2sqD/3C
 dimomhTzxvqLY7y0dBUlj4162cGvOv7Xn6YKc+/WaQ2D1HT7f7Sj9lal885qnfT1k1F54zD6jbO
 61HZ06rCpsULhN5BWp0qxcUtaFExqbLmMpsw5UypOWguh0at4aXK9sqgjtfy7MBhehK6aToy9Fk
 +P08Zof1KmCn8Ut2ANKiCN8OR2xyI5hzcunTmrUvs9r14q35BhSio2ZtU5ZMHD8C2b8+/FFyHYl
 OVUw49rexFgQDxVNIn+aDerMf3JARMDEuq9R58dvEgP0VTiuLjIkR1GnsTb3UIMviTql4SeNgOj
 9SkIfIA1F44qzHrlEW8WjZJqM2MKPxOOCC/o2UjrFCNExzUqgJedQuR0HYHseCHwidjyC1Y/95l
 NroNIpoHCUTzXa/IerfWBEN1d5wDsf/8Op5n8aj6jdnDN4e0X78U=
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

