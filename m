Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E82E7DEEE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90B10E4E7;
	Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kNKVbk+d";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C73410E410
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7D4671A2C1C;
 Mon,  2 Feb 2026 14:32:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E3F960767;
 Mon,  2 Feb 2026 14:32:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34013119A88F7; Mon,  2 Feb 2026 15:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zf6Iq3tk3Wf49F/j4CCLrMJXebxp10z+qm+KWoYcoPU=;
 b=kNKVbk+dCQ9xFGsFUGBdIgskEvZlNsr4kVdpKzMHPkko11GRX8wJcQQ4isW00bjwS6+YLZ
 Ck1sHRPrIhe5uSFYkgIajeArvxcwlih1Jiu3vEtdGdNHdIFqNsAYYVFfzx9a8csX2LZeiE
 PqJ9ebTwNyH1EBQi8jUGVJQ61X2/rVR4eELNekHkzDfhSXRjCNuj7hGpQ7rrRTExo1TIVs
 8UhpEuhOMDRO0H3jo8uVleJQLBknkGIYWl5UBH3LAyilmIV6W4VKsDxhUbkgANMsxzV7zX
 8AuM9pVIxCXtTuQ4TgjNRMck2woWUfP2iiyRmbiYvyQLLOyXDajeSri1LASGlw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:47 +0100
Subject: [PATCH i-g-t v6 08/48] lib/igt_kms: Expose
 reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-8-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XbeBaqe5BiZHHUDBWtGPpDWT1svrqpCbCIpDNN6seLw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWP7PllcQNIrjlrtjrYHvr9EJc032KpkCH8F
 J2eD9KDlNuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKcrA//UCcml1ZcEbO4h72+Yq7Ktqc1Irbb3QN
 TjjuztxItAxc4CJLviBT6sIebgQy6C/44BIV9oPJXhZk1upnVuh50Lag9hBw/XpDJr8DOOfpojG
 8cYlX3FO0+geRqqxPAXR5jijJSQkzxUQWUP+cLOkMiKONIl/XKaMB3ru5mel2F8BsRaxosXJM6H
 S5BDDVsET4YEo2afGpNfElfcE6Xe6vm2nusq2qZRosshLXglwW+TG73N4n18aeEph15h83Cghtr
 plx6yy1AoZLFmCUAYivzvqwqQMW8iFokQ7w3MHXINcxkxUn8mV9xVM/hgctrVBqAFJaZ7FXh5SE
 l6q/0YH3dJ+sj+oLH1O/lQOFid8jgZEQ12aG1ZGyUt+MbEwO8MBqYwJTu1GdiZtEIfbfEBEUEUj
 wfvctjDFKxQeLzPHjbmHuEVyucvN3b9c5WaOSIWUhBtTK5sIEjBtTNgliBgCteCUjc9OllUxjPc
 p6KaA20RSCc8daO4HSB6jACHVClfHLXh+sDIkSGUUTUQqUpJzz+4OlS2VB2FksGvSjYFfqN8CgD
 7ADrVoleittA3//BQKtCGqxBzyN2DM6b0JA/2vRCKpELeKPxvBySF77MD/N13aaYbq6vop+zmqW
 45NhoEmkp67wWvS0bqGqAVmSa4hpks0FS6SETmo+aWSAShttEPZY=
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

reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
be reused in a different file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 76bd6dac2fe6..7a0fdece0774 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1577,7 +1577,12 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+/**
+ * reset_connectors_at_exit:
+ *
+ * Exit handler used to remove any forced state from the connectors.
+ */
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 23652ec6649c..88a8e016defa 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -160,6 +160,7 @@ int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.52.0

