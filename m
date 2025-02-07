Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD7C0219E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 11:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2CA10EAF1;
	Fri,  7 Feb 2025 11:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPvwxLAg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D7910EAF2
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928972; x=1770464972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RE0UQQRC7ylWPW6iCGNUSBhkT+cdYNzg/Y85ZmRmkDc=;
 b=IPvwxLAgZTXdozYEO2N11lViSanBpLDvHWsIC6Dnb56Jdit0woU4X20X
 9xjSPX5KT+2BzI+ffg4kcbuIvj31zyzri+AEBLQiDkaGGDm3AaAYZhWW0
 6fxviWMHBompYEX89SfgPgIiZyfw3ygZ+nZr0j9mThRZoBoEvTY40wzjQ
 VzpeE6CQ6OfmXi2gjKqNnz1h9fshVbGgFR9DAEuBSuyWtleksh+9h/xWJ
 eTPbcP+OeCfxJPo2KnEm16EtDaFiWj6tRHpdUb7d5jnKUaC/YIXgLGf0b
 YqFHBB0BpdpniYrDRriqOSWveXgdSDyOTxhEchuPHM/ZBJTPGwHwCUSRl g==;
X-CSE-ConnectionGUID: ZHQJBHevSEuL+vZ1D+fI4g==
X-CSE-MsgGUID: 6Ol0eaLuQpCZCCQV2hXu1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39683418"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39683418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:31 -0800
X-CSE-ConnectionGUID: dvH6ehKBStyWAbMIk037gw==
X-CSE-MsgGUID: HJ5xf2HIRliKdZdG9DxwzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116506765"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:28 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 3/4] Revert "drm-uapi-experimental/xe_drm_eudebug: Sync
 after exec_queue placement event addition"
Date: Fri,  7 Feb 2025 13:49:34 +0200
Message-ID: <20250207114935.1996323-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
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

Exec queue placements support was dropped as unused.

This reverts commit 722494e73a3117c0de1708a2ff2a326446b043b6.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 .../drm-uapi-experimental/xe_drm_eudebug.h    | 31 +++++--------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index ed2e728c2..714bb93c7 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -147,14 +147,13 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_OPEN		2
 #define DRM_XE_EUDEBUG_EVENT_VM			3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
-#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS 5
-#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	6
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND		7
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		8
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
-#define DRM_XE_EUDEBUG_EVENT_METADATA		10
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
-#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		12
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
+#define DRM_XE_EUDEBUG_EVENT_METADATA		9
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		11
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -190,22 +189,6 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
-struct drm_xe_eudebug_event_exec_queue_placements {
-	struct drm_xe_eudebug_event base;
-
-	__u64 client_handle;
-	__u64 vm_handle;
-	__u64 exec_queue_handle;
-	__u64 lrc_handle;
-	__u32 num_placements;
-	__u32 pad;
-	/**
-	 * @instances: user pointer to num_placements sized array of struct
-	 * drm_xe_engine_class_instance
-	 */
-	__u64 instances[];
-};
-
 struct drm_xe_eudebug_event_eu_attention {
 	struct drm_xe_eudebug_event base;
 
-- 
2.43.0

