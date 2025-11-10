Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D2BCD13D2
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FD610E3C6;
	Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Tr0ULgGG";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454C10E3BE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CC2BF4E41609
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A33CE606F5;
 Mon, 10 Nov 2025 13:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D087110371908; Mon, 10 Nov 2025 14:40:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EH6dOXsf4nTdgy/ZMDi1FwKub9ab+CgaiCz2MqCiDxs=;
 b=Tr0ULgGGmQwH7SWaRJ3J2hzMJpzbva+W9KnVQg2ffhpSUEuJGONru5TxIYjlVtKipj9mSX
 l9GgZL3otMWLWB8cveCHHFTP+lPg4BYArkGVPF/PZpyPFx+MKdjohNBBd+O2gsYSwqCDdc
 xMlHh0hFRNElL4L02x/WdXGV76quu2d6JwTc+wEymmhZ0Fa+qJK9+MpkWGLfONz81+D60X
 tpFus64huPv5EzbZOhLJlBUuKNSSec9GxLXdUlX1m9121MqP7EEPcKrfeHriTU3DGz7UvR
 ZKm1Qh4joGQKv75M7WVVJ0LVbkUqFNPO3HZ8MX+62YYGNVHgcrQSO7l3xaDo4g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:37 +0000
Subject: [PATCH i-g-t v4 35/46] lib/igt_pipe_crc: Add ungiraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-unigraf-integration-v4-35-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3813;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pd5v84XVhIiXfJWWhFm0XWERCx6/1xt5gN/nw8qzOaE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesSBM8uQ4cNhR1HZBmcMY5xLqcGr6SZfeQQH
 ESpF3DXh2aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEgAKCRAgrS7GWxAs
 4naWEACFVWfQBnyF6GZxXNEvvOj5edPdPIzyjHMj/qAHvOaqlaItUx+KF2kdpTvSY8RcDZeeen1
 JooEd2RWcZ4hRVt9GW2Rr30ULrc/cz4c5khCAcrrkTbt5niIj/aG7M60gysNzREDW7TK6E/TNph
 lmFuVJtMnEfTltOgoRZBn1/ScRnNTJdwI7pfljq1TX+K5QpCkQIJMrceK7yRbNNeayDmqeLxnkw
 0uFhah0ITqjHBRWMx2rMGmIFIode7PAdouUOKE3REO4GD54kUDCFXFGU3TTbb4fsS+TLQK9LTfR
 sNvgrmVAWN1k+csCfQyabZaRm8FXt27s+YLV8rOumJBVPCKvxEiMgrtBVV4qd94999gF0hw4PiU
 78hcCBOu3mjILrpe3z54e9/2LdzLTyhd88qTZoBXw3Wk4U19QQ3ciZDqjpIGgohZBVg8EUxnqG4
 jrOER+XPrOq754YAx/BsG2CfD9prWQr8O2wyXGDIz/H8o5t3kTa0pcHVRg/Viw08LgIvchTs2a7
 ouoa9PLdOLY62oq+jQgAymPZ8Pyn2RjaM1Ns7399gkfd7OLMcSDshOfhJjpVFGc3W1L8YeakEcM
 GFFZLmBxEH+C8vxqMjz2lxKQK2wn27S+Hw60R7HgF8O9s7cIWoYuqT/W2mDvbGyzYQ868NdUBHA
 2PbUmGRaDXpC/Uw==
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
 lib/igt_pipe_crc.c    | 28 ++++++++++++++++++++++++++++
 lib/unigraf/unigraf.c | 24 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 866bf2881cbd..32fd7f09ff5a 100644
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
@@ -359,6 +362,31 @@ static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
 	} while (ret == -EINTR);
 
 	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
+
+#if HAVE_UNIGRAF
+	if (unigraf_open_device(pipe_crc->fd) && unigraf_use_crc()) {
+		int pipe_id;
+		int stream_id;
+		drmModeConnectorPtr connector = unigraf_get_connector(pipe_crc->fd);
+
+		if (!connector)
+			return;
+
+		pipe_id = igt_get_pipe_from_connector(pipe_crc->fd, connector->connector_id);
+		if (pipe_id != PIPE_NONE && pipe_id == pipe_crc->pipe) {
+			unigraf_read_crc(0, out);
+			return;
+		}
+
+		for (stream_id = 0; stream_id < unigraf_get_mst_stream_count(); stream_id++) {
+			pipe_id = unigraf_get_connector_by_stream(pipe_crc->fd, stream_id);
+			if (pipe_id != PIPE_NONE && pipe_id == pipe_crc->pipe) {
+				unigraf_read_crc(stream_id, out);
+				return;
+			}
+		}
+	}
+#endif
 }
 
 /**
diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 51f1f13af354..74bc9b2137d1 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 
 #include "glib.h"
+#include "igt_aux.h"
 #include "igt_core.h"
 #include <stdint.h>
 #include <stdio.h>
@@ -65,6 +66,13 @@ static bool unigraf_crc;
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
@@ -341,6 +349,7 @@ bool unigraf_open_device(int drm_fd)
 	int chosen_device;
 	int chosen_role;
 	int chosen_input;
+	int unigraf_stream_count;
 
 	assert(igt_can_fail());
 
@@ -368,6 +377,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
 		unigraf_crc = true;
+		unigraf_stream_count = 0;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
 						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -416,6 +426,15 @@ bool unigraf_open_device(int drm_fd)
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
@@ -497,6 +516,11 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_reset();
 
+	if (unigraf_stream_count == 0)
+		unigraf_set_sst();
+	else
+		unigraf_set_mst_stream_count(unigraf_stream_count);
+
 	return unigraf_connector_name != NULL;
 }
 

-- 
2.51.0

