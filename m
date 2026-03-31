Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BB910F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A42510ED4A;
	Tue, 31 Mar 2026 17:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xVNkYPiN";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F82710EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AD1F3C59955
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 15B5D6029D;
 Tue, 31 Mar 2026 17:11:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0131C104506AF; 
 Tue, 31 Mar 2026 19:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Wi8ZXlaFqE8yQXLg34RcvnbOw/WMDaFCTTj0bNb+tiA=;
 b=xVNkYPiNCuB3t141L7Xecd1Sx0kOLjABpM69KgmsyPXn8o5FkGKQQ5P3zMDPdgU1T9Qiqk
 p1Shi43elpOjyTcUxnd6/iHo0dX+jXgEIdImwNL0rxPg5uPfNa+T8Hv2saxiac0ru3FxkF
 vmCC4lAiI5RM6gL/E2QOUSEkXwrnNCDYC/UGwgVczjGm75+kw92ALYGiJhIaqLj7ofqMUA
 CltwKOCmlqG72S2p5uu+mKqoItZgrFAMC06dNYz1TeELu5MUkMLKY0DzKfQg/d/ojRJDTQ
 XcEuXBCs7nPghjFPlCYmkn8qAYvYqKLl4ErGAR2DYtilzJ6AdItJQnHP+tCq+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:44 +0200
Subject: [PATCH i-g-t v10 27/49] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-27-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5H+zFJpin+fqX/UZl7pEU5QSFis7XQlUyT6JJzruNEw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA/V1Zia9sWuPa4uGaej/k10FwWHqY/qAsAo
 GoPOBs0tcSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI2IQ/+O+Ch46bs2dH10hM/tt/NOmvFabw6QKJ
 KF3NWb4R0HjuN6+dnynFYG5kHEGjrcM4mky5eGl1FPrqrmfJmR2OCpXClU1TQQz0ZgSiytIi4AT
 wtJea9vN4d/ES5WBMt1fg+MEo9V4i1Dt6LJGqsURQDfWz9A/hRjaw4al4vvJ39KSMizo6DpFwSt
 KPV2B//FpukJFgAW28Gq7GzRs/5Hs4h1Irs0Bn5JJHwMJbAyAgFMmEMat0G3onzlKFVCcmfWIWh
 noyeQWBZ/179U34JQ3x6AYqE3KTnI6X1E/QmNi8bhLLRlB3tmeip4ehgNhStx8Af+p+p58Epa4h
 OxpdpF9dqmE8LR/C4J69aYhUJEEUfnp/CGjIrl+zWudb4/udw9knUgHvzj/aJXFacBXRmOABKMI
 guKfHhU+8jJXBm3Jx+oB694eQ1HtJ7rMFqlRdQjyjC417BQDrkirj4MBql5t0u+6ygw5NrA2kNY
 sr/30V5macvTZT/xVv4yfS5RKSXCCLExBDt58XdKy/1BsPXLzazbMl6JratVNzxGA2BggM82RRK
 ILNtmhZLAMZj1RU69hG84jF+Cdlth7lOpOwFNsh2gruRLSsn0o7s9Akryq3OiUI+Mm8dKZUk448
 RlIHdZ1BkUrpNOLhHZqksfaDiYqw11SL3M6ZOdosbGx6Wirj/sXk=
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
2.52.0

