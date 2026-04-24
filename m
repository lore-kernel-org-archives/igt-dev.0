Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E667FED3F2
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BF810F645;
	Fri, 24 Apr 2026 17:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mmkJ1NwU";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F067210E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A9CE9C5EF2B;
 Fri, 24 Apr 2026 16:55:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D5F3C604EB;
 Fri, 24 Apr 2026 16:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E080210720A1A; 
 Fri, 24 Apr 2026 18:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wjmCkZGmnPNxZULlSLSZcTaJPSlJN+tMM7ImXQlx1S4=;
 b=mmkJ1NwUeqc7QLXs/SzGdRts5/v1JXXGDUiqDc+ugbPZU2WTcg73JMNU02pEK5rJSRs6xf
 c+WC0o2+Pib0yzLarvQaTOx+cIxdPGG2PQJNsfWKEH04AUN0O/09+AeYkcFdvJ+OD1r04k
 MnqoqRRtbi9OZIRJEX1t/8/pvAyaKLScU/xtzZ9bRKwX6WN85lh6LbezBIHkNkr/EO4O6F
 S5hvk+bPswGnxz9tHDRSvaXwU3sLZmpdSiGdAeZQjhyjGLrQsgU/uWXqjPk93MLzW5/zoO
 PjHshl9RHY4oWfJW5CkVC3JBKlEzVf0mXRmpq0fJWhXrx3XYR6Jeay5osG6c2g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:01 +0200
Subject: [PATCH i-g-t v11 26/49] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-26-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
 lib/vendor/unigraf/unigraf.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  6 +++++
 2 files changed, 59 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index e6760ba84386..aca26fe06cc5 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -93,6 +93,22 @@ static void unigraf_init(void)
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
@@ -293,3 +309,40 @@ void unigraf_require_device(int drm_fd)
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 4c2cbd6b1aa5..77fba4e53912 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
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
2.54.0

