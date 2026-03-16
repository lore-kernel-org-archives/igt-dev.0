Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B66F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194BD10E292;
	Mon, 16 Mar 2026 16:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ds8oS1d0";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95CE10E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CE2B71A2E6E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A55B75FC4A;
 Mon, 16 Mar 2026 16:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FAD810372205; Mon, 16 Mar 2026 17:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gC7Ct5bcfWwlrSsJ3BzzV/f4N2HWOvoGFMCLwNsxg6I=;
 b=ds8oS1d0buuhDNW5Ng6Y8AfxRG0/YX7ywGEN+8KmQdktxgTzVlFVakM7qXsaC/7TTVnjFG
 zScm3duA5NCHklOTTrOmpvLNaluqeIoixyq0uUa4H5WFWJtwh1Cm0066pCaG+7SeERA9s1
 XQjOfbaFaWx+fXA/i8tYD4q/8z0K2B9DNqLKValsvCu1taTLQZ6ZPFtbzRFiifVD80XJTa
 mEpK3ZkNr9YkvXYi4soQB49Y/JHKUjpgLs4pguDCPhdVXskl850X5z9MTQjVtpsoIr9nyb
 rRDGIyUwNqCYZnxEhV0T/ufX3lVAdm0j1FdeQU6U8om/9qzLsY++UNNGPRgLZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:42 +0100
Subject: [PATCH i-g-t v9 21/49] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-21-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=atV3PcTy6xfgdz1tBASBPWt8P5blMx5lNvKPiMZM8FE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Mbag6MVUGqrBhgnR5hFRA2NxSUwmFz4Lz2
 55/Q/PYXhyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLgYA//f26e/1IgHeg/BY+89vv8GlsQvBoEvzF
 BuG17qJQ2vHm8OsiyAWcXpf79YnetF0JFy4fJFFQVoU2R0UT/e5x+r9EJpM0Xnxdnp0upqrl6KS
 z6bf3HGRutknyLwPJsBQ145mW6UnyrB0/xO5KdkRC7MvdmU1utml5dGEpseCoxSDkUo5w+Pv1O9
 uiUYlLmA9JwFZG5+99Sa4TAzWxINoKaF5gmh9k5mowacplx5Xh3g7teP86AhYLjfB1yQRy6q3O8
 ToOaG4iw37hKRJmpcSWvfzFH5KYWlINqS8ruU4a0dxddOwEtHwj7LCOPmM/K8rHakp8EGUcYT45
 bR3Q5fIlyVClrDte8zmHFz09PH1qjIuwa6kY+mCMZwMW5VBk3FTZRKA/oxeMV5LULz8oXGPUCjl
 vZH5q6i03uT1cHebcO37qkIya2T9EViHPSp+IuDSPAlHzPuBmHkJw1Pc7GIN43MMj65EM/vXfH1
 EtgLCdhEJF1efJa4Zsatr1IOCDB3kzQgZW2kxU9o334vWRRzdfxQm9Wd4Uuvik3DKUNsv/+yL2t
 aF8wEC98PDWodH5PwcfvjnIDaeoc/djWVZnrOB4FXxyUd+M7BDp8VomCwphXsBxkhrFfyavAt16
 tIwvAlvXeZ8CkSP6pmo/r8q98H23QPfjuRdBqYl9a/JvSLHR8k5U=
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

As Unigraf can emulate a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f6ddf25756f1..064d5b35aa54 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -66,6 +66,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -3123,6 +3126,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i, crtc_index;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.52.0

