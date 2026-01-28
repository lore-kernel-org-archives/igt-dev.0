Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F0D25B5C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3772710E6DE;
	Wed, 28 Jan 2026 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DXB9eBOb";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0670010E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E403C4E422FD;
 Wed, 28 Jan 2026 13:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAA186071F;
 Wed, 28 Jan 2026 13:14:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1FAA119A8820; Wed, 28 Jan 2026 14:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JRDaizWCYjq0l9s3d9glqWm+cZXKTz9DzAIBYonFqBY=;
 b=DXB9eBObH4JfKvSB9Rl6XpE7uvZD0v7qIjZUjvulzmAbxWushfMrShykSlxk3AsyB7Ilcn
 feFT+I1WXr8yvuopCkLZqpeDMsUuoVW0wx2XPcd+fl3E7B+D8emMilzDh9yjiJxZJxroR6
 qyqWJk9W1CuGyoFPg1skN0AGIchQr6qZ+5cBEE3JlRX5NYGIk+wP00SVBIlLT9eTFiRuq7
 y6ZbgHtIemXsA9rBQkNXPzVB39qSOdlcl6T/W6KUIyyiUeHysatsNuis/hn+5ByKVnlLpR
 h/Hk2tWVT+9jCZnRAt37uBvDSTrsXDyH596jBwfSb57rOvN6ygTpi7so57N0MA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:51 +0100
Subject: [PATCH i-g-t v5 20/48] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-20-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7HbDMo6GLAMvaAZ5CG9+Hs0J5S5LT2vrv4YT3UrhaVE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvKacO6X1hUXl2bx5w8LSpjlo4E9/hgsUSEP
 7/PQBUlFS6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKZsw/+O2TmIo7mZfY1q91Rz93mUj2wcugb5hf
 2RIHMs5LKL2HMazZZ51deCexTRbZs2nHnDcFi7Vc4V6jtRW6xmk4aLGsA/DgAysEV1CWnaxhKuT
 ytswRj5OHw2MtaDLSr6lvNrL2cR98bGkYe+CtGwsOJ/ffHNSepF/+NXK11cD2zg/sxzuOJ2w4cM
 k9aPHADnS9GsuU8UBI3aEgx8XT7nKCgkTJ14CWMYk2TZ9Vz35Ox+6Oz2w1VHfe6nCWjsywqMAVA
 iyG/6fReSWHmVETd2dlWXKDKKN6FIvIL5KYB+bfQH3X/AvomFeaW4A5ptlThOyyJFk3crJyE76l
 BwD3yzYbDUuVLS7OnGMrU5CyAz4fM/qCmjqbwG8KIXwBL70JLnYD9Tmv2qYgpU5p1cV78c/L3u4
 jrhgbmutyF8IG71DHWKIzPjorVwnIGt36dFcTh4lmmoj/VyEA92L3uidxN6wggEgU4a3GosV/oK
 jAqGgGTni8+oJXSAUl9s2y3UC50lREX0qK5uW3mhv8prqyh7Mm8LCFOHdjT5xSlwhgmT7FtWM28
 Mhslmk7U8sWem8hKw77T6MOfgGV6+JCA42+HQgOPUIpbaiLyjkGQkyCgg1yw9IUCrVSK7gaCmpT
 cDSwclfX+aMyAjk03ojTn8paJ6yf2D2zBiqzUTOzDI7DqzLg6FBs=
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

As Unigraf can emualte a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2cd21278a9bc..4d88515c13ab 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -37,6 +37,7 @@
 #include <sys/stat.h>
 #include <string.h>
 #include <stdlib.h>
+#include <xf86drmMode.h>
 #ifdef HAVE_LINUX_KD_H
 #include <linux/kd.h>
 #elif HAVE_SYS_KD_H
@@ -66,6 +67,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -3178,6 +3182,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.52.0

