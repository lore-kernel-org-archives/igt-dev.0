Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B229BC04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0693B10F521;
	Fri, 12 Apr 2024 09:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C91PjpJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527310F529
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913107; x=1744449107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S23uFzKKS3zw/qIVCBbWkNYhwi+wH4uQMChj6OStNsQ=;
 b=C91PjpJ+Ruzx6G/MT6vESDWsJjBYGaSvr6sYAaoa+FEG+v1+PM5dl+RU
 yghWv9m5ESiVFZmQ/D32g5qsQ2A8J77EV6V5LWPGcGpxNkTyr/WYzXv1t
 T6hA9BJ94WxdtXFL2waAHRrQuu41noSd/uipJMmn2g8LJSvYQsfyJcbxe
 Ecb75NTvvRp5wjQvhETeCL0tZGyB8Cpg88xRsRmizdmswNKZ1EjNNTb5P
 DBat4QiXmR1t2T19/1RKlgGlaDzk9CvLghogTrcPddUunug7A9bNwBt8e
 gwQazYTjjuHNUP1pmVDv/YdeF2bKWJsXY4KQu6uWtVIVTzJVegGRq89n7 Q==;
X-CSE-ConnectionGUID: iE1/wHCyTSecDGob69694g==
X-CSE-MsgGUID: MHKJF3BnSNyM6SOrad3adg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842834"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:47 -0700
X-CSE-ConnectionGUID: 2rHJgFmUTwi0fuCaB99XxQ==
X-CSE-MsgGUID: fgUZVZVnS/Kj25beaLo76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625075"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:46 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 1/4] drm-uapi/xe: Add device atomics vm bind flags
Date: Fri, 12 Apr 2024 10:57:37 +0200
Message-ID: <20240412085744.21196-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412085744.21196-1-nirmoy.das@intel.com>
References: <20240412085744.21196-1-nirmoy.das@intel.com>
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

