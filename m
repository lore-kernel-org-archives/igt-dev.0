Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED431C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 17:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E5C10E320;
	Thu, 25 Jul 2024 17:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxadJjT2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA3910E07C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721928181; x=1753464181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zphXYV2bh5+9V71GIb14JH3q66n+hmTsStoU4s8fAQQ=;
 b=QxadJjT2U+g6VBdl7HtY3VX0J6D7YOTqTxVM8OZqOxaLcmxaLKPm8jfa
 7qZSXtvm4PZ1wIwauzNE+f8Lzs0kZA4pXzTT+GFJS6ljszNdEifr6ymjN
 L/6MQvn5BAcWibc1x0PAM2KvaCuYJadCU7RIET1h4pia44nt1JVlpOi/R
 mgC421sRPsX/WFKBlrgTWXmYHPU+qwWgRAj9atFrlzwg0RyWr3ul788Nz
 JS9wV5LkmulSqL7W2T3MabeiH5EC5uFRrxQA2aKkm4RHzG4mdPGmN9Kq9
 hNYOTV88ZtJ1cO5+gzXfx/lPReIHhStg7sOatrnlN0mA/rDUEa7A6PBHt Q==;
X-CSE-ConnectionGUID: tmQO1h59R9iwtTPbweFOlw==
X-CSE-MsgGUID: EypbucVTTCOyGWojmsWg2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19839657"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19839657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:23:01 -0700
X-CSE-ConnectionGUID: G2wzj8dcRsiZLrwwndM20w==
X-CSE-MsgGUID: MmkAiYE5SxG15F+owwuy7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="57583287"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:23:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH v3 2/2] tests/intel/xe_vm: Test zero number of VM binds
Date: Thu, 25 Jul 2024 10:23:44 -0700
Message-Id: <20240725172344.1927234-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725172344.1927234-1-matthew.brost@intel.com>
References: <20240725172344.1927234-1-matthew.brost@intel.com>
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

Verify the bind queue ordering works wrt out-sync signaling when zero
number of binds passed to VM bind IOCTL.

v2:
 - Fix build error
v3:
 - Adjust patch subject (Kamil)
 - Make xe_vm_bind_zero a static function in xe_vm.c (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 76 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a4f6c7a0b4..2b050f32c8 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -728,6 +728,76 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	xe_vm_destroy(fd, vm);
 }
 
+static void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
+			    struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = exec_queue,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
+}
+
+/**
+ * SUBTEST: zero-binds
+ * Description: Test zero binds in IOCTL
+ * Functionality: bind engines
+ * Run type: BAT
+ */
+
+static void test_zero_binds(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct xe_cork cork;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = ALIGN(xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	xe_cork_init(fd, eci, &cork);
+	xe_cork_wait_started(&cork);
+
+	/* Initial bind behind cork */
+	sync[0].handle = cork.syncobj;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	/* Bind /w num_binds == 0 */
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_bind_zero(fd, vm, 0, sync, 1);
+
+	/* Let jobs runs for a bit */
+	usleep(100000);
+
+	/* both binds are waiting */
+	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
+
+	/* Release cork */
+	xe_cork_end(&cork);
+	xe_cork_wait_done(&cork);
+	xe_cork_fini(&cork);
+
+	/* both binds are done */
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
 
 
@@ -1998,6 +2068,12 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_bind_execqueues_independent(fd, hwe, CONFLICT);
 
+	igt_subtest("zero-binds")
+		xe_for_each_engine(fd, hwe) {
+			test_zero_binds(fd, hwe);
+			break;
+		}
+
 	igt_subtest("bind-array-twice")
 		xe_for_each_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2, 0);
-- 
2.34.1

