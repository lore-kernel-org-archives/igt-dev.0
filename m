Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE2D1CDD7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2F110E64F;
	Tue, 22 Oct 2024 10:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Xm13Nenw";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79510E317
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 72D7BC0C08
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBC0140008;
 Tue, 22 Oct 2024 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729592922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYCmBg7eR7IkHWQe/PoUfhGGTT+9LV/bPFx/vX4feeU=;
 b=Xm13NenwVU4PQRzfVuFUOUSw3M7wW/8rDxxKImdhla0OVbeXYGVnMgCs4Pt6zT9RFgVJ0k
 ueNOZFfvZIGYgWd8XFg9U1jPPgfeYafziJqlFEviERat+YZVi2TFMUJ15tMqzmkXbkX2YB
 0TiQSHOj06uy3y/41jAiCdtyl1Vn1zLNOLn1QmuWXs9M0d4nvS3xe4uZ3ZWuxRGm+Fu66g
 Gx/TyquAyYYnqMtthrmUJHL+oeNE1BzU9v9Sztp8G6qlFbJGwsqe1iQ7skHn3PJKMxaukQ
 OlI/0b2eVla4eXMD/SZJBmzYOeOWb3ll8UhjhW8CNiNwb/bbW6I9OUAuzNXnxA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 12:28:37 +0200
Subject: [PATCH i-g-t v2 3/5] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-01-igt-kms-v2-3-8f654694b513@bootlin.com>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2993;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Dnpg3zurfabLSNJcYgma8rN60L9w5S+ZSulW58IlW80=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF35WFTJvSIHnByu1aWwt+QyfHd5SMBeCf+DqV
 BIBY9mCYeOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxd+VgAKCRAgrS7GWxAs
 4kogEACuJEj18JvhRaK0Qvz+B6UgLTAQMPgi9Nm2QMYVW0LEzN+BAuAH3gcJYlHydOPN/J/ePoQ
 IZMx1mqHlQQ8dPm8awYMvrleLIer7ymSQtAC010CK5cb6EsLFPhBzXqMBXffnrVNrZyg5bV818m
 9xHXrgs7NdUmr1GEPN3S5o62WJOh/XIoAk7YMfQBi2tt9dhrx4/fmPkMwl1m0xYV7HtTpMQsJ2B
 Jt7pa6rLiYDZvlZOaESmhtmKkNQ+CzegGoDG/TfkYjEkKRxa9ArOE3N4th2UyBtAGtMXoO7oE2O
 eINfSe9oJGNQNw7LBbvg9dWiR0NWzCsWU1+Jt3UmUAGxlimXpYkg2CXBXnDdvTF9cITt9Bi5NqR
 AlHbS6VJbhDHVHfBsTU1WZ56KL6VoHNDIO3O13CNzvFHaOq39VFRXDadjOqj7r9b0k/xuRqE2Bv
 zJNKYuOmnTqb4BK9a66B1vkKQRBBpYYYwKRcoO955yYypchTtL+1JfSyTZ1tQ3mWY1TinR9Aux9
 sKsy9Xii1A94mn9EuPpR2gpRHMhkJMlynfjSa2U0sFg0qKutdoqI+Xye+E0KaozU817D6BTUdl0
 STbW+3VIuqj2xLRYQ/RVgHcv+m4SoYJmugqaF3C1xMQBTdU0r/8A4ZJerqmSviSLt4amXlhPtTW
 xALZ/a5RGWe+lUA==
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
 lib/igt_kms.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 40c0a207cd17..44b546ae52dc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7181,3 +7181,57 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors - List all connectors reported as CONNECTED by DRM.
+ *
+ * @drm_fd: DRM file description
+ * @connector_ids: out pointer for the list of connector ids connected. It must be freed by the
+ * caller.
+ *
+ * The returns value is the number of connectors
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
+		clock_gettime(CLOCK_MONOTONIC, &end);
+		while (!connector &&
+		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		}
+
+		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
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
index 4cd4a4f65460..4674b271638a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1265,5 +1265,6 @@ float igt_default_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.46.2

