Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEE510E456
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 08:03:27 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  7 Jun 2023 13:33:52 +0530
Message-Id: <20230607080352.950226-3-janga.rahul.kumar@intel.com>
In-Reply-To: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
References: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_vm.c: Add Negative test to VM
 error capture
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

Add negative test to check invalid arguments.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_vm.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 0da6c847..7f369fc4 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1638,6 +1638,31 @@ vm_error_capture_address(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: vm-error-capture-address-invalid-val
+ * Description: Negative test to check vm error capture
+ * Functionality: error capture
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+static void
+vm_error_capture_address_invalid_val(int fd)
+{
+	struct drm_xe_ext_vm_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
+		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
+		.value = 0,
+	};
+
+	struct drm_xe_vm_create create = {
+		.extensions = to_user_pointer(&ext),
+		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+}
 
 igt_main
 {
@@ -1924,6 +1949,9 @@ igt_main
 	igt_subtest("vm-error-capture-address")
 		vm_error_capture_address(fd);
 
+	igt_subtest("vm-error-capture-address-invalid-val")
+		vm_error_capture_address_invalid_val(fd);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.25.1
