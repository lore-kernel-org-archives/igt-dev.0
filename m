Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E8F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BB710E2A4;
	Mon, 16 Mar 2026 16:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LlVwkACk";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4BA10E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 808171A2CD4;
 Mon, 16 Mar 2026 16:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5739E600E3;
 Mon, 16 Mar 2026 16:23:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7F1D10372210; Mon, 16 Mar 2026 17:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L7c/OfFOQhPbYzafebYfFZAwA9j0dpLZnO/mJMAmXB0=;
 b=LlVwkACkPkGpNuonVXiA+kosg8Rc6w5NZxZj1XLwbu0y+aZ8SQ0s3PaC9Ai+9/xH345gqO
 Ep4ubNwoxqHrwrITlzy23DeyTiIES9W8E5ig868xpU5uYya6xEYE42uJR8Q9FTjEvUvUlb
 ODpB9QEJZ3ZQ2lXeT9/XKWTxyshQsLqo2Di4N7GcmGWOvulHHFkp5Ejy+/qPPrIyHnyU4Y
 v7nyAW4hN843OFCN/RcqQUgSAh9JRxYZQ4Zw2LKbFUT+DrB/Rfj5mSZ9lBbddyIJUNXZvb
 rFEtNbHoKF487l31WM0zUajQFDrk6P+mSn383xnqtHAI3AS5z3G+VoW1bZAo9Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:48 +0100
Subject: [PATCH i-g-t v9 27/49] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-27-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/LUOuij0H4MByYrTB9fazOVduSCd0iLJwCq53Fk8Nls=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6NLXB1HNZ++dzQywpqLi+wxnq3DVGzvpJXC
 cdhlwCoFKGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKPUA/9GxaYPywicAJAKcY0yoNJ3QB3pIZQkat
 wiJbeJbo7TRQRU7pVgeVOGz6C3Z70GnOXGefRAiQJ2+P1vYtM52bLNV/5ovCJd5NltUtKnKa9ZH
 Pet0UXGqqG99dCPaLUVaYz29Wx6sPZjTcUXycqRpN0gWN2ZDXygNmZtVY+JKgY5CV/rg76AZy6U
 b1eXe5g9ld6fdVUTuFk/vGwFPQnLkNSyVBsfT2O/vaImofIeDx4R6ceYNqiaji0me8GhGpt+fJ4
 kxzV9YgzDTPT0rCf+nro/BFeiUXLAUNXGdOBTGWxTBAN4D4jRIZel3jXEwK5JqUmavruRCDQpeh
 bhEIHVz+Ed8Y2Yb16Nk8jnWrfmcwtzk8h8ODRMpfvPOAcsf11CdzosdYtedHkc+VjApeEVNkcfb
 2OUGmTcMLiqwKt8GEPOrkvfacpHJ3UPFOmMUmdVHj7lZiIDJWVlbsjhOYibP6sCh1uCsMPOyXR0
 0iIWWOgH+uGkBIStSPhIhVH/Jit/qeEYdJ1TI8ctMdv2EDszouW62YJluiDLolHxtKPZGbJ1Om0
 2vzHlP7jhAwIf4D42+xEkRtut26YbWDMq7BIC0+rv42Xf46gyOr2fLyFy3Wq7NygIyqO2uesyBV
 EzMKzdBjQfxnfnGP2qYaUJECZHKQu2BCLBtR7w4Beha3WBE8iBu4=
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

