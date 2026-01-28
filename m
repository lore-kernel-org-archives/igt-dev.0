Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C0AD25B57
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ABE10E6FB;
	Wed, 28 Jan 2026 13:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="v/yPHSnX";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E8510E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8B5831A2AC0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 61E186071F;
 Wed, 28 Jan 2026 13:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 73BD6119A8801; Wed, 28 Jan 2026 14:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qa6r8WJ2ul7UfqTZ1J7E1+Zbfa0S9U3PPImKDZ7lbyQ=;
 b=v/yPHSnX/8sd5+jfHji2bmQOnWng/i+YU4938JPtqWFihnXWB9cfDMtALy6QT8EafDUqX+
 dZjKZM5IfSYllCuccMSnJ5Pu6/x/rCVQ9xc/gYwyEQGik84Rmmr6GP51zTpttnzrDbZ33/
 tizTQuif8cIPh4alcX6KqXkKJD32czci/jvL/yXeEDbKF+KIIijU0lQnBoIHtPkc5PoRUu
 kf0NIxoGMBnuHug2+Cs1/knnEZr60w0Tu6NbDBmBahkwUYEA0Q5jeIj9tEE81ena9t2/Nc
 BvlOY5XwSjdCHxOm/q/FIN4ISJ5PJWnOPq9ZjduCK9+QcxiypX/k+StUnIsmzg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:13 +0100
Subject: [PATCH i-g-t v5 42/48] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-42-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=649;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=m3zgTjpnN27mJtOtmKxc/0wQ4vFiAhm7zFGuUbwro80=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvNl6V7857e+VgsoMZqb9ryHOd2qfNcDGQhl
 hU1WX1co76JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIN1BAAl5R9je570RftcIe3bf2hZ+OSsO4jkzO
 iTPkVJUwSE1IN1JQgmXwB3Ilp6d1LiiSUURTc+l12PZz62OuR+dm7vhMZ14jlMLQvk7ONIDpBDw
 4TgYnpMgitKFVi6x1f1pCrCASXNyWlN5kIskD17LKRak8bruj4eUt2I5Db8LFL2g+HcTpnRBz1k
 zBwH7E+W8K1VEVwRlXg7tdmSZrb2/8I/tdc8pCmV7Unc/31G++ohl6gu91FBRDOAxQCpyIMKmn2
 sN+JFcoz74UsDa2r5x/ce+zDfODXxngDcfJ1rW25yQKIw/gDoJICfvesl81DAyoWI3UaiNZZhR5
 lmmgFWF5HXAGbjhTHIe8rKjpdyf/yjYE12jSPPuzcoSGYlngw9brswwA354UIPNXIlpeRrB6ZnR
 EfT766AB7vlsGdkeemc/ZmtHOMQo96W4/JQ8phjWKQT1fW++tWKlZ+qconNmSbSTzOnzCVsG4MM
 yxiVo0wy/QYHyGH/1Rn7zuGaQ0Za7TSaKfRDvy6njgo4shUgIy6/oKyMAnBdRrTVOdQnATw8r0D
 MXnJqCV5vjCUjTIYCAAaYuAPqZHalqdGZZLRA91eD/WnsWB97YUYq8HilFrNB/PMwEUkUQ6JC4t
 RcYUCYFLl804fYacunjceBcV2epOI+wazGhcT3yZm2+RYkOhSZT4=
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

To help debugging and avoid null pointer dereference, add some asserts in
igt_output_from_connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0c2e08920345..dfd83e295491 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3353,6 +3353,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.52.0

