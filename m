Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F10FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF2A10ECE1;
	Tue, 31 Mar 2026 17:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jOQijlHA";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF7910EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6F3091A30B3;
 Tue, 31 Mar 2026 17:11:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4378F6029D;
 Tue, 31 Mar 2026 17:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A0C51045028A; 
 Tue, 31 Mar 2026 19:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dGa31SLncrrN4vx9p2xYJaoCu95D74TtvoV54VGuhJo=;
 b=jOQijlHAJnfx8bNulPVCtKzQAPrzUG3neK0ii2fVy76J+b4c/Hs4l1xkTrHr+31K1zlwpM
 Ihd9KgdI7bVAyBOLVk4QE/ZKwNCfEqxXdLbeRJZRAnR++TjRwh3UMgHBuvJqGngh/BwsB5
 blJfHTd/Y2XWU+Yeb4i1Ag3cNGBQy86yyHamttHSNSwZfKlFREX7esosSGHkn5JK1du2v7
 pfqX2+OmbZJ3pZ+NTP1REGMQ7gtiZkmGfrhJC7AEuojIZhxlyZpOW65YRfueNyW52PTjjn
 VrcAyC7ksfceLEPpnkdpiMv+4cYJT78k2zHL+h5jEEwmGLtZO7/8uNVT0e3bTQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:53 +0200
Subject: [PATCH i-g-t v10 36/49] lib/igt_pipe_crc: Add unigraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-unigraf-integration-v10-36-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2qg2ocuO8er62yszEvV9FhB/Tdo9BIKzsEsNXfQOnuI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABAsXloFs8gLi3FIqIUSLyfUN1oZ1fkk2zYK
 S7UcvO37l+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKQ/Q/+L1Grdi9/v9YZ8X7Z/AS+AxZ7F5HRNDA
 Yg/nFjd7VEhvrOocvtgSLdV8QUh/uUrBv4awroPtT2xAibsOt+fPOV67bIQKBCrmazi3lDtaX9h
 ADDBR4vX5AHKBh1GBhcja1+ohy8rvci6szj1Fdtv0R7yqlz5EUjH+RFwh+bl8w84Z9cQKH96NX/
 bzdgwHKPEn/o2/OYc7xgRU1mgl0RRBQF5O388N7RWzZdBa1TvuiZpupu8aOcIHlxb7W6TK2f6NO
 aRCaQTzFLQ7W8mDUJNPmpkXIg5EVStvDysU3WLimP6D2dBUg2xp3Zk/9JwlkWVQVFvAIIU5qO+b
 6bA/C2nOfgWib/7AtVUhw8/MJL0535RjL86FWRmDikz2kyUOY2qzkz7zVJLbrFs1NU1TM8cnORz
 mzeBREmEAIDGD+EUtEzOpRFYvfAfCIyBXY/Te4xXzgskx4qqP9YYfe79R7jE85xeG/wK2QBX5NG
 KYduwsPXecOuCM6Wf4yPxpFeGeOFlLm8yhr7mNG9E0icYhM3j8euyeKtQTU44i5qpcNkctnW7ZF
 T+/DGbLuFO52AFqdtCYhyRtmRLswiwawULMMeoSuJQJvnHa56CQS6SPzPKd1gfZmlcB3cV1qhmp
 NC7cVdvqQdE/kdV3kSzKKQX36qqzs+ZEggJA0UG4gIQKmFa4MNtU=
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

Unigraf can read crc from the physical output, use this CRC instead of
internal CRC when configured. This allows to also test the hardware signal
generation.

This small addition allows to use the unigraf device for most of the
kms_* tests.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_pipe_crc.c           | 35 +++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.c | 22 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 9a79edd51531..ad76e5ca37f7 100644
--- a/lib/igt_pipe_crc.c
+++ b/lib/igt_pipe_crc.c
@@ -3,9 +3,12 @@
  * Copyright © 2013 Intel Corporation
  */
 
+#include "igt_core.h"
+#include "unigraf/unigraf.h"
 #include <inttypes.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
+#include <xf86drmMode.h>
 #ifdef __linux__
 #include <sys/sysmacros.h>
 #endif
@@ -359,6 +362,38 @@ static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
 	} while (ret == -EINTR);
 
 	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
+
+#if HAVE_UNIGRAF
+	if (unigraf_open_device(pipe_crc->fd) && unigraf_use_crc()) {
+		int crtc_index;
+		int stream_id;
+		drmModeConnectorPtr connector = unigraf_get_connector(pipe_crc->fd);
+
+		if (!connector)
+			return;
+
+		crtc_index = igt_get_crtc_index_from_connector_id(pipe_crc->fd,
+								  connector->connector_id);
+		drmModeFreeConnector(connector);
+
+		if (crtc_index && crtc_index == pipe_crc->crtc_index) {
+			unigraf_read_crc(0, out);
+			return;
+		}
+
+		for (stream_id = 0; stream_id < unigraf_get_mst_stream_count(); stream_id++) {
+			int connector_id = unigraf_get_connector_id_by_stream(pipe_crc->fd,
+									      stream_id);
+			crtc_index = igt_get_crtc_index_from_connector_id(pipe_crc->fd,
+									  connector_id);
+
+			if (crtc_index && crtc_index == pipe_crc->crtc_index) {
+				unigraf_read_crc(stream_id, out);
+				return;
+			}
+		}
+	}
+#endif
 }
 
 /**
diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 29db564b2ce4..ae8036526156 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -68,6 +68,13 @@ static bool unigraf_crc;
  */
 #define UNIGRAF_CONFIG_USE_CRC_NAME "UseCRC"
 
+/**
+ * UNIGRAF_CONFIG_MST_STREAM_COUNT - Key for the stream count configuration
+ *
+ * Set to 0 to use SST, 1..4 for MST
+ */
+#define UNIGRAF_CONFIG_MST_STREAM_COUNT "MSTStreams"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -367,6 +374,7 @@ bool unigraf_open_device(int drm_fd)
 	int chosen_device = 0;
 	int chosen_role;
 	int chosen_input;
+	int unigraf_stream_count;
 
 	assert(igt_can_fail());
 
@@ -423,6 +431,15 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
 			unigraf_crc = true;
 		}
+
+		cfg_error = NULL;
+		unigraf_stream_count = g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROUP,
+							      UNIGRAF_CONFIG_MST_STREAM_COUNT,
+							      &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("MST usage not configured, using SST.\n");
+			unigraf_stream_count = 0;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -501,6 +518,11 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_reset();
 
+	if (!unigraf_stream_count)
+		unigraf_set_sst();
+	else
+		unigraf_set_mst_stream_count(unigraf_stream_count);
+
 	return unigraf_connector_name != NULL;
 }
 

-- 
2.52.0

