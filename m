Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF3EA4FB4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B8C10E36A;
	Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="suoTjHds";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1D10E381
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 48BAB4E41031
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F8F25FD43;
 Mon, 23 Feb 2026 12:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBBB510368F89; Mon, 23 Feb 2026 13:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4QSX4EAWVFZpC3BLjt5f1Bk+HkvmeNQUM73a5SK9GQQ=;
 b=suoTjHdsuEP9FhFLc91aRYBf/ik7ocKdsZYUVhydid3W75ARoFzbuxozT7uAQzKhjwpo0d
 Y99pMX5oe43qZTATKQWs6OfwCxX2bSP3dlbn1v95o4qsuhFo+HFDV3B3oaAPO8L0IMSJjC
 cIY+ziQnpSJQjaLqluHR19F/BytcCXxjZq00nInTMwo8bEeYJ/boVMtRUhcU6rz9/KkBcS
 1mJRdLJ3ey11jiWo9CSQHz5Kmtyu24TnPsNZECZtdyefkQ5Z2NKYPNyNu2P4LSj6mEpIeU
 o2Nl17OoZ96GRc0JiWI/By8AJpVAOeoQWmVKhEPyWh8+8EcoKFB765h0SEboCQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:15 +0100
Subject: [PATCH i-g-t v7 08/48] lib/igt_kms: Expose
 reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-8-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7ewKHOSRK2/NGryljD3VzLbymAPLANpQuw0nM6uly7s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENnWkv6gO//14+YI7C4/filzLi8CujQQ4MiM
 TiG0N2uezyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIwZg//a5I+V+Tr5kiC2Rz6ADmtEwuUOAe2brt
 oFu+iOp0eI1uwPkxiIycpSLBYazQJMq+m39cGatF2BSeNmhvgaDNE5Kpo6nmQKUT4102TBFmHeE
 Mwoifyk6Yo12jfRv8jj/aeuzDrrZgeSbdb7JRJeKw8+dLBfED72UZYKkvCeYdSow+m3xsojjyTZ
 pCA1MBIPjibo6rVOHQOJwOfegrb0XCOYWIH+u3PkXhePtojA78neQ+3qoAO06fC/yh8QdedRDLz
 vAZBhP6tNBsPIeQK94/OYyLfRr7DprLpoCbxpk4GNxas8DLaqg2ErtRfVyMcrG1oyRlUcjVa1sD
 z9tfKrr1S+jP085mC6mzv7m5GZizNrz7a99R0FVq7r1LOZjbpNkQE5hJiBBdFvVAmehEX3J6Jwl
 FlCHPhV1o+iM2Gw3q+ibFx5+yeoTK+CqcojP5rsDTFuZo/T9ZJcMiE3EfbPmyUuvcmlgQPpkAe3
 ovY9rdaljMYA1Fs/f68cvnnAGkAZgJlpAx76HDQJB8IrYxvMWfYrDBe2Mu6rACdxB9xjEVHDhG5
 DNAsgtCJW9+gnQWKTIp0Rtinq/2LSvob5iG8oQw2Kpa1kHn2Lo38o/9ycvslDOV2NdAi6V/hR4v
 ZNmIspGOf3OPyuzpjvEvqpL6/TaI2Tm9183G+LO6DMUWEXj9OJ44=
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
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d76ae3cccae4..2ea774d79d8a 100644
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
index a1da1b5a0dd7..23b7110fafca 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -152,6 +152,7 @@ int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.52.0

