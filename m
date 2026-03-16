Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46545F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F150D10E292;
	Mon, 16 Mar 2026 16:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ViXm7atQ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8678E10E3FE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6913B4E4260B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40A1D5FC4A;
 Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 450D41037220C; Mon, 16 Mar 2026 17:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/k+lmRxwQtnXIkJsn/o7k2uDURRoM9ndLwKN7AkS2zQ=;
 b=ViXm7atQSS9KrhHveTCZOMFvwIeKky8KBCvKOOQLrA4cmyY9eMvnGVO5XPvsn0IcM8OgXo
 i7CjTWUvO0B/IlDBlW5mhcOgFHU1ktqBFD82vDzjMLQofMSrPCB95Wew7Sf8gOj98foK/s
 IegtBAccZsYIclGTJI5zLHH0vgFDG+prCZL+HORV35LG/rmoEVv8W7gnLaDymWFHSdpjcz
 IX+F77/7TBi/H9cyI/kznWPV2g26QYKAXRihrkJ2dpaTDyH1qwI2Qs3oTk3lb8XCeOXhR6
 Y9BoQh83+MFAWn9VIV/38PyoZw2F5AzaUNeBzXSBZXkGL21jiU69PqTDgYsi4w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:57 +0100
Subject: [PATCH i-g-t v9 36/49] lib/igt_pipe_crc: Add unigraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-unigraf-integration-v9-36-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3614;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/8S4dD5gBmKL6XLGBrmLH6qPctngkCzfg1Za04WN8qY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6O9UIpqyyTtLrVZyLTLYOUJqTSsvi0ZT+/v
 cAe87kMS+aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKA4xAAv1zdglYu8gVwo7gkVq/eEgBRha/jbzZ
 lLnfLAmb05DnGM4L3l5Z/uhliBVLsLSLTQQPoTTS2ZNWPEaylGYcqDJQ3+F3mzh/rCbZfSUjNTb
 QBbCyidsMqfkbtH/PmEM52GPg/VDSH4UOMIAzIKVnLmKd83IKqyF0nK3mebTv/0ezN5hWPblYde
 Zm6e11YIstvyOdq84wcoh4+2PbZbkLzB+rePDcrXOnbtJQZgEMptWsgpVxKBlFH5rPKUvuBGcwi
 MjBzjVs0cECCsjpwQUgssBVD4Gbb6Mwx2UjCyzrC7R0bltCQeY2wTM5y8AfS9nepXAzKcPB44Mg
 5mDS0UROfi11c6gVDf74PDiggGTMmkTiB7Ix5/S5jOhGh4aBRtR33Baq+HjCJS+XoediToEd89x
 qZ7/E0GZb35tWeYyaJN4bP9Nia3c71g+19LBCL8rbV6oa/iMH/TELw9hIZ+88m7cYMTuhrm9bfs
 bl/qa634ktEB+58i7VFJ55rWM5TDOOrJQ6kujJVifVSEddNAyGyDKeyXQpz0ZoDYzvRhk5l/GRf
 XLeQhnsa3MenLnQ6ZOLKMWcoG60/lCor1mJ0sOkcgJF4UPfTwsZ5b9R3UsvpSN3hxOD64AP/JfG
 3XSTVl9Q8oMsOPsJMKpThPK3LKZn35N1kY5jGI237ZUZ3trOUw2I=
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
 lib/igt_pipe_crc.c    | 35 +++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.c | 22 ++++++++++++++++++++++
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
diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 3970c1071cc8..83ea1eb1f91c 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -66,6 +66,13 @@ static bool unigraf_crc;
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
@@ -362,6 +369,7 @@ bool unigraf_open_device(int drm_fd)
 	int chosen_device = 0;
 	int chosen_role;
 	int chosen_input;
+	int unigraf_stream_count;
 
 	assert(igt_can_fail());
 
@@ -418,6 +426,15 @@ bool unigraf_open_device(int drm_fd)
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
@@ -496,6 +513,11 @@ bool unigraf_open_device(int drm_fd)
 
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

