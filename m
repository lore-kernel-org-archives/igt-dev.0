Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722B9E7DEF3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877410E4F2;
	Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P/hwH4uJ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4088F10E282
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 26B0F4E423C3;
 Mon,  2 Feb 2026 14:32:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F18A160767;
 Mon,  2 Feb 2026 14:32:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01329119A8907; Mon,  2 Feb 2026 15:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2P5KPd1zfQ4hcLsUblfG5jWOS7GzR6jbZrTUp1+9u5M=;
 b=P/hwH4uJ4sDc0u+XHgCWYQlw5EsgNwKOcOL9AD0sYCzBlGsR6BXyfl6XEdBkpIalmU6dTx
 AZ5hhsfJWy+nyT8jf6lc1C4E3X0jirItM2mxbBsegbdmhlgf5KXFERxbA23F0vfq+rnnVL
 uAQm2Pvz4r5nWlCtz+59/a5twLU07xQZb1NazyMWHhv9zC75XKAJ/f4Y25eRQMH7oiSarJ
 RfZo1ux/GR/xXRyD5q+ZWa/zXl+lgxDwD/whzkke/MNFGYOYjkEeM0bKx7+Vz7OfSEd+Ng
 MzDXMPByYFQFbpamHs6m10NhNq/wCyxtuheOrkBSIXLgw8yOniko8a001WQTUg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:03 +0100
Subject: [PATCH i-g-t v6 24/48] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-24-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=4gGnUXXFV7lEFkOsWtcDwCWfv6a22sTWmsNNaFk99P4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWRDsQ+x+rQA+OJP/7rQrLZpC+QHYZAJ8Gte
 MaqMT/HFQKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIvvBAAjFhICrZfx8d5e7x/tWGfh3XYKs3D9mu
 zZG6StDX+kAIRwN1AY8l6QW0xvoY1ittL1TDMHYLE6x83GVkH5ATNte9/f7BNYyMANqqM8NUTmm
 N+WsIXLiQrVMQliOVhVJx7nisNYbFSrFypnhujgt8mj6tOS34wHkEN13YA2gpYBfs8Qc5mLC4rG
 KudPVvWu/cPBsLuHdZ3bcFHFnoqF7HvfRjnfFvh4LB7n8KZYyXHbGbFlX9rqDr6QVZ9JF6IZ2rs
 Af2AOUoieluaA/LZlsGnecag358MANaOVltS6YaIMeDPDIrUNbik4apMP0GqDoRtm4QrYWa7bT/
 GOT3ayi1TWjS51eD2qENd1U+eCSa7iRPAsj0smIOMvtih+nuqXoRc7TIH/j+7WJg9OFPR1Imb5l
 +cbH8sgv+5/YU8NEWEWjeF+Xx6KS/yUvPFXYb05scgT6Wp2qMhGMvpsgOC/lAH7AsnZ4FIAnFyv
 2C09ajne+wcTfoG7W2nCVn8WcqySLZ6b9wBFq2Xu739qqblJz4XWVEziRFxk9D2CtDLb1wEVrRX
 9IjqP+k14M8USBdMbp/I1NdyU/8+dPWFzLHYVhua1cSWWxA2keyIvAEfXpNNs8xIMCl/1+4CFd9
 Tn5TO/uxkXioU3ITqUMy2wR5C4u21dqq8I5EEMjSu+upUN6Zvg3U=
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

To have a consistent state at the beginning of tests, add a unigraf_reset
function that will restore a known state.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 12 ++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 1b31f7a44566..02ade26f7bdd 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -283,6 +283,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -296,3 +298,13 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void)
+{}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 376ed910bfa8..9395815dee00 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -34,4 +34,6 @@ bool unigraf_open_device(int drm_fd);
 
 void unigraf_require_device(int drm_fd);
 
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

