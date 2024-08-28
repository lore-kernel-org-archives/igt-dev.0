Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB70C5B55B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B1910E54B;
	Wed, 28 Aug 2024 14:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HtOTupwd";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448BB10E547
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:32:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 09B44C824D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4545C000D;
 Wed, 28 Aug 2024 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzRXFeNK6rZQB+Sn7i5n81C/GuWUk8bU5rEdkMs8Ums=;
 b=HtOTupwdbvfROjHP0htIgr7qFHW/w++i5cqedPmUFc1lwkpeHSPhmM18k1HeuNdLX81UgT
 NMNSeTMzPSzj4Xh5pZoRO1Cqe2xEXMiUiP5unE+csvH22+Yy47O0zueHguXQhnySviX+X/
 QIOGlbhQIc+7U5B7JOGYxqLCBlvehapyXLTrLEqNBAO9ixen+RKWzJDEJH2kfZOeei3f40
 BXMbSmPgyqUkw/gt6ZOUH3YnJsS1N1xVa4OSkBXRx19hBuEYiCspEjxKfXXMDvMO1xpX3d
 YDgpThn+exSvHh26OaOM8XlRmrl2AloW5ZcdCH+5vYE7MCcO+KtULI+aRKK60A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 16:31:53 +0200
Subject: [PATCH i-g-t 4/5] lib/igt_kms: Add helper to obtain a connector by
 its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-01-igt-kms-v1-4-d6e21b1e5d04@bootlin.com>
References: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
In-Reply-To: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=utTydvIQaIgUEzWMNR/ZbpJQKapyP/uAxn9u+LgFKWo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzzTZ4lZX/9YlK3/ibPZl8ERizgszDaklh2hPs
 ASwjfmhT7iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs802QAKCRAgrS7GWxAs
 4kBgEACrSI8JqA4FffPtZU0YYrNdpni9lsV8/fjD48sOmBQgNbWFwCpMOHjfHz7NQ9Zmb4zjQpa
 6bRypBcDUnzgzmeRTPxjQ345fFak0vZtpjD6WNMVi3bSkcGLnIDdelaYD+lQ8lkwPxX6T3w86pR
 rdt8n2Wq1Kfl21QNQaNMndNowtowYANedC6Z89gizdmHxlqq97zQk7UxbAT6zkET1J7Bmkce4jb
 UrqpHKtNwH+3AP7+kzT3P29DGinFC6lMSDd1QNwELyMvAtDjWBCMLkIn2XBvsa0GKrP7j3kkP5W
 RBCd00jlSD3wsSGjPdikLazRyHKqsRvrf/mVgB4FJPQmfdjjx6z/q0ISdm1WOg1blYaGEAlLGxO
 AJY2o0meczzc0fEHNKkrwzLqLTJXCpkX2KY2XiCx1quwbjR2LCTzwETCacxztLUpvATzto90Te5
 d/fMr3sRUlwnbBzs5tqECD7pTDkcuFlsurpTwusZlNW0yvsL4fvZwPk+0RmTg1rBimaWAwo6Hoe
 ZRSpOo0lS4e8tNIy+hRRBRhKbPabzXCdJbLKtcmRTChtZgofYK6L8gqcNg5IQYPsMlCQK2wjOwk
 Mk6LtxsnUnrdS2kxHTdM6e8Gwa7w300FoTai9LFbiOMorZcstqkluoC2Pmwls0Hr4CU++R6rTsh
 BuFvKXdJ0zheeEg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Introduce the functions igt_get_connector_from_name() and
igt_get_connector_id_from_mst_path(). These functions serve to retrieve
the connector object using a connector name and a connector ID from its
MST path, respectively.

Given that the connector id may not be consistent, especially with MST
connectors, these functions are essential to recognize each connector even
after system reboots and plug/unplug events.

The function igt_get_connector_id_from_name() is a convenient wrapper for
igt_get_connector_from_name() to streamline its usage when the caller only
requires the connector id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 ++
 2 files changed, 100 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d4fe4ee7ae4a..45587a4bb9e6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6821,3 +6821,100 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 	return
 	    connected_count;
 }
+
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	struct timespec start, end;
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[50];
+
+		drmModeConnectorPtr connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+		/*
+		 * This time is required as sometimes some id in the connector list are not totally
+		 * ready or can disappear
+		 */
+		clock_gettime(CLOCK_MONOTONIC, &start);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+		while (!connector &&
+		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		}
+
+		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			igt_assert(connector);
+
+			/* We have to generate the connector name on our own */
+			snprintf(name, 50, "%s-%u",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+
+			if (strcmp(port_name, name) == 0) {
+				drmModeFreeResources(res);
+				return connector;
+			}
+			drmModeFreeConnector(connector);
+		}
+	}
+	drmModeFreeResources(res);
+	return NULL;
+}
+
+/**
+ * igt_get_connector_id_from_name - Get a connector ID from a connector name
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to find in the connector
+ *
+ * Returns 0 when no connector is found with the correct name
+ */
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name)
+{
+	drmModeConnectorPtr connector = igt_get_connector_from_name(drm_fd, port_name);
+
+	if (connector) {
+		int connector_id = connector->connector_id;
+
+		drmModeFreeConnector(connector);
+		return connector_id;
+	}
+	return 0;
+}
+
+/**
+ * igt_get_connector_id_from_mst_path - Get a connector ID from a mst path
+ * @drm_fd: DRM file descriptor
+ * @mst_path: MST path to find in the connector
+ *
+ * Returns 0 when no connector is found with the correct mst path
+ */
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		uint32_t connector_id = res->connectors[i];
+
+		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd, connector_id);
+
+		if (path_blob) {
+			if (strcmp(path_blob->data, mst_path) == 0) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				return connector_id;
+			}
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+	drmModeFreeResources(res);
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3ff0cdda36f..0b7dc7e9a3ed 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1237,5 +1237,8 @@ float igt_default_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

