Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730C1FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9CE10E29C;
	Tue, 28 Apr 2026 04:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/J5ysX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1984610E0EB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351625; x=1808887625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+Yu4CTmCLRVYbzQlRdpGoQt0cYBFvdVFB/TM8va/RA=;
 b=U/J5ysX+gh+3UJz2X8yKetyLj81M9khuCoNvHX0YZ6nJcDPcf0F0y+UF
 g7tfE8lT72v6e43YdifDTtJrmkbmSEE14jTsxAAsO4SNkaQd6OjGfbJcr
 MGWchfJb5TKzpB1M3sIYonc+kuQqAp+EWYQiLVIP0snzydx2JIce+iO0q
 S42hdRvf/Q6y6WT/8s5/1Ke9AWeIxSD+SoN7jt3XFhzVQbP/HGMV0jxih
 DVXucjipyDrta11JRvUfrT5tAQ789bLt81khY16IaejO0lYoxKZHOvQ0z
 hGKF4SUU3uI8Wx166aSJbF6LtucFXDRh+N4CZjfP6BwlILDvUeeAP/i3M A==;
X-CSE-ConnectionGUID: o4XBwq1fQOi0l5VN7tJU9Q==
X-CSE-MsgGUID: u807rrLzRW6x+83IbTr07Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167791"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:05 -0700
X-CSE-ConnectionGUID: Mto+rZRXSy+4cfs1KYcaQA==
X-CSE-MsgGUID: z1l2cWzRQy++y+VmL7PYDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706558"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:03 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH i-g-t v1 03/25] lib/igt_kms: Add function to list connected
 connectors
Date: Tue, 28 Apr 2026 10:16:12 +0530
Message-ID: <20260428044644.257001-4-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 25184531b..2ae283e93 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8215,6 +8215,29 @@ double igt_default_display_detect_timeout(void)
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
@@ -8253,3 +8276,45 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
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
+	*connector_ids = NULL;
+
+	resources = drmModeGetResources(drm_fd);
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
index 60cfc1763..71d77a3c2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1301,5 +1301,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.48.1

