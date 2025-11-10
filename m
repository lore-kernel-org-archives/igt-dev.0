Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B8ACCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875EF10E3BE;
	Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TiySGR6K";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C6810E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6B498C108F0;
 Mon, 10 Nov 2025 13:39:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D9025606F5;
 Mon, 10 Nov 2025 13:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C3B610371916; Mon, 10 Nov 2025 14:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9rB9IU1tvt1IZt4zrTNeSQ5QdIzr8JuNQLpV3dIJW28=;
 b=TiySGR6KyNRn3V356rAa6UhD0YlGQ+Bm7t9mNoJoLhfYK3UWkBxY4DoVXQ6zYf8Qu06g4R
 KuKFsUUDk1K2VOC93fJLq6KJm4KQ2jn8knYHXk0OSWAAk0Le8mJEKNKoJe7ZT/NbHu8xwW
 X8h2Gj/M3yh+QgcyU6wnyy+TsSp8YU5PIApew0K3PsnFGLYFCwYRvQc3sQqEAMcgj7auKW
 KzsFPbkKGPLXMUlGABd+fnlAGXd7b0QDMSp3k5RUh6A8rif3qjF5rZtFWHeahGVCZZ68uk
 sS4eoyJbMs3sONkRhKrL9WSiZzvP1kx0xzMKddEm7IyphHFhOB1vSxEE6B0HKA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:28 +0000
Subject: [PATCH i-g-t v4 26/46] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-26-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=m0Jkv3FXdnMAKmZ+rDbEFIrX8LpG8F1l4hNNucWW+XQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesQDH5/3Ew1gdSOZ5oL5itaMfgJ8zqUNlUPb
 7dg6MRDYwSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEAAKCRAgrS7GWxAs
 4hxOD/4oP06ZuHfJZr1iqlHI4Pr1Tpe9WupklRhL8FI/ZnPZOHCiZmWffM1CJxnHD+R92vN3d5F
 kqOixlsh07OZr8U+bqvIo+tBw6UOo1WcTJx3AI4+BIpGq6o0vpNdCbwL59FNqp/OPFM2wjStVIP
 ztUwcT0aFa42SNN0VZaVYRUhHZuIWzA82iixdtV1dy5Ijf8gZ0OB/tqg/4FnV8dFhELYBUdoSAq
 bTAKxzh5KDJHPRmCDSrKhkNe6b/Cjh0b4YijtvK2YisoiYGqWb1KTjcfQEc1NWRMGbeQT00XFjl
 poiY4G+J0TRYj6cruoSpy9/l63v4vDPE0uLYZVMxNj3PxxBP76WN2/MiB4hPsXvvSbsIDJfAY+W
 bt1aCJ64425318QVOOukYjiGCzfkXWvEyxT+O/pG0cX+ZEy17t0RCXWSh3uONvzzGyUR/sC6mYs
 KBWY3r2SIJxrHjdczjGzFAC/58bC8uF8bseBtRkPGFmdofqa7+kzqrW5EG/V/e91YSgvj6b94x7
 hjhlEtEATTO0NspA5YvD/14FM12bIfNJOseyutu5etbwvlsKMhtDCcdnGbnPWcAgRQU5bA+rWkt
 F+0gc8qTOqzAPZGVcHeHkpcWY9X+HXhy+LreNZE/2bsHwLQvxAW3BkTtopA9pyBI9eOMr9v3ZDF
 F3F/DHus1VrVI4w==
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

The unigraf can emulate a full cable plug/unplug, so add helper to emulate
this.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 18 +++++++++++++++++-
 lib/unigraf/unigraf.h | 14 ++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 40daa42ef7e9..5ce1bd7d757b 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -309,7 +309,9 @@ void unigraf_require_device(int drm_fd)
 }
 
 void unigraf_reset(void)
-{}
+{
+	unigraf_plug();
+}
 
 void unigraf_hpd_assert(void)
 {
@@ -330,3 +332,17 @@ void unigraf_hpd_deassert(void)
 {
 	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 0);
 }
+
+void unigraf_unplug(void)
+{
+	int d = 2 << 2;
+
+	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
+}
+
+void unigraf_plug(void)
+{
+	int d = 3 << 2;
+
+	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 17a3dacc768a..14e5fd984159 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -79,4 +79,18 @@ void unigraf_hpd_pulse(int duration);
  */
 void unigraf_hpd_assert(void);
 
+/**
+ * unigraf_plug() - Emulate a cable plug
+ *
+ * This function will emulate a full cable plug (not a simple HPD line change)
+ */
+void unigraf_plug(void);
+
+/**
+ * unigraf_plug() - Emulate a cable unplug
+ *
+ * This function will emulate a full cable unplug (not a simple HPD line change)
+ */
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.51.0

