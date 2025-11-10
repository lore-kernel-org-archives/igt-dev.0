Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB9FCD13D8
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C5610E3C4;
	Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dK5HBcDB";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9304210E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 61AD64E4160A;
 Mon, 10 Nov 2025 13:39:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38D92606F5;
 Mon, 10 Nov 2025 13:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46F1210371915; Mon, 10 Nov 2025 14:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5S0COx+33Eq/wDO4KxBR1weopMW0VhdU5dijCk2VGK0=;
 b=dK5HBcDBLIwSSICE7xI/7oXQAjY5hbMbpumGSz2D1xCV+AEYDeNj0kZpxJgcFarysVqlld
 cjBiBYt0o8+Qi75jHdBqlxamQLVYF5iq8P58tywwX4ijKKiKLXPpC4GNcWaECSebwUdAwd
 HJTzfZv9PAx+4paH/ZMxhHB7pdXW+doVwS8hrNkraOIDJLswOrkTc9PuOC4POh9nXUg+me
 Al+xBsU/JqIfLRxWUhbA+8JlBZwkChnJXdIMUz4ScQNCb0eL0911SElKwFIuzdRK9w7biG
 4ePF1m6jxqhIwotic6ZozCqbzpUj4CtNS54tWnnM3ac+XVtHoE/UbRdcC9YiBQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:27 +0000
Subject: [PATCH i-g-t v4 25/46] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-25-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1diusEDZDVzxK/7UeCC29q7cUEi0FOnYy4RxQhnfzo8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesQNPhEEG7WKDs43zYQK6HOZKc3ay2XPcOg8
 zntfgFZwJaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEAAKCRAgrS7GWxAs
 4sE9D/9+fLI/qcSOh/JnfsmpYRwH6phqku2LNp8BLJ3l1+/i81pF/9nqVR1dkTakBczPPxJ4EI8
 PbZSu2CRSpwHCimDvPhNlYfDihf4ADod5FPpMvr2MevvqROMXS+DY+wUDMzk41GqCmi5m6/4rfO
 Jj6hpZ7x2KScKKijvJM1IBoHAN8JXNSs83Sm2+p5N2/76HrpsrQLFLbAuEvcqva2J+CBztVksam
 gG9NypfsF+y93T7CAgj2sF0OG2D+QVvPijomHrMa5NDd5G03PcT3QKiTtOvXhnH7/ln8vM6LKua
 JzlnwT0y1ZQoqfMaSv4VvcUiCR2Io20v9jnSxx6c4kURStm5cBSveWqiLKAccHeJt0tBETeGehJ
 X+KPe7SW/P0eRk4hz3PDHzmbWMwKsemY5khD5ymhajIYfm0vRE5lSVQi2swQMZTYVBAsQVPsIoI
 7zMLApz6u1qGt13iEvEVq5CsbNQZ1QE239BkpnYadEdkvPXWj8yMX+R8rOo4Q7EjKdGWi/Cb+bB
 lu0HzWs3YfVq90WNbgQ4Xj4kcGrGVkD0g8dmc8gdNEkAIVdxpXOp2CeDZDswL0n+RnvBhx0qUet
 NdxqMA8q43Pm8Tlthz7eSFBAdQpoC9Oy+PnasCePsdUAhClIewH/k5xVs7eH5Op5zOtphEr50h/
 o2DubC9Git08K/g==
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
index e96c7fc3a91e..40daa42ef7e9 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -88,6 +88,26 @@ static void unigraf_init(void)
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
@@ -290,3 +310,23 @@ void unigraf_require_device(int drm_fd)
 
 void unigraf_reset(void)
 {}
+
+void unigraf_hpd_assert(void)
+{
+	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 1);
+}
+
+void unigraf_hpd_pulse(int duration)
+{
+	// In theory this should work:
+	// unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
+	// But this seems to be broken and this work:
+	unigraf_hpd_deassert();
+	usleep(duration);
+	unigraf_hpd_assert();
+}
+
+void unigraf_hpd_deassert(void)
+{
+	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 0);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 76f4f8878c2c..17a3dacc768a 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -57,4 +57,26 @@ void unigraf_require_device(int drm_fd);
  */
 void unigraf_reset(void);
 
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
2.51.0

