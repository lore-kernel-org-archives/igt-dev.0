Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60D4E7DEF8
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC3410E4EC;
	Mon,  2 Feb 2026 14:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hGOmtmFd";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B8510E4F8
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1CC9F4E423CA;
 Mon,  2 Feb 2026 14:33:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2BC160767;
 Mon,  2 Feb 2026 14:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9528119A8912; Mon,  2 Feb 2026 15:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IHVbA0QkvFHbBr8fSs3tErfYuh9mxA7o9H+jdmNxDYw=;
 b=hGOmtmFdOkt7HsUGDRZZV8DhmwLm3Pte2ox2pgqxIA+zhn3SsG2ezuACw5sf1oNCTl9vkC
 8/kKWgfQWBP5lDmEg9Vfq9m1IzHqXNGIV2S2rNuhRLDUYogOIOKIOj7HHsUZAf76PaMTn1
 3tZKCZS2J+z6xaKw+Bjpx2Rq95lmzQclRZ7g5DZFNILrwha7/iz4PKNYdMSAlP9kVbeWT4
 Cz9gTR8hsLXqb8LdDxZALKATPHCXfckEVJ3QBIncOJr+Y+nNvqsuTusCwk+vKZIPxQuMyR
 AfjmYXQTAhnGpzyeQBdUeb56bSrf2OtRq1qhUWpX/iApG4KBZ2cgqVqDGksWFw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:21 +0100
Subject: [PATCH i-g-t v6 42/48] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-42-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=649;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QZGCi2srqcGZOAyOhj2a8wcIQZixoeqTrfuJGitEEKU=;
 b=owEBiAJ3/ZANAwAIASCtLsZbECziAcsmYgBpgLWUIFFRSkN+De6U+h2CAQK6GWuiNdxdiKFAk
 1P+mucfPl2JAk4EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJuvA/40iVvqpaeDSwCaUi3yeThvXX5ArWqhy/
 f0DL1kSRkYzYIcqlg4nEqH0aT8YCvTjsU2g5VYhNQe1m++y+DC3bhWthgVFhWPYJ9JNkCYTjffM
 sK3Bop6AG3lr3q2fGkppqLqpuv0tvQtKM2hJQxuhIA4zkFjAeOB78hLkZhwF6yGrEvuQ7qDtiBB
 AO3zv1GP2RXt6WudgQ8g7s/Jfmi0OOd89Xl01aNAABNDD81USI87TAwWJPP5ZRF6T43/OaHpWpV
 bVBuOmM+xp4ZUeO35BRijk9SiAtOnIvQSNfXHsikh2b6KFfQRDwQohz06QBmPN+DATvJUtfSH0J
 1d7dzB2aiK/Rm6ASuVX3koJ/nxiY8j5x4RVcfQ6xsdaFPK0D6dtfQ5ZKIUD/qMwGz7sPE3wzkol
 OMjAdXsc+LHJWMeeBXQcNp9wA1PqdbK1sNbVwjZhrVsMzcaVGtetNfVRZhvC2CROHQWzOhW1Zs0
 Ul9j8LaI99q72NmWbPX0SIrJ6Xdtn2wib5ifeMqTTQn+ngSrHXQYB3Z4Eau27f+CsN82r3Tnm/2
 loJw7gOPMLXgTPdaYvc0RXYmX7bTajE73KG+NC8lHv15jn3QcSTIOdPaVdVH2j74jqf/gi9bd/P
 kPWcAOJD5wpv414vnondLBkMdOxoe/8IjuyYpwa4zZBRfUSAHQA==
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
index 76179319cf6b..cab42bd4ceb0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3317,6 +3317,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.52.0

