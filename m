Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D20CA0FE8
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EBA10E191;
	Sat, 23 Aug 2025 02:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RPrlj5JQ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9089610E193
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CACCFC8EC77
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B1E2A606A7;
 Sat, 23 Aug 2025 02:12:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DFAF01C22D036; 
 Sat, 23 Aug 2025 04:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915124; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pij1GWLYj23t0g4rQTy1tjHRXS3rTaBAt97tf5OInXk=;
 b=RPrlj5JQzSXTSgyVH2e5HYKQa5DYf1kJ4uwe6sJu3f+K0AGFn4u7SOhu/rhhbFdlP4DPOW
 zRO8rQw46fiWcYBb7YBPKlJ3bAWZYHxDvwtXNCvfSRiSn/TFRo66wUfScJPUaQnU61DzFQ
 Mcp5EplkgrIuhwx1iVMJMR3y313qexetY1+CBQe0ubanpkHkdwcCYx8ulRry98dqzxBN8k
 T4ISECRMc8gqGVR0ZjkBvLvL0DgoboK5Fq0Ar6DDumRoRJk3azsTZ0ilZQGwf1DzKQnVMg
 UMEVn+8IlsuOWvc+vMiHEZmYehk6jl+xxMFLPq1HPho+CvYQzSDnExu3EM155w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:48 +0200
Subject: [PATCH i-g-t v3 28/29] lib/igt_pipe_crc: Add ungiraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250823-unigraf-integration-v3-28-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tEhmu+xoRRvSKCAe1r1tvzRCEQW3Kp8DDQ+wKfLqX5o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNYx2dze1TyThuBRlfLVMIo0O3NxV2r+2eCy
 65806tZms6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjWAAKCRAgrS7GWxAs
 4u4GD/9e8a6vhN5t9gJuKJEKGxAirXXUxM4NKmvEJBhZa6vpX8/vU4CfqK12tsVPeSpVMvzYKcB
 SVu5PFp3FV6kMzxQotmP7Gb0K7A6HgIayF/quq0OBwlvT9q6DmyimN6lC7M0QfvpA5dz6seXyS5
 Eehh7r+yLelCwQQbdO9nwu48QRYGjv0Dn30OIeb/lnDVHWon5HZ2smrrLNziHbfTjt47L37k+Bz
 S5wkDia5nnZbcSgfje5tXJFL+8sFseOmFW4HxCt3nqrSdz3p7FItTNWgBxU6MjwsSOAmwlF3cIx
 FMaF1pXdpk6sb/ZB7r3MIUOyZhVF0Lvd3Ti3GhyAVEewjC4Io7pmj2Ai3E6dMyloI8xc1zDpayR
 6Xe8guDhPUhxhksHadzQmH2F2a5A0HqNZx4t9Zj30c60x/RreZPFuQkkiCHTYd5MC9tA9EGyxet
 XDsb9tsN/bz3fVJIUTdzw9hlaFKuRUNhXLuLrR+UlgVQMRUXVIBxZ3iWjFz+9VspSZq/+Y/jteU
 J60QLtt9cGINAu8jcq90alzjOHuXLDOvuJw5lfj0DPVeGISWQFUAthjxq8ahFA8MPd81MfY24ds
 SEEQyKeXl/YIktDwzK7XJCSa/FGlA3ITrIO52gl21zdlnx9Vc536QIVLhYrAOv2Y4Cb+UnAgAqY
 KG4Bzn9EWpoMGaA==
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
 lib/igt_pipe_crc.c    | 27 +++++++++++++++++++++++++++
 lib/unigraf/unigraf.c |  1 +
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 866bf2881cbd04df0ae0cc8fe91fe0626367144f..64ef1fe47ea5735b56cf56b007831d404dd5cf5d 100644
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
@@ -359,6 +362,30 @@ static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
 	} while (ret == -EINTR);
 
 	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
+
+#if HAVE_UNIGRAF
+	if (unigraf_open_device(pipe_crc->fd) && unigraf_use_crc()) {
+		int pipe_id;
+		int stream_id;
+		drmModeConnectorPtr connector = unigraf_get_connector(pipe_crc->fd);
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
index 8de2c74affdda741b11933a1a55f1c2d2b1bb61b..d4403a6d42eabc748a841b307f76856454360279 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 
 #include "glib.h"
+#include "igt_aux.h"
 #include "igt_core.h"
 #include <stdint.h>
 #include <stdio.h>

-- 
2.50.1

