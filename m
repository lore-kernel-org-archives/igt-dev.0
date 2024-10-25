Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E4AD149E8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 18:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C704C10EB76;
	Fri, 25 Oct 2024 18:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHXlC3JH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972F310EB74
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729882336; x=1761418336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3DlMLr5sH6cBPOlewxk08HdG4YSq7Kz92tMA2nPmAXk=;
 b=oHXlC3JHG5E8uTpMUIEtY+wDbvht2m8+LsAS/SG9ouXJsBkxw9bmf67E
 wVngTyXXtNGmP8bDP2dg/IQloIVzKtJYJT6IK57g+b8NFkbVIbitQOZfH
 435iHkIgMDWtWsKusaJfMIrqGy40KRequlAb4FOKeD19uFzWmqmGTeNNN
 P8nOt36wCzSF8KE+6ambx5Cw3Afd123dRoOFlv0jb33z5jL8NeY1Bg5cb
 SYxeNTibzQ5TpghGTIJbITVNs5k01MqMXe1nlxigE1k6m5OKLycW2zEkQ
 QOZkr/nDM+Huax3sslq+R2ljuUkjBNbwf7x6wjosW+Aj+P8WPXaM3H3uT g==;
X-CSE-ConnectionGUID: 2m4ewY9dSOiI86L1C67/HQ==
X-CSE-MsgGUID: fBrbnESBSGO8bATMkhn1jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29736721"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29736721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:52:16 -0700
X-CSE-ConnectionGUID: shERV2/rQ5aylwdwcoPqKg==
X-CSE-MsgGUID: LarLZEt1S3yy0aZzco8F2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81143012"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:52:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with OA syncs uapi update
Date: Fri, 25 Oct 2024 11:52:04 -0700
Message-ID: <20241025185205.1327235-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
References: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Align with kernel commit c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA
sync properties") which adds OA syncs uapi.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f0a450db95..4a8a4a63e9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_DRM_H_
-#define _XE_DRM_H_
+#ifndef _UAPI_XE_DRM_H_
+#define _UAPI_XE_DRM_H_
 
 #include "drm.h"
 
@@ -134,7 +134,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the boundary with pointers encapsulated inside u64.
+ * the __user boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
  *    containing the following in mask:
  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
  *    means 32 DSS are available for compute.
- *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  This type
+ *    may be omitted if the driver is unable to query the mask from the
+ *    hardware.
  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
@@ -1483,6 +1485,7 @@ struct drm_xe_oa_unit {
 	/** @capabilities: OA capabilities bit-mask */
 	__u64 capabilities;
 #define DRM_XE_OA_CAPS_BASE		(1 << 0)
+#define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1632,6 +1635,22 @@ enum drm_xe_oa_property_id {
 	 * to be disabled for the stream exec queue.
 	 */
 	DRM_XE_OA_PROPERTY_NO_PREEMPT,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
+	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
+	 */
+	DRM_XE_OA_PROPERTY_NUM_SYNCS,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
+	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
+	 * configuration will wait till input fences signal. Output fences
+	 * will signal after the new OA configuration takes effect. For
+	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
+	 * to the VM bind case.
+	 */
+	DRM_XE_OA_PROPERTY_SYNCS,
 };
 
 /**
@@ -1698,4 +1717,4 @@ struct drm_xe_oa_stream_info {
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
-- 
2.41.0

