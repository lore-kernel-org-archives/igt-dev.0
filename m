Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F70F46446
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBFC10E252;
	Mon, 16 Mar 2026 10:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mFFDdW+3";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4DA10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F0FB8C415A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 745BE5FC4A;
 Mon, 16 Mar 2026 10:24:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B88410368615; Mon, 16 Mar 2026 11:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L7c/OfFOQhPbYzafebYfFZAwA9j0dpLZnO/mJMAmXB0=;
 b=mFFDdW+3R8UX0/bUEG7f6bGFv8BTsaR4Ki4K8G2QKLchpEtxEuKEZtGXCZwC7ZsrGT6Mzw
 qCcTB1cZDAffjaC80YyUy/0BiyzdhSP2hzCjNVoRyHI2Jo0i5HeXkiM0NmUBUOtlGxcz7b
 0aYTs/H/uqbiH4PIlHHCXo5kvFVe35BHr70pCD+hcObTXTicrm7hsG6FfI7Op9amIDHl/4
 SdQ/U8TPJai7PX1wNgGglIDqxQyy4/PuHG+cw/+j2fqbDPhfdtTap2YHJ6KOMZdd8rm+ap
 IOXD0qmXsCdedV5kTkRTntv3J1AsOMhCQL6CHzXPm2rihQUfqt9KmHk13BCwBg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:35 +0100
Subject: [PATCH i-g-t v8 27/49] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-27-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/LUOuij0H4MByYrTB9fazOVduSCd0iLJwCq53Fk8Nls=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pSbPijCH/qnJ/n6XB2926l66Ib6TgA2kigP
 xwKWm0s/wiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLjCA/+JEIRMPF2iIm1rc4O4FBBZRqhlfEDyaa
 lb3oZs9tZcnYYMMTQH74B4XHGiLS4U7chwo0u9RnFGegif/J1bgn2L4f8pF3dUjmbgEE5B2GlTe
 r22jLQ4cFyjnzgLnWyKlhleCFfdaZ8dpVRefRGwMApqLyhnjCyT50qabxBO2Sp8MwJgA8t4BI56
 7auxKDjfJ01MbaTuo+IGLtnQBkmT6lk1bxHXxmHv2J1eiUaLqmmJVbhfcuVj597MzvaZY2e+tsk
 wuJKBJqwr+tRwojE2mMH0E0WJhEo3vw/uvqXzk2eXeTTZ7wINR0QR86fLiJzV9+2c5duDgQVABw
 06Gh0134f/qo7R55zFhv47Pren8awh7LxHnE8fi5GA4Xp+Iv68tjB1tWw9RGOgSR0pOZLL54uM+
 QRaOTtCDxOiSbQgFh6WNie8PaQOkSUkH7UcYDvLqaw7PoGWwctQlfPDAMrJMRCvR1TUXIhCh/vF
 OT7ADdejXB1fUJSmA8RuE7EcrukhddakDNEnxswQeBwZsyzKTM4uJXOw4mb8XUINlTOieLi63MP
 2PJoOcMOZQSyWp3DMvhEGpQnAdX0qdQM5nMNzbmqwTaqKzzi01P4AXBMoqarIBRlFW6uQIoMTVt
 Y9Uiv0WKPQ5V+cIO74zDdBC5k7FS4gTxpJhlfhu2n354mUtivV2I=
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
index 34f3e83e4358..29283b7751b0 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -304,7 +304,9 @@ void unigraf_require_device(int drm_fd)
  * and link parameters to default values.
  */
 void unigraf_reset(void)
-{}
+{
+	unigraf_plug();
+}
 
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
@@ -342,3 +344,27 @@ void unigraf_hpd_deassert(void)
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

