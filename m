Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E437810E457
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 08:03:26 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  7 Jun 2023 13:33:51 +0530
Message-Id: <20230607080352.950226-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
References: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe_vm.c: Add VM bind error
 capture test
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Test injects error during vm bind and check the captured
bind address.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_vm.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 861822b4..0da6c847 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1589,6 +1589,56 @@ try_again_after_invalidate:
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: vm-error-capture-address
+ * Description: Test to check vm error capture
+ * Functionality: error capture
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+static void
+vm_error_capture_address(int fd)
+{
+	struct drm_xe_vm_bind_op_error_capture capture = {};
+	struct drm_xe_ext_vm_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
+		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
+		.value = to_user_pointer(&capture),
+	};
+
+	uint32_t vm, bo;
+	uint64_t addr = 0x1a0000;
+	size_t bo_size;
+
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+
+	sync.handle = syncobj_create(fd, 0);
+	bo_size = 0x1000 * 32;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
+				to_user_pointer(&ext));
+
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+#define INJECT_ERROR	(0x1 << 31)
+	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
+			XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC |
+			INJECT_ERROR, &sync, 1, 0, 0);
+
+	igt_assert_eq(addr, capture.addr);
+
+	syncobj_destroy(fd, sync.handle);
+
+	if (bo)
+		gem_close(fd, bo);
+
+	xe_vm_destroy(fd, vm);
+}
+
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -1871,6 +1921,9 @@ igt_main
 		}
 	}
 
+	igt_subtest("vm-error-capture-address")
+		vm_error_capture_address(fd);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.25.1
