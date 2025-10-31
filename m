Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFD0CCFA06
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF23B10E34B;
	Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffRrWhjD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DED10E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935762; x=1793471762;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aRYGaKlFVnDrGR1IL5xGVCGE2TVP7AjttAfsPR2XUl0=;
 b=ffRrWhjDXycdnp693P3Z6AopXowglIzmaaRvQUgJAroJzFYxryRA3XfB
 ZS4b3ulOc2feZDRKLf3kTG9Kihh5VfRogxdrDuVn0tAqNWltaAFDpyuIT
 CShYnVnpJdBCPuVvElwZf7wHLKQMPuvmAj1To+qiAroUWAXIdxmlRuY29
 Aavu9rDZGLbuzX6u8e/5JidM/PsLgi6tkNjdrcNFXUZoSpAcB/9+aVPDy
 A6DP8YK7ESVUVQh6rDnw0uGZqR5Y4NDA5UL5hRRN3J+27Mdp1ZnEsWQbx
 yaRE4A0eTGcQINXzPTSX+0flDnyVjSKeclBDEf9C6rxgHoN8VCO+uM/Aa Q==;
X-CSE-ConnectionGUID: C9F16dItR0ihsWdsWqS1kg==
X-CSE-MsgGUID: LF6dDF/8QzaW1o7JcfO/qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144725"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
X-CSE-ConnectionGUID: 6qZR5cczSEiaEpNbN7l0zA==
X-CSE-MsgGUID: Ihu14LplQiK3UG7NrPWlFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650017"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 04/18] tests/xe_exec_multi_queue: Validate exec submissions
Date: Fri, 31 Oct 2025 11:35:41 -0700
Message-ID: <20251031183555.1882721-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Validate multi queue feature with different queue group size
and with execbuf submissions.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 197 ++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 03b920dc8..de2aae8f2 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -13,12 +13,15 @@
 
 #include "igt.h"
 #include "xe_drm.h"
+#include "lib/igt_syncobj.h"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
 #define MAX_N_EXEC_QUEUES	64
 
+#define USERPTR			(0x1 << 0)
+
 #define MAX_INSTANCE 9
 
 #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
@@ -144,8 +147,175 @@ test_sanity(int fd, int gt, int class)
 	__test_sanity(fd, gt, class);
 }
 
+static void
+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
+		 int n_exec_queues, int n_execs, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	uint32_t bind_syncobj;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
+
+	if (flags & USERPTR) {
+		data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+		igt_assert(data);
+
+		memset(data, 0, bo_size);
+	} else {
+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+
+	for (i = 0; i < n_exec_queues; i++) {
+		struct drm_xe_ext_set_property multi_queue = {
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+		};
+		uint64_t ext = to_user_pointer(&multi_queue);
+
+		multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placement, eci,
+						     ext, &exec_queues[i]), 0);
+
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	bind_syncobj = syncobj_create(fd, 0);
+	sync[0].handle = bind_syncobj;
+	if (bo)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
+					 addr, bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_exec_queues;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[0].handle = bind_syncobj;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+		if (e != i)
+			syncobj_reset(fd, &syncobjs[e], 1);
+
+		xe_exec(fd, &exec);
+	}
+
+	for (i = 0; i < n_exec_queues && i < n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
+
+	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	syncobj_reset(fd, &sync[0].handle, 1);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else {
+		free(data);
+	}
+
+	syncobj_destroy(fd, bind_syncobj);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: one-queue-%s
+ * Description: Run %arg[1] test with one exec queue
+ * Test category: functionality test
+ *
+ * SUBTEST: two-queues-%s
+ * Description: Run %arg[1] test with two exec queues
+ * Test category: functionality test
+ *
+ * SUBTEST: many-queues-%s
+ * Description: Run %arg[1] test with many exec queues
+ * Test category: stress test
+ *
+ * SUBTEST: max-queues-%s
+ * Description: Run %arg[1] test with max exec queues
+ * Test category: stress test
+ *
+ * SUBTEST: many-execs-%s
+ * Description: Run %arg[1] test with many exec submissions per exec queue
+ * Test category: functionality test
+ *
+ * SUBTEST: few-execs-%s
+ * Description: Run %arg[1] test with exec submissions only on few exec queues
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @basic:					basic
+ * @userptr:					userptr
+ */
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
+	  int n_exec_queues, int n_execs, unsigned int flags)
+{
+	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs, flags);
+}
+
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "basic", 0 },
+		{ "userptr", USERPTR },
+		{ NULL },
+	};
 	int fd, gt, class;
 
 	igt_fixture {
@@ -158,6 +328,33 @@ igt_main
 			xe_for_each_multi_queue_engine_class(class)
 				test_sanity(fd, gt, class);
 
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("one-queue-%s", s->name)
+			xe_for_each_multi_queue_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, 1, s->flags);
+
+		igt_subtest_f("two-queues-%s", s->name)
+			xe_for_each_multi_queue_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 2, 2, s->flags);
+
+		igt_subtest_f("many-queues-%s", s->name)
+			xe_for_each_multi_queue_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 16, 16, s->flags);
+
+		igt_subtest_f("max-queues-%s", s->name)
+			xe_for_each_multi_queue_engine(fd, hwe)
+				test_exec(fd, hwe, 1, MAX_N_EXEC_QUEUES,
+					  MAX_N_EXEC_QUEUES, s->flags);
+
+		igt_subtest_f("many-execs-%s", s->name)
+			xe_for_each_multi_queue_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 16, 64, s->flags);
+
+		igt_subtest_f("few-execs-%s", s->name)
+			xe_for_each_multi_queue_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 16, 8, s->flags);
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.43.0

