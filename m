Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94049D25B5D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D1D10E119;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UAOB9CY8";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6A10E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 649C1C211E5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFA3B6071F;
 Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E5CEF119A880E; Wed, 28 Jan 2026 14:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bsS544cEk79yXOpjp+6SFmlG2mAoWPEUBTt52kHh7OU=;
 b=UAOB9CY8H3O6SDx55i4DXAW4687L0T4g8GrqeKLrzR3aMeAB6i4J7579IIFxehxIANBi3S
 L75khBLtwndeXlgXjc+o79X1GicO+/SgauZWTJnCs1TvMX2fdAHsiMayxmLfN39HRh8Wt4
 8Wk5Ke4QshjtBMOOVJEwgQIGgUKGkmF/fr4PJzmTcikeNRvqv5gXb0bwqkL7si8ngfdh8r
 pafk7o+y3ZI32IHly409J378X9WJm4pAMpAnOSIU1YxVrAnB6tQWlhZkXMK/arGcI58bog
 gOqbpbBJjv/HI58svWlCbpa8bdXE/PZWwioKxtnC06Nv96KHE4qwBVaMQDQzbQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:06 +0100
Subject: [PATCH i-g-t v5 35/48] lib/igt_pipe_crc: Add ungiraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-unigraf-integration-v5-35-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UyP/LFRQkcqV1u4c9Jw04LCGRVmgSv7b5jD8wpvHL5s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvM5Fq0aVBKvweJZjEk8M7pe1JdnemSa2WV/
 QEkUmkGeXaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLgExAAvq2EW14tvAi96Ma6UjjESNwjHnaajz1
 SEM6I94EjibSJAXcwNaSjwZgFnO7Nj6zByJ+XmUFqMnphyXbuus2sSWmN3daUN4UhUDb2o+uzDc
 n38cl5UUU/MKlMAG/3KwFzOc7h4kVL+m7bWKtTFDe2kDbJ54wSVjIWOtcJdyB7/I6DTZ47iqbor
 4AenpE2rA/Pq4yVN9rGMwcOIL8g+OldWY+cEC7t2KQ8eiJb1E3TxCMnx562Otm6PIZVszSDrEk7
 DfZgIMHZcBIZISsDH8Go1wlCrObuA0WMqBpe/Rk2Y0U3YdbIAg2juZ1wDAJhyv9VeUEJsOGFWZw
 cZQkFp7z/ut+UfU3E/ScF4T/zjhNWkUt6HpXaiUmRHXcS/Cx5w3wzRS+CJxf41uNRyjTzw2R8qZ
 yV6imHXG/cBd8phNKiJXrhQdVWvC+g61zLM80ORr6zbznIJ6q6V8h1FTMfIsnd37g1Pt774Ld6P
 JVhoftuonI5q+G0UAKhK0Cc7UesgyDW4VzHdQwXU6saWnXdFTxoECwgOyLzjkUwSUGQPFxgiyoB
 zW3wMDeuWE6ri3v7C8RaH3aF7p3TPoJ0Iu3tC65CrJl5FKDlqGzF+5siWUOzKO6+NadVf4Lw0MH
 3LnT9semIx/WjckShvBL/fDZWbERZ31QvsUEK/q8VbI6HHo6TzMI=
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_pipe_crc.c    | 35 +++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.c | 23 +++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 9a79edd51531..7bb724311890 100644
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
+		if (crtc_index != 0 && crtc_index == pipe_crc->crtc_index) {
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
+			if (crtc_index != 0 && crtc_index == pipe_crc->crtc_index) {
+				unigraf_read_crc(stream_id, out);
+				return;
+			}
+		}
+	}
+#endif
 }
 
 /**
diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index f39eb2ac1942..fbff4aeccba2 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -59,6 +59,13 @@ static bool unigraf_crc;
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
@@ -357,6 +364,7 @@ bool unigraf_open_device(int drm_fd)
 	int chosen_device;
 	int chosen_role;
 	int chosen_input;
+	int unigraf_stream_count;
 
 	assert(igt_can_fail());
 
@@ -384,6 +392,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
 		unigraf_crc = true;
+		unigraf_stream_count = 0;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
 						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -432,6 +441,15 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
 			unigraf_crc = true;
 		}
+
+		cfg_error = NULL;
+		unigraf_stream_count = g_key_file_get_boolean(igt_key_file, cfg_group,
+							      UNIGRAF_CONFIG_MST_STREAM_COUNT,
+							      &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("MST usage not configured, using SST.\n");
+			unigraf_stream_count = 0;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -513,6 +531,11 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_reset();
 
+	if (unigraf_stream_count == 0)
+		unigraf_set_sst();
+	else
+		unigraf_set_mst_stream_count(unigraf_stream_count);
+
 	return unigraf_connector_name != NULL;
 }
 

-- 
2.52.0

