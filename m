Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28423D25B62
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9285310E6E3;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Kor6WK2J";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6310A10E6E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4D9324E422FD;
 Wed, 28 Jan 2026 13:14:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 243DE6071F;
 Wed, 28 Jan 2026 13:14:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37C67119A8828; Wed, 28 Jan 2026 14:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=l6vAhc94ARDCU/wgXmMPnvTjcgIUuTtcYHmpKqHqoKs=;
 b=Kor6WK2JDgSQP/LPhQRqdSl3Eukpbf7dDTKpptUyN/RG+2DqlK8UOJnYmeCt2WUuwK+7ms
 Owp92Q7ztu6q293kcAC0KfoL0m1GqnbTYpjIFa7BHBzvsWCQ50Ll9giGac1oPX29P3qh2D
 cA8BgUkbrJyNBHmFvxM3Rxb/oDpZPi6Jl1CgmPpKuUOJX+UiKGIIMYDvVcUeqXzdx5s5Yn
 KUzWKIGudWvrvKqHJlMrTFNpn54fTK8cMcahbqvB03EG3qhahoPClHiH3ID7uUvruc0xd5
 lvNaqK1RLl56k+Yn0xzDcngLiICnqbwKkIkvLFBO9yh0ZNnTTHASja1+c4gA9A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:57 +0100
Subject: [PATCH i-g-t v5 26/48] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-26-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Yendymglfi1ntYaZnxiGgIc5BrBNgX0YlgGxs0PBgeA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvLXTvQZPoFXux7s1gmKMw6ba0jyhijzFXyK
 476kKWU7V2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIdqw//fdrVu4MUX0l0gZohOzZr0gvpeJ+NsHi
 4Vsc84OQTB88pvubPvSxp8Prf0z6OuCUbHCy/dVLPs9oUKzcg0a46mUKk++RIygwMCGv3I1nIGy
 l3hL6veAnwmRQTmGKyCXw3webfSd5F5kxDRlgTDvbvsxTGMGLIyXH0JMY1PtAZZz9QuxrzgU44U
 dhIGXXLscojJ/erARfWSP7tNpIlosVDb4MYP5CPBo3thI2X12jtHLapB9YOpX1pTUhyrErW+P6h
 tAx+5h9GJTU5ya2M+ja+3XukBGXT2CHpcs92Xohsq2iZfBLmYQVOJXMe7JeNwW+O4ssXDLFkbjh
 zV87VqB7dcML7P0Vlz0tmwKRlfSrf5SIsXUfLqeOUdnLPgbG19Lyqx2lITThHY9+N/iG1r/R/LJ
 D7nCy4YSld/3+Uw0jJZWeunAayjDkxa5Wo0u6M29Ly/XlULRDg7cIgUyf2FksgFsmI7ZHcHSmsZ
 B6QrghW6J9FlrF6MnkwRpUQMcX2Rn60ras/nvPPQCnwy6k+XcdXS0tNZH4Ej9WZd1o7bEKSYp7e
 /pL9i4gKslMK6V8nV8YiQJYeV1+yt+z0bugZYuhcvgpYextIjXed5kRtfpRdGfT0nKsePzvCWv2
 i4IeuVEAVX/96n1LU17kQdbSVhPmreCGArn+nwHRWMJpRRfxTVS4=
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
 lib/unigraf/unigraf.c | 28 +++++++++++++++++++++++++++-
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b7e31a887a88..966e7d2a5077 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -327,7 +327,9 @@ void unigraf_require_device(int drm_fd)
  * and link parameters to default values.
  */
 void unigraf_reset(void)
-{}
+{
+	unigraf_plug();
+}
 
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
@@ -364,3 +366,27 @@ void unigraf_hpd_deassert(void)
 {
 	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 0);
 }
+
+/**
+ * unigraf_plug() - Emulate a cable unplug
+ *
+ * This function will emulate a full cable unplug (not a simple HPD line change)
+ */
+void unigraf_unplug(void)
+{
+	int d = 2 << 2;
+
+	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
+}
+
+/**
+ * unigraf_plug() - Emulate a cable plug
+ *
+ * This function will emulate a full cable plug (not a simple HPD line change)
+ */
+void unigraf_plug(void)
+{
+	int d = 3 << 2;
+
+	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index f91b903cd80f..97b8c3661f1f 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -42,4 +42,8 @@ void unigraf_hpd_pulse(int duration);
 
 void unigraf_hpd_assert(void);
 
+void unigraf_plug(void);
+
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

