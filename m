Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7B0C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40710E5B1;
	Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dieaXzvC";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F76610E5AE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C80B20011;
 Tue,  9 Jul 2024 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmrxAwOp9UNfC5PGDNgY8Gqtw65xUvpvQl0mVsQ2L1o=;
 b=dieaXzvCGh38YpkxXZVP5fx8BTQWeJs7OYAFYd+yORN5bONVm9jrI7sTwRjqZ2zxEqWYTJ
 iajryWsm9ITAqjyyiReBuXAqQA9uU3tLoXzfayBTfi/l/yeusyUyVoPoA/tTArFPfr+3Bh
 DxnAJItKLS84cBIXK8t1spVHkY5bjZ+imafBF6PXrXyN7DSImxDK32RMualqTT4LyFgFyq
 F/j03gKsMb1+B87qDZBF0h/CB/8P10lGe5vWnoyq62Tmz33DkHTmwm99Y6MlkNrA2ox4nH
 dlPxP3ntDE7aDhyp3E+I9P+DllJSWwbNfa45wHOjQkuj/Pxx2uMx074Wkc9/ag==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:20 +0200
Subject: [PATCH i-g-t v2 04/39] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-4-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ngiV9suAGw2r4E3i329z+uANHLWDx6mnImHAjEGvNIA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViWbeXrmGfEW5cAf6G2ugtEHfZ9XYnVSdmgF
 Gi0BlaOf9WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlgAKCRAgrS7GWxAs
 4irED/95FJYurjUUv2yFpcpbXFPtywjHv/EUDVEd5paO/31t5xq51RhJX4AqiOm2IWl9qqbie17
 pqjwwPrNN7tMUIBC8N9dBltQ5P2jR4v8JCY3GgqYMPh+5QpqAC1uoyITfURiHcF7/+dlJ02nMn0
 4demfExIr+f/VyinsaGO3tSU/F2UVvHZkeDYTLhHf4VMUbF1dTGXsU6q5q+Yu8LPD/DB6k7e/sj
 kQIfnZZExHgGqUMHU8IEcwEQQ0Q6yPNOdZMWzlRDTUvP5wT55j6JpstXpD914tQZdPprAjqJZBJ
 lNtRgJFTHGPhUr+Zk8bg5Y6SNpdq4FFWmCrJZrzrgRzP4rmRmcyRrPwIw5dcZ6ck8dtjctleaL9
 6NPvLtE9t6LuAhis+3jtBQjzw9ITwliPL6U3TfpC+y8kD4ZA69b/xDgqu8cFKquRVb9WB+NlzdA
 zKs4YZaSenjEs7FSpnRgtWMVZLPpFpZ8Ai3EBK2/SwcXrCPkYk3gaKwWrpTzSjH3kv8lxv2zDkT
 IVBErQkfCt8qvyEZ2EqK0Z0SNT7/TS/HQXSNOl14DQPpUrYnirjmmAK4knnnAIjtFf85ggmcJ2J
 mp33It4exDlvJtn0bESOf6FwgbxsWX/fjSQvHaOObiQqkmqzvCxspcykBC2jtVQ0eA6hCElJy0H
 OYvC6JMGg49sk2Q==
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
index f1eadf190168..9669b5004e39 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6778,3 +6778,100 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
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
index 1964c725161e..a7c80372ec6b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1236,5 +1236,8 @@ float igt_default_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

