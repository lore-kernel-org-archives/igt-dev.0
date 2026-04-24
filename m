Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F28FED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DA510F645;
	Fri, 24 Apr 2026 17:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EnfoNwYh";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC828961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2F2CEC5EF2E;
 Fri, 24 Apr 2026 16:55:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C2D6604EB;
 Fri, 24 Apr 2026 16:55:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49A8B10720A2E; 
 Fri, 24 Apr 2026 18:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049703; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HoXnykrfYOQEN8p527t5G9XeQ1im2UIRsm0Vgiky6uk=;
 b=EnfoNwYhNTJILJO8X9FDtuVZojbTx0G3GuldF9uV81fZME6TI6EnuEhOdGTwgoaM0vD9UO
 D4pGTQobTsn7RLuW9cD+Np9G8vkNh9cto7IEeGjGM8w9i1nXyi7rrBdorWFhXZuGMhXLd3
 2VuHtu8Psud0BDASErNbOOhrKAZmY7uBz1eYj2sImVE4FYzzT4h1iytNf71kUCzSr2kKiF
 fcd5Oe0+gLnda/aET5XU5f18myRB8cyfiTJffXsLcOq9D9ZQ11mNt9fWMWBW2woHUUNteA
 JQdvL9CQnCTcpWSvTFq4TUN2xlqokePXNP1DnN8PmVQhxHHgUXvtIE4fvZmA2g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:11 +0200
Subject: [PATCH i-g-t v11 36/49] lib/igt_pipe_crc: Add unigraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-unigraf-integration-v11-36-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
index 8a12fc624c64..8c091219bd40 100644
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
@@ -366,6 +373,7 @@ bool unigraf_open_device(int drm_fd)
 	int chosen_device = 0;
 	int chosen_role;
 	int chosen_input;
+	int unigraf_stream_count;
 
 	assert(igt_can_fail());
 
@@ -422,6 +430,15 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
 			unigraf_crc = true;
 		}
+
+		cfg_error = NULL;
+		unigraf_stream_count = g_key_file_get_integer(igt_key_file, UNIGRAF_CONFIG_GROUP,
+							      UNIGRAF_CONFIG_MST_STREAM_COUNT,
+							      &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("MST usage not configured, using SST.\n");
+			unigraf_stream_count = 0;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -500,6 +517,11 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_reset();
 
+	if (!unigraf_stream_count)
+		unigraf_set_sst();
+	else
+		unigraf_set_mst_stream_count(unigraf_stream_count);
+
 	return unigraf_connector_name != NULL;
 }
 

-- 
2.54.0

