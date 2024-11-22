Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3421E6916C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9940710EBBF;
	Fri, 22 Nov 2024 15:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oFmz8k7A";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3354410EBBF
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:19:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55B881C000C;
 Fri, 22 Nov 2024 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732288760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtO+gVesUxFDQKPmFpKyvKxQ0V/PRkDzRKGU+zIqj7U=;
 b=oFmz8k7A8FyvkTJnYRMg/V9vZdFmgLlzGzFgIXp9vwBqa8kJY5hYtakMEZK5oDLDeEtpLN
 BolP16BvHQHxKmlacxEuoMENScoH1Ym+npGDdTpUPVT64r3UJKzmRLubfnix0rh7T4ezgd
 qI88sxxzy8Tt0dvTGkd51TxVIR4NijWPuPd+qFFO37YTmPTqiri9G/DL8Hxi9fZ3PqsYam
 S0OTTe5nk8s4LVQeVIWu+8eLNxhp4AkYaDVafvwaAX86F3eGXqs/Pb51eQV1ccqufBPyXx
 x5uoFZWqSwfC3zu920nONOxlBX9p/4qXOi/DEe6lJWTTLYOqHH5bbMCxmGPWuQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:19:06 +0100
Subject: [PATCH i-g-t v3 3/5] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-01-igt-kms-v3-3-c5ced6976e11@bootlin.com>
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3137;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=f240yhHp/IGCQa0ocubl/RwCPZdPzyxMxiJbW1Gbe98=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKD0/WdwbT0+XEFxZ/b/rBDVW+nWWUcnXyRUM
 5peJxsOJiqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cg9AAKCRAgrS7GWxAs
 4nawD/98HhIHUO2xvElBXPOW97AXtb5aM891OX7PjNXWA6MEZ2fc9z4/xaF6bOpFZIF1ySgLsPL
 qpDICLZGU3jOr9ceja2v9Dw+ElN72twCw1Tgeg+JGmEkswmc84hLc4AZNJx6Jd5OkVtKTcQKKWV
 ueNYka9HCXKtAD5lsy/DAouz0Z2xu5/iDSf7lDgIklRVd3b1v2vRan7CujDOuV9rgfXyZl91uvG
 mtBsalTx6b2YBQAOuseYbsniGSrAvqtkSfuZYEkJA37S8cfOQGWn1AN5R7ziX8jiQeuQXZERBKM
 nJ2pKH8KM7ZGtks5vl6/J6x0kYCeTXGN9V1c2Jjd1OU9S7kx7nSINnOBY/O7WB7JuNgrBfZ09iZ
 lerHUAW7AhRvCb2RjXePVr45N6gCvxW+FYa9HYypCWYuuHgDsek6g70b6NZQnr3isho7UN0PDS1
 FECJqB7OoYsZSqNqGgM2DCyTyC4hO5fXYj/yrz1OS9Iyh25cd2o2+9PV1TYe4XtrCmMrwa2krSY
 OG4GogEO9C1yWgHOi4hOWhSq+udbywbiJWYeb7n/OV9Od8tZM0DEh8AGK1yEjEyIqw6SRnDyV05
 Oly2Mz18UijH/OyJrJpJjMghd6K9p+HYIGhMGS82Iyax+cIWAkyHI1L3YscBKPPH220tGPqlsyM
 0K2BwGk83wsL5XA==
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

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 58 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 626f56b8caa4bc0ba98c69aa22d0a6bf80aadedf..5d3f609d469d741d9fd68a9a0b41ab0162d322b6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7257,3 +7257,60 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file description
+ * @connector_ids: Out pointer for the list of connector ids connected. It must be freed by the
+ * caller.
+ *
+ * This will probe all the connectors and return the list of all
+ * connected connectors.
+ * Returns: The number of connectors in @connector_ids
+ */
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
+{
+	int connected_count = 0;
+	drmModeResPtr resources;
+	struct timespec start, end;
+
+	*connector_ids = NULL;
+
+	resources = drmModeGetResources(drm_fd);
+	for (int j = 0; j < resources->count_connectors; j++) {
+		drmModeConnectorPtr connector = NULL;
+
+		connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
+		/*
+		 * This time is required as sometimes some id in the connector list are not totally
+		 * ready or can disappear
+		 */
+		clock_gettime(CLOCK_MONOTONIC, &start);
+		end = start;
+
+		while (!connector &&
+		       igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
+			connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		}
+
+		if (igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
+			igt_assert(connector);
+
+			if (connector->connection == DRM_MODE_CONNECTED) {
+				*connector_ids = reallocarray(*connector_ids,
+							      connected_count
+							      + 1, sizeof(**connector_ids));
+				igt_assert(*connector_ids);
+				(*connector_ids)[connected_count] = resources->connectors[j];
+				connected_count++;
+			}
+			drmModeFreeConnector(connector);
+		}
+	}
+	drmModeFreeResources(resources);
+
+	return
+	    connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6c6df3f18dde72459d09b56192e108da5d951bdd..33079b696c070ee7b62ec1d5705b221ba4ad5a7c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1277,5 +1277,6 @@ float igt_default_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.47.0

