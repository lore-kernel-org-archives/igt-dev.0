Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D4F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2BA10E25A;
	Mon, 16 Mar 2026 10:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="atsLrmal";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8810E25E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E40AE1A2E28;
 Mon, 16 Mar 2026 10:24:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BABD85FC4A;
 Mon, 16 Mar 2026 10:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A82B610369F4E; Mon, 16 Mar 2026 11:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gC7Ct5bcfWwlrSsJ3BzzV/f4N2HWOvoGFMCLwNsxg6I=;
 b=atsLrmalIediYKglJH9WX4oOEtu/R7RpcjGZMLn55GGg+8PkYzvDLbD2Q/6eZYwUax66uT
 EOQ2geSVFPlzJclSD3rkmkIY5v1elsGPmocVfXHb+0PyhedLiceBsmdMNFbU7KulQKmq/N
 3/yBpDcmjDx8Dv7A9xlAPNpAjjf/cCU3c7UJM3vqYyEkuwcQMtxQeLqvJE+k8ZFZF15utd
 GiIGhQNWCwxIqGuk0BiKXeGsQV2+BZBqdKzDDm6uGjdsC2ZOtfVm1UMowVq4REiXqr1ZHB
 iBvPtUh4gj3PRGif5v8E7AtbmyWLFdzmx6wnVN2DnWTTy0Xw+J13YgMXnM7sAQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:29 +0100
Subject: [PATCH i-g-t v8 21/49] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-21-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=atV3PcTy6xfgdz1tBASBPWt8P5blMx5lNvKPiMZM8FE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pRgnGV4oDdYpn1CBEUUM3JD0zHDwy7zPSqk
 oAJXoUasgSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIALhAAml0YBqKvIIHlM2jyC26YJorxWjE9CGj
 WGyONqd+iYwnoSwCzvEOmFksnI56vCPpKUgEzksx7uiH2h67wrstieTAqSG16JEW1ygxU8cDD/6
 JhM3YPygOh5ouJZ80VS1t715AIi8sPeVsnDgQnVhBlj1PsTBC0O/M8H1gg6ITJOvBKnbNPJwcXR
 PDathprFIHsjSy1nDvt7K0t/Ew0wM6BUHoXSgZsXHEvqIbvIubIDkdLLTpiJHYFUpBE9Nx15GT0
 sO+wjux1MYtrjhENGhczmauvh20wG54BYcm0otitJ9epy7FgpJ/kxsrPuGLJXB50BZmZsgNa1pJ
 Dj/lZ8VZEdvwauRI4kIDkqrQ7nLzvmE/4tncYrwJAYT3/5ZIgJSH9Po/0UBfUmai26qbLN/6WrU
 JC5GXKsmync1lpSLqyuweTgOMQ0vqZrXAxyCrEDtqIknCTGvLOK6klrB5lLTFy8QYmsJ3+Ewwu9
 fCI2DCEQygm5gvScAEacsTI0HumvhcmhFGWNH7Hmu5st21BdhsRIIwXu6poZDfJWyPFKW7Q2Uhq
 c82jRoVVK7iOREr3mnknyJrN/qrDjUtzh90Q0HgLTucns06ZfiTSYoFER7CKq8z6TWTeqmSmGWG
 uiG/WpXiq7XXEqEJXLavMvv8gMCtzwX+0hln9y/X6EkzdUoIZRW8=
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

As Unigraf can emulate a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f6ddf25756f1..064d5b35aa54 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -66,6 +66,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -3123,6 +3126,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i, crtc_index;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.52.0

