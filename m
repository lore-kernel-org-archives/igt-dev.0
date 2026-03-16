Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C42F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A631710E26A;
	Mon, 16 Mar 2026 10:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DWM/KCbI";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20110E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EA4BD4E426C0
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFF895FC4A;
 Mon, 16 Mar 2026 10:24:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB4F710369F44; Mon, 16 Mar 2026 11:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=R85mHCTJO68G7Nm02qnH/HifeyXjY+ub9U70DMwxD/4=;
 b=DWM/KCbIGIaRzIPhIc6BxAx+BNkJlzY+qsnEE5ZeMYCR/81s5KacwvFhd6ykiSH9JGeB6I
 o/y6wfsjguLkoG4I6nDBLx+rJ8LHSBsR3CRy1sv4nzInTjbFEyBxVPkFOHqzH6Uy2eM2xy
 7aiUAw/FZMSMoe/0sRjwBYwNmH4N9lViL19+1+2KZ82m3znAahfMlNkQ9aW7l1iMg26Jsf
 u9SWAGIupHl/8/rSPEoq+igh0KPopW0VicPsqdJ4g1tQQY04RS0hFOmjzBEHcI8cj7mMIT
 D6l6aKSCVJUoHbw2hIPPSI1ReVWkxdd/jilLA01G5HzThgjPfaLcu6t2+8Ga7w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:51 +0100
Subject: [PATCH i-g-t v8 43/49] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-43-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=705;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xhRmXAcvGaX/LHZhSZxsF7ijVYM3O2IKyvfK0RJXoJg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pUNk1FZlRo74eVp4ijhQl3dq9dHWWoVI4MW
 f7u1OUMJwCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIZyg/9Hsspo4lh0JSM/+RdJpyqQwH5uEsU/7H
 mL342+DzZSKJg98dNNcDz8qld+deBf+yuYqpYxTmZnulQZes13l2+4i0x/IHaDgK+tLXWZ5CXb5
 FXU4t4k0aeCI4TR+DwKF7j0jkVZTYn+469T8F8jqIEYixMk8KG1Zvkll0LDbPMa2eXqIm1xtoO5
 Kvr4cy3pIYif2lyyh0b2xeWDcd500AIcJn6wOherT+dQLkd4s8wR4P1PatBPGv18X1DLl3c1BML
 7Cgt+tK2Q6Jr7mKsPVP/XUuSR/v0A7AQEm6jUucz/I2v3iM2XCunqFSRTi6wXhmmxg59FPJ9jhC
 qiu9VdM0BMXAm25LqfG8sbpBWwC5R+UWKy8xlhuGyLx06W7Vz1JXRU5AbZKAWBUt2vvUNAHzhQK
 H2iT1kn3SkQz7EUydvT9EV0LJiqPjOo8cBcEkFO/K08dWcJ6uEur5l2pskEF7U12kxbZ3ypgnkK
 OIa6F8oPXvZ92YS7JKHYxKtStWAhqJNaNx1akB0J7dXOcZIzDgQWGzoLyR0DLfYWztB3UmXIkFi
 L9fMldEnbQ+Myu368sjIYIAAbLbfh6fWKRM5lzBXVXrYVdfW6CGT+hmJFqoIwpCD2+Ot3yktCts
 gve4duehaQzEA8kJ9hKkiIhSdNC+xvtcAP7X9JDZTQgehmwMGFqI=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2f1f5cf4a5f3..81d5077b3acc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3293,6 +3293,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.52.0

