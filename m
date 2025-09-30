Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B155CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 14:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DCF10E2BE;
	Tue, 30 Sep 2025 14:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0ySR/Ql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198F010E2BE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759242701; x=1790778701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xp7MV/FCYO9QifgxGCp6l3rF9brnFY7x5FnM4314zRw=;
 b=W0ySR/Ql8NxhqiXsmq8Y+ltuEvpLl/V2emNAeklRrdzixfaTIXU+NaD7
 jhduwKJCNt2uNx9pKURTW7HXAdcxaUhNFkQH7fDYZMrT+k78sQDg1nOdn
 98svzclq/JjXGW/8OtplGMBLP3eZMFfm4Oc1KsaJvaUVbvRwjH1vTaNOx
 qTZQcZBaKvo7Ax9qBPEI4KXKK2Zx6Ed8zelb0zM4WG1MpSCoRdO+h4ltp
 +mYMEmd7e9MRM96KgPOS2NEDJot0UIlQmFvCf/21BZmTmvw8WoDl07nFN
 PB2z3TkyQLxGKWQyV1BzBgH2f5xdO/ObNYj44gPNi0/cGAYTWI7AnQ0fL Q==;
X-CSE-ConnectionGUID: /k9GufOCRveFzOfncBqtyg==
X-CSE-MsgGUID: CzbPqF4LQ+as5ipd68390w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65322326"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65322326"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:31:40 -0700
X-CSE-ConnectionGUID: gtjdDIyyQ1yTIneFBK+TfQ==
X-CSE-MsgGUID: 9fjDHmLIQTSAxE+m7+6J2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177809707"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:31:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Nakshtra Goyal <nakshtra.goyal@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe_util: Add xe fast-copy helper
Date: Tue, 30 Sep 2025 16:31:32 +0200
Message-ID: <20250930143130.186193-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
References: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
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

In Xe2 and beyond fast-copy between objects with different pat indices
is quite common operation. Add fast-copy helper which requires only
src/dst bo handle, region, pat index and size of operation.
It is however limited to size being multiple of 4KiB and lesser or equal
16MiB but this limitation may removed if there will be user of this.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 lib/xe/xe_util.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  5 +++
 2 files changed, 85 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 96287423ff..6246841e61 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -7,6 +7,8 @@
 #include "igt_core.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 
 #include "xe/xe_ioctl.h"
@@ -280,3 +282,81 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
 
 	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
 }
+
+/**
+ * xe_fast_copy: simplify fast-copy from src to dst bo
+ * @fd: opened device
+ * @src_bo: src bo handle
+ * @src_region: src region
+ * @src_pat_index: src pat index
+ * @dst_bo: dst bo handle
+ * @dst_region: dst region
+ * @dst_pat_index: dst pat index
+ * @size: size in bytes for copy. Currently has limitation that it requires
+ * size aligned to 4KiB and must be <= 16MiB.
+ *
+ * Simplify common fast-copy from one bo to another. See @size regarding
+ * operation limitation.
+ */
+void xe_fast_copy(int fd,
+		  uint32_t src_bo, uint32_t src_region, uint8_t src_pat_index,
+		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
+		  uint64_t size)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	struct blt_copy_data blt = {};
+	struct blt_copy_object src = {};
+	struct blt_copy_object dst = {};
+	intel_ctx_t *ctx;
+	uint64_t bb_size, stride, width, height;
+	uint32_t vm, exec_queue, bb;
+	uint32_t alignment = xe_get_default_alignment(fd);
+	uint64_t ahnd;
+	int cpp = 4;
+
+	igt_require(size % SZ_4K == 0);
+	igt_require(size <= SZ_16M);
+	igt_require(blt_has_fast_copy(fd));
+
+	width = size >= SZ_16K ? SZ_4K : SZ_4K / cpp;
+	height = size / width / cpp;
+	stride = width * cpp;
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
+	ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
+					 INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH,
+					 alignment);
+
+	blt_copy_init(fd, &blt);
+	blt.color_depth = CD_32bit;
+
+	bb_size = xe_bb_size(fd, SZ_4K);
+	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
+
+	blt_set_object(&src, src_bo, size, src_region, intel_get_uc_mocs_index(fd),
+		       src_pat_index, T_LINEAR,
+		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+	blt_set_geom(&src, stride, 0, 0, width, height, 0, 0);
+
+	blt_set_object(&dst, dst_bo, size, dst_region, intel_get_uc_mocs_index(fd),
+		       dst_pat_index, T_LINEAR,
+		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+	blt_set_geom(&dst, stride, 0, 0, width, height, 0, 0);
+
+	blt_set_copy_object(&blt.src, &src);
+	blt_set_copy_object(&blt.dst, &dst);
+	blt_set_batch(&blt.bb, bb, bb_size, system_memory(fd));
+
+	blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
+
+	gem_close(fd, bb);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+	intel_ctx_destroy(fd, ctx);
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 06ebd3c2af..a22572f35c 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -49,4 +49,9 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 
 uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
 
+void xe_fast_copy(int fd,
+		  uint32_t src_bo, uint32_t src_region, uint8_t src_pat_index,
+		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
+		  uint64_t size);
+
 #endif /* XE_UTIL_H */
-- 
2.43.0

