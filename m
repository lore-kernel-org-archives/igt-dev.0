Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AD7C5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9D10E72A;
	Tue, 11 Aug 2026 14:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpnmyIdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B32010E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786457690; x=1817993690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j6uLgroEfORI53xe3C/O1amBRcfTsYvAdkBr3cnAjuE=;
 b=dpnmyIdZFSGKuBKHviMhjWgD5n2kcsCjG7iNoVmWtEoVuQv7e5W34pGK
 dDsy2+n5pdguM2KPzy/XbDKfcSr7tv0Az9F8vNmluL6ZGgwM6y0NEgEfl
 9cVw0Jx+RaRm1gSMAFzL2m4zvHoDs26oD12SdY8Dn3q5g7o5Xj50c0RPW
 AgqQHLBarnzvgLqofzcRwuRo8AyMwtweVS6E3lm/VzIKWRfqpRMYi/xOY
 3vtyYDuQZNVuDetc9RBbaYgv2bEDtB1LpWvhv2/UDjCvrtVjq5hvGSUPd
 gHWFvH+RpCJN19mZUV88c4PwVT6OdlAX1WxiAyYoxYt6KsCklP3j1XDeC w==;
X-CSE-ConnectionGUID: 1M/eycAFQ4ClEBftmDk+GA==
X-CSE-MsgGUID: KYTolL4qQwSzxiQA54lHng==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104519703"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104519703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:14:50 -0700
X-CSE-ConnectionGUID: +afQMKl8S0+Udj2rOY8djQ==
X-CSE-MsgGUID: rU315C89RSSw52FZr1+T0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="260737250"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:14:50 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v1 1/2] lib/xe/xe_device: Add helper for device healthcheck
Date: Tue, 11 Aug 2026 16:14:25 +0200
Message-ID: <20260811141426.1642321-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811141426.1642321-1-lukasz.laguna@intel.com>
References: <20260811141426.1642321-1-lukasz.laguna@intel.com>
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

Add helper for a basic Xe device health check. It performs a minimal
bind, exec, wait and unbind sequence on a BO to verify that the command
submission path works.

Co-developed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/meson.build    |  1 +
 lib/xe/xe_device.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_device.h | 11 +++++++
 3 files changed, 85 insertions(+)
 create mode 100644 lib/xe/xe_device.c
 create mode 100644 lib/xe/xe_device.h

diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..7408da963 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -126,6 +126,7 @@ lib_sources = [
 	'igt_msm.c',
 	'igt_dsc.c',
 	'igt_hook.c',
+	'xe/xe_device.c',
 	'xe/xe_ggtt.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
diff --git a/lib/xe/xe_device.c b/lib/xe/xe_device.c
new file mode 100644
index 000000000..74d85b097
--- /dev/null
+++ b/lib/xe/xe_device.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "xe/xe_device.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/**
+ * xe_healthcheck:
+ * @fd: Xe DRM file descriptor
+ *
+ * Basic check for the Xe execution path.
+ * It binds a BO into VM address space, executes a minimal batch,
+ * waits for completion, and then unbinds the BO.
+ */
+void xe_healthcheck(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe = NULL;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t addr = 0x1a0000;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bo;
+	uint32_t *batch;
+	size_t bo_size;
+
+	xe_for_each_engine(fd, hwe)
+		break;
+
+	igt_assert(hwe);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = xe_bb_size(fd, sizeof(*batch));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, hwe->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch = xe_bo_map(fd, bo, bo_size);
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	sync.handle = syncobj_create(fd, 0);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	batch[0] = MI_BATCH_BUFFER_END;
+
+	syncobj_reset(fd, &sync.handle, 1);
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_reset(fd, &sync.handle, 1);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync.handle);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(batch, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
diff --git a/lib/xe/xe_device.h b/lib/xe/xe_device.h
new file mode 100644
index 000000000..f1b6f887b
--- /dev/null
+++ b/lib/xe/xe_device.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_DEVICE_H__
+#define __XE_DEVICE_H__
+
+void xe_healthcheck(int fd);
+
+#endif /* __XE_DEVICE_H__ */
-- 
2.43.0

