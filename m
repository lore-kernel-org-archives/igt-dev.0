Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C32E7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11C510E4F1;
	Mon,  2 Feb 2026 14:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qtXb1hB6";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BEE10E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9428FC237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC51160767;
 Mon,  2 Feb 2026 14:32:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDC44119A8908; Mon,  2 Feb 2026 15:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wpwvhS/pEOkTfBErm5eMf5vkGf1V1QIi0qglvMKy6Qs=;
 b=qtXb1hB6F1+Ew8QFjmh9NaJXHOgQwy3TKsAUPy9b5njetl/LmQerDG4FJCqXmbajXcD9SX
 ktURR2yNYisRxIDTvZ6CP/hf1+pRLkDHtnrKR8TT8cARmZynmhvwOJ9CvA5Atp4EkKc76g
 Q6BYMMEQVqBlB1mKthLFoK1a69CxuAL7I1EAfFmKfGEOdyC8uk4ZxORHuct8muycOfb10F
 p+w3dnmxmAMyloGZS+deFKJH2pJKKD+XgHqr2rFu5myLlONHIXnbdAqWih9uuzrjxbe/DY
 SVRt128CybnfSWmK0dBxDhMvnpxE1p/JnZxfSYUyRpuv9IW5xXie/lXuATfA+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:04 +0100
Subject: [PATCH i-g-t v6 25/48] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-25-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2865;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MdHi6aQ5lVc57/hJ4wFSco7gaP1W6sJXiQ4lk/PkdS4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWR4ZPD4tXcaSuyFPBMA+nv39yfe+Mflmg/E
 4zdpSfgjXmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIInw/+J30hQzqmdNpe56xqMqod9Sji1a/cDtN
 ZORBy91ycLhSVlMNtv6lwFUSws9iqhBBX/j1H52XVjagSLklhEvZ1ZWHcnVLl9za+RpDYKonMZL
 awp6g2W04pAuqc0n0tvDbRMfWYxbehIM8EyJ4EEZj+T9DK94Un/wYTef+ofG5PQvmzoEJJ7SI9b
 ndPjCm1BCE3hrE/4+MAmaxkPnYhXxKoPkQWsE2HbWTJF7OygQ/SZk61Th84RBpCI060JxIw9uHJ
 3Svm2VqGZ05chG4KtbTHAHwzxdrznM+8h2VgeVndHnZYZ608WbCLWWaSTT+xun/dVHs8S4VBvFM
 Uq1mEj9da9LPWlJx7OPqRokPwEQ/mYUaIa3mx9P/tDHiCb4EvlOiagJJT3i3GrozrwgEYX0Xu8U
 p/Yu8e7icQHf7PQZRpkESC2/RKiz0MQSXWspdZLh8Bqex4+fsXsEvwY9ZdqcwCKHsYlUAw7vzB4
 JQ6xlbaGygafri6fTYe1fC7frtXzaK0dpoBXRGP9PyB4pKC/t5hchcaIl3obHdCefg7Nqmgy1jS
 7dm8S3Hnm4sRkFzZVjdsuBMXUwI34tIqRm4Nf19Lx/VnBeAPpjvF09t4q6eVIuK545wTszLuZlX
 n8ZZCfcN19pXadohWDzfPUiixaHJEVA4LLRN7D6EMNgEJNTMmKz0=
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
 lib/unigraf/unigraf.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  6 ++++++
 2 files changed, 62 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 02ade26f7bdd..b7e31a887a88 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -85,6 +85,26 @@ static void unigraf_init(void)
 	igt_install_exit_handler(unigraf_exit_handler);
 }
 
+/**
+ * _unigraf_write_u32 - Write a 32-bit value to a TSI configuration item
+ * @config_id: The configuration item ID to write to
+ * @value: The 32-bit value to write
+ *
+ * This function writes a 32-bit value to the specified TSI configuration item.
+ */
+static void _unigraf_write_u32(TSI_CONFIG_ID config_id, uint32_t value)
+{
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config_id, &value, sizeof(value)));
+}
+
+#define unigraf_write_u32(config_id, value)					\
+	({									\
+		uint32_t v = (value);						\
+		unigraf_debug("Value write: " #config_id "=%d...\n", v);	\
+		_unigraf_write_u32(config_id, v);				\
+	})
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -308,3 +328,39 @@ void unigraf_require_device(int drm_fd)
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
+	// In theory this should work:
+	// unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
+	// But this seems to be broken and this works:
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
index 9395815dee00..f91b903cd80f 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -36,4 +36,10 @@ void unigraf_require_device(int drm_fd);
 
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

