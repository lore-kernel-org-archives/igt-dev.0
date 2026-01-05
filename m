Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB30C2A076
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 04:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECA710E232;
	Mon,  5 Jan 2026 04:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JylOB+59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D110E232
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 04:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585602; x=1799121602;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cwWlit3moelL2R3BhDkSVYd3L1OWf4hzjTIS3S1L5q4=;
 b=JylOB+594PH8AUedgXbxJib+XO0uY74R1oY+U1OZv3HlFpP2+AQwo7nV
 IHHd/g6Rm2GXMPBucZ/7/KHVkvpxmQG+VlH0L41vkOvaGOO6F0gHe1HM6
 KihSk4WtI+BOd/4xX7HBqF5V+9QDyqtrMj8TmGJT5RrhZmcf8P6rEhP+c
 tI3eySeL7KKA4PNEN1+omzA+DeeCul6VLEqKMt6LyNDj0/RWpO42XnwFy
 nL90UY/xO/vbesQSh3mzUtZvm6U5imxmdIjJV6HkXT150ChnZW7j6awhp
 DY9ub1pTQhn/aygtCVe2MmTTrX6pGfLMLqcUJr8IWdhtboU1qt3KkSLW5 Q==;
X-CSE-ConnectionGUID: 5OUIeqjeQy2wZALOQQZ9Gw==
X-CSE-MsgGUID: EsKWtykfRXqevBZLBdrUGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69024114"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="69024114"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:00:02 -0800
X-CSE-ConnectionGUID: xjvjVtTLTnyPMCkmmaL/qg==
X-CSE-MsgGUID: A4zyGcItTOOliUXkt8HR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202335513"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa008.jf.intel.com with ESMTP; 04 Jan 2026 20:00:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	pravalika.gurram@intel.com
Subject: [PATCH i-g-t v13 03/11] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Date: Mon,  5 Jan 2026 03:59:52 +0000
Message-ID: <20260105040000.181183-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105040000.181183-1-nishit.sharma@intel.com>
References: <20260105040000.181183-1-nishit.sharma@intel.com>
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
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/xe/xe_ioctl.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index e3efe12ad..16aae05c9 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -774,3 +774,42 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy,
 				      instance), 0);
 }
+
+#define	BIND_SYNC_VAL	0x686868
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

