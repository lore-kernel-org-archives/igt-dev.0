Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D77B10F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFB410ECEF;
	Tue, 31 Mar 2026 17:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i5eOErER";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358110EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6F1F84E4288B;
 Tue, 31 Mar 2026 17:11:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 468116029D;
 Tue, 31 Mar 2026 17:11:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A239310450627; 
 Tue, 31 Mar 2026 19:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oZ8ts7vCdQ73qWLzROxDjuLCNG/RPcf2xY0mRhDiKtk=;
 b=i5eOErERevCvOZ7U3hRYSA9Ta1K031438rzQ17pZLIG5lG0mxN8m5x3KDc2XgbpFusfaMb
 n5vsE4cfn1LbqG/nFdZoM36ABCj4IKGZHuqNwR14hO1C1oJ30TNxjpjEy7DCn1Cb+r0B0V
 +GQh+RhxbLDnrM5QpuTu4RfM5IBZFpU+ZtZYZTT8BuFyCoU8O2jkRtZHzYXXaOIACN7qnF
 eOjrBwj1Np0hV/DslqugEr/nY1Yp26Bnr2Fbqxo71Fp31cXAemK0MTODf5+vNCB+gxbFVW
 +TWcvlNg55tcAgccxBak2hVwZpuVV9Ar2wieqvoISRW5s7CPGwUCk4YbdQ/72w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:43 +0200
Subject: [PATCH i-g-t v10 26/49] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-26-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2968;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KDqm7CKmLOtaKjfg8U6FnHACnxlOStNMxw9iJfPUCRw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA/DpDc8SBoXjIpft7pSzMH/Ih/zr2ZTTStV
 mpoKDDzPIWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL0JxAAhjQtl/OZE9UNojGdqZGN0wBR9zwkjtf
 pLXoThvAzfrup3agMnYpkhXQAt3DikdCcAmmkoQHz6GsvTg8LLmGLXUsy/pi1FuaJ9afPdveU6Q
 tfq0MD0x+O2VcStysLq5VvBDO88eHu12ZlgNyHYSNHQa4d7woGFQpCCMIJMBO5k6NaVxCX8IEEv
 eBNsAV3PgD6sjXX+ww6+e5p6GugDMKAIePru+ZEdOEHnAp1ga/JZBlIS+TTEsyx2SiFsA0F4Cra
 VjhjAzxmyeF2GOH3ke9t3dmhzCbFcwjsSGmCdIynYraSP94XxvFfsD27K9yQlH2EkK9INniGK6F
 y2ziy9It6vyOu5IGw4hokDZgmmw3uAAm4TpdkvqdjEbV4oiqDUXzPYAmU9bBWsBQnMmEGnkJqc/
 8IOdyoDfKNkaUt8S3Kd5nJ1tU+n3ZFyWYqKFOzdPbndNiVPKmtkOj28W/zMqVXejUnnSbazszFi
 EFTnNhN4XSjFZkiJ6QnBqDIUUzez3KqhfTIL/ekggpHET9raGyydyB0ysSvbLXbnod+w5MO37Uq
 kmDZht8vLh1qoHJpEwruypFLqEe2G8pDadrBH0Rt0sj3KN2AsnDhaYB9bvfq3rOBTrLQrHCLDWv
 0ahdEYUCU34Fd4YzgzRbQuXYr4qH+5tjRKYX2l1i0rLEK7ulHmOU=
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
2.52.0

