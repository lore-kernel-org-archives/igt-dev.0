Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEF2C47DD9
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 03:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839910E6DF;
	Thu, 28 Mar 2024 03:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSdphVNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C0610E6DF
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 03:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711595425; x=1743131425;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qYp2qeEJ0aGZvY61nHmvNciUeE/qsq3bH0KqZ7BMtAc=;
 b=HSdphVNdtX2+PJe4wcvSc09P9gwt28xfWTb+nW2ErC5PUcHV1guPcHfl
 WceN3HQVFG3nDUXErOLpbe0EpbXgom3vr0E2qNOn+FXfLfJtsIB+2WXkW
 oJ+VRv4UbNvOOPUaVoPwSoacj4C4q0JVm/vadJYQHqt7dSUogiGAv+f8U
 qBMfLCh75QQv4fcJAkIJ54rKsrEZkg+LihB1zsMOkk0eJTvy8D6Te5Lpb
 Rx/n5DAAs1snvzr0T+hRjvXtM5DWDqwh92K248ipc5wHWXpR/pbS9hJj3
 GZNvPrsAP/H5hiwaF0XSQ84aMfAcdsZ8VFBik/Q4PNx7rJneDDfc8X4ei Q==;
X-CSE-ConnectionGUID: yqn8eUktQ7SoXBmGcnopRQ==
X-CSE-MsgGUID: TV6wZ2b9Qj2PaKVOGcojqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10522353"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="10522353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 20:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="21151438"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 20:10:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/xe: Update __xe_exec_queue_create()
Date: Wed, 27 Mar 2024 20:10:21 -0700
Message-ID: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add ability to specify width and num_placement in __xe_exec_queue_create()
call. Use __xe_exec_queue_create() instead of ioctl calls in the tests.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_ioctl.c                    |  8 ++---
 lib/xe/xe_ioctl.h                    |  2 +-
 tests/intel/xe_compute.c             |  2 +-
 tests/intel/xe_create.c              |  4 +--
 tests/intel/xe_exec_balancer.c       | 45 ++++++++--------------------
 tests/intel/xe_exec_queue_property.c | 35 +++++++---------------
 tests/intel/xe_exec_reset.c          | 25 ++++------------
 tests/intel/xe_exec_threads.c        | 14 +++------
 tests/intel/xe_spin_batch.c          | 12 ++------
 9 files changed, 43 insertions(+), 104 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index da2a7af51..934c877eb 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -332,15 +332,15 @@ uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext)
 	return create.exec_queue_id;
 }
 
-int __xe_exec_queue_create(int fd, uint32_t vm,
+int __xe_exec_queue_create(int fd, uint32_t vm, uint16_t width, uint16_t num_placements,
 			   struct drm_xe_engine_class_instance *instance,
 			   uint64_t ext, uint32_t *exec_queue_id)
 {
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
 		.vm_id = vm,
-		.width = 1,
-		.num_placements = 1,
+		.width = width,
+		.num_placements = num_placements,
 		.instances = to_user_pointer(instance),
 	};
 	int err;
@@ -363,7 +363,7 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 {
 	uint32_t exec_queue_id;
 
-	igt_assert_eq(__xe_exec_queue_create(fd, vm, instance, ext, &exec_queue_id), 0);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext, &exec_queue_id), 0);
 
 	return exec_queue_id;
 }
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 2b30f1d98..4d08402e0 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -70,7 +70,7 @@ uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t pla
 uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 			      uint32_t flags, uint16_t cpu_caching);
 uint16_t __xe_default_cpu_caching(int fd, uint32_t placement, uint32_t flags);
-int __xe_exec_queue_create(int fd, uint32_t vm,
+int __xe_exec_queue_create(int fd, uint32_t vm, uint16_t width, uint16_t num_placements,
 			   struct drm_xe_engine_class_instance *instance,
 			   uint64_t ext, uint32_t *exec_queue_id);
 uint32_t xe_exec_queue_create(int fd, uint32_t vm,
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index e773e798a..75378595e 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -86,7 +86,7 @@ test_ccs_mode(int num_gt)
 			hwe->gt_id = gt;
 			hwe->engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
 			hwe->engine_instance = m;
-			igt_assert_neq(__xe_exec_queue_create(fd, vm, hwe, 0, &q), 0);
+			igt_assert_neq(__xe_exec_queue_create(fd, vm, 1, 1, hwe, 0, &q), 0);
 
 			xe_vm_destroy(fd, vm);
 			drm_close_driver(fd);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index fd5d71d8a..6ea5ad38b 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -206,7 +206,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
 		for (i = 0; i < exec_queues_per_process; i++) {
 			idx = rand() % num_engines;
 			engine = xe_engine(fd, idx);
-			err = __xe_exec_queue_create(fd, vm, &engine->instance,
+			err = __xe_exec_queue_create(fd, vm, 1, 1, &engine->instance,
 						     0, &exec_queue);
 			igt_debug("[%2d] Create exec_queue: err=%d, exec_queue=%u [idx = %d]\n",
 				  n, err, exec_queue, i);
@@ -349,7 +349,7 @@ static void create_contexts(int fd)
 	xe_vm_bind_sync(fd, vm, bo, 0, bo_addr, bo_size);
 
 	for (i = 0; i < n; i++) {
-		int err = __xe_exec_queue_create(fd, vm, &xe_engine(fd, 0)->instance, 0,
+		int err = __xe_exec_queue_create(fd, vm, 1, 1, &xe_engine(fd, 0)->instance, 0,
 						 &exec_queues[i]);
 		igt_assert_f(!err, "Failed to create exec queue (%d), iteration: %d\n", err,
 			     i + 1);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 6e467e34a..8ce8cbf7f 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -75,16 +75,8 @@ static void test_all_active(int fd, int gt, int class)
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placements,
+						     eci, 0, &exec_queues[i]), 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 
@@ -231,16 +223,10 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm,
+						     flags & PARALLEL ? num_placements : 1,
+						     flags & PARALLEL ? 1 : num_placements,
+						     eci, 0, &exec_queues[i]), 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
@@ -458,19 +444,12 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	}
 	memset(data, 0, bo_size);
 
-	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
-			.extensions = 0,
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
-	}
+	for (i = 0; i < n_exec_queues; i++)
+		igt_assert_eq(__xe_exec_queue_create(fd, vm,
+						     flags & PARALLEL ? num_placements : 1,
+						     flags & PARALLEL ? 1 : num_placements,
+						     eci, 0, &exec_queues[i]), 0);
+
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 51ecd725d..57baae305 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -56,21 +56,11 @@ static void test_set_property(int xe, int property_name,
 		.property = property_name,
 		.value = property_value,
 	};
+	uint32_t exec_queue_id;
 
-	struct drm_xe_exec_queue_create create = {
-		.extensions = to_user_pointer(&ext),
-		.width = 1,
-		.num_placements = 1,
-		.instances = to_user_pointer(&instance),
-		.vm_id = xe_vm_create(xe, 0, 0),
-	};
-	int ret = 0;
-
-	if (igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
-		ret = -errno;
-		errno = 0;
-	}
-	igt_assert_eq(ret, err_val);
+	igt_assert_eq(__xe_exec_queue_create(xe, xe_vm_create(xe, 0, 0), 1, 1,
+					     &instance, to_user_pointer(&ext),
+					     &exec_queue_id), err_val);
 }
 
 static void test_property_min_max(int xe, int engine, const char **property)
@@ -183,27 +173,24 @@ static void invalid_property(int xe)
 		.property = valid_property,
 		.value = 1,
 	};
+	uint32_t exec_queue_id, vm = xe_vm_create(xe, 0, 0);
 
-	struct drm_xe_exec_queue_create create = {
-		.extensions = to_user_pointer(&ext),
-		.width = 1,
-		.num_placements = 1,
-		.instances = to_user_pointer(&instance),
-		.vm_id = xe_vm_create(xe, 0, 0),
-	};
 	/* Correct value should pass */
-	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
+					     to_user_pointer(&ext), &exec_queue_id), 0);
 
 	/* This will fail as soon as a new property is introduced. It is
 	 * expected and the test will have to be updated. */
 	for (int i = 2; i < 16; i++ ) {
 		ext.property = i;
-		do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
+						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
 	}
 
 	/* Correct value should still pass */
 	ext.property = valid_property;
-	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
+					     to_user_pointer(&ext), &exec_queue_id), 0);
 }
 
 igt_main
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index cc10900d9..8d731e689 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -177,16 +177,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm,
+						     flags & PARALLEL ? num_placements : 1,
+						     flags & PARALLEL ? 1 : num_placements,
+						     eci, 0, &exec_queues[i]), 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
@@ -621,25 +615,18 @@ static void submit_jobs(struct gt_thread_data *t)
 			.engine_instance = 0,
 			.gt_id = 0,
 		};
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = 1,
-			.num_placements = 1,
-			.instances = to_user_pointer(&instance),
-		};
 		struct drm_xe_exec exec;
 		int ret;
 
 		/* GuC IDs can get exhausted */
-		ret = igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create);
+		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
 		if (ret)
 			continue;
 
-		exec.exec_queue_id = create.exec_queue_id;
 		exec.address = addr;
 		exec.num_batch_buffer = 1;
 		xe_exec(fd, &exec);
-		xe_exec_queue_destroy(fd, create.exec_queue_id);
+		xe_exec_queue_destroy(fd, exec.exec_queue_id);
 	}
 
 	munmap(data, bo_size);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 05ea1d35a..d6d39814e 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -114,16 +114,10 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm,
+						     flags & PARALLEL ? num_placements : 1,
+						     flags & PARALLEL ? 1 : num_placements,
+						     eci, 0, &exec_queues[i]), 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index da8fd0a30..68cbd1bd1 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -114,16 +114,8 @@ static void spin_all(int fd, int gt, int class)
 	vm = xe_vm_create(fd, 0, 0);
 
 	for (i = 0; i < num_placements; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placements,
+						     eci, 0, &exec_queues[i]), 0);
 		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queues[i], .vm = vm);
 	}
 
-- 
2.43.0

