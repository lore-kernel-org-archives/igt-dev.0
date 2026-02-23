Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8238EA4FB5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7126310E386;
	Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fGcW6xKZ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D3810E377
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2F8D54E41033;
 Mon, 23 Feb 2026 12:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 074545FD43;
 Mon, 23 Feb 2026 12:08:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F233510368F8A; Mon, 23 Feb 2026 13:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3m4NAINhrdbuCZceRGFRhISUWqWvjjnyBuOYcDMqr54=;
 b=fGcW6xKZ7cWmQt7MbqXcDZj/BDupRjciY0D/I3qrzJcNTpmeBa3jBW65ENvoGy9XiFdq3X
 eCQmE1XODYrYhEcQS1JdPYnPjlCsnfCIR5MC+VHBUfMVbswwYWE4XaCemeglna8z619XrT
 9d2Cbq2VgUUDYld/pXiEpEchSa84zGCYyizWLrIqAqD9ZiTtcJIBnypuLCwFVOtfqe6LnU
 uo6mpoWqvJJAwamxPLxu09GoY84uCtTmNWCYaifY/21lbAKzx7tl4WeOJWxzyQi1bPruIl
 79nTTH7OE/U8rOyyMiHSQ7vDvalaoI49FYREuj6hS1QEsoluXMx6fKBPoWo67w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:16 +0100
Subject: [PATCH i-g-t v7 09/48] lib/igt_kms: Expose connector_attr_set and
 igt_connector_attr_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-9-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CX8omOZMm8kvb84NnC9DTfKm5RVgfB7GUC8o9NIDhn4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENniE1VG7r+5HTsAQc5cbHVg/vkFYwgqMzyS
 U1gnAZYmjCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLBDA//W596duGniucc5FSxV/jQYQ/zOp7xJRJ
 qgFcai9j5AAwZDbPc/BM3r1hVJ4yzPjV0FETLqESOoFLcXGwL5zZM6aEQJ4KyVnnQExNUbBEsc9
 5IY9RmcEn2EudMrzwQP/UsIR+IhbGD6bh7XtzYcsoGlKyUwhJRQ0/7qW2w5nC3Vpc12IMcndDt+
 PHc2ZSh6h/i8iQ+xCH8PP4ysX99FQg5XW8NfnlOnRUb2Rfkn8kJYyuiyeMqmqBhH0nSo0mOTdZ5
 3EfPbaYSrkzsc2d9hRvSavt3XqEwDZ7EFpzVU6dYYeSsqhRNLMVlEY14W9tf5H63T9fxK+uapL3
 8WweU5HOErcn1Auqqvbiwa0Lt/Xg06jD6rCcND3u17ugyfNipzwep6jmg92k5MGzaeOcosZ1Hha
 EtlBSrCqeNNPMtwGM1Hi2Oq47AG/+Wdd97hvvZMedwhYNN4uMX57OKGrSAFP/xCgrSoKbjhYJXn
 ainzQJ+mbwK3i6vXlBPITL9WkQscq8jxpYTIfYNKefqrDbQoeqprkoHGqJLmHZp3+dOOcELigaO
 TGkmyYh7DhQo76FKXjyiBbHADTT8t505Stvg298+yJGqxSUeu9BonSNRMRF5C+JgklsaBo+NQSL
 V5aQyJeE07eeJ/jNv8paq2KIGX5Zf7Xd8LXWrNWYkenoZdZCADm0=
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
index 2ea774d79d8a..043d7dd547c2 100644
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
index 23b7110fafca..568d863f2dc4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1237,6 +1237,12 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 
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

