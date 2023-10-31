Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF01E10E518
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 15:03:42 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Oct 2023 16:01:40 +0100
Message-Id: <20231031150140.374123-2-christoph.manszewski@intel.com>
In-Reply-To: <20231031150140.374123-1-christoph.manszewski@intel.com>
References: <20231031150140.374123-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/1] tests/intel/xe_vm: Add 'partial-unbinds'
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Xe supports partial unbind operations in asynchronous mode. Add basic
coverage for this feature.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_vm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index dd3302337..eeb49122a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -256,6 +256,46 @@ test_bind_one_bo_many_times_many_vm(int fd)
 	__test_bind_one_bo(fd, 0, addrs_size, addrs);
 }
 
+/**
+ * SUBTEST: partial-unbinds
+ * Description: Test partial unbinds
+ * Functionality: unbind
+ * Test category: functionality test
+ */
+
+static void test_partial_unbinds(int fd)
+{
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	size_t bo_size = 3 * xe_get_default_alignment(fd);
+	uint32_t bo = xe_bo_create(fd, 0, vm, bo_size);
+	uint64_t unbind_size = bo_size / 3;
+	uint64_t addr = 0x1a0000;
+
+	struct drm_xe_sync sync = {
+	    .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	    .handle = syncobj_create(fd, 0),
+	};
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_reset(fd, &sync.handle, 1);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr + unbind_size, unbind_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_reset(fd, &sync.handle, 1);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, unbind_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_reset(fd, &sync.handle, 1);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr + 2 * unbind_size, unbind_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync.handle);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: unbind-all-%d-vmas
  * Description: Test unbind all with %arg[1] VMAs
@@ -1827,6 +1867,9 @@ igt_main
 	igt_subtest("scratch")
 		test_scratch(fd);
 
+	igt_subtest("partial-unbinds")
+		test_partial_unbinds(fd);
+
 	igt_subtest("unbind-all-2-vmas")
 		unbind_all(fd, 2);
 
-- 
2.40.1
