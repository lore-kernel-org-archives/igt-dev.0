Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291BF4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168810E25A;
	Mon, 16 Mar 2026 10:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZP1nCLFV";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F6E10E252
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BBA6F1A2E28;
 Mon, 16 Mar 2026 10:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 91AF55FC4A;
 Mon, 16 Mar 2026 10:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 769BA10369F12; Mon, 16 Mar 2026 11:24:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/k+lmRxwQtnXIkJsn/o7k2uDURRoM9ndLwKN7AkS2zQ=;
 b=ZP1nCLFVidjGrIiEgzRxfRYhZ4eCWJc8VWSo+Fg0Wj4azAZ4XJLebhqnyyxloaZm/l63se
 c6Q6AjgzNL3WFB3lNwfV/uenhBVYMK3YptNWaLz3ZmDq/gtDtZ9xeWR6IgW9anugHjDwYL
 aKDtW0mSPecK8HuEokDKCFIlnYBjylb/VZaz4cBGjSMqPPKk6tEbz6Bt79BXLlpcdQogiS
 65MLTcqPWO+jgNhM6SskaeHeI1Ph7zX/Fk0KO/kYB9dfeWvBye2R6dCmW8lgYGLOPWgYyc
 xTezzr17TZYK0292H2kRTMcht+dLg6V7kyOKgSC+vbLcfFbTsCQ4d71TKi6P1Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:44 +0100
Subject: [PATCH i-g-t v8 36/49] lib/igt_pipe_crc: Add unigraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-unigraf-integration-v8-36-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3614;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/8S4dD5gBmKL6XLGBrmLH6qPctngkCzfg1Za04WN8qY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pTgUA1yEqnx3JUwKMwcBrYjmUKLrlIVRurI
 zxIOXSvnCGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKGSBAAgGfg3/39NGEsr/ys44+bZQiEXHE9DPC
 pIxUWTNtyiSGR6GHdlkpZgiCQXswHpw77kkQUa6YTqK9lG1yNj7g0H8A2dEFqwFlkogArjoeQAd
 //JF9744ofgU+wxPVmJojLr9XIF7mofHajwvly3xtkjanPVt95IMmg5llh28tkWY+RcSuo3iZ75
 EPVroakSIlJe92tXwGUYAG+MKrfwADV+jhPijwqvN+JUxkK+78njjrBcK6hl1n4r3jtZdBYXRvs
 gmeCNOVEveQwc01DtGYvvl0B7yrn08S89J003RKnmkk4GZ4eQGiG6kY97T+ZU2WlJu05BTlT6zC
 B1kEE8j3UxbP28WK9mRbvKZZlVGvJtNaIpBt7JD4Honeax9xt+povMxqTjXde8Wnfua+pMu3Xsx
 fcrT6L4XxfxOMnGnnzA+sjum1k/rZ3FtWWDkfF67j+e1vsV3gbUv1KkacG2mYOWUwsTLH45MVL3
 kh+YtzNE1vS5RfyjWvmLfQ/AKOQ1HoalzDE716XLfq5z9uN90fv6qrz65Pmlj7jXwpuTBaDJ0cW
 KQxzvy12VpEZJp2zoq6A+vfH6MSgL7a7oGAdOTvbdai8TnrNFWVs9K0Hf6s1Cnpxd5u2eqPV9rn
 HvGf5ziIzQNvB8ZA3G8//1jqTvbKEmhN5ANK+EThQVPyDFlBKYGQ=
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

