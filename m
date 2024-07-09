Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A3CC41513
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1425110E5A2;
	Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Wqzc7QSA";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1B310E5AA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A02842000D;
 Tue,  9 Jul 2024 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8N/mWbm20nhv3rrF/eiWcHG+T92dbKo72EyuWyRun8=;
 b=Wqzc7QSAtjw76w3sF9oG0skNxSFXWkm/J1b/+Zxz+1OWQqpeI7gBawYyBbrQoinIofWXXr
 2aLh6PphoRrZD47EkOn2cgygIRFqir3FW8xdZjGP/mTah/M2xUcVvgGZiTypDgyXITXOql
 k0a+RXFJ3OJz4c8onuteGsBe1ySQ9yjU0nLtBjALEMTXQeuq+ZJESRlZ4PnyXnR82h2fNQ
 W8CIy7u9MAC/gju1NrwxokTFlzS1Tqs38Csr9gwdVdzYhk3V8wSFzqPygJSvx4riE/pmGH
 lLK4NZh4e1iFTH89dWdEd+LsoN3PwKzSExmpigbj1MF13rXi64QjknU3Aowm8Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:19 +0200
Subject: [PATCH i-g-t v2 03/39] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-3-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gYSyminlPu5TwyFAN3xzO+3UCPXxT998gJA8TvdCzvs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViWAtHfavXI1FsGqmjI4Kky1btH1UoXQ4fTv
 yN+2NY2TQWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlgAKCRAgrS7GWxAs
 4lD2D/424DH9N/Mo5N0EWL5QZyWwkYZ6ye3Vzk4nVyXN3kLLSsjT7uV2heU0DWWm0Vs+jHoRwe1
 EmAulfkehEjVZNRc8n2zG2XzBTG5BE04iacd5FjXMmk3kG4jz1Jn6Xoi6xOuYLdL2LjqLcDtWiX
 C3JPqdg1qhzNLkOKepBpAPCJqqPDEtFBYYbhWM6kYpS8LZEXgV28iWfZ332pZSJoYd/3qg9bXgn
 6QMrap/1IJDLV1T9SHenzEL33YAh9u7PWBxTwEZRVuiKJxVKSQzwMattu5foMaGfYATolK09LCA
 8aUU3Gt0deRRdTkFanFFvd58xeceW/izhd2H7V77Qp0LtpaMP3uFmRUo0sCwSnWrT09jIeVNOd6
 4IWJQEJR9N/wn87t8sEhLuyfr7FMyWDiw2ESMFr5sDjnGTLXj1DwYWp8bXGauvgUjHWDYy+g2xU
 EigeTgV3NPOdv1LaU8ZVHTjhTVf6WLWSDQa6i1m9hf0o/phoQdJsa1/9A7Xvyy4F3NkqWNw2lzu
 ZQrizsNf/eeyLBolz91vQDksf7uiQ6ujC/p0mQzi3nEorwW+MFNf3tnAg6nvpXqGTQSi8LuMgl2
 oo/X5LCdtqImQkK5lEkstrhKf+d5XDwEdJLRfCm0+QM3M6q01eNOQqCDO1eqN+M82hOS/cLswfp
 iI0XyVUqth/Pigg==
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
index bb4c065ab4ed..f1eadf190168 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6724,3 +6724,57 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
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
+	*connector_ids = malloc(0);
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
index ba8658ce45e5..1964c725161e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1235,5 +1235,6 @@ float igt_default_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

