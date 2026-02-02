Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B55E7DEF1
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9075210E445;
	Mon,  2 Feb 2026 14:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Hu1DrrF9";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7410E410
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4A34C1A2C1E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 20A8B60767;
 Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C039119A88F8; Mon,  2 Feb 2026 15:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zK7TTVtkBMvvSc4S9PZS3D/UfqynZLodtmEuEN+mBfI=;
 b=Hu1DrrF9+UFhEwgD7Oqj87pBGMQcaIrH5V56oVJKKjPy6TGogpzrvPXw0RVqUKDIyB0qP0
 tkXEvYEmODDFFANMpDQT4WQeXHK6TfQB8PEIPK8Jr3BPlwxY2pcH8+3kGHNWU/cocJOgyI
 CE/op4KXaRl4EIbMefnKweIKSTFSOpJ1iEtcfI7aLBscUlgjuOxD+lgiqNkr5VkwTQ6oS4
 45JhlMeBNINDefT3CXG9N1+JzSHbhV1XDB+4TvF5RTHHeM1mvk2rsg3c3HUvO0ebibeey7
 Sq0zq9S2HGGbp6JDJAJW0pJlElgynpJousm8xaGRjUUVA62/5QrxKPmPnrmRHg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:48 +0100
Subject: [PATCH i-g-t v6 09/48] lib/igt_kms: Expose connector_attr_set and
 igt_connector_attr_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-9-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BS7p5xrPEUuhZ3zxt0Hk6vlSwMor3QFaBYnklDby+SU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWPgIcMzO/0jRfQI2sdeXrhRo9aRqJJv5xWe
 zQt6M8v8RGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKOtg/+OxR1qRzuZU2NzjKtKDZIvBGMlbJMDLD
 A8KvXDU7WAmKfgrrtTiIqN2QxOmhqfArVUiAOSGqmoJ7d7dhm//gTPJUqIV95U+HVwBJuS/2wdI
 Cm2OhjIsxP8Ht1fhwBLu1sbNpq5rbauovUs/UR7VRQHAl+3gbl2ELMym79XmT3gc3HkdCRvFf4J
 /SO35e3o+gEyG1lHZkVCauQKxgbwoe9QND83tAu2/9YtWZuVJYL9MXyKu+XlOq3FPdqel5Mjqpt
 tzUO82NQFbECyYAdgc55a0jEvHCyJ0psmkOwvPI4HS9F3jFw5r3BEQaK8VmIgEVoXIuMgL2gNCa
 bZDa37qQz9echT/LSu7ZOvsuUd2QPvgpwXmfq207XqARqmWGjkzGbhdSw4zdG5aNQrzRBLzUkGa
 6BkalYJr1rJDen1RwlLPuCn8hHKGVKDUb7NHFlJOJgzfuuOTHXyAdla5vfzkVDE2tNZVsg2vUP7
 IFJZpVWPuPtkBuKhazc/pJ/jeK1ANJUrLyxtEI7TmyfWh04GS+Q4aIZDyfaUmw3xdZtBHTCc9B+
 nnQ+2oVQJ5+Xu+nEdwkU+jjNk63S1gNsCkc1ZAlo+xv3SHc7B1UWlrfuoQdLA0vFc+GUvFhHLrp
 NmKOUTK6hZgtRDypPuBIBkbGwEC5/scaRTiRAvVDQWhCNZAIWjuQ=
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
---
 lib/igt_kms.c | 30 +++++++++++++++++++++++-------
 lib/igt_kms.h |  6 ++++++
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7a0fdece0774..84423b36cd7d 100644
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
index 88a8e016defa..42d47071d932 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1233,6 +1233,12 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 
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

