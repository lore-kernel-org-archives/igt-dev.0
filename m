Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F39EEA4FB4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1B410E384;
	Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mOpogDtG";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012F10E374
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6A8E3C143C6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 354635FD43;
 Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A2F410368FAD; Mon, 23 Feb 2026 13:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8Y3da/560tEqTvzbeECd5TsqIC3g4cU2I5MFBO5AwZk=;
 b=mOpogDtGfzqaTML0OeKZSU1y6V6CHTKzNgkpq06Q65U+7lKj7VuKPQr8tyTM2xl4nVD+LJ
 QGxQQku+Km1eMaIbm6vpxy8Tr0BC9EMWZrv+o348XY0W40KC+O0NldT7iaAT0JvUVUT4u5
 oIfXx9GjnObs2cLy+wauvDznwGBQzvRaGme1GWvPV+GdJZ31If7ovh7n3Q10K94qAo5frB
 NjIaDivdjIh26pdUb2njwn6PV6uktqF6zWYGBLZ7gWalk2G95oR4xyQWXQKra9NBlH7gUQ
 9DA6WzIixS/xXYMKEaBPcaRCfyYs9+vNf/PuVSMwDsqcGIgsd6ZlP78oFy5W0g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:42 +0100
Subject: [PATCH i-g-t v7 35/48] lib/igt_pipe_crc: Add unigraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-unigraf-integration-v7-35-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3554;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/100NZodbr4Rg1K8zKQ4bcS5KFEiDed0vN5OZKYkmok=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENrZovNySFVlWtkdbCi/t8YHPurdyUEJlg5I
 MaXa3iIQkOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLvCw/9HeJ1iD70+iO6bKMbjIiqXQchdlpRVOp
 vu62JLYJ/gPApwfV+YM/aN6g7YjzH2JthlX8M/d+/Wx5EWhhNL/7ZesEBsmsFUVnk+ZqAUdSASz
 zXjIqR/+iA6iYxl7KnG9yWiWcyftOdWyo9HreVRsV5I66zvI+29mBWX4+4jaF9zcdgJ5qzOKDOU
 KTC7jIYvNRAimpl8qEI+A6RKB5wMlqi2rRi3YSf/tUbqL5PfPiNKVOPHh7tQ4lIxi+j1g0qadp/
 hKT3xccdAbpqmVFk0tvZAyINqXMIp/feRtQ+CYAZrbI/DlW5CTVz0w8SQzk9hxIVM8aEAj1GiC8
 7G7EnMJSSiRoP8eXoaSG66qsBht2twHAHHge5hJ1U+Y7yu8DiFjTOV6WN6CnVA7kbgF0+kprN7b
 mWr3gJto4pFege71LGS/Pc3vDhh3ElN0CILNv5EvVtrNi+D5lV//E8NNfaulEH+tGe9iH77URDH
 aETugzzLjWHBtTdcFXJHA2GhrbuKiutV9+DadzMlMP5Q17R/ZkmXe0epFJWeWMeb60+Ne4GsR3k
 s9q4nRtZi7p3CjSMKr0RL7ZuGI1sL4rMgKeHsmJN79j6YKtP5Wv/V/nQC4+iO9RJeu/mxO1q58X
 sqW4BVEa4uGbBJXkwQFzQZGqN3uPIxmf2jBULKb+hDXEExoLyUF4=
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
index f30205bbed0b..17b96aa3ac89 100644
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
@@ -357,6 +364,7 @@ bool unigraf_open_device(int drm_fd)
 	int chosen_device;
 	int chosen_role;
 	int chosen_input;
+	int unigraf_stream_count;
 
 	assert(igt_can_fail());
 
@@ -413,6 +421,15 @@ bool unigraf_open_device(int drm_fd)
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
@@ -493,6 +510,11 @@ bool unigraf_open_device(int drm_fd)
 
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

