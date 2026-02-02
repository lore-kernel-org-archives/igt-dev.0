Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE071E7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA8A10E4E5;
	Mon,  2 Feb 2026 14:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tSP/G5x/";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5910E4DF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D754B4E423C9
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD03360767;
 Mon,  2 Feb 2026 14:32:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67A52119A88F7; Mon,  2 Feb 2026 15:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PVkSwZXHA6TmJUVS65tz8/8Aa0h6CfPEyga2eKV3jJE=;
 b=tSP/G5x/ugXml9rZGqi8BmD9GtDg+pToSnA56lMdJ5fPsjLCq2gwtXQc+r9VFqr36mrk57
 AnDYxosPRjSqrgvqpr9aJy1cPS8Xa0dDhZPzx2YgE6Tsg6Dua9Os1w7hdaJwdyElNFPSMm
 iV7wrgmI1sOyU8oLBLNh0psl9Aba5wh2o/rgOaUXnyxo3Ec9Bk6g31R8wtqp3gwVPkjYC/
 5q2lm0JdCVNzrIvEGQaIp4wH6371+Wt/oqpw3nqrQFZ67UUYcYKSn1BHnkrbHKNeaWX3/e
 L+p8RGlVlOBKEe0vKRa6JcASIEE/1CxdCxdjGavHSe7J9nBwCy5rJce0zVDKbg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:42 +0100
Subject: [PATCH i-g-t v6 03/48] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-3-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3512;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9YOQnqXtlxes+Seczojg3Ua4aOZ7myErosXaAaOfPOk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWOJUonbqh3KgheTQg67+JJ2GRnOAlACXlMC
 0zyIFKqflqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI/HxAAvLd//QKQCTYT4B9i5Ujkh2PjA9RwTdh
 8Wbu3h7o8GGei92S4dMObrBhrD51iO8t+DXA7KE1oVudPfdJ9XAkxmsPX6zJ2cMeE+gjbvAMb9n
 1WWc/U+Y7G8KwbaYDsgP0z1S65oi+s0q2tD0VDjK7z3kKbwb7Ugyv4r/R4Z2pnzK6ypDsWlYxDP
 +YmVyoeLGdI6OeeitZkcx9mgLMWWyXXs3yy5IYefodqcLhNa0dzR3dp+wrvREPIiHmtO79iFYLs
 fkoCSqwYYSBZ2NrtiQkwxcoRq8bOXsVmu0DViUXuwixyQ0dduGj5wnJEZm/RsIjicEuoWU7eFab
 9FnjjevU6ggzDzcCtbqmrZWin/M613OtXZ3f0vPSdbxRKS7WeyWLl6HCceOWtvfvF0/Ae4hrTBw
 3FWA5jrnYLitcl2wVoKFIR9dEwWjjq4QpKRGh6mufzDjYykCgo8yvLROfb2W9+sOGL9lZ35uMrX
 gU1rglEAOb5IBL9f43LthkXUeUlBZFYLV63sSxx24mV7SCs1ErSuGsqDKF4g4+wtCZqfFIYkUp6
 2hWn94bGDogP88ahIRvHkdfwnaHlirv5c4c+UrtCs1LeZzVvllNMFizbNABanDXYHNufxtmTy3l
 Y/m839SXMDNuCNMtbPRxsTH/aX/gm7vEaNbNbJnOgz926InzDu5M=
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

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 68 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 74178adc21b3..d8910a01c17c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8016,6 +8016,29 @@ double igt_default_display_detect_timeout(void)
 	return timeout;
 }
 
+static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned int connector_id,
+						  double timeout)
+{
+	drmModeConnectorPtr connector = NULL;
+	struct timespec start, end;
+
+	connector = drmModeGetConnector(drm_fd, connector_id);
+	/*
+	 * This time is required as sometimes some id in the connector list are not totally
+	 * ready or can disappear
+	 */
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	end = start;
+
+	while (!connector &&
+	       igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	return connector;
+}
+
 /**
  * igt_wait_for_connector_status:
  * @drm_fd: drm file descriptor
@@ -8054,3 +8077,47 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file descriptor
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
+	double timeout = igt_default_display_detect_timeout();
+	drmModeResPtr resources;
+
+	igt_assert(drm_fd);
+	*connector_ids = NULL;
+
+	resources = drmModeGetResources(drm_fd);
+	igt_assert(resources);
+	for (int j = 0; j < resources->count_connectors; j++) {
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd,
+								       resources->connectors[j],
+								       timeout);
+
+		if (connector) {
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
+	return connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b6937d19f621..e6b09c08d1cc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1318,5 +1318,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

