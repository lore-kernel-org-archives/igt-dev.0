Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5AFC00A94
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 14:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599ED11263B;
	Mon, 15 Apr 2024 14:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxtQklp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EC610FE8E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713192570; x=1744728570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S23uFzKKS3zw/qIVCBbWkNYhwi+wH4uQMChj6OStNsQ=;
 b=CxtQklp4oVfk3i/V/pYn0gdy3Z6wj2xz31cwgtTIJqo1a8TiIZ6jHykq
 mtbXhupgwAaVGL7031GpebDtQUs53gG4atLhD/63YpbMi8hJit3sc75HH
 nopiukZiSeRd9ajB0+l8Gz+aYndfqYsI8A9ia1rQmLZiTd3JDr3RpGarQ
 rTvNT4AkKSktEbypp3hexQPSbq2kb/Uj/pK5ytZNV/GflFFkWQue+PnwQ
 ShMY6kVz/hsgzpASTJuqX/dM448Plz2P8Y5QjnGzAB3k0gh4ABy6D6qwA
 6jo2TSaKQGSu7UdWTHeE0Y5GzKKNZioUbH6o59yR0DUclkZiPZX6VoW8W w==;
X-CSE-ConnectionGUID: n9LNaiajQauJETPXOwvsuQ==
X-CSE-MsgGUID: bqRNCMRuSIWJXxcjJ1SWBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19735065"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19735065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:30 -0700
X-CSE-ConnectionGUID: fGA4C1RBSiyaaRTZ5gv0Eg==
X-CSE-MsgGUID: Y5TsK+TcRReW6TsqqZ8m6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26580029"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 1/4] drm-uapi/xe: Add device atomics vm bind flags
Date: Mon, 15 Apr 2024 16:35:25 +0200
Message-ID: <20240415143528.4107-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415143528.4107-1-nirmoy.das@intel.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
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

