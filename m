Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4267C87FC7
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E301710E894;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Owwsw9KY";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2679110E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9037442B0;
 Thu, 17 Jul 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcUtbpoVE0TTV1p390Am+Dmfy/vnpdO6pa1QxeolcNc=;
 b=Owwsw9KYTXrxWBaWTjoGXN7xpMkQciiiOzGl3dX+yGeLqQiRPu0oBuy6+IryFiePsBDJ93
 BurqT+5I0Hqce9eEv8fGqbQp/SToY1I46bpeTjIY6nYHnvr1gLJLRJj1mif2BgnuyJUIY3
 s63CRSfODPy97r0Dm2hD0YjuKU+Xv2fqU1YkjJhNl8pjA4z0IKDiDbWUvU1YUnKPymuvkX
 tuju8TRdruD1/SbmXaXkEiO+BonHYoHc8Mb77z/n0iTAkRvpBkU9eH03t3B0mSBnGxUtKp
 gdYV6l7FLOyL7ioTzb3XJVjzToZxz0NAd1qB4m9mCupwYE4zW0lF+5E18APe0w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:23 +0200
Subject: [PATCH i-g-t v2 03/26] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-3-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=O1uRJ1uCUs4fkDJ3ppbu+RDJNH01C/U40DvPxPzJn70=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUHd+Fz4MMVmWa/fKYdaFw7TQBWMXNfoj1c6
 CwHTiUZBwSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFBwAKCRAgrS7GWxAs
 4sCAD/9oCgfpefLOk2OyxEEP1m3v+NDkrHndkgA4DpYdn2edQelyUafJh2Tc5HzEtIYG1wpCt/Y
 f+XKqagbH0kPgSGamU8jihSPVO7ar6IK+qFDCX6R3aMsF4BRcWmeOlQd1obBphjGIoIxxZqGlvl
 Ez2VxlweuvWzk19w09xjFgXJ0eQ0XdnQ2OXV3Vh97u4C4u2fgRYvGnp0UXDPXxOCWt2V+Ni182t
 wl72bHSr05URz5dJ4WS/SPGR7D+kFlRJywkgtj6bQ9mHS0psrYtQGJ7OLgtHcmsTJljVEXP51vZ
 suyzlYYANstsT8t1iWdX6oKrDRTOUwxPZdpX3T7LeAzedLoTwZy3vMME+q9uVcwNHKhSYdY4h8f
 +U02IHHNyNK4HCbyYHQZgIS+TmTVMc0oW4A9eGeqTmUKrZzLlf2GCSVmYNbu0AjKWPSkERj+l3b
 tCYsCImFxCuefda0Kbd4FHWMSqCqhv7web5OvRrcaxZ0aiFh+zxM/bOntOe4hG+L6oCKNZHnp5q
 UWbh4vpt5bQq7zCNLLTzpnBwRgEFawbMaMaVwIoxl1oofIRCdBsatUtuf+JRG6iVw5cUOI++XoP
 +HCv+vo7UuvV1q5AXh4LIomjohfmuR1ta25bNX7bp9iBXzLXUCclAU1EVEaEG8ulNXRSxiG05jo
 fb7+aeimGdBprWA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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
 lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 68 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ad3a31b7a487f986083c6648e2cc1f5f14d5b4a2..98f86ae18f79ff6ec068878041de59fcefa8744d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7508,6 +7508,29 @@ double igt_default_display_detect_timeout(void)
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
@@ -7546,3 +7569,47 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
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
index 1a2ecfd154769e5fcc755f126cd1e9c8dd1bc7c2..fb0ef6f00477283c19e4322f832f389bde317c4f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1293,5 +1293,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.50.0

