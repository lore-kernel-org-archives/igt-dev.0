Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38069E7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC30810E4E7;
	Mon,  2 Feb 2026 14:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YZyKYuVJ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B6510E4EC
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0B1D64E423CA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D12286076C;
 Mon,  2 Feb 2026 14:32:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9351119A8902; Mon,  2 Feb 2026 15:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MD/sU0ttkcwNIyJGSIBj1cTm3LfIaFDXg59G9E8J2Iw=;
 b=YZyKYuVJ5UOP1TuEQXM1hTa10BTgnpha9V6YKKtYTLI0/7jc2DTfaFn9p8RnGNMxGfFT3r
 VGI7cCTEI7xPLfWaTRUBk4eC5TqCZo4UHaoJzSxbicEtBop5KAOF0OMx2JcNagQdvAgMUs
 TTrNt5qNH3/dYo7kniKNHL2cn0AsqFvEezWxcvQvm/DOPsxGtgkWFXPibIrYDGK2mTI45T
 dxk+avJHPdm6jKW9DMoUZZa3VK25Ie+emb/3j3QJ8VshC5k71li7nQ3Zkr1hqx1KxtLFvx
 Uzpq7pL9z3faDZ9jcgDbWHlmABfhWezCWhSShV1nW0yaHMThGVMXyB17Ku267w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:59 +0100
Subject: [PATCH i-g-t v6 20/48] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-20-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZRXqOXWupJ8SrFWfIzkCqBEVZDH8Rtn1EsenOyXGU2g=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWRahjRCThFP9Mr2LagGudGnRpxF9RmPP/4Q
 6fEymXwum+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLSgQ/9EHMKbmHfMB1m2zGnlzkMYCRLYBJrIiX
 EtMJ3GSuVICH+ztcyMe/9HJd+8CQC6nF4XNAs3R6/UEC8KzJSX0FgnyEi3SM3/rT8WfWJT0rDbH
 HzAqlxzcYJ+is/7U4J5Q2qh9ipyPRdYXgXZYMUeq6pHd3tnNyc91QeP7d3rp/52c0qWmckXM7P+
 /vNXVfzehTDRqPClnKtAKbezkSFpXlH5bwqtfOQkR9cBZKXSLzCIag37rPx02Rp/f2KlgGEDBO0
 u/R7UNGnaMeF8v52un3Q3yHg9Mb+e54deymuyw5HESzrCs/ta7kWegMhL7GRx0+LgvFlee+Kq8A
 F0Y3Q7B+rOjAVya5iEEqZO22E/AeeU0bIsQZOvqzReI7dALOPmbGVkqP21jtsSQE5YEfAwFdw3P
 4NgCJB5Cc6ip21WU4aSWPbT9XSbN+y0l92wy9eQsdFNnotDL7vZWZhndF27u1UDSKiUKAIWbuFj
 Qely1TpTff+ozzflm+1AAiVjc2w6V9BSaQYnfmcUcbE+/SzIJk067r0GbvZtJ1aGdXvMqqBaTze
 w07GnYU78/wjgmik7+5bQ/vtCG4CfRbcRxtPl0hlE2wfHasmPSIVPRPgqJakYPo7wcIq0apCwz7
 Ni5OJmJM/x8xsWCa3sWe981/X7ySrITeVH7xDo7oPZyiStTZThTA=
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 799952c18f07..556c215c3456 100644
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
@@ -66,6 +67,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -3143,6 +3147,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.52.0

