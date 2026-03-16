Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C58F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E9A10E29A;
	Mon, 16 Mar 2026 16:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P2nAnA1w";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6221310E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4CB184E42609
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9B9600E0;
 Mon, 16 Mar 2026 16:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E93331037220D; Mon, 16 Mar 2026 17:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6dXeSk1AjbF4Zw53d28QAdfu/fBqghan+P24PRJ+uB4=;
 b=P2nAnA1wpxMCuko7B51hSAPK5O/GIwf8b5DMYP3gsHo79ykfvDC9jluxQYx4Oam6qg6rzO
 cBAYou44EvuVFrz1hdhAvVkMTsv0TP+qKoeBLgKuMEOtoNRWYckoqbCJwkDNQHr5rV0H7n
 Nwj3kQ6GX3y1gjuJ9G+dVf1LZzQsVQAJImm6fkFL9knSkLjwk/sH3N7T+0PwtiJ0Eyc9MV
 3CDzBZrrpaMZi8CPFU/Ux46Nd6R/ztmais8MdtuG6R708fegGJEjhtcT+kmOJiSaNTqAnO
 6EjVQdW9L1466Oh3ZyO2+87d1RErkWm28tT8eh5rMSCFhbSIKccwJb8U0QAPEQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:47 +0100
Subject: [PATCH i-g-t v9 26/49] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-26-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=m+7Si+sviXc1V4jYcoVYXWZ6RCUb9Ou/WmPXGmz51nI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Mc3gBBWNrOfxzmgduxyr9Z08mVXYO1XiXk
 qSSSagjfwOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIyog/9Hf1J7a/2UCPnUa0SZ+wAaZ3Zcfnw8V2
 ghE3M4t5gQsyO6RSnUiuweJJrk/vlDoUfvg3AZ4ZtS9ZhL9pMWUap9+aNol7VBZoGkdzN1adVXK
 wllgkjjrOZq8/MBeAlOr/JNacmjSzeOLawehKXJkVR814o+zq++IhBWeEFcV7MgPn04ZbxjIaPq
 TWLwpC04henfPQAxzW8bLS7ZbsMwcMk8pSzXpPRThCgiD5wnnbNc/tWWFAtY25qsfyJ/Fv+vjAy
 KANIMd3jdT8m+0xsLgP3T1aBfxEv0OI5ees7WYyA9+4ixb3PoFcQ8W/5zYNEx9n3UgrLd5Qymer
 neuhXGMC1HIx7Q74L5sBCOMFfYkoM6EYwOKqhaGwDm94Cxrzv5vdpb3mBCzY88snuL6/p8emEwE
 HweeYoHU7uB6zCVixbm33q33D22JsYQAgRFCxvZzuq71c+B2jPLN/Ac7yHBvXz3FdkGEUx+VXs2
 IMdF1je5VzgiyToqseDxFw0uTWIg8hrKDnAXp3wGgKADLDONB7Jo9u3aLbd1nNWpiFxARH3tHFD
 unYVVn85FjtFjaTt8NxTCq6sHJZQgzQCYwI9ossmbZx4ONrnVqLlKnGTWIlGc7gVBRAeT7TEQyn
 MnBNpRegK7OHNdpxtVvPWurjXnxN2/z7oQI8Mx50GpDw3DVSzmY0=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  6 ++++++
 2 files changed, 59 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 9cfff8254009..34f3e83e4358 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -92,6 +92,22 @@ static void unigraf_init(void)
 	igt_install_exit_handler(unigraf_exit_handler);
 }
 
+/**
+ * unigraf_write_u32 - Write a 32-bit value to a TSI configuration item
+ * @config_id: The configuration item ID to write to
+ * @value: The 32-bit value to write
+ *
+ * This macro writes a 32-bit value to the specified TSI configuration item.
+ * This is a macro to have the proper line information when using unigraf_debug.
+ */
+#define unigraf_write_u32(config_id, value)									\
+	({													\
+		uint32_t v = (value);										\
+		igt_assert(unigraf_device);									\
+		unigraf_debug("Value write: " #config_id "=%d...\n", v);					\
+		unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config_id, &v, sizeof(value)));		\
+	})
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -289,3 +305,40 @@ void unigraf_require_device(int drm_fd)
  */
 void unigraf_reset(void)
 {}
+
+/**
+ * unigraf_hpd_assert() - Assert Hot Plug Detect signal
+ *
+ * This function asserts the HPD signal, simulating a device connection.
+ */
+void unigraf_hpd_assert(void)
+{
+	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 1);
+}
+
+/**
+ * unigraf_hpd_pulse() - Pulse the Hot Plug Detect signal
+ * @duration: The duration in milliseconds for which the HPD signal should be pulsed
+ *
+ * This function pulses the HPD signal for the specified duration.
+ */
+void unigraf_hpd_pulse(int duration)
+{
+	/* In theory this should work:
+	 * unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
+	 * But this seems to be broken and this works:
+	 */
+	unigraf_hpd_deassert();
+	usleep(duration);
+	unigraf_hpd_assert();
+}
+
+/**
+ * unigraf_hpd_deassert() - Deassert Hot Plug Detect signal
+ *
+ * This function deasserts the HPD signal, simulating a device disconnection.
+ */
+void unigraf_hpd_deassert(void)
+{
+	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 0);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 4c2cbd6b1aa5..77fba4e53912 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -42,4 +42,10 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+void unigraf_hpd_deassert(void);
+
+void unigraf_hpd_pulse(int duration);
+
+void unigraf_hpd_assert(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

