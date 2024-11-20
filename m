Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90131D743EB
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 22:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E30F10E19E;
	Wed, 20 Nov 2024 22:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSo2wNvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818BC10E114
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 22:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732141748; x=1763677748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSvnGS3y8Pc2x5eG4m6ICTEEtYqu8LRrtyiYTmsT1mE=;
 b=iSo2wNvPHUpq5M/lVFehi3q2eioZZoLqBoOD118JGrHx2XgRsVZqagQH
 47KlPxCtoglhGIqpaJCP/9L5n6mWyaT1CexgWqjengXRRQAenGEEfMYRc
 Wizue8NRDwFhNh2GMOQLZQjs//cZxT/XdGTqbSYQY2L/06j/ehqIVR7s4
 kRUDLcSrBweQYI17McK1dc8BSAcYCspjCIahRsKE4CkNF2Y4PSxYzquM7
 MplHtLNSVSHqwkOdzXpqp4DyiUqsTZwpEpHQk86HU+HR2okhi/AY2NJmo
 q7yHuWFwDJtDw/F6YSnXo6s9YPzG7U6qQQxprsyL9+zIRso1D+2SUiunh Q==;
X-CSE-ConnectionGUID: h+mJAB8nRA2Wi177+hxUjg==
X-CSE-MsgGUID: MxtRR55uSXiUHNHV1IJagg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54727916"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54727916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:29:08 -0800
X-CSE-ConnectionGUID: y+ACqrg9RYm6v37J9rAYZw==
X-CSE-MsgGUID: wizOvtJoT6mVBR860lcOSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="89850276"
Received: from art-dev-395.igk.intel.com ([10.102.138.231])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:29:07 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/3] lib/xe_query: add hwconfig to xe_device
Date: Wed, 20 Nov 2024 22:28:48 +0000
Message-Id: <20241120222850.1497784-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120222850.1497784-1-jan.maslak@intel.com>
References: <20241120222850.1497784-1-jan.maslak@intel.com>
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

Add hwconfig and hwconfig_size to xe_device, so that it can be accessed
easier by the tests.
Thanks to this, hwconfig data will only be queried once and cached.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/xe/xe_query.c | 28 ++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  6 ++++++
 2 files changed, 34 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 0c9cff066..49bed033b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -39,6 +39,32 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	return config;
 }
 
+static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
+{
+	uint32_t *hwconfig;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	/* Perform the initial query to get the size */
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	hwconfig = malloc(query.size);
+	igt_assert(hwconfig);
+
+	query.data = to_user_pointer(hwconfig);
+
+	/* Perform the query to get the actual data */
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	*hwconfig_size = query.size;
+	return hwconfig;
+}
+
 static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 {
 	struct drm_xe_query_gt_list *gt_list;
@@ -239,6 +265,7 @@ static struct xe_device *find_in_cache(int fd)
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
+	free(xe_dev->hwconfig);
 	free(xe_dev->gt_list);
 	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
@@ -268,6 +295,7 @@ struct xe_device *xe_device_get(int fd)
 
 	xe_dev->fd = fd;
 	xe_dev->config = xe_query_config_new(fd);
+	xe_dev->hwconfig = xe_query_hwconfig_new(fd, &xe_dev->hwconfig_size);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index cabb8078c..f8836578e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -26,6 +26,12 @@ struct xe_device {
 	/** @config: xe configuration */
 	struct drm_xe_query_config *config;
 
+	/** @hwconfig: xe hwconfig table data */
+	uint32_t *hwconfig;
+
+	/** @hwconfig_size: size of hwconfig in bytes */
+	uint32_t hwconfig_size;
+
 	/** @gt_list: gt info */
 	struct drm_xe_query_gt_list *gt_list;
 
-- 
2.34.1

