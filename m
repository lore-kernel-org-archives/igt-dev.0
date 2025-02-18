Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FE4C021AF
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 18:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6636410E021;
	Tue, 18 Feb 2025 18:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noXlPe/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F25210E06C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739902894; x=1771438894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3LvxyWrm4Yaf4eaZcY7mhOPPl3/xOw5tJwLocX3jRTw=;
 b=noXlPe/tudT2gOuLLfxcol//vWVJFMdauf9/bpH7r3bYZnx+j6+BbYpU
 NKXGyuJ97Bqoj5gCPbE3xIzPEjKTlqsXGnRkuDWYXKyT6n9gK7ACMJwqN
 TBAn7cOKq/7jCDCi5NYV6ViMbvc4WpcESJCpcmsoxd/5/DlMhaDq+ECl2
 PUBtpI0KzCX0rN+yniKz14Yyo7CNuntP30xTmJt8/mjW5sabOvfA14f2T
 /+7NbOTrVXCLDAVtIkAkzfUOod18KPMsZpgtcio6IiAq1y2cgKKuv6aap
 Gx6AiBp4hghgfdNWqcq70AhEROhgO2le5+8pSrDw9sWCPnr3q8dE6IXEN w==;
X-CSE-ConnectionGUID: 1tiXNrdRSOmIS4u1gjvxKQ==
X-CSE-MsgGUID: laMXuL1hSi6b3zjGQ7iqLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40823138"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40823138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:21:33 -0800
X-CSE-ConnectionGUID: X4/TMPv1SkC37UcTcvMqIQ==
X-CSE-MsgGUID: nnOlKnG0QfahBa2iozcJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145371697"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:21:33 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, shubham.kumar@intel.com,
 kamil.konieczny@linux.intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t v2 1/2] drm-uapi/xe: Sync with EU stall sampling uapi
 updates
Date: Tue, 18 Feb 2025 10:21:26 -0800
Message-ID: <7b245549e606629e860b258fe037f47df480fc72.1739901972.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739901972.git.harish.chegondi@intel.com>
References: <cover.1739901972.git.harish.chegondi@intel.com>
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

Align with the following commits:
("drm/xe/uapi: Introduce API for EU stall sampling")
("drm/xe/uapi: Add a device query to get EU stall sampling information")

Link: https://patchwork.freedesktop.org/series/144609/
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 include/drm-uapi/xe_drm.h | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 08e263b3b..f143f2e65 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -700,6 +700,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_EU_STALL		10
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1397,6 +1398,8 @@ struct drm_xe_wait_user_fence {
 enum drm_xe_observation_type {
 	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
 	DRM_XE_OBSERVATION_TYPE_OA,
+	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
+	DRM_XE_OBSERVATION_TYPE_EU_STALL,
 };
 
 /**
@@ -1729,6 +1732,77 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
+ *
+ * These properties are passed to the driver at open as a chain of
+ * @drm_xe_ext_set_property structures with @property set to these
+ * properties' enums and @value set to the corresponding values of these
+ * properties. @drm_xe_user_extension base.name should be set to
+ * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
+ *
+ * With the file descriptor obtained from open, user space must enable
+ * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
+ * calling read(). EIO errno from read() indicates HW dropped data
+ * due to full buffer.
+ */
+enum drm_xe_eu_stall_property_id {
+#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
+	/**
+	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
+	 * EU stall data will be captured.
+	 */
+	DRM_XE_EU_STALL_PROP_GT_ID = 1,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
+	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
+	 */
+	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
+	 * EU stall data reports to be present in the kernel buffer
+	 * before unblocking poll or read that is blocked.
+	 */
+	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
+};
+
+/**
+ * struct drm_xe_query_eu_stall - Information about EU stall sampling.
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
+ * struct @drm_xe_query_eu_stall in .data.
+ */
+struct drm_xe_query_eu_stall {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @capabilities: EU stall capabilities bit-mask */
+	__u64 capabilities;
+#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
+
+	/** @record_size: size of each EU stall data record */
+	__u64 record_size;
+
+	/** @per_xecore_buf_size: internal per XeCore buffer size */
+	__u64 per_xecore_buf_size;
+
+	/** @reserved: Reserved */
+	__u64 reserved[5];
+
+	/** @num_sampling_rates: Number of sampling rates in @sampling_rates array */
+	__u64 num_sampling_rates;
+
+	/**
+	 * @sampling_rates: Flexible array of sampling rates
+	 * sorted in the fastest to slowest order.
+	 * Sampling rates are specified in GPU clock cycles.
+	 */
+	__u64 sampling_rates[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.48.1

