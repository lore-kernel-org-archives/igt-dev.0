Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F4DD25B5F
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDBF10E6E4;
	Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bfkOQrs5";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5E610E6DD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 971084E422FC;
 Wed, 28 Jan 2026 13:14:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F9296071F;
 Wed, 28 Jan 2026 13:14:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 759D3119A8827; Wed, 28 Jan 2026 14:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wpwvhS/pEOkTfBErm5eMf5vkGf1V1QIi0qglvMKy6Qs=;
 b=bfkOQrs5xpJFZfFEYXMPH/ytFePr/KYdWDra9cJbAHCBSmz2KYz5dh9xqkP+H1xMRq32pG
 dVCRIh2HL/LRAh42bK3aHCpBuZ4ZPWMbrRjZ7Bi5VCs3QUkI2DJBa2AOnNuagFR/7y4nT7
 qSmWGFEauFOvlpwEtmHofgES/+YSz1KN2dGNwcVs8NT6eCN1fYe1E8pa7NlBgnU62m2dhk
 GbDLRwp1eVVJioKdfr1MKhu9N/2SQI0K0oNQ7bcjFVibUc9yeBFFgHof5rPXKjpwXuITQZ
 /wRVNdvWsPYUkup9qA/0mhctZ6ymhGtGuLin+MFCh4V4APpTZQa/bCf8Um9swA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:56 +0100
Subject: [PATCH i-g-t v5 25/48] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-25-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2865;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MdHi6aQ5lVc57/hJ4wFSco7gaP1W6sJXiQ4lk/PkdS4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvKuLUXSCVQ+qAxpgZtZVAOK/ZYobv5aST3h
 BAmrp6emumJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJROA/+P7BjbrOK4BpJ4aJ4zhABO28OyLd7Nhb
 bCNjjIfb5eOPSSlzh8YBiF3COaueF9zuAXoniDcx8l71mOJsAstuoS7SjLpLGeXI7uBYQm8Mv5w
 jrXrXBA15RD1Cui0Ki/gZHHAbnedENsTKaUIU6Yad8Axj55Jw62dA0v3gsT0ETKaIWtee0skhMU
 vpjdxwpcAG1CuxVsmo+VnVnxc7dJk1GYWkvvb8U/LJ+MOIdH6TtYSNU7iBmTsKKhoQpHvmk/lAS
 wjTCG9/Wiingd55qj8E7S2Dt4yrUOkvUkqMKBYkvpBT8PeylCKpayTZts+KqKFwWtS/3ab54COl
 YncW9krYhcuzaUW/fzuB1WwUhK621SGYJp1of79pVRNkIw3xqMYdyzAtiNXqFO6zbDZRilMUjuK
 GZYkc/9hiGgeCZ49E5K1n2en1Wi+1mQtkKsYc4g2aanskXpTBkuiwj+r6IGWBgaXWc/vsnUQOGq
 mkmKfzPP6EfyvFLcl34bpoICcxtvdtRrW/yupOyqFgyz45fDtANarmwm4V9012hNVXQqfPaUtX7
 uEjxqMZJrhHpEnrnWhv6/07iZzngDsFI4jK8Svkl/Hy6gSK4ZKm2273+pKWfS3Jn/oEmMhLiP7k
 2v3iSkEwWSmDjka/D+8mZ1zUxQ7DX0Wb4u47wB51Lvpmp+F1DTKA=
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

