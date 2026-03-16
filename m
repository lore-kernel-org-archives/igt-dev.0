Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF43BF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643F610E252;
	Mon, 16 Mar 2026 10:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="u0Czxeh0";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495E310E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB3DEC40404;
 Mon, 16 Mar 2026 10:24:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2105FC4A;
 Mon, 16 Mar 2026 10:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DF6510369F2B; Mon, 16 Mar 2026 11:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6EcE2qxMle+TG+wJSgbKVMDJVCNSb9z1+xs4HZS+p6E=;
 b=u0Czxeh0lbN7THmZuf+laGWikF266edxoEDBP3dwZpxPMjNdvevlb21ywK3ycQfxWoId7Z
 z+4Q7ggO75zyBmo6xTE0MhS0EgFN7zILJvr/4qQocAx7Y8GS3rIcY10h1inWha5BvW3L1+
 6MX3XBFnHFCrBdUTIxCIIqyu740/wtLMw5TIROGZKeNy9QMtUQsKBDFMO+9saFsm86uAqg
 6MSpmd+c4Ufvtd5/4qX7sD7STsD55kd7jdYb3Redolr6nq3PQdHzMWCQzxlA0B4MzICx2A
 l6FhpBQFg6ETOqNInX/sytvewjH5ZYP1eJOQh5WNDu1YDzZNe3oOJYhu9KXovw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:18 +0100
Subject: [PATCH i-g-t v8 10/49] lib/igt_kms: Expose connector_attr_set and
 igt_connector_attr_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-10-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mEalr9OApTui0QytUpthazYtkWyOgfcWb98CZfilDBU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pPWqNy6aUIdYDCxq0savOcs8gqW93LlLHvm
 vtMExXceiqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ9HBAAnJaHfbQNvZWLzYsmpJEkzOZ/FY8dw36
 N19nwk15U3uHgz15k5AY1YR/pC8GXVJXPj6bTebN1pOIqcnt0EihJWvqFNxeBbhHB+wcbZ+CAZ/
 +rZiq3EalGNBOmbzsjWtWm22RS7mSkV4GlBFN8poZk3TfLVxtRtg4wfFWPleYEFqkLeKlIqKTX1
 3IRgdBWHAAAtptxtc6f03+yxo/GkHzoTLNX8CO1xj4GA9e/haiUa22+ImBIKxQ3sooJ7dcQIJjm
 Pa+8a3OTlxeAtzX5mb9zbAMRcPZLxd5fo4GcZSfoDobWP+Lv0YMjlBbioIeb9Ih/C6hYvNB61rk
 V2pj3/evEhUEiAfD94VJ7Ij621hVNOb9me8jhL7x+uc5ayks/1mrfo+i1l36LBb4odKzILIqF4s
 c9ToXPng/ErR4dPy3TI5RARQLrxf6gtJ2YNAlcciFW0hGFwRyH4xix9qPzLFazHAzUKKJDuGREe
 KnvevdWq740mnbpzT1zD/3S4/v1Bw1nEgl8lufrPNmZT3tvdlevHMZgJSSgs5Wjm7HYWff5iIbY
 sihqNzc0BdndMch7OJ3bbM4Li6L8eHWZ/5j5eMnrooRVBgsLJ3ukKWN9D8EPa0NneK5aZS200Tx
 Rh6n7bV6MHxzYaV/CXng3SziFJPkmGdPJxHlBYxoNmqu6URz0la0=
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

Some debugfs helpers need to use connector attributes. Expose those helpers
to allow using them in igt_debugfs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 30 +++++++++++++++++++++++-------
 lib/igt_kms.h |  6 ++++++
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 451b273999f0..ce9f70f31f64 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -100,8 +100,6 @@
  */
 #define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
-typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
-
 struct igt_connector_attr {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
@@ -1682,11 +1680,29 @@ static void connector_attr_free(struct igt_connector_attr *c)
 	memset(c, 0, sizeof(*c));
 }
 
-static bool connector_attr_set(int idx, drmModeConnector *connector,
-			       int dir, igt_connector_attr_set set,
-			       const char *attr, const char *value,
-			       const char *reset_value,
-			       bool force_reset)
+/**
+ * connector_attr_set:
+ * @idx: card index
+ * @connector: libdrm connector
+ * @dir: directory file descriptor
+ * @set: function to set the attribute
+ * @attr: attribute name
+ * @value: attribute value
+ * @reset_value: value to reset the attribute to
+ * @force_reset: whether to force reset the attribute
+ *
+ * Configure a new attribute for @connector on card @idx that can be set
+ * using @set function.
+ * connector_attr_set register this attribute to reset it to the @reset_value
+ * during igt_reset_connector.
+ *
+ * Returns: True on success, false on failure.
+ */
+bool connector_attr_set(int idx, drmModeConnector *connector,
+			int dir, igt_connector_attr_set set,
+			const char *attr, const char *value,
+			const char *reset_value,
+			bool force_reset)
 {
 	struct igt_connector_attr *c;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5a9efc8cee48..6298738b452f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1231,6 +1231,12 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 
 int igt_connector_sysfs_open(int drm_fd,
 			     drmModeConnector *connector);
+typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
+bool connector_attr_set(int idx, drmModeConnector *connector,
+			int dir, igt_connector_attr_set set,
+			const char *attr, const char *value,
+			const char *reset_value,
+			bool force_reset);
 uint32_t igt_reduce_format(uint32_t format);
 
 

-- 
2.52.0

