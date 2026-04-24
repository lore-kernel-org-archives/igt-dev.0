Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CDEFED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF7D10F642;
	Fri, 24 Apr 2026 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZMe1wvW6";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2A8961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3D1ABC5EF2B;
 Fri, 24 Apr 2026 16:55:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69966604EB;
 Fri, 24 Apr 2026 16:54:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 73B3B10720A1E; 
 Fri, 24 Apr 2026 18:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fk5zCeSSsnYiJrhkEnk/r9ZK7tfOF0NalrQgUXHL210=;
 b=ZMe1wvW6Ns48zZTLNo0cIycGP9kgofm8VbQ0M8wk60XHpbpx/Am7UkQOsizHIYjBkRaNQV
 WlpVFKbM1QTAN6Un9OK+XCKoFlW6P6L3SEu7nWCuOmcAJVJgJW1b2srAdkbxMYN/f7pJbE
 YWFzxzeTzUW5vxiJeGgJ2/F35P4QHYPLnn4wDIYlM38o/FvUb+Zlh8mviTT3dqx83KIyRB
 dEXl3tFNaFfeLvh4xK3xPXJfJ6XKpOh0siE57HGgRNUrfOnm+bFpZymtp23V9w03FE7D8m
 jNEwHJ3Ul0whzvTyeR7TmwVgl/LnWDgDQ1QfkWHrttCY4nr55HQvUALeN/s1fA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:04 +0200
Subject: [PATCH i-g-t v11 29/49] lib/unigraf: Add helpers to read and write
 edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-29-0c5f5346ae60@bootlin.com>
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

Read and writing EDID on unigraf can be useful to emulate different
screens, add helpers to read and write them.

There is a limitation on the libTSI.so, it is only possible to read EDID
using buffers of size multiple of 128 bytes, and there is no way to query
the actual EDID size. The current implementation can only read EDID up to
2048 bytes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 +++
 2 files changed, 63 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 930dd129d091..6a4e84484b20 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -14,6 +14,7 @@
 #include "unigraf.h"
 #include "TSI.h"
 #include "TSI_types.h"
+#include "igt_aux.h"
 #include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
@@ -57,6 +58,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
 
+/**
+ * UNIGRAF_EDID_MAX_SIZE - Max EDID size that can be read from the unigraf. The
+ */
+#define UNIGRAF_EDID_MAX_SIZE 2048
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -128,6 +134,19 @@ static void unigraf_init(void)
 		value;												\
 	})
 
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @config: config id to write
+ * @data: data to write
+ * @data_len: length of the data
+ */
+static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t data_len)
+{
+	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
+
+	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data_len));
+}
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -333,6 +352,46 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 }
 
+/**
+ * unigraf_read_edid() - Read the EDID from the specified stream
+ * @stream: The stream ID to read the EDID from
+ * @edid_size: Pointer to an integer where the size of the EDID will be stored
+ *
+ * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
+ * is responsible to free this pointer.
+ */
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	unigraf_debug("Read EDID for stream %d...\n", stream);
+
+	edid = calloc(UNIGRAF_EDID_MAX_SIZE, sizeof(char));
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
+							  TSI_EDID_TE_INPUT,
+							  edid, UNIGRAF_EDID_MAX_SIZE));
+
+	return edid;
+}
+
+/**
+ * unigraf_write_edid() - Write EDID data to the specified stream
+ * @stream: The stream ID to write the EDID to
+ * @edid: Pointer to the EDID structure to write
+ * @edid_size: Size of the EDID data in bytes
+ *
+ * This function writes the provided EDID data to the specified stream.
+ */
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
+{
+	unigraf_debug("Write EDID for stream %d...\n", stream);
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	unigraf_write(TSI_EDID_TE_INPUT, edid, min(edid_size, (uint32_t)UNIGRAF_EDID_MAX_SIZE));
+}
+
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
  *
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index c2caa9c2c54c..40f706ebd483 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -42,6 +42,10 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
+
 void unigraf_hpd_deassert(void);
 
 void unigraf_hpd_pulse(int duration);

-- 
2.54.0

