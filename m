Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD1BF4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC910E262;
	Mon, 16 Mar 2026 10:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HhTygKb3";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0110E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CA0931A2E6F;
 Mon, 16 Mar 2026 10:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A25285FC4A;
 Mon, 16 Mar 2026 10:24:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6A2C10369F5B; Mon, 16 Mar 2026 11:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6dXeSk1AjbF4Zw53d28QAdfu/fBqghan+P24PRJ+uB4=;
 b=HhTygKb3CqUrcEPXoZLIMJkCnucInEFrvnMXcqa+vmvHZCOFCRUvI+5dNQGofFnfIdYt2V
 dA23CblXy6n+57p2jPv/gQFr3f9EyATLfzh6hq1Fk52GM2wNxtMn1UWAOgZ0sxNtWzEGKY
 1kyPqG0v6Oi0JfCwfnKgyz3cKtvZIWg++xSjRHdiMJafr6jYHw/r7aP5hPGYIENwuP185h
 ENL55X/u+dKYsmQ8/IEHHBPTTOJPv14eoTth6kgwJ0LvNAcB9Y3sj8/nGmAlHLrE6Ru1NB
 V+drVTaRXnuk5HbaGrdgE5t59d1k8Y1N0mUa5hHZrhuMFHKIyK1YEL9xRfOjBw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:34 +0100
Subject: [PATCH i-g-t v8 26/49] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-26-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=m+7Si+sviXc1V4jYcoVYXWZ6RCUb9Ou/WmPXGmz51nI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pR+gkR8WYCwyNPV6gXitLwV+/OxqvYl1a0H
 Qd4dJ0YQeWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKivA/6A9djNlu2aiF1pbwN3oeB74drFVtnCVs
 iFhlZkAHQzvIVNe7MivcGKmj4WyxrX2QYQd+MinrSuabxLknvW2lyiaTwa4UBIgM4rgvF2NyyXh
 tMQaGO5GEOZP1GEJh0NBx+3N81z/pDKYaa1i1ZVFQIL4xxAmpqivSuw61OfHV3lXq2EZYsOeI9G
 F3hkVNfSdaJ37FUOTx9F05E1UY6lMC792ssWmWJYSL2PF70NbDI/7QhrQXG8Ad1o7lH5Wf3Kk5V
 6knldPVM0jHmWcEPo5ICWYe4b1Bkiv0lG3n1U0AspvYOXUAZhGlZP9cOUWJHpqCnbCUEJT/laaf
 uPkaCscTm6fVAgh0gGNe89QlWFSpL2UF4QX/OQEqA0ITJabM1H+u3UL81rxnCUcQpDp0VhRUF7m
 kaZHcEVa8I4uhWmaFiwNfSxrCWsAy3D8n63HtAwjpOTZw0IFOUq2RduTnfVnqcxYmOZKZbCCIS3
 xax6oXhhNZPTvCt7I6rmT1fHbDQQ44i/LtF5hYVK5jiBHrPWlU4tPYUsumQAmyPlYtZYP7pWzf/
 CGo+LwiN++0j8thadJcSl4BoQ7uQzuC9uOlqynb7iesPT/MIGm6f3PO/xatUTxprY0cWJkBuBrM
 BRyT35OwiK7k7XtL5tdl+sdQsUzv+C13rReLhRuGBqgujguU9eUg=
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

