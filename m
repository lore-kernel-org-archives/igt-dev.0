Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E27FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AAE10F648;
	Fri, 24 Apr 2026 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SXFSYiUy";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90A110E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C7CC11A3402
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A04C0604EB;
 Fri, 24 Apr 2026 16:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A38D010720A1D; 
 Fri, 24 Apr 2026 18:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9Cks9arAHxxEtV16h1x0lU5BFfoc1nIggde0HhgVP6g=;
 b=SXFSYiUykYZgqx+LAQg2FiTm65kj+l4yiaVVh2PqGvoiianeXZmc5bRm8CnY3FBeXa37SW
 8BfyuyIqaDKVLFCFMgH7cBEUSYjS1yFE8zsn9rP34BrTffZEYC0lq9FF1G+etCWIcoQQxy
 h2PZda7YN1zRlN0+SqelfDAkN9VlweTPk/nNARbJbzblaXZv+uvhVZEyfQ02ZeSLz9X/NM
 uCf+Ugd+Kx+N5IoaCFBAEyhIKp2qWVsLC+51enEx4PLOnos/WeVNUDdrpZUC5bnw8QihBi
 OYsbK5hnHbkra8vsKX7AhbSwDaqlcyxgNXAtwr7Itm1avinxQul6t1h9so4hRQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:02 +0200
Subject: [PATCH i-g-t v11 27/49] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-27-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
 lib/vendor/unigraf/unigraf.c | 28 +++++++++++++++++++++++++++-
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index aca26fe06cc5..1552a90e05b6 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -308,7 +308,9 @@ void unigraf_require_device(int drm_fd)
  * and link parameters to default values.
  */
 void unigraf_reset(void)
-{}
+{
+	unigraf_plug();
+}
 
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
@@ -346,3 +348,27 @@ void unigraf_hpd_deassert(void)
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 77fba4e53912..ae1f0d8955ab 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -48,4 +48,8 @@ void unigraf_hpd_pulse(int duration);
 
 void unigraf_hpd_assert(void);
 
+void unigraf_plug(void);
+
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.54.0

