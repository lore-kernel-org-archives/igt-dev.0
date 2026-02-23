Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20982EA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FBF10E384;
	Mon, 23 Feb 2026 12:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PaZGJ8gF";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496D10E374
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 70B934E41031
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4781A5FD43;
 Mon, 23 Feb 2026 12:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5378510368F8F; Mon, 23 Feb 2026 13:09:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848573; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3Qi1R/8JqgjFqx7JaC83oXlKOY9k15A7LKFe8bPmaCQ=;
 b=PaZGJ8gFQDK14Iq85f2yNUVZ6QMBwjm0RqSY81lbB2xnWpWztt3Tj1KJK9/Z6nc9MQkRgH
 lLhpzqNlxcAaWoBVztc9lY3yyHLdN7x4GYz92oTyqtRv5d9h0vZt8/ZmEqAoTD/mgc3LbM
 /K3v7JAW2JMCCFnCKRymz0yn9DmxjRvNzNHl4GHeu6BA9uLqnhCrKjKta6yC/daDOX14RX
 eKSPFE6xqMjq8uIpno6nmxG/vDXnUewlh+hwAGTjDiEWipU3ebEFP1p+oyhv4RfjvBmAJO
 +hEco1hMYswIA2Pt5z1RK4XjXjmVZy7sEOtvib7WC8eaDMT511/jG7BCZX8ifA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:53 +0100
Subject: [PATCH i-g-t v7 46/48] lib/unigraf: Add helpers to set maximum
 link rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-46-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3112;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Q4lYFFvDnWZnikOODYv8NTnyrTDiy1sHb1XDEZLZe6o=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENtVMTvqanmgsVzhBywiZ3vHioE7Pq4CrW2S
 h/kmBgmYMKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDbRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJlKQ//XutUXwl+SmSxeKZ7iXHKCNaV+0Ni6dA
 f471ZNubo+tvsJzJEoooeno47fMtFXL2JokmbRxFDOgDSdBhFgyZmYEUYHHoOf37e07RC7PI0iB
 DD9k6P377RAd37uJME5AnDWHlCP7tfiWW7PNRjx11eMX9J8X/8Z4qvNY4Nn3qJG7E+9wMDNc2te
 lkQVTVCvreol+Ovb8fpM7f7lZ+bBZQhqp/Kw9a7ZV/EjaJpRX2e5XDPq6diqGq7H2HmHuzlByhm
 vV21lfNdG0XMF5+rMspkGNKNloOFbtYJzoF+MZuSHzXUnSNS/LpYGnpvvgJpnwwnWIzndMH8b0B
 bZmJil2/oGjA1ZwXB1ng01mwDAuY0w5gmfeu+ITKXshNSTDez3a+n3hD+YWohmHOcoPjqm7yzuT
 c58yWrHSyVlVzdOoqKWly88sxgmIcynpifaaMd2Fmv5JbDp0wgsJUlgibgCBNRpncBE+NGOREba
 glxDdRts6IUeeDlEllqNxjB9+/YN8ob/jgO1xHJbV04+Uq4YeOAuk5fHbgS20SJa5m8XuJNGjnJ
 t8NmsfV/88jkqrlnjP/qIvO9yL56B9wgvkyZJS8E01v6OMHWUTg8QnIpRZ2cgq4rkM1W62/YTMu
 ijzmzNDWoapqTTeEindq3z/UpxHMFKGhTA++R3JVZoGaiToGmjo4=
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
index 038188182bc5..a18a90caad56 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -544,6 +544,7 @@ void unigraf_reset(void)
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
 	unigraf_set_max_lane_count(4);
+	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
 }
 
 /**
@@ -832,3 +833,55 @@ int unigraf_get_max_lane_count(void)
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

