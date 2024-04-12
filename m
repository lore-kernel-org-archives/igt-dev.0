Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93239C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 14:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAC10F3E7;
	Fri, 12 Apr 2024 14:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZ3GLrWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4710EB98
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712931742; x=1744467742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFdFwTwANkV8GoV/3KNpUA7IuEttgqFLQPCvePv7QQk=;
 b=VZ3GLrWwlVH6fM/RqpKGYAuw5g9WXa9LoMecvcewOooo+5H4H7NJXA9B
 Ob0YQk0M7SBnGAmm1chBTbOYCJH6OmuU4xqrrByTro5tswI/fyrcrRywI
 tmsFwB0aFnTX9GbwOeA2SvlsPc7dYwD4Z6FRdKyAj3kMVsJ3JVbEJrF+l
 pP3txEuqcA0pwiCyTlxph45jYjsxxkq+mmfLOch6I2LcKTknbnSuslHN+
 zcr11Zt43tcMwCiW+CFvGsCM7zuLdRw4P8wFEO0u+Vh1kJ0PUZF+sIST+
 u5iIDNKjCGy2wY4yflYPoBW/011vR0JgZYZyECKBLU3rpsumMRL8+ns3z A==;
X-CSE-ConnectionGUID: Z2MF8FoMSPu6otjn4ljGhw==
X-CSE-MsgGUID: Qd0ivYlLQ3eI7aJSIKX34A==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25840427"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25840427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:22:22 -0700
X-CSE-ConnectionGUID: ahC5mE4wTHi2+T+Ivtj9qA==
X-CSE-MsgGUID: BD7q2GfmSN2rCzrekZrZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21313804"
Received: from dovchinx-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.215.7])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:22:20 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t,v2 1/3] drm-uapi/xe: Align header with drm-xe-next
Date: Fri, 12 Apr 2024 14:21:57 +0000
Message-Id: <20240412142159.6-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412142159.6-1-francois.dugast@intel.com>
References: <20240412142159.6-1-francois.dugast@intel.com>
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

Ensure xe_drm.h is now aligned with kernel commit 8e61e3192a77
("drm/xe/uapi: Add IP version and stepping to GT list query").

v2: Add kernel commit hash in commit message (Lucas De Marchi)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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

