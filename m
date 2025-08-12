Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B2CA0EC4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 13:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4C610E3F3;
	Tue, 12 Aug 2025 13:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBYl172+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE1710E3F3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755003727; x=1786539727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAL01cXxnp8BVuni9CzL4+uM8yg+dpV8H10YWOMPGpg=;
 b=OBYl172+lbz1wqREAxF0EUFE2y5L8gEY8AXqyAfVdNKQWZAGicjqR8sI
 osbq8vQu3iNLJ3FTK3uv0p4QjSqo+yFNKwx9d2KqNBi6SocAwzA/BQsiW
 fYsmlPGVbDiV3J+jFdWs6agWabl4ABN5ZwQyKR8zhqUZciyN+q8HZhgkv
 gSza9i0Yz0Zlr7vP8pTF72REaWFoY9GypqKpgx2ec6gTFnCgjyTbahCbj
 Fd0iU/ks4ww7dgq6Defb53BUB7vdH7xr7ELOWCMFBW9U36/qJpjjVuE7Q
 yHXIZhFqatXfNVdLVPjqgyIEc7PN/wo/XQImu74ErGDOwDz/OmdbIiC54 w==;
X-CSE-ConnectionGUID: nl1Du2LPScKYmKCMBIT9aw==
X-CSE-MsgGUID: B/stdi+PR22WAvbSvpUeJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79849073"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="79849073"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:02:06 -0700
X-CSE-ConnectionGUID: udY2Chl2TYWYxFZEnqcX7A==
X-CSE-MsgGUID: U1iCgM+LTBqYqzyLLhQ9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170407112"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:02:05 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_vm: Unify bind-flag-invalid and
 bind-array-flag-invalid test functions
Date: Tue, 12 Aug 2025 15:01:42 +0200
Message-ID: <20250812130142.37988-3-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250812130142.37988-1-christoph.manszewski@intel.com>
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Unify the single bind and array bind invalid flag subtests by using a
common test function which parametrizes the number of bind operations to
perform.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_vm.c | 98 +++++++--------------------------------------
 1 file changed, 15 insertions(+), 83 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 236494407..7a37bfe05 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2191,86 +2191,6 @@ static bool pxp_interface_supported(int fd)
 	return ret != -EINVAL;
 }
 
-/**
- * SUBTEST: bind-flag-invalid
- * Functionality: bind
- * Description: Ensure invalid bind flags are rejected.
- * Test category: negative test
- */
-static void bind_flag_invalid(int fd)
-{
-	uint32_t bo, bo_size = xe_get_default_alignment(fd);
-	uint64_t addr = 0x1a0000;
-	uint32_t vm;
-	struct drm_xe_vm_bind bind;
-	struct drm_xe_sync sync[1] = {
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-	};
-
-	vm = xe_vm_create(fd, 0, 0);
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
-	sync[0].handle = syncobj_create(fd, 0);
-
-	memset(&bind, 0, sizeof(bind));
-	bind.vm_id = vm;
-	bind.num_binds = 1;
-	bind.bind.obj = bo;
-	bind.bind.range = bo_size;
-	bind.bind.addr = addr;
-	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
-	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
-	bind.num_syncs = 1;
-	bind.syncs = (uintptr_t)sync;
-
-	/* Using valid flags should work */
-	bind.bind.flags = 0;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-	syncobj_reset(fd, &sync[0].handle, 1);
-
-	bind.bind.flags = DRM_XE_VM_BIND_FLAG_READONLY;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-	syncobj_reset(fd, &sync[0].handle, 1);
-
-	bind.bind.flags = DRM_XE_VM_BIND_FLAG_IMMEDIATE;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-	syncobj_reset(fd, &sync[0].handle, 1);
-
-	if (pxp_interface_supported(fd)) {
-		bind.bind.flags = DRM_XE_VM_BIND_FLAG_CHECK_PXP;
-		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-		syncobj_reset(fd, &sync[0].handle, 1);
-	}
-
-	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
-	bind.bind.obj = 0;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-	syncobj_reset(fd, &sync[0].handle, 1);
-	bind.bind.obj = bo;
-
-	bind.bind.flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-	syncobj_reset(fd, &sync[0].handle, 1);
-
-	/* Using invalid flags should not work */
-	bind.bind.flags = 1 << 5;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
-
-	/* Using valid flags should still work */
-	bind.bind.flags = 0;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	syncobj_destroy(fd, sync[0].handle);
-	xe_vm_destroy(fd, vm);
-}
-
 static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind bind,
 			      struct drm_xe_vm_bind_op *bind_ops, int num_binds)
 {
@@ -2293,6 +2213,9 @@ static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind bind,
 			bind_ops[j].obj = valid_flags[i] == DRM_XE_VM_BIND_FLAG_NULL ? 0 : bo;
 		}
 
+		if (num_binds == 1)
+			bind.bind = bind_ops[0];
+
 		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
 		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 		syncobj_reset(fd, &sync[0].handle, 1);
@@ -2300,6 +2223,11 @@ static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind bind,
 }
 
 /**
+ * SUBTEST: bind-flag-invalid
+ * Functionality: bind
+ * Description: Ensure invalid bind flags are rejected.
+ * Test category: negative test
+ *
  * SUBTEST: bind-array-flag-invalid
  * Functionality: bind
  * Description: Ensure invalid bind flags are rejected when submitting an array of binds.
@@ -2317,7 +2245,7 @@ static void test_bind_flag_invalid(int fd, int num_binds)
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 
-	igt_assert(num_binds > 1);
+	igt_assert(num_binds > 0);
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
@@ -2333,7 +2261,8 @@ static void test_bind_flag_invalid(int fd, int num_binds)
 	}
 
 	memset(&bind, 0, sizeof(bind));
-	bind.vector_of_binds = to_user_pointer(bind_ops);
+	if (num_binds > 1)
+		bind.vector_of_binds = to_user_pointer(bind_ops);
 	bind.num_binds = num_binds;
 	bind.syncs = to_user_pointer(sync);
 	bind.num_syncs = 1;
@@ -2348,6 +2277,9 @@ static void test_bind_flag_invalid(int fd, int num_binds)
 		bind_ops[i].obj = bo;
 	}
 
+	if (num_binds == 1)
+		bind.bind = bind_ops[0];
+
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
 
 	/* Using valid flags should still work */
@@ -2676,7 +2608,7 @@ igt_main
 		userptr_invalid(fd);
 
 	igt_subtest("bind-flag-invalid")
-		bind_flag_invalid(fd);
+		test_bind_flag_invalid(fd, 1);
 
 	igt_subtest("compact-64k-pages")
 		xe_for_each_engine(fd, hwe) {
-- 
2.47.1

