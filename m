Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DBD116F8
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 09:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BD610E365;
	Mon,  1 Dec 2025 09:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mo2QJteD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8641410E365
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764579829; x=1796115829;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tMeKAbWS+fUYnuaNBwBGRmwtnmulhHn0tFVJKuGUvFc=;
 b=mo2QJteDoyuzyS+056YowG733I+v8PL21LKInjzrm/OIJ2W+RmX3d0n6
 NuJ5cdXi3TvZIbMRK8zRV2PRmFf9VFim0iz5N3xEJ1k92FPZbwm5MasI6
 pVnBafDDy/23ZbLfMxRhcTEyHzkUenNPiL6ZapJSu/V1O8vax836nudj+
 Q3XVCRkXeBYvIeoxGPeJe6RDp1UGpPTprqlI1aIeO/KWpzniOVHgdUJH+
 jr7HQvO3b2ZFTLkVAMUj9HHrIiSol0LhhMKvjfWFZKfXouTcocndAoZ8y
 VT3rEWxvwU20bT35uF4S59yPtMy8OThOMaoxIqkWJYRxjtCb1qQa130SO g==;
X-CSE-ConnectionGUID: vMcc8y2jS/aF3W0I9ix5JA==
X-CSE-MsgGUID: l3BCwNGQRsyT9MHNiv+7Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77199535"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77199535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:03:49 -0800
X-CSE-ConnectionGUID: hefJyTi6SqqYTcchQhk+oA==
X-CSE-MsgGUID: 8tB9AQkjTF2ujcPFoy3S9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198501958"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by orviesa004.jf.intel.com with ESMTP; 01 Dec 2025 01:03:50 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v9 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Date: Mon,  1 Dec 2025 09:03:41 +0000
Message-ID: <20251201090349.326673-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251201090349.326673-1-nishit.sharma@intel.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nishit Sharma <nishit.sharma@intel.com>

Introduce synchronous wrappers for VM bind/unbind operations that handle
user fence allocation, waiting, and cleanup internally. This simplifies
test code by eliminating repetitive synchronization boilerplate.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/xe/xe_ioctl.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 221fd7c62..369c5887d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -747,3 +747,42 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy,
 				      instance), 0);
 }
+
+#define        BIND_SYNC_VAL   0x686868
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size, uint32_t flags)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.addr = to_user_pointer((uint64_t *)sync_addr),
+		.timeline_value = BIND_SYNC_VAL,
+	};
+
+	igt_assert(!!sync_addr);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, size, &sync, 1, flags);
+	if (*sync_addr != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	/* Only free if the wait succeeds */
+	free((void *)sync_addr);
+}
+
+void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
+			  uint64_t addr, uint64_t size)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.addr = to_user_pointer((uint64_t *)sync_addr),
+		.timeline_value = BIND_SYNC_VAL,
+	};
+
+	igt_assert(!!sync_addr);
+	*sync_addr = 0;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, size, &sync, 1);
+	if (*sync_addr != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	free((void *)sync_addr);
+}
-- 
2.48.1

