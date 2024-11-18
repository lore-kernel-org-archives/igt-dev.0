Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C34FD60CFA
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B551510E190;
	Mon, 18 Nov 2024 23:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5cV1/kf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFA710E56A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972958; x=1763508958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rdI4PLJjh43e/IG8RS2pfdO39jrbnYw1BScUbD5C7zQ=;
 b=Z5cV1/kfwcuApE2h5h7tRy3FXU0NX9yzmk3+Qyv7J37B4vmk1OxzbqAV
 ynX2O7WVFyR9MOZe4QtFodY7+/bXucmahizdCF4WozYPv3qprUZrP/wst
 mLz4FZ1HLk8872YBU9PC+rMfnMTZZHyC9oxTQbPrLqMAkkPSt73v1uIyD
 6DtGJOmJgKvsmTg9Wt6EOQWFveogmxMYFFBcqVeBd6O9BU9rx+xANfHUg
 rJrxB5V2KttCVk+cFfdFfk2xnbq9T/3ZDq6STNsdjDyWNpi6Cb9XRSRvN
 OFpPHHffkodrkcWYA6+5KifjXT80EeBiioeShUm80KnVYGMmeq6W71ANK Q==;
X-CSE-ConnectionGUID: yowa71PFTGezdvjJzjw6lg==
X-CSE-MsgGUID: Xi0R6mCzSmS3KpllykQR7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451236"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451236"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: JaHdEFieQSqK2NHq4ZtW7g==
X-CSE-MsgGUID: KjhZAszxRQuikZg/6e4iRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245235"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 16/29] drm/xe/uapi: Define UMD exec queue mapping uAPI
Date: Mon, 18 Nov 2024 15:36:07 -0800
Message-Id: <20241118233620.2373819-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Define UMD exec queue mapping uAPI. The submit ring, indirect LRC state
(ring head, tail, etc...), and doorbell are securly mapped to user
space. The ring is a VM PPGTT addres, while indirect LRC state and
doorbell mapping is provided via a fake offset like BOs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6490b16b1217..9356a714a2e0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1111,6 +1111,61 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_ext_usermap
+ */
+struct drm_xe_exec_queue_ext_usermap {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @flags: MBZ */
+	__u32 flags;
+
+	/** @version: Version of usermap */
+#define DRM_XE_EXEC_QUEUE_USERMAP_VERSION_XE2_REV0	0
+	__u32 version;
+
+	/**
+	 * @ring_size: The ring size. 4k-2M valid, must be 4k aligned. User
+	 * space has to pad allocation / mapping to avoid prefetch faults.
+	 * Prefetch size is platform dependent.
+	 */
+	__u32 ring_size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/**
+	 * @ring_addr: Ring address mapped within the VM, should be mapped as
+	 * UC.
+	 */
+	__u64 ring_addr;
+
+	/**
+	 * @indirect_ring_state_offset: The fake indirect ring state offset to
+	 * use for subsequent mmap call. Always 4k in size.
+	 */
+	__u64 indirect_ring_state_offset;
+
+	/**
+	 * @doorbell_offset: The fake doorbell offset to use for subsequent mmap
+	 * call. Always 4k in size.
+	 */
+	__u64 doorbell_offset;
+
+	/** @doorbell_page_offset: The doorbell offset within the mmapped page */
+	__u32 doorbell_page_offset;
+
+	/**
+	  * @indirect_ring_state_handle: Indirect ring state buffer object
+	  * handle. Allocated by KMD and must be closed by user.
+	 */
+	__u32 indirect_ring_state_handle;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
@@ -1138,6 +1193,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 
+#define DRM_XE_EXEC_QUEUE_EXTENSION_USERMAP			1
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

