Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02700CD11DD
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 17:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BF410E8B2;
	Thu, 28 Mar 2024 17:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7Chhrkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4D110E8B2
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711647175; x=1743183175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rw4velbqbueqm2naTnIs4xF/qxP52aBY3x/6MJC6P/Q=;
 b=Z7Chhrkn9xSd2ywZseouuwz1J1u2OxVXtnYp273A9xQ0Tj3sOv15wlXI
 oOE2RvzodJiYIw95lLjZ8Ou0H7iWd2vVJhkxgHULD4ygEqE6KTKANv+U1
 ByU0eegVjiAqlBrP+VnsuJiwR2W/mm2WQ1sPANSohcxKKM93sHbm0xNbx
 sc9/6xS71Y4HNLn3/5Usjm+ZuO57zz4MXp8eIgsB2earcOBVf1EOJVuis
 h1b5tDNU+Nd6COnwn+q3h9yq1I6TwK+MWToQJm9XdGFzGs+wnLRbc3EPt
 sRGRGlQG1dgDVnO10RbWEuOBLz5rltlhl3E+fvCAHWm3d2II3iW8u60h6 g==;
X-CSE-ConnectionGUID: kwRHC30aTBiILR568eEnZQ==
X-CSE-MsgGUID: FZGRaDqoTPu5fs9M+0ACmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6929551"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6929551"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 10:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21424845"
Received: from jattlan-mobl1.ger.corp.intel.com (HELO a276e54ca1b6.intel.com)
 ([10.252.56.46])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 10:32:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] drm-uapi: Align header with drm-xe-next
Date: Thu, 28 Mar 2024 17:32:43 +0000
Message-Id: <20240328173243.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently xe_drm.h is based on drm-next with some additions from
drm-xe-next.

However some uAPI updates brought by commit ca4607939 ("drm-uapi/xe: \
Remove unused flags") were mistakenly reverted by commit aef5f4742
("drm-uapi: sync with drm-next f112b68f273f").

Ensure xe_drm.h is now aligned with kernel commit ("drm/xe/uapi: Add \
IP version and stepping to GT list query").

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 4353595a4..91ea92035 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -871,10 +871,6 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
- *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
- *    MAP operation immediately rather than deferring the MAP to the page
- *    fault handler.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -967,8 +963,6 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 	/** @flags: Bind flags */
@@ -1085,19 +1079,6 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
-/* Monitor 128KB contiguous region with 4K sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_128K				0
-/* Monitor 2MB contiguous region with 64KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_2M				1
-/* Monitor 16MB contiguous region with 512KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_16M				2
-/* Monitor 64MB contiguous region with 2M sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

