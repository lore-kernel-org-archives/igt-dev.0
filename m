Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D90F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC1E10E29A;
	Mon, 16 Mar 2026 16:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g2svvA7c";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECA910E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E39901A2E70
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAC375FC4A;
 Mon, 16 Mar 2026 16:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6E08103721F9; Mon, 16 Mar 2026 17:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dNequfOAbzpPS1C9G94e5CCyJgic3nfPmyEbGIfVdQg=;
 b=g2svvA7c5AFqEOJzN6yjsDlT+mIjSFsAY5zI9fpy3KoWyoYZBoZYdeRp5uWr3v9aksTDsU
 Qjp7SPZHBHU10hc9/QYfCfl+H+wqWiauNM88+JC5GslJ9UPt4hYwQtBtNhrVyNTILzDJp3
 /IH8XYYd4OsRJrjPh005nZVuB84agUDmWbQHYo1bTBp86sjcuPgGHQy+Ai+gYKbx9T2c2X
 MQxBa1qRDtA90LnCu7pxW1QCJ7muxyvfvgSQrXgcfZDEyUSGNC8cPQRAEkWdxv/nMbRhJm
 V8pm7ZabfgkZ66pbYve1WZkdy/Pro0lSOvI/z7CnuOQrzcWH/lSr09pgdN/ZZA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:08 +0100
Subject: [PATCH i-g-t v9 47/49] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-47-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=L81vBf9VXnxP+LQ7qzxyDqZOyXAhbkM3GoS1Xh0Hitk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6PlBzsKk8+TXkehGiuw5c7f7CSHSk+JeAQZ
 7hteEst1hSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJu6Q//QAUIf7cGSX7dlrF1YRo6y5rwQKeZNCE
 5b41sL/SxKhigqXERktFLdxW9dPl+pcVc9QxfncuYzX01aDiko2hI7aD92fG4PFAXgKLo6bqeYx
 BlHSdQkK/IgJzyGMIpVa++4PjOv//Z3P1Bw3G+sMt6ICz57ZaXpnj+fn4Fhp2i54uXKMVTbWXkk
 93MKDFY6sqGyGwV7G3MnU8TA4PWQCsw7zooFyIEgtAdCbei4Z+8iy6vvHUMHXpUj5yChn+8JlPK
 GLp6xRjB/AH7NMGE8ly9jMS2OK8Tb96USbX7BfPCX59hqY+9JDkX63wOzqSEqpRpjDazKWIHjJN
 7/+1ZZEpe27SpC23dR/pje0P4w5vEjBmsrWVODWx1bKh5l1Du1DUokot4XCpVE+mojic6Vq6p+B
 14O5ymlpAh/pZsrYyLG8zAkoev73q25djJe7GfhomAGABWb8qPCkR9lBCNfYUHx08hpAp4S0bD0
 bbuax1aSeu8BmcTcPf2ZT16OPRc/3cgVroklSXUMLyJPNb+QWM1ZfaCErhbxV0g7XbomQ9vq3Ik
 aOPCAznkd9k2ecS7Qz6ofvkMyPdN7blba53Ii5LJXy0sZ/hBOTcITd3Rsz89MEiNevar/aQdjhV
 GdgrejY3g4Kwm5dVCMeYqeiMYKmM414OBHZkvlHUYwH4vJwSJ0K4=
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

