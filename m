Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB1AD25B59
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F44710E6EE;
	Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WCY4vAcg";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21C110E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3CDF3C211E6;
 Wed, 28 Jan 2026 13:14:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B5ECD6071F;
 Wed, 28 Jan 2026 13:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C0B73119A8824; Wed, 28 Jan 2026 14:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2P5KPd1zfQ4hcLsUblfG5jWOS7GzR6jbZrTUp1+9u5M=;
 b=WCY4vAcg2Qp0FhlZbKo2ChFtUI0cCWXOVSNGSl34IGwlxkn7fvcfufcYXD4qMW/pyCMAAC
 3L/guIEEJiVPVouXau+HkU/Mx8QhZxX+AxtkKjZRJuWCx4Nx3R3MPpaw39u2KRrNJev6AD
 rIqUMjYno5QUZOeqoXR6xU+fn6yJrFkvpDJlsnfKwfXDUDVPVaAHtrk/lPrEO130JswdcR
 VXHrau1rYDgHNcUyZa6zAbB5Nhab/TFIImzg7RnmYdinbIDYihwU+/544ryi1T9SrNTDjq
 N+nfqvex65vpFfFbiIM+yE2Ejk7OKdhgwr/YXMXThm97hDSBnFokDIJo0qQLqQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:55 +0100
Subject: [PATCH i-g-t v5 24/48] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-24-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=4gGnUXXFV7lEFkOsWtcDwCWfv6a22sTWmsNNaFk99P4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvKmv1TcqOriXD0YFqZ2LgL49Fz6x2zBcFFX
 fDlfHyX+/2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLi4BAAjf+D00hRs9GBgksmxrCzk/L6ucCbd4u
 EmGm0BhyAw/qm5akp+3evrAcg1J8PA5d246s0yYfzIiQKyIKJjTyS6/mgkx4Iq0HKQTY7F5+Xqn
 h4XQF8ga0D98C6wrNGGVL+KpJDFx6kOz0yNwgOFmZ5mhq+DlW8rZHF9vQXBGDQSSYRp453jVzvr
 lq9etTaFWBGy21/3G1pmDizJ5f3CPWMNYjAwj6SCQbtGyLnB+g98K9lSidrhT5+QBLC7WXV4Ksn
 MnKGywp32M4n4IZq7SsITKYBYpk0NgGZT561ZU4BIgg9jb0snwcKZl0a6rHCIMOyuXM8fZwZ1PH
 ZCk9xFN1M5uQri3kLF4zGaLMEBsn+0Upq3ZFY4MBIpxZAsRc/YAkpZvxU9MKNIOeXqsbFHOdvCl
 HikF9qKlQ0C6AoQjVZtjuqIHe3GL9dAGhJAm0P7HwX/9q6pzKBRu6h33qx9MwiXCsJ5ju6FwbN6
 EDBYmcSTvZAzQbnGao94OXZigA2EImglSfGsuRqlgO9Lv3crTiTdT+Tt4+V7ME9VBT+3cpAo+6A
 4oObN9H+RuR7wywCeh5nVVe8TdiZtuDNzVbuvPFWKSdU4Rwwr/V0hgi3fmBp/GiXvvQ3fb8B4Ze
 RX8o+NPyncxFc5MFzBCrUjn+9sKK0jm6td6j0NrCFNkC5nbtCmK0=
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

