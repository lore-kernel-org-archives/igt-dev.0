Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A546CCD1292
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 17:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7C511290E;
	Mon,  8 Apr 2024 17:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8kFRHzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465E811290E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712598089; x=1744134089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UlaIVMkAKwCkIoxiHsIxkLAxtjQOI71HJU74D/uJ/2I=;
 b=H8kFRHzvULnQXEVObbH0UcAgY8NNLI8tj69oCH7lIFbS7oklxqk/J+gS
 /LWRBAOWHFoW0ZrfiKp/U0uJRQ42DLSp5MlL27F/PsJzxBRQi1Y/jFOqP
 Jc3R4Vvx+P9NvFinEr1L+cTFrAxrb4JtIivCZEtdjCconN+YVUEwZCK8r
 k+BMVcefcgIdgzRZGttS8oLCGlilZJXMmyYqv4gLK1oEGj3nJxD3cLgP0
 O/BTd23btE0iP0Fo8oYJRAiGhJHlB0aQe7TvKZ/1jp6rDIbA2EschbvXJ
 1Zh6EmLTudCi5q3DvK2rTnGvqAGs/9ZbKaDmnaml6llSfQ25GoWs+XmUc A==;
X-CSE-ConnectionGUID: Wq4qCSViQQ6KlG9er/U9AA==
X-CSE-MsgGUID: CnPEKq6DS96iPaTH/73Ahw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7759529"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7759529"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:41:28 -0700
X-CSE-ConnectionGUID: w4+S5tvPRvWebqsBS+GQng==
X-CSE-MsgGUID: /shVkALxTJyvtePXrONXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24442507"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.223])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:41:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_store: fix sync usage
Date: Mon,  8 Apr 2024 18:41:13 +0100
Message-ID: <20240408174113.73617-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

If using async binds it looks like an in-fence for the exec is needed to
ensure the exec happens after the out-fence from the binds are complete.
Therefore we need to unset DRM_XE_SYNC_FLAG_SIGNAL after doing the
binds, but before the exec, otherwise the sync is rather treated
as an out-fence and the binds can then happen after the exec, leading to
various failures. In addition it looks like async unbind should be
waited on before tearing down the queue/vm which has the bind engine
attached, since the scheduler timeout is immediately set to zero on
destroy, which might then trigger job timeouts. However it looks like
it's also fine to rather just destroy the object and leave KMD to unbind
everything itself. Update the various subtests here to conform to this.

In the case of the persistent subtest it looks simpler to use sync
vm_bind since we don't have another sync for the in-fence at hand, plus
we don't seem to need a dedicated bind engine.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1270
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_store.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index c57bcb852..728ce826b 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -102,13 +102,13 @@ static void persistance_batch(struct data *data, uint64_t addr)
  */
 static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
 {
-	struct drm_xe_sync sync = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
-		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
-		.num_syncs = 1,
+		.num_syncs = 2,
 		.syncs = to_user_pointer(&sync),
 	};
 	struct data *data;
@@ -122,7 +122,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	uint32_t bo = 0;
 
 	syncobj = syncobj_create(fd, 0);
-	sync.handle = syncobj;
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[1].handle = syncobj;
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
@@ -134,7 +135,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
-	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (inst_type == STORE)
@@ -149,12 +150,14 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
-	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_exec(fd, &exec);
 
 	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
 	igt_assert_eq(data->data, value);
 
+	syncobj_destroy(fd, sync[0].handle);
 	syncobj_destroy(fd, syncobj);
 	munmap(data, bo_size);
 	gem_close(fd, bo);
@@ -232,7 +235,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 		batch_map[b++] = value[n];
 	}
 	batch_map[b++] = MI_BATCH_BUFFER_END;
-	sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	sync[1].handle = syncobjs;
 	exec.exec_queue_id = exec_queues;
@@ -250,7 +253,6 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < count; i++) {
 		munmap(bo_map[i], bo_size);
-		xe_vm_unbind_async(fd, vm, 0, 0, dst_offset[i], bo_size, sync, 1);
 		gem_close(fd, bo[i]);
 	}
 
@@ -300,7 +302,7 @@ static void persistent(int fd)
 			      vram_if_possible(fd, engine->instance.gt_id),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, 0, sd_batch, 0, addr, batch_size, &sync, 1);
+	xe_vm_bind_sync(fd, vm, sd_batch, 0, addr, batch_size);
 	sd_data = xe_bo_map(fd, sd_batch, batch_size);
 	prt_data = xe_bo_map(fd, prt_batch, batch_size);
 
-- 
2.44.0

