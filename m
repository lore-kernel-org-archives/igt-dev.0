Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB44610F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8630810ED32;
	Tue, 31 Mar 2026 17:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zur0Nsua";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACC710EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DFC5C1A30B3;
 Tue, 31 Mar 2026 17:11:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6CB16029D;
 Tue, 31 Mar 2026 17:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98D261045059C; 
 Tue, 31 Mar 2026 19:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0iwPz7E4yulT6MuvJFztj0O8cDEhSDUR7GyN9xQNb4M=;
 b=zur0NsuaIAm1xQQPlQFFpje44IEB38qhyds0hRavsYoLSSSP9lzWzKJYaoK9c9iELCf3l+
 t27CT8fe08yaEwMu6TslHGOA7DEzzgIBae0CAFZHoR6PX5D67CjKfwGk9Y9eqlPGjcK0Si
 iaZKB/LYJEsRg3g/LKHOI7zwVqlzHySXm1GjSRVGFJ1Ns7y23u3ZoSzrb4CQ/k0/9YdLbX
 Vj2X69Xiu1zsvN/e6WP35O3VYh1ahV1mAEjeLl8LZTWtSNHDi7nTmeJq90I/JCa7zbbFAm
 78MlxEw9Uxo8TEUCF2z34xdPCirxMYF1+yugHKTuBMtQreNJAx1u6LKmzta7Ig==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:04 +0200
Subject: [PATCH i-g-t v10 47/49] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-47-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+O19rNGRJmTxTt1pen53EqhZH4sdrAQ2/smJBZlAM64=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABCeM/mKSZA5jSKtLGvoqbBxZULd+6z9VjYb
 Z/hKe/w5T2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKVIBAAhcWWrCJ3w0s3QL3e+I/zpHUcl4DLYBI
 yQ1aQIHrvC7HJhYYSulr7JiSE+nJ974mb97eO3HInjUiUfxL/vrOJQ8ezhDCYqbxLJ5/kh5MW4J
 IQGKlg5qZK/dw/N/ULkPW/k4kj1r02qJHe1WUQRoqQbnEiGhErsvbCSEH1RWski58EeH42n50Si
 wxk2iPLhMP66ddF6555c43FiQxSAWhulRCeml/UM+KgqDuB92PCsoyvVFvL/+uGzcfi1OVirPbt
 IGLajrenRI3yKedPlC5ut0XlCpeJ/ENNh4QlJ7VYh8ZdUyfZiMm9dIovjnTmjz/GzbkkSsqfv8D
 VvKklO8gO5Yzzayqo2GswdCLZhHS6CA/HrGvKFaqdieQKGUOYI55tQHwWCLUPwWu/uMY2kiF1BS
 fbfXurVSklZs+amITUg2RHzMC5xjZavmnspMVHswKNpqQCdBOtcWaovE/R1Y/RJle4NC7IkfAvm
 NOo+RpCKmXTtX5blyNvTReP10lwJWAePGL5fcl0Fi+JUu+5mSNfDLpj9jfB9rymU791q1+TtSi8
 4WZf3K9pVQTlPPmEaWrsUrPrLNl4UaJ6vnEBesro/h0SHGYL9v1ZH2Tdnr9WYKUh7qriZaKrPmY
 PxWbbCbvt7cjc9Il3renKo5duC7tCHX8DYbP+6BTdaOGdECdYXno=
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
 lib/vendor/unigraf/unigraf.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h | 14 ++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 7dbde1279d31..ae293ef5a64c 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -552,6 +552,7 @@ void unigraf_reset(void)
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
 	unigraf_set_max_lane_count(4);
+	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
 }
 
 /**
@@ -839,3 +840,55 @@ int unigraf_get_max_lane_count(void)
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 56a9d910dcb1..cb49b5897b54 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -85,4 +85,18 @@ int unigraf_get_max_lane_count(void);
 
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

