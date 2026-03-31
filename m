Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EC510F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7B10EC8D;
	Tue, 31 Mar 2026 17:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iiI7dQzQ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FFE10EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6B1D2C59956;
 Tue, 31 Mar 2026 17:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C84AC6029D;
 Tue, 31 Mar 2026 17:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB9CB1045043E; 
 Tue, 31 Mar 2026 19:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NGZILoMjlm/MEfz8GXRz7QRfxNHEavxog4SPtTPRiUI=;
 b=iiI7dQzQRnNwudaGk2fWBu6ZqbRhCohkvENQIU8NZdu/2wL5XS5yOqsJhlFZgfD9fFpida
 iR+ylcLoqUX+pE2tJdb4DBkKbbrHKz3vPoK5mhdOkUz3pOKzU2yjf38IzDBX2FXyavEueP
 NfvJrH/u7sAqzWwjthP5B3QdmC1dn8DqMEVNTDJ15s1muGbN9HnHmbPB3ORX0dG5Bl/zK+
 fXdrkvuHd8vJMovSlJQtdy3xVqAIGN7sMqT9JsoyTdImXwgMSPstEqjmVSWiAwwYluKVdh
 01ARTwU8gM03FW51XZYigbmEJQ4OZM6KUbVK7TfWxoKdFRYSrX+JOcSFmbV3Tw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:27 +0200
Subject: [PATCH i-g-t v10 10/49] lib/igt_kms: Expose connector_attr_set and
 igt_connector_attr_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-10-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=69Tf6O4eQYaniircnLikILg/n/5/hwges9q9V2yfCpc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA8Elasn2pOeYd60tARoUDpS8a5/F5TJhPIR
 UYn/N8CuqOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJtog/+P3luLoXD8SmX02pZgJmxXfq3W0KwKOS
 yA/wEjYlndvw4y2xwM11fSoYan3lZRG5wLJh6makpOlR1CHWH4WLCQqnyJaS6qmKbwl9gjPXMsz
 c+DhWW9AD+Y3ELl4cGlNrb93nzjUctNa2eoJurIQScKLYHh1wSKevbf4A2e+v30gzCnwmkBjT2G
 5tQjC3a33C9KT8HAtbBkVFlBExLpIYIA6AyOmOGgMYzmzAsxvW7M2lXvKQEAKxOCyG4Ot8UYb3D
 rjuaSe5Krqke2iSft+Z4HrGvhGpds9P9AAqa6fsQNunIaFDAXnrzPhqJg08PnccwVJQlEQcSK9f
 cvRQupwROXAtcmQ1yPDJGHzRoIg4PlgiTG5xo3skjgYJMFqcDQFuJN27OuA7s5z9uyzoe0loirj
 5PgWWfxtPeKX1O5/3NZqdeqNwwqDOagl3plsDoIsLhL33ubkb3LNuPG54jYx2HtASdBhkPf33s8
 MYhzVbe2NGEk7ITEyiv/NNkqwxQvfbeZ5adxDmLvKPYAC3zhcQjYezXRoIg3jYof7ldQvwLMV9o
 Rs4Kd4THhJKt2HmyyoAGMhhf0+SNSi81zQq4Y7+1iLxwM6HrPqp7eVo/FVmz0L1FIjtNS9YwQBM
 nYDLanq/NS/ah0n83TJf3mC9EXrNAelNNxjq0zpEocWz42wIBKBs=
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
index 0ac4eae008c8..f78acd2c1f3b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -102,8 +102,6 @@
  */
 #define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
-typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
-
 struct igt_connector_attr {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
@@ -1685,11 +1683,29 @@ static void connector_attr_free(struct igt_connector_attr *c)
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
index f2c9fdd996ce..8dc06a8cd808 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1222,6 +1222,12 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 
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

