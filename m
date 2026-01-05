Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A920C2A075
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01B789361;
	Mon,  5 Jan 2026 08:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEcWTcHD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D833010E394
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602872; x=1799138872;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cwWlit3moelL2R3BhDkSVYd3L1OWf4hzjTIS3S1L5q4=;
 b=TEcWTcHDR9TIPtFkLGB7THvhHB4BJXmfn+zhdCWSs4FV18r95YUzKZ3P
 VdGs9q9tMeaXPXS4nBYrmF/gCISaNZX5AMp1zpPdf928+Czrh8YTDCstV
 nx6u7JzgzttSzh+Ou86ZqdC67tG9idrHLNXdakMdqUyyuEIGJlF/qQsxb
 BpIA9EuqQCzSJP4tUhEYrtjVYGaAAV7/d+g1/DzzIVaPlD3Ro5eFaGGf/
 4FSaH3iJqaZ9E1OlmHuI3s3KiyHwnI1QS/OYlGG1hGpxVSdI5Ox3hmOmS
 mlqOLJkFMHOcUrNOgLS1csvXxKbg9Abz8AavZ4/aXfGAx8vG6JJQnVT39 g==;
X-CSE-ConnectionGUID: vq6Hur+TQ62ftpfUcctbmA==
X-CSE-MsgGUID: qEXu/sJCRQ2JMAqNHUFSMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72814607"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="72814607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:47:51 -0800
X-CSE-ConnectionGUID: 1FjQfCKWRkyw+wQLaMhNIA==
X-CSE-MsgGUID: /kK98xgETAGR07a3noLcnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="225873328"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2026 00:47:50 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t v14 03/11] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Date: Mon,  5 Jan 2026 08:47:42 +0000
Message-ID: <20260105084750.190346-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105084750.190346-1-nishit.sharma@intel.com>
References: <20260105084750.190346-1-nishit.sharma@intel.com>
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

