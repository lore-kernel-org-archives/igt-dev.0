Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C3DD69107
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 13:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC7810EC7A;
	Thu, 28 Nov 2024 13:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E868Q5pO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2310E479
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732799118; x=1764335118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuDFn3b1Nq98n+UrFOUu2iolRbLhuGlETbJCf7DwTzo=;
 b=E868Q5pOMBMpR0+e5G2pB5nE0IDyRQ2eRYyrQrEtSEDqRLXU+Oj2GJyI
 u2P2v0yFS2jJNJuPWBwdE7cnLLUvIP/usSvatck7liP+wHNUBY3G8VeH3
 PbmbBfMGngRd3pYs/WfcQJ3vt/IIzW7L97url0/lWaggYIdBmVYpEsupI
 ZnebKf1tR7iSvLbm6oE5SQ6e71FxtSznKQtb5nbi3o7wTQaygAXGB6N3c
 vNCeqH+NEBa2dRjUFqBqiMhQZWOgi31k/yExo1foNyMI0bHDM0mG9Xrzs
 vCB4s3DcChO48rvqov/dggZxlTAkWSc7uHdjLAa9dYtmIZBk2YBpXmmU0 Q==;
X-CSE-ConnectionGUID: VJr8zSUWQNW3ajuLbpFTWA==
X-CSE-MsgGUID: 62Moa9CWTSypmTb6+DTJHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33183271"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33183271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:18 -0800
X-CSE-ConnectionGUID: tNiLsU5IRw6EzQV439PoqQ==
X-CSE-MsgGUID: +/u4I1TtSPmZzWKnZWWiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129736116"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:16 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/3] lib/xe_query: add hwconfig to xe_device
Date: Thu, 28 Nov 2024 13:05:01 +0000
Message-Id: <20241128130503.241328-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128130503.241328-1-jan.maslak@intel.com>
References: <20241128130503.241328-1-jan.maslak@intel.com>
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
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
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

