Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A400EA4FB6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738E10E38B;
	Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oYbU0sgk";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF110E388
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1F1ADC143C5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF8695FD43;
 Mon, 23 Feb 2026 12:09:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF01C10368FDA; Mon, 23 Feb 2026 13:09:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r10zO9YC2Lrmo8764iR0H38GTfTLfmaBbn8VyUuZVwk=;
 b=oYbU0sgk2s2uUI82lDyQxe4OIZBaFUOkytNVOmD9+Egv3u7n5PtJdaa9avuZeqc6cdKYN0
 bu06dnUAZAoth+k5J/6cDTKfkFpfFNrgZFEqYdES+hbrd00Rh3XUmKVhfiXoBYiVYTk16N
 z8yeriltT98BAHGa17UqXN+oROVPxMloSl0PgpSJxwCYKcGopM3gA41XK0mhqhdJf1SpqX
 ND5w1dXb69/S9g5kQsi4PGxuJI/HIqUuIP9M2VvKUZLeeDq+y38/x7ViA2nXWNlQKYUT2x
 4VlYhGebTQ10FGfc+Dmaf5ZgTfvIYZ+NtkGspuKSS2bubG+HKciF5HIh/gzCHg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:49 +0100
Subject: [PATCH i-g-t v7 42/48] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-42-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=705;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Eln/zeig/RLjfjaaRLb8bBE0/VAqVuLxgOb4KvaryzM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENsCGR7gLR/oe6ji3uzORxYFNEK+lOLtODzH
 USiQ9/0izmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDbBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJSIBAAjOcm5k5RFArByw/7sjMlQlIcDOHGWUi
 sgy7wTWtoWPL/7wXUHnTTxGWuhSpG2PUKa2osUzJLOF2g1vnuovrCh88LUVHj8fljhr7NSXdPGT
 aR0Z9R5+TbOlgjHZy0ZJvqrxTwCU1sTErkCVVdQb6ShsautbV9/O2KYD4eXM2T+D3I251ndfEJA
 bYhr6UoAswO7Mt+IVPvfSDtlH5wTC8OTjOuf3iwPDrEiwgKSsyqiZoeOvW4gz+4eBSh5ymoMTup
 YYHdcTW3B9UKfsW0jx5jCWUPiTbZx37EwCoJ7JGq+qyHKSeE38xCNVi1XK5stLm8H+bRwTBoI2V
 akpR9uHHxzw+hlrDF0h6o+KfDtEzrRSOW75cdrG8v2RJzhOIFlKLQqzRsycTyWz/DpT1bHimmIv
 QcCAkr8r/ZdGbKHucEuSfkajH9PSfRBU4/D1TjVQBvd/DaVAwuM4uUBySyNVr13FYFqCkcsWuuB
 9zUqDayg947dseiZlWAGauxY3MQuWt451y9gCtWMH807B3C8Z0DPFhTFHemw/shZji/mGkOMLL2
 RPNc0zwFypRy7lPz/aVj9vsPo3vYYfEKxS07plk19iADJ+XoP3JFxWPxcIQo4O4x8Uhe+nKce76
 FY8EvPrDONe6j8RxvEctPgtDUiXnom1hYAkCnXIIHpGRIVvu9oxw=
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
index 5eb94be49494..0c61ac6e2788 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3296,6 +3296,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.52.0

