Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D693CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785910E3C6;
	Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Sc9PxwtG";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA18E10E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A45824E41609;
 Mon, 10 Nov 2025 13:39:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B317606F5;
 Mon, 10 Nov 2025 13:39:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A047E1037190F; Mon, 10 Nov 2025 14:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eB4m7vnUbFj2oqWXROHfDVeG2PKD5WT4nOxaqHmPVR4=;
 b=Sc9PxwtG/CUh6Tfx/O8qciB/d4LErp7yOjmdWXiOoYy9QQqvwjRtkriXGdD6V3y/4tIpCs
 tRt/a3CPhI01PCHo25Qtp4apal0yZXw1BE4f6RmPMi4OLt8FLWS1zF4q8V/2s3JksNN/nm
 B2kIYHu/7LCNuyhIjO3lW0iyGR56n8kg5GaFlS4812XVacjZGO4eg33k4HDAsdSKFS2QJm
 edyc/YM4RhrjUkorJOswj+SzJM2e5sCyMYgXAsC0WcTm1hMkgRgDUwbngcSqEOMa06iqCE
 ++HsNLC6zW1MWkv+eeaGASzmHq9qn5nQOY0ax63wBArWsutrJTQmE/2FBUwfkQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:26 +0000
Subject: [PATCH i-g-t v4 24/46] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-24-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gcemdSjKVzR0lZV4mYLLtsWTJrUbNRSDuzp81IZ7U88=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesQfKHt0f8E5u/w4AUYVgHKflVDl/mSPmNnu
 mcDlZqu8Q2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEAAKCRAgrS7GWxAs
 4nduD/9Uz1Eezs4xx+de31B5b/zcDPLMuDK1cE7irfVB7mfVXyzm/bQjAQwnKrpytCcT1kf4xsi
 rxUgIH4L/ab7PDhp2l3q5rGlC1ej/XUEaXJx8Imfs5266MsSUcezl9F/1eBNkcTyskH1RayiY6S
 KT29G++GAY0HFVObcXXRsA5XMfIV+BlP+Ko6JlZWGWpcUGApnwiVWGEJFIzn1vEfsMSK4Z8nDUp
 a8AUfyIm7m3Ek9ZWSft1OnZiPuIFax4rbtEE+8kkYjiCXLrKnvaqE6scKgywayvLHtt21+aNGcF
 PdQnPRfqeoA9xCowd7X2VGvaqPNrlDkDkgoQAOaX6iSo0ipHeg5lUWPU9ayMA/hh7uzWzlE1qqP
 IJDrk5lOWZRyPqbDJYd7zjEeQRtCYlI7RWsRVqNhHiOMYVqC3vZxSxhvZsHCTo/3GIEFrNrMLv6
 I2aCxrL/DiREUs6R3qwEvLzemBKwYAbYp9bno8ox8+QbaVRPNN7yMc7leON68Uj8F6gLpvFJPUF
 n20jgVM1UCEENQfZlTca8Hy7oS+hWFg6cdnBjrpSKNDuNFQ2olWtJ34wztivnjMvnIvG/ofC9W1
 lCZdl5AH/NZ0d3IAx2Px0YRW2SJVP7ejZVm0so1LhvHE1TX6sbr/oo4Btaicf+kmoRtrEZlvhgu
 MuNy2F//dbZ5yAw==
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
 lib/unigraf/unigraf.c | 5 +++++
 lib/unigraf/unigraf.h | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 59a85e1b84c9..e96c7fc3a91e 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -278,6 +278,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -285,3 +287,6 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+void unigraf_reset(void)
+{}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index a93bd464bac3..76f4f8878c2c 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -48,4 +48,13 @@ bool unigraf_open_device(int drm_fd);
  */
 void unigraf_require_device(int drm_fd);
 
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.51.0

