Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9A9C87FC4
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31D210E891;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SUVImWpe";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69B10E0B7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAF0B442B2;
 Thu, 17 Jul 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxoSpbRb+T3gpRz3yJlSotvAFJzjqFtULUaOo5tKafo=;
 b=SUVImWpe7MH6LgHuXoFr4MZNucNwD4YK7pgh0lddQGphJs80iGTlEZxo91gWhcy83bOC4g
 +88u6uPwQ6i27oUpsqQ8Sd0v1GxezNKXY7reoex/KUAZ5IS6DKu6R3f54rLB8eFbf28N3h
 CAELJs8TCQFOHS7M30sHNk2SDs2UZMW/zIwal6tCcaJyzuPT0VHhQQE4oWBSqrjF76MZLX
 6m2tNOqzQEn/tc0HhKZ4bO+eUgNWdjb4bJUEN0DUIb6fn/to9FWC0x9BGTC7+yylkYhJum
 kxPD6dyyIsgoC4G9pFMzm9RfcaAmOkPbY61FANvLaDgzREqa6EQn7ZTeMW0+RQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:24 +0200
Subject: [PATCH i-g-t v2 04/26] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-4-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4826;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CaHnVozEL2WJtMhBg4sUy8GykPqUBsKU2sb9si6QA/U=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUIE7kX524r0pKUzeXgwfhI0wKOwKtfzi699
 mSEG36FJFWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCAAKCRAgrS7GWxAs
 4mg8EAC5aWFBJKYBw9hIshHmqtcgqubsryol4zzcMQmVz2NwqaMCiYhD1yCExOg6MGGrP2PwMd2
 hPMbqTnHfbSy7SsYLQla8RIjcJ3FdoJxywHHIFBzMmtHYGr1mP3cth0q9bOSb1Gaxackv4NJt6/
 uZbC5tR28i8JaSL0iG0Q50bJeR4BwyUxL7dA6oRBys7eziHjrCnzam0jbLQPqCnkY23vtqIERHf
 sr/YSbEo34NG+yepS0FpcjNtDcKx6dq8vApHvV3irOEhEfkT1MHigN96q9bxSIGSvu5CVuqvxOF
 dvszzW/hyq5/H1L0bkA7HP2aA76lwfRQnxcnceoDY5bydHfwuZC1T0Lh9SQS3aSCrcftgMQWATq
 zeSL2VaUnFq2lzmwvBSAonZ5/Z4/iPnhBceykedEcwObDjLFDa2p1Ofgfe12KqFkUC1OL9giXxI
 zFNZu7QOk+n1x91ooU1RNCUxU8J588pmKVAA4ajQY5j/AW2kDptJKa0twwIIz8ScwHkB2ITr5m3
 QNNisSneTrrxFWEzDQ0bjAsQMJrVRXmdgJb0uGnVHPIGCp1zv0u2rOnT9uRqyIYXBvBsMS4E0Qo
 2PlMxjK6Gbq95Hot5mS1DLm2ALQp65CPyvd9TnJYC8Q5DrV/N41m75ejPY3SBEqLfaGzQRR2fYE
 kszBiOQTOCkOgQg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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
 lib/igt_kms.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 112 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 98f86ae18f79ff6ec068878041de59fcefa8744d..27326eec49047bc521eadf39b9f25671ff1e9e26 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -93,6 +93,10 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+/**
+ * define IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
+ */
+#define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -7613,3 +7617,108 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
 	return connected_count;
 }
+
+
+/**
+ * igt_get_connector_from_name:
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to search
+ *
+ * Returns: The connector if found, NULL otherwise. The pointer must
+ * be freed with drmModeFreeConnector()
+ */
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	double timeout = igt_default_display_detect_timeout();
+	int i, len;
+
+	if (!res)
+		return NULL;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[IGT_KMS_CONNECTOR_NAME_SIZE];
+
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd, res->connectors[i],
+								       timeout);
+
+		if (connector) {
+			/* We have to generate the connector name on our own */
+			len = snprintf(name, ARRAY_SIZE(name), "%s-%u",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+			name[len] = 0;
+
+
+			if (strcmp(port_name, name) == 0) {
+				drmModeFreeResources(res);
+
+				return connector;
+			}
+
+			drmModeFreeConnector(connector);
+		}
+	}
+
+	drmModeFreeResources(res);
+
+	return NULL;
+}
+
+/**
+ * igt_get_connector_id_from_name:
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to find in the connector
+ *
+ * Returns: The connector id if the port is found, 0 if the port is not found
+ */
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name)
+{
+	drmModeConnectorPtr connector = igt_get_connector_from_name(drm_fd, port_name);
+
+	if (connector) {
+		uint32_t connector_id = connector->connector_id;
+
+		drmModeFreeConnector(connector);
+
+		return connector_id;
+	}
+
+	return 0;
+}
+
+/**
+ * igt_get_connector_id_from_mst_path:
+ * @drm_fd: DRM file descriptor
+ * @mst_path: MST path to find in the connector
+ *
+ * Returns: 0 when no connector is found with the correct mst path
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
+			if (memcmp(path_blob->data, mst_path, path_blob->length) == 0) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				return connector_id;
+			}
+
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+
+	drmModeFreeResources(res);
+
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fb0ef6f00477283c19e4322f832f389bde317c4f..8939ed84bd016ab03b6f165621b62664039bca9e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1294,5 +1294,8 @@ double igt_default_display_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.50.0

