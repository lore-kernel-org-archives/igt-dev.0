Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90739EA4FB8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4611E10E382;
	Mon, 23 Feb 2026 12:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qBFX37Lc";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8902910E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 83653C143C5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AAFF5FD43;
 Mon, 23 Feb 2026 12:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 462E510368F9C; Mon, 23 Feb 2026 13:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=O7NnTutq/GrP6y3YGoX/8Pldnh2RnRIlIne426cWXJo=;
 b=qBFX37LcwxSXI3zq5hGTXFPIVhsuMEu4nyNyrmPNkmvkyGYDTIwchH4K2EhRlT6LS6V+aQ
 JzSW7kBG6HfFtVdt0dFng4ABQZxAcbHDvqyxT94A1BaG76dKeiOYuP/mAwhm99BaTJ1g58
 Q9rF4aBOglXuyZi7/i/77fcLP8161yXR8E1AL4rQf6DMfGNo+tFGpZDbVYe/AImFD8xFBH
 cpHDo/feXHjYoQmvL8sQxpY/B0eCN4FvrFk5rfZlug17j5i/IWjmLdEiqG4F/ycCW9JzBO
 ckj1F0njq8/I7Sq19Mt85orhQeYIh4SnUH0hIJ4HD4yWqkrrEjy0C0jfAb0X5Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:32 +0100
Subject: [PATCH i-g-t v7 25/48] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-25-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wzgSZ6wG3Aez2PPrzMOTD7S+SYXQ9cLE5vIqASA86vY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENpl0V62lbkBsirurHa+HTNWMhiop16F/fOT
 rDIHneKkQ2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJKWw//StS/qZyK34YVYuj0ARd1ByoLVOfPH4y
 KNc97IL05TbZQ2I3Pfm++oFFi8sprSK3+ZmclRVeLBjdnaI399BltQvE124Hak007+5Bp4tm1Kc
 jvX1MM/LGopHYHbunLEmaNp9BjJYs03BnWGJ2B8puIXA6V2Jzpm33tHxZvfvzvq/toEFa2qkAKx
 JGv9nYY+ZHGlsF1Ioa/VbdU3VmLLLKizrFHbKWMvM8pjE1RGg2W04EY6HL4ADUfCPsi5TlnSl/S
 nGQeDuDgVVNxEaFAnzsUZJJSBSwHCeW2Z7PESuHCbfJgnEyv9/Jr/Poo7n+BfAIWx4CLE2VLBgm
 zB1GcrAxFQsKUKXuGEQh3cbd7IVkBTF9d82m9zE3rM21g0yaRV+mPEaS9FUnCFPXPGtwT3/4T0X
 FtPGbS8FGR07n0nKUJcjdgT5+yK1f06GmJCcZBTcMGo+H245UwdPA/9XMg+ksCLVIDX3yEcNMLg
 tw2xHvgI/NjXgRC+wuWiCDE5PNpwCtjS9y5JGhPG9kn6lph+V2BqIBr5huRgI0aZvCxoJqO2JFj
 42ihc7Hd7EHfDqFPgF2YzstbHwUQq9J7QlpLPrmmyTqDWg27PCaIp0zDF+mswZq8vNhqD+ipERS
 IDRotc20pdOkmBwef73hitHuBSWlykubea9ZUXc/Ku49kYuMtob4=
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
 lib/unigraf/unigraf.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  6 ++++++
 2 files changed, 59 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index bd47cebb8480..5812f46fe6ae 100644
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
@@ -292,3 +308,40 @@ void unigraf_require_device(int drm_fd)
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

