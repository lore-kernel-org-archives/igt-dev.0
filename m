Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6578AD74957
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 02:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C77A10E73E;
	Wed, 30 Oct 2024 02:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkzMEKrx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA7D10E73D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 02:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730256821; x=1761792821;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zUGlOZKCnHOjz5vcTUGS1ARz6HD8POeOzTcfIbfdXqI=;
 b=SkzMEKrxQqE1Ukr2slYVXVXKxiIDfPK2psLpnOmgu0LSIbT1cE9zDkYE
 agj695Mf09l5ZXW4OrXhis+zCgjgH5oe+K11BIusyndfYnDPpKVQuJVRr
 d7K8AsP0EdgvcOioIhJ8RW2k2mQRObIMuhVbAL0n8i+b1IkNyvnbrpZAp
 n1UFPb2ts4u1gRlDny5oAzRzMd5zx2tbN+RAAxD7IU3mezSFhL6Yljjaf
 B3IovE7bqhb3bqF5e0anfpwIJLNwvX5L1UdeIt+RVhtw8b4jtKk9g4VSI
 8SuTKILBYoldYeX36IjoGgXyFj+FQgKmPOcl8LJ4RiMSZZj6CrltNWsQK A==;
X-CSE-ConnectionGUID: KIrQGweFQGK06rnbrDeidQ==
X-CSE-MsgGUID: Pz+JEjs5Spekx6b6BQvxeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29362490"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="29362490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 19:53:33 -0700
X-CSE-ConnectionGUID: i7Ed2QuaS2+9zbZXeyRBqw==
X-CSE-MsgGUID: jenha1G9Q4GPdETnSOV6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="82256964"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 19:53:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with OA syncs uapi update
Date: Tue, 29 Oct 2024 19:53:26 -0700
Message-ID: <20241030025327.1487897-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20241030025327.1487897-1-ashutosh.dixit@intel.com>
References: <20241030025327.1487897-1-ashutosh.dixit@intel.com>
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

Align with kernel commit c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA
sync properties") which adds OA syncs uapi.

v2: Fix #ifdef identifier change (Kamil)

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f0a450db95..56163eb913 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
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
-- 
2.41.0

