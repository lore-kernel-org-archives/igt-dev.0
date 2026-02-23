Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E2EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFD310E35F;
	Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pGJZCeBp";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248310E37D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 980084E41030;
 Mon, 23 Feb 2026 12:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E8DB5FD43;
 Mon, 23 Feb 2026 12:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 42BBE10368F70; Mon, 23 Feb 2026 13:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JCwF2UPGXL/7p6Tqw14fe4yFUFOMt8Ty6a58yiELx4k=;
 b=pGJZCeBpSlvtja7WZ9stXjfvd8vJ1XQG5vugtnsUCWOT+5RRZoVT+taNuTx+YT3woiaw0s
 sJ1tJo0MDnfePfA7FSF9p56Zzkq7WlECrivYtWwoPr/ZLCi5NKHENE3SL+yJtvZBBvmCo8
 xL1fwrvMl3PKSilutaW+lty7jqktvPpO2G4mWtnNQgo/JHvJgC2KFnBVbCv3uC3imZdIqH
 kFk6h8MpYXTHzNh+FuhuPqEzRlz8bVl/TGddxILh4SuTnk7eRuTaL8kqWx/SlF4eogXj6C
 au3iZnYEQUN5dYrlryz8jKrFdSzQ5Syg1CaS1R47ONSposmM1K+bjGssKodFbw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:33 +0100
Subject: [PATCH i-g-t v7 26/48] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-26-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=56JY1vehLopnp7c96OhzETHeuutlbsO09SjmatkMoBo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENqEaqj+gf3FcR6nQYhahC5aGiEk2BdIFFTD
 g+89dLSP2WJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLYRhAAsSyUJRueiyI2y+eCbQ0zOzWocdirCoq
 DSY6BJ8q0N6Yy2qQSPKXUIGyZC1dl7oAiTmaAlAIz8yiCQSC36b+DF3V98TuiDvnCfxWX7qiZnj
 kwkvRtp2oNFndOfXGgTpu8ne1bYL9W6VQBsn0o8+9dnZHcvXaRWuc7kXL4wSoxn2YUKgVyY/Bya
 y3jLizDDTBeL63LZANyXmVm1qxlNE/i8fFjYP8c7ISRrLbp9+r0qRdlxIyfoMFGPexNibpd+j0Y
 3BKSTrI4XEP5/ydcjGu9Ij2sGlZEvztOlc1+wkPlD+BAyKlt8pvlkeINSbkMXPvjFqbC9a5nMXS
 mW62erWZx+xh/55O1fXo5S8v4v4uRc4skfKzpFOXwFYTWAjA1YZyihJnkFPtNJuBnkdU6sRYny3
 7GgoraTkFb8iiSXrSLEgDku57wq8kM2ryWNgg3YEo01vllS+HtTm3qbW5G64ufoboz+ZakusFJ/
 6uQWQYFTa2sbugexWCBeW3OARgrp2g2x3+mba51LBKciEc2TZ2KpE5yvso+T8m2H0wbVZOjn1Xx
 dfO5G77A19COL8zuU46Acr9Cnt8qieleFE/vf+GJk52VwO/Wh+377xJpih3cpvfil5xOAmIpOCn
 12mniYbQ3+eGCkZX4lSbk1qbbzH4uMKJz7RfBBoG0Gv9ThCSbRJY=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 28 +++++++++++++++++++++++++++-
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 5812f46fe6ae..f148d4fc099f 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -307,7 +307,9 @@ void unigraf_require_device(int drm_fd)
  * and link parameters to default values.
  */
 void unigraf_reset(void)
-{}
+{
+	unigraf_plug();
+}
 
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
@@ -345,3 +347,27 @@ void unigraf_hpd_deassert(void)
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
index 77fba4e53912..ae1f0d8955ab 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -48,4 +48,8 @@ void unigraf_hpd_pulse(int duration);
 
 void unigraf_hpd_assert(void);
 
+void unigraf_plug(void);
+
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

