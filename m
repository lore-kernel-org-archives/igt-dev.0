Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE7FC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4910F546;
	Fri, 12 Apr 2024 09:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9ku3NXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F2910F53C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913326; x=1744449326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S23uFzKKS3zw/qIVCBbWkNYhwi+wH4uQMChj6OStNsQ=;
 b=M9ku3NXX5E85FLBXnVRKBtQ5bED3HvHmG0tQ4NIww2pi8biSuo2gBxAK
 KmnRq2T3ty7Ur+BCTEThyZ9i/odjk7ToVR0o6sbxQbTAm9jj2XcLSbUHv
 fkcTeVGkuToM+yUzQ9IU0R6hC9L5xjE5iE40KCJTcUKw0DaM/LeA2JC7N
 U/SLIrY+JothY39NdPT5ZtmQR8v1IS1hhThCnFezB0O+IJRYDtTLzHa45
 TI9Dqp9ZnDPR/MbxI3uuLMOckq0QEOyCGZB3ldj320I+65EFeRz6DYxUj
 Ecln6S7BlDZTqDIi46LrBV/DEi57LYuu8jc4OHkBdoWyy2H2yss9AoJxO A==;
X-CSE-ConnectionGUID: TmIlLhPUT4SKXTCTj/xMFQ==
X-CSE-MsgGUID: 2cjpf/xoSRqtCJG5pU+b2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12146408"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12146408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:17 -0700
X-CSE-ConnectionGUID: i+iOoz6jTHmJSucyW8geEQ==
X-CSE-MsgGUID: tk8LQ3HnSSGwTjr9h+5Mzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21165127"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 1/4] drm-uapi/xe: Add device atomics vm bind flags
Date: Fri, 12 Apr 2024 11:01:14 +0200
Message-ID: <20240412090117.32727-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412090117.32727-1-nirmoy.das@intel.com>
References: <20240412090117.32727-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Align with commit ("drm/xe/uapi: Introduce VMA bind flag for device
atomics")

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm-uapi/xe_drm.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 4353595a4..9171cc0f1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -881,6 +881,14 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set for
+ *    a VA range, all the corresponding PTEs will have atomic access bit
+ *    set. This will allow device atomics operation for that VA range.
+ *    This flag only works for single placement buffer objects and
+ *    mainly for SMEM only buffer objects where CPU atomics can be perform
+ *    by an application and so KMD can not set device atomics on such buffers
+ *    by default. This flag has no effect on LMEM only placed buffers as atomic
+ *    access bit is set for LMEM backed PTEs always.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -967,10 +975,11 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
-#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
+#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.42.0

