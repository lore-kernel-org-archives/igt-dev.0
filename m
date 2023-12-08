Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329B10E27C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 15:37:54 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_waitfence: Add test to verify if mask is
 checked
Date: Fri,  8 Dec 2023 15:37:38 +0000
Message-Id: <20231208153738.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Verify if the driver checks that the drm_xe_wait_user_fence mask
is one of the allowed values DRM_XE_UFENCE_WAIT_MASK_* provided
in xe_drm.h. See kernel commit ("drm/xe: check mask in
xe_wait_user_fence_ioctl()").

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_waitfence.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 3be987954..e76a4c78d 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -152,6 +152,9 @@ waitfence(int fd, enum waittype wt)
  *
  * SUBTEST: invalid-engine
  * Description: Check query with invalid engine info returns expected error code
+ *
+ * SUBTEST: invalid-mask
+ * Description: Check query with invalid mask returns expected error code
  */
 
 static void
@@ -229,6 +232,37 @@ invalid_engine(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
 }
 
+static void
+invalid_mask(int fd)
+{
+	uint32_t bo;
+
+	struct drm_xe_wait_user_fence wait = {
+		.addr = to_user_pointer(&wait_fence),
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
+		.flags = DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP,
+		.value = 1,
+		.timeout = 1,
+		.num_engines = 0,
+		.instances = 0,
+	};
+
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+
+	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
+
+	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
+
+	wait.mask = 0;
+	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
+
+	wait.mask = 1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
+
+	wait.mask = DRM_XE_UFENCE_WAIT_MASK_U8;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
+}
+
 
 igt_main
 {
@@ -255,6 +289,9 @@ igt_main
 	igt_subtest("invalid-engine")
 		invalid_engine(fd);
 
+	igt_subtest("invalid-mask")
+		invalid_mask(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1
