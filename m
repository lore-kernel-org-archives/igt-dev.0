Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE5CE7DEF1
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767C710E4DF;
	Mon,  2 Feb 2026 14:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2iv6alOz";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E910E410
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0C7181A2C19;
 Mon,  2 Feb 2026 14:32:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D764B60767;
 Mon,  2 Feb 2026 14:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ABB98119A8891; Mon,  2 Feb 2026 15:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iLOKZEUJG7LXZQJwW5pVOfRtwcwOoY6RvUlqKrP222Q=;
 b=2iv6alOzlD8XoKE2DIyule3oi66i40xBaJoiD2rDjf61fElj/ZTP8GDuJcgq0xz2xmJgA7
 ktWWJNp28W980woOKH5PmuREk81wtHgRC3SMpVuR+NfwBmW2ZfZ7imYVAzlVJF6wL65lnh
 5726iOS31zC81zwpajmVfyq/y0k5PkBHIra6D2O4uPNefm6FXxgZFMnnG4ilHqK+vEPmHA
 1ed8eJwZ3PUtgfQLbIA9swbvBxOcJiu9H5Es0cifno8PasdWckNBqlJtLNfeFG3lkqkQi3
 o+LHk8qj8ivGAMDnKbuGsBG76YtVtax4Db3iEP1WxZSRFT4yZ6yN6eci2oG3dQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:40 +0100
Subject: [PATCH i-g-t v6 01/48] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-1-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qn5t6CSDgxeumhcDW3/qs42eCYPenzNpWoN57DjLpH8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWOlqWxhil01NQoIiq03opNhbUvYJgjo4W7h
 KS/snn5x1WJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKffg/+MvqEsw3FSDM0Je0KzZnE3ciwH1bin7j
 4fugskIvoCA4m9g4hAZFT3dnu66IZxbUC0Sw/67TslOaPjWcwia3acGbVci0nB/l7iN0idwIJ4D
 dGBc3Zt8yZo490Yuwt0/y3X48g2Q5dvTxx2ZozcWo/NnW2dMwL10YQc8C+D0pB6kM4A/f6T4GkF
 0NlOjRLYgB/szBtHWnCPKmt2lYNp0EAJn9CvoGT73h0s1Dp9nRkqc55y3fklS5myYg91Sa2GrCj
 7ZFEkecxnZ1ymmaWjY2jDFHK+17N2ENSE6PSvtXnAwRcnVw6PdnMFjgHj8mVxSDWCl+HP2wJLB/
 BXERS4WBpy8darL5Ad60z9GMVaoJxz6lsAb3pwktoSN5xd8bL9uNW4Jz0MPHv0ZMZqbzNVhRe7E
 7JOLjU4fEFIoqib27vs5NLfJRVEd4YRust0iKgSqVCaD/00rtIFTKIxvX70b5vQbavg3GZY42a1
 AO3/ymkhCENEIG59b6o9TAft+UB9MEL/sgY1ym6KOOObs9CX/Kk1fUJssJsAfGQ/4firniZnfko
 HLPnIq/tP4CoUVXQKxxloChvFDm8269iZvQPTGtFt4Fxux2STFXZ4BYGF4gGAh8bZHo6ufL1WZ6
 dCjaDGgfASe6/6joZwBBHh/L929pJOYghJcE/znC8Pn5Vxhw4SQc=
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

Some tests need to wait for a specific connector status. In order to make
the timeout customisable for each target, add an option in the
configuration file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_core.c |  4 ++++
 lib/igt_kms.c  | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  9 +++++++++
 3 files changed, 48 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ee670a41a91..da2453cc1028 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -271,6 +271,10 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *
+ *	&num; The following option define the timeout for detection feature
+ *	&num; (waiting for a connector status)
+ *	DisplayDetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a94c4820bd87..3f1e93af62b7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -60,6 +60,7 @@
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_pipe_crc.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -7980,3 +7981,37 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
                                               buf, sizeof(buf));
         return res == 0;
 }
+
+/**
+ * igt_default_display_detect_timeout:
+ *
+ * Get the default timeout value for detection feature
+ *
+ * Some tests requires to wait for a specific connector status. This value will determine the
+ * timeout value for this waiting.
+ */
+double igt_default_display_detect_timeout(void)
+{
+	static double timeout = 0.0;
+	static bool first_call = true;
+	GError *error = NULL;
+
+	if (first_call) {
+		if (igt_key_file) {
+			timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",
+							&error);
+			if (error) {
+				igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
+					  DEFAULT_DETECT_TIMEOUT);
+				g_clear_error(&error);
+				timeout = DEFAULT_DETECT_TIMEOUT;
+			}
+		} else {
+			timeout = DEFAULT_DETECT_TIMEOUT;
+		}
+
+		first_call = false;
+	}
+
+	return timeout;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 432c67d11780..ca3c79f713cb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -40,6 +40,14 @@
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 
+/**
+ * define DEFAULT_DETECT_TIMEOUT - Default timeout in second used for some screen detection
+ * functions
+ *
+ * It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 10.0
+
 /* Low-level helpers with kmstest_ prefix */
 
 /**
@@ -1306,5 +1314,6 @@ void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+double igt_default_display_detect_timeout(void);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

