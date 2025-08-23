Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272B2CA0FE7
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A210E2A5;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T7smYQQQ";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94710E191
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 951271A0D8F;
 Sat, 23 Aug 2025 02:11:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F850606A7;
 Sat, 23 Aug 2025 02:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB7B41C22D437; 
 Sat, 23 Aug 2025 04:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=olMHLpQQxcYRFJuthZtTIDEvu7WSIrtCAfeqMmDcOFs=;
 b=T7smYQQQBPhO+XAm1Vmn6LYNShNosFKePwwDFe7mCcne3hiHKOCXMNj/A5LuygmR4hLPW4
 CYKOyQAKAylTcLK2xNJ/O1y+GfBXm2u/7yROAqNgAqRLnna0gribD9NBVk9JfFv0aDSKYF
 Tj1zLuRpHQCdFt4u2as6op2c5n9DxPCo7EJaEL2e6O2TLP0HYBMI3fHTutGHn+kWd12Cwk
 V0KJdOvvL43ks4TLHkasUiOs42kuJiDr7/FArOpFqUixn0PmvryRx5Nuw5VEUY8FWxpqiK
 sXjeAgz/kwDcmXf6r63nB/TlWAjgQOJh2r7cQGjRlNyKZqG3WC5a3Nj7uBBmhw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:33 +0200
Subject: [PATCH i-g-t v3 13/29] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-13-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RcC5CIoKG3P0Yi1VFNyR45y9ofgfMvnHbFY8vZ50bgI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNVl5K5fpiwplPEJervQVgmmaeoEJ7EXX2ir
 hHPqZlm2bKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVQAKCRAgrS7GWxAs
 4rPUEACQ05bRtksHJhZ41wJN1pxGJCFhA55JkXQtqqVw+pxZ0arT2fEgjnHRzDjMTyD5MzLI5wA
 A3IVfF5B3Boc1Piw7w5IgxrDyD3VM3Q1OHXtZkr72Z9HxnehEOYWj467DgZWWk7Y7xF+4plkItk
 ILMoTGKNOAYYMVPIAQUg+gA2fWP4NWNa2usnEzeVKB4ODOePHzEUrX8+CRDVJkeGfS3FbK/aOO6
 S1bNNeTpMOWTtYWP7HDXAsP8a5BZd6XrmSMKFUOABpQiqOo4iyQsfSun3GVxK6iXwU/qlGH+PeF
 B2tevSPfo1/ZGV/TRBve2C+6IlIwrOcQ3RbJ/28aqt9MOokEvlds62hTvoE9t9w4SUIR9RwXUcl
 pDFuv69CI/3hoR6a7+NMQPplT6eG1WN43zwYVPzPQA0xKBGd3UhhTLvQCgHsvtXxXp3z1fj0qPF
 oBxv4a/ZzqLbkpZJMkn8aMVirR7stRVGjKIoHTuhL9aWFHjDQfTD2Hz7907gjEH2qu6PxiBLTpy
 gWsQs8SnG13sDk6++zZUlZsmIFz25WnPVxX1c+5Qgz1gwAp7XNxBOuhwzzHKSQODdqMzY20h0Tc
 iaQHW388OTgCieXilLwgY8Ovimr8ESmbc0HQRb8iIX1DYZWhARPxfxPi4VUCFYjco5QJyEgJVgY
 pguJ2YjY8KQvLMA==
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

As Unigraf can emualte a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6929b7ea87ab04e945499ea73f014ef68c60d3aa..1d01b9204de79ab54bb968f572bac3e74bf94fdc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -37,6 +37,7 @@
 #include <sys/stat.h>
 #include <string.h>
 #include <stdlib.h>
+#include <xf86drmMode.h>
 #ifdef HAVE_LINUX_KD_H
 #include <linux/kd.h>
 #elif HAVE_SYS_KD_H
@@ -65,6 +66,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -2957,6 +2961,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		}
 	}
 #endif
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
 
 	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
 		     "count_crtcs exceeds IGT_MAX_PIPES, resources->count_crtcs=%d, IGT_MAX_PIPES=%d\n",

-- 
2.50.1

