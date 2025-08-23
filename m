Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06705CA0FEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EDE10E31E;
	Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kRxe6IYG";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD8110E2A5
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 167614E40C58
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E388A606A7;
 Sat, 23 Aug 2025 02:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 301E41C22D8D5; 
 Sat, 23 Aug 2025 04:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HEpYQT6kfwkkA1ng+5ifZre6EI+M1au7yuut/UNW+WQ=;
 b=kRxe6IYGoebKwMGWy/mGdJ2R2TiD+kAwYUmffxjvhoM9gi3DmqgQKrHgZ3lhnaN+juwcZ5
 Rg0nqHhYMnRSOYCoUhAnSkEM+NwiWsHhqCOYitglnUF+ObqtlRy90DRw6e4sYhvq/EuRts
 ofoyaJIZkffxT7vzTvzkEffu8CMss7T/yYXBnaXZ/Bj7LtqPce3iSRHSHjNsLFm150UD5P
 asXmc9PiR8dazSoH8qzOuJ9p6gK/lQuf7eYL5X3eVPnFUkuRS0IPRNzsm5UNk7iIF7t6fV
 nQeRRTJnfzQpCWFzIXr36H6U0blk5WZB9nFQOxPuq2xfangtCclA3eHbi/KbGQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:37 +0200
Subject: [PATCH i-g-t v3 17/29] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-17-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2876;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9suOCLHghdrpnE89p+6n+EXuGQtusw+QRhsGVhdSJ6Y=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNWWX8CuXRSDxztpVxW+7kHGVMgBKMQ0dNi+
 tsEwupr0ZeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVgAKCRAgrS7GWxAs
 4km9D/40glkgcLByYpvqxBmU97MWRpbJWIqo/0SPwYI2qD4dy24zy6IAjeT175UkYuyItEbQ7p2
 nBaVlXd/rd/hil+7M0vjfKJGF6cPuvaTsGzDihQSOufhhzhD8zS7ilID891nH60Xw88OZYZ6KQ9
 54yer2roq8S+wnXylryFknlE+V8AQ6FuEpjFEeP64Ato+9pdpO0O5js5sVIuHoIYDUPqp5L+4St
 rB6RS2CJCstIYWDjhKdfXw1qn0v663I+xNoOlDuf70YOBhp3s3q3gDgVDjWESQUE5CZZBw9ED0H
 xuqmPeQR6Txm37cseiXZMMflGFwrG3yP+RtGSCzO3HLBcY4L2gRr6FMzqZNXzo3/8NNd+RIZT5N
 Cdjx9KiESPQ3tKZn0nj0BNzB0LGTBlAdJ8edtTgpnZtR8XiQXUqXwYd6cSHeuYnMCJIxpY1ykvH
 La32YjtogOZqmK2//EViJeVuhzkct93IntJklEpLSiVJ++6iDAn9rZweSO9cZ1Maiym20ar+msD
 UxtYQoRtL3EL/7ydEbYhrV0wZtIQ1DxMUeG5aWP2J2pJCiGbvfdnRevCkZCvo4pDzn5+kNyCzjB
 laPCPitTbEFz3oT9jfqRRyvEMeEFTBu/8Nz6Esur5YN69VyLxTk0lgfO8NLq9IIYXUc/LbEP5nm
 UBQtV8r9kCL3Xwg==
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

Unigraf is able to manipulate the HPD line of the connector, add few
helpers to manipulate them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 22 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 59a85e1b84c9df47a56f0273dac37d2dcba175c3..0682f383aaa0f5eb8d4b40bb88c2ea88975f311f 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -88,6 +88,24 @@ static void unigraf_init(void)
 	igt_install_exit_handler(unigraf_exit_handler);
 }
 
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @dev: device handle, can be null for some config id
+ * @config: config id to write
+ * @data: data to write
+ * @data_len: length of the data
+ * Returns
+ */
+static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t data_len)
+{
+	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
+
+	if (data_len == 4)
+		unigraf_debug("Value = 0x%x\n", *(int *)data);
+
+	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data_len));
+}
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -285,3 +303,25 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+void unigraf_hpd_assert(void)
+{
+	int d = 1;
+
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_FORCE_HOT_PLUG_STATE_W, &d, sizeof(d));
+}
+
+void unigraf_hpd_pulse(int duration)
+{
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_DPRX_HPD_PULSE_W, &duration, sizeof(duration));
+}
+
+void unigraf_hpd_deassert(void)
+{
+	int d = 0;
+
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_FORCE_HOT_PLUG_STATE_W, &d, sizeof(d));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 8cdbf00201b2a0467ec15259cf4bc0a2d8f9b61e..c5ae949c54729bf293a4629ec3bf5d995de9fb6b 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -47,4 +47,26 @@ bool unigraf_open_device(int drm_fd);
  */
 void unigraf_require_device(int drm_fd);
 
+/**
+ * unigraf_hpd_deassert() - Deassert Hot Plug Detect signal
+ *
+ * This function deasserts the HPD signal, simulating a device disconnection.
+ */
+void unigraf_hpd_deassert(void);
+
+/**
+ * unigraf_hpd_pulse() - Pulse the Hot Plug Detect signal
+ * @duration: The duration in milliseconds for which the HPD signal should be pulsed
+ *
+ * This function pulses the HPD signal for the specified duration.
+ */
+void unigraf_hpd_pulse(int duration);
+
+/**
+ * unigraf_hpd_assert() - Assert Hot Plug Detect signal
+ *
+ * This function asserts the HPD signal, simulating a device connection.
+ */
+void unigraf_hpd_assert(void);
+
 #endif // UNIGRAF_H

-- 
2.50.1

