Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D173FED3F1
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455ED8961D;
	Fri, 24 Apr 2026 16:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OD2LDhig";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F58961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 510174E42AF0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 29486604EB;
 Fri, 24 Apr 2026 16:55:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6FEB10720A32; 
 Fri, 24 Apr 2026 18:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k6WG+pTCFztsll3YTcoYDi7sQEoXG5I3vsFypKbuiMM=;
 b=OD2LDhigoPZ4j/adapvy+sCYgFlanzPybSOouBPIjrCkdkWeudDZIi9NpTSO/Qo/XRvQPo
 bv6oMgP1vVKiNCcef44ikywBxbIXTaxawePtkefJH9qWInWuTy1CM9iCRDFMJM/FBAY873
 DIGP0aXE21GIEUD8dgrA+Uf+TAbfmys+4oS0RM35pXRmH+CDL9CKXEj3Etc8oXPOpSH8HK
 Stvgu91R0aFKbMYN+DMURta3fPyBziNtaybwNKaiFaTsBZ5aVzbMWI0UEQJ1CyRbm8DPTl
 cK9QOoRR3gs8rJpNmlwpiQ612Pek24ZiLtaz/MrO2L+sIkOSNxfxHSkDMmYOVQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:09 +0200
Subject: [PATCH i-g-t v11 34/49] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-34-0c5f5346ae60@bootlin.com>
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

As unigraf can emulate MST, we need a way to grab the corresponding DRM
connector from the stream id.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index e51495674f10..8779cac0dd26 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -302,6 +302,47 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
 	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
 }
 
+/**
+ * unigraf_get_connector_id_by_stream() - Get a connector id from a stream id
+ * @drm_fd: DRM device where the unigraf is attached
+ * @stream_id: Stream id in the MST streams
+ */
+int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id)
+{
+	drmModeConnectorPtr main_connector = unigraf_get_connector(drm_fd);
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+
+	char *mst_path;
+	int mst_path_len = asprintf(&mst_path, "mst:%d-", main_connector->connector_id);
+
+	igt_assert(mst_path_len >= 0);
+
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd,
+									 res->connectors[i]);
+
+		if (!path_blob || path_blob->length < mst_path_len)
+			continue;
+
+		if (!memcmp(path_blob->data, mst_path, mst_path_len)) {
+			if (!stream_id) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				drmModeFreeConnector(main_connector);
+				return res->connectors[i];
+			}
+			stream_id--;
+		}
+
+		drmModeFreePropertyBlob(path_blob);
+	}
+
+	drmModeFreeResources(res);
+	drmModeFreeConnector(main_connector);
+
+	return 0;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 34bdf15ed04b..e07ca6745292 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -77,4 +77,6 @@ void unigraf_read_crc(int stream, igt_crc_t *out);
 
 bool unigraf_use_crc(void);
 
+int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
+
 #endif // UNIGRAF_H

-- 
2.54.0

