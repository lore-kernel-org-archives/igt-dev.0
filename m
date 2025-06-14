Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CCCC71135
	for <igt-dev@archiver.kernel.org>; Sat, 14 Jun 2025 01:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7930F10EA74;
	Sat, 14 Jun 2025 01:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZdGrr5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C77D10EA71
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Jun 2025 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749863320; x=1781399320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZziKw9kkWO8ki53VnZ6bxGsfx1yKsI+C1M67ISFqqP4=;
 b=fZdGrr5PhMZCAEm9lWPU3BYrchf0ZWX0oMqk+espbOasQCPx4KN9osuE
 ZxyzYCl/6IB6ri5QvunztV7s+BiS5j2ereJU+JCgVCZIZA896iWXc7GTP
 jq3n3vmNuF2FGMQVaPF7Bbajt81R24sCd9qXo7f+BBmcJ6Jt1DBTxo3sh
 ignXqgqlZcYKWmD/9p1T7QGfe8weK1yEip6lG4ADhkNExrQa9fuh/SOiD
 NL+ZnkdusAc8tNF4KBDylOxsQjpxjqOEGqoGZ1X5w9GZkx5RE2bLZbkVV
 AHCUyyxF0G30/rTRqif5VdlRHF8dM6lCZpH7CXB7LyffZSKt/bB08FBLy w==;
X-CSE-ConnectionGUID: OU7zObHjTHWokiLGGqGugg==
X-CSE-MsgGUID: zfbasPGHT0m5AR9Fh4o15g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="54704314"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="54704314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:08:37 -0700
X-CSE-ConnectionGUID: DiDxxTQ5TuCUDjHlqZKk3w==
X-CSE-MsgGUID: SGDRlMdYS0Sqg0BG4wWSVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="147958937"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:08:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with OAM uapi updates
Date: Fri, 13 Jun 2025 18:08:26 -0700
Message-ID: <20250614010827.3477175-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
References: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
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

Align with kernel commit TBD ("drm/xe/oa/uapi: Expose media OA units").

This commit will be replaced by the actual commit for OAM uapi changes
after OAM kernel changes are merged.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index c90fab1b00..a52f955936 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1210,6 +1210,11 @@ struct drm_xe_vm_bind {
  *    there is no need to explicitly set that. When a queue of type
  *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
  *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
+ *    The user is expected to query the PXP status via the query ioctl (see
+ *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
+ *    attempting to create a queue with this property. When a queue is created
+ *    before PXP is ready, the ioctl will return -EBUSY if init is still in
+ *    progress or -EIO if init failed.
  *    Given that going into a power-saving state kills PXP HWDRM sessions,
  *    runtime PM will be blocked while queues of this type are alive.
  *    All PXP queues will be killed if a PXP invalidation event occurs.
@@ -1612,6 +1617,9 @@ enum drm_xe_oa_unit_type {
 
 	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM,
+
+	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
+	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
 };
 
 /**
@@ -1633,6 +1641,7 @@ struct drm_xe_oa_unit {
 #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
 #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
+#define DRM_XE_OA_CAPS_OAM		(1 << 4)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
-- 
2.48.1

