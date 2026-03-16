Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49964F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBED910E29A;
	Mon, 16 Mar 2026 16:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2b1Dl4aw";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACA410E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 46794C55044
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A17655FC4A;
 Mon, 16 Mar 2026 16:23:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6356D1037220B; Mon, 16 Mar 2026 17:23:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BZx0eZ+X2Jt7EA2nMQUaCpeLZ70+cv7nsxepSw4kTdE=;
 b=2b1Dl4awA/cJwlPnZDa/SGubVeeDn7s0quaEbGNeAY+C4h7pxt9Z41AmF33ia5/Bx+vUwF
 PTG1hx8lHzKMA4X64OoqBVcMtrzrmayaUmFeaFE7x1skkUrBjkGxZY8KPOvK+E2XqaqBB6
 ZNJT2ucRFRpPxGr8JNDfMQvtxsHYIY1GM4fttL95lf6wcS5Jt74gFV/ZHsmSaoTFapR61/
 BkVN0GoGRbETcTkc/Ogu7fZyK98L+36ULcDHjKOrgWKYXMEN4E8FquVHD7ANJCT3uD3r5q
 AEe7zVoGVW3/OO+sKc3+x6bXbfB9si9guRBfuSGE5JXRdoQ8aQQcdHgI7CgdIw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:23 +0100
Subject: [PATCH i-g-t v9 02/49] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-2-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FXv3d3u1y6SRBP8hFBpj3UuYZJ9AE8Kt3MSvev/Nt8w=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Jul/h83qMEZ0o9HwmPbHcbC+3aazmWFpYX
 6DiU0+vOKqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguiRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKJ5xAA1ABJURuFpfbwKf4yLFFoeAP1Bqd2jfe
 wVrpQsusiOvptoC9Xl1vcMHJvBXEPv6l9I4HGZM4+L3KoEIjPam1Ck15jlIAkszq725eT16Ovz5
 MdRrqz/IexbeQwTpqEJcL74iZLNnmLIvgypfuhxMgVwiuIxEzmzIVxCdhVa79Uo12a5+Smf0dvO
 uQ414QNCEVWvSDeC3JHF0yvBMlfyEdXQjCoSZ9DXSMAC7FSLOq/5KyCmySJ+QZy91fNGun8rRG3
 bH+AJR4+E36SRwUJJRvQAkgEI9HO/E/mAZS005/Pz4fZt8RWlhKoq1cSXyaKeTfYlHrymmKkxY+
 rUx11HJr/AXMn78J1PvbeZURSVAHAeW/GQ4EZ8NV9EvbYKUfYvYF6f3dvIAELKagrzeexDjARpq
 MHG2ccY2aepCNy7ioupZ6GV7GUaVWeWSg5mjfa4JTYG/H8/XRbyzErO37VlkO4XfR+NgIZw1GV7
 o9ZYvFdt2WB6qp9KsKFf9b3aN6oYg8+PBf7Jrom2K1VR8u/HZomfmc3IPy6EwRnGtlbWmeJx+LP
 GSPvSRWBKy3+mGlxs/Wrvob9NJqGWCP9IQJaB3jo8HP/FByYLPIOf+HkxcKR46oTPfhoxy9iV1B
 JioEDhEp0ucSnrwmlbzdiWpeLNrGdf4rGH5a0QXyipU6ge2tKrEU=
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

During testing with chamelium, it is frequent to wait for a specific
connector status. This new helper is polling the DRM API to wait for this
status. This allows detecting it without notifier systems which can fail
if hot plug detection is not working properly on the device under test.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 692d75b70ecc..4a496ab256f0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8093,3 +8093,44 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
 
 	return crtcs[rand() % n];
 }
+
+/**
+ * igt_wait_for_connector_status:
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second. Use -1.0 to set the timeout
+ *           to igt_default_detect_timeout().
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Wait for at most @timeout that the connector @connector_id  status
+ * become @drm_mode
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout == -1.0)
+		timeout = igt_default_display_detect_timeout();
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	end = start;
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			drmModeFreeConnector(connector);
+			return true;
+		}
+		drmModeFreeConnector(connector);
+		usleep(10000);
+		igt_assert_eq(igt_gettime(&end), 0);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 081613a4b949..934f24d5915b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1301,4 +1301,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

