Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027D2E7DEF5
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914310E4F6;
	Mon,  2 Feb 2026 14:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hzx/jh4y";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEA310E4F6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 04FE44E423CA;
 Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D029060767;
 Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA2A8119A88FA; Mon,  2 Feb 2026 15:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bsS544cEk79yXOpjp+6SFmlG2mAoWPEUBTt52kHh7OU=;
 b=hzx/jh4yd4/26d5K5tEGb0jUIQPBxGMGF1dQeaxYxepttxxtrHx+GJuPzoRqBX6ikvGif9
 rIdM/HUCfTK3u0HDizZFu55P+dBdtbT3+Wiy87ZBH7+24d4kg/p2R6/5w/Zr658ymov/1Q
 U1cepZ3anny+2Np4B3wIgKjiztgYSiup6iVtBTLxaUU6K5KeSHAUUogN3R3KUbtdrrUeW1
 EdEQ/re6RlL9QiSzbqoWgOfDtLPPW00nNAJBDhTh4NPLBasA1/k8ju9mAE7qW6sxB6mV4l
 fPVKIrP4G3R0azQDfWldZmQFhXqjCqBK9XE8TMy8t4fmI9WOu2hDWMtNp04RhQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:14 +0100
Subject: [PATCH i-g-t v6 35/48] lib/igt_pipe_crc: Add ungiraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260202-unigraf-integration-v6-35-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UyP/LFRQkcqV1u4c9Jw04LCGRVmgSv7b5jD8wpvHL5s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWT3LCxSLfjmzlDvkUzQqA6xCdELK2KMs4aL
 xIQBoTogzuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJiKA/9Gw+/vdo8M4s2JQiXClCn/ZTRIwN41Jv
 Z7hlk1hd7x+N8S22G5NYqZSAl0hMqgMsKpWqHUgnzjnX+APGps72f367m/nQU7fer6betR77vEn
 57hd0/Oqx14bNKKVWizpcUul46ap9z+vpmrQDj23NvBUceguTlgL47f3DLRjfjaDnjjcvA2eGb0
 WCJKseMx2n3bTbQEB0LR2XFWuT/N3pYCSSuuofO62tVeR6ku7dxNBT2yzlW8TInBvUaKOJgmD98
 z65FlxEiT+fCx6RNGOI2vC8MVg5pxQFGkLfp2bcv5hmZywToqTlslkPtCX+pf4n3r8hL/ZkciDG
 CJqOIWTE81e2ou0DlkajuIU9q2R1UKVjnV7nWNS4+m6zSPDmeAd7fei4K7OJvOrw5IsXBF8rz20
 vRD3cmevQQN5V8MI6KWMFeFsoeE1YJbfDi3hPtHjbHJwfhKYas0cOEqnQFmqFokG9evThmNUgLs
 Oc+U4QGtQNZCFCACzKddOTaUXS+uPUH8q0MYFNNYQjacL8t2m/T4qymXescRttqBhp+ts4Q+PlN
 ILFTatR1G6w/eFB4uzucg4q8dBVDTg/4/Bu8bsMjUqUlzuuMMhQiI4ZX5VwTB23BYwK3OOlkSJZ
 y8xumnzfyD/QIb9erHEuazjJx1HHu/RGv7ZhL/ARdTi/edndghs4=
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

