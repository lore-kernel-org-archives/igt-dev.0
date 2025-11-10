Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B1CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57E210E3BE;
	Mon, 10 Nov 2025 13:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oA6tO/G5";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D263B10E3BF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BC9B64E41608
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93A5F606F5;
 Mon, 10 Nov 2025 13:39:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BB1410371910; Mon, 10 Nov 2025 14:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wgLB5hgCjXArQFyYwHhzu/GVCyNAEQ1anYY1Rrl98xw=;
 b=oA6tO/G5zy8RyD0MdD3w3x/O301yuiehV04+qtRo1m1TcAqv8H8aOwkE/T7g++TgVBPROb
 xkJZK3l8YRE8HTCDSNtPaiY/LLkyDjKFx4CetBAHuZyh+Pycy8L9z9jg+K2E+qGlHf/D1R
 lPCgwXB7lirEZyIHhtowJfw1v0zK8RJDK3YoMhyzgj+4Ufo6TqmDTk7Zz9veRG0T+5fVJY
 Plb1CuQvTpWYLa/14dp73UeZo3MfDlLlOuJcJLJ8gAupUBHAF526UIg1tguBeM5ZScrtR6
 T4XAll5q+lYJGsK+rzPd09SiNKegYCYxrfLnhH95nKNLTY3W6Mk755z+73fjtw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:22 +0000
Subject: [PATCH i-g-t v4 20/46] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-20-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ogbZFiGeYBBup+zqVqbicXouyHa38Wd5FUBWM52prOc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesPOllm32/5ngE54netDuEzCOSk6JecCx0E+
 mchoMwmvMaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDwAKCRAgrS7GWxAs
 4lqIEACqpwYcRMPI8R8WntLrEOubjLflkWYB1z2qthx9lnJ+7cUC4mHGdcY5nFEZCK6dhzbfteS
 10Yqntwihps6vIcW+1ZJcSuUtO1BMeJ/hJSlJiAQiW6lLlc2qOW7XBjvAlBfZln+CPsY6QmjyaL
 0F/GG3PvaezK+NWxwT8yC/6CO8JhTr6sMTIyziD8wiuCxG0nA2ZXxeRiXese/psyE2+YuMOw0vO
 x+ND/NQ5FsjfFq1H9Cje11w/7F+yTn21w5PPvMtbid8K/8GZzJJvp6bM6z2vNuowCAU0J7j6zHj
 1B23KQKEik90XjdFapMrjZOHERRdseXmQGUO2kdFRpjCK7SMp59A3VJD/BcS445tlj3D9gdGyi8
 zFfHoGOjusL96DocFuVcVbMSghEmxwOEbZb7bgaKkIGRvE3TxQGeFnBGiOHgpk5+G/DLovJ0LDU
 g5Yaq2fTGml+xnVGGVXt1+R6B5ELuNpcT5aU/eE5C87Ls1jtASzNBTl5+9MNdBbKiX6KtWT6vPp
 ChXhKGODsgkvU0JHYbvMhGJ85qr/rUZIPA8ixjAD2vP2ZpV6OzY0gHCp76qXlMCNMLN0mTgT6uu
 v1Tu408iNutD3VXvG4IsEq80wCpKJM+doUWx+xw39Kvhfkk1eA5EtSwkhcpJCHixcTQ7+JW62fF
 bT3zuEHWuF06ZwQ==
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
---
 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3d73f338cc80..d429a1d5d605 100644
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
@@ -65,6 +66,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -2946,6 +2950,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		}
 	}
 #endif
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
 
 	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
 		     "count_crtcs exceeds IGT_MAX_PIPES, resources->count_crtcs=%d, IGT_MAX_PIPES=%d\n",

-- 
2.51.0

