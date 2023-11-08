Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2410E041
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 09:13:08 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  8 Nov 2023 14:46:29 +0530
Message-Id: <20231108091629.814209-4-janga.rahul.kumar@intel.com>
In-Reply-To: <20231108091629.814209-1-janga.rahul.kumar@intel.com>
References: <20231108091629.814209-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/intel/xe_waitfence: Add
 invalid-engine subtest
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

Negative test to check ioctl returns expected error when
invalid enigne is used.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_waitfence.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 87e7b2284..71616c7ef 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -111,6 +111,9 @@ waitfence(int fd, enum waittype wt)
  *
  * SUBTEST: invalid-ops
  * Description: Check query with invalid engine info returns expected error code
+ *
+ * SUBTEST: invalid-engine
+ * Description: Check query with invalid engine info returns expected error code
  */
 
 static void
@@ -163,6 +166,42 @@ invalid_ops(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
 }
 
+static void
+invalid_engine(int fd)
+{
+	uint32_t bo;
+
+	struct drm_xe_wait_user_fence wait = {
+		.addr = to_user_pointer(&wait_fence),
+		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.flags = 0,
+		.value = 1,
+		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.timeout = -1,
+		.num_engines = 1,
+		.instances = 0,
+	};
+
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+
+	bo = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+
+	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
+
+	struct drm_xe_wait_user_fence wait = {
+		.addr = to_user_pointer(&wait_fence),
+		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.flags = 0,
+		.value = 1,
+		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.timeout = 1,
+		.num_engines = 1,
+		.instances = 0,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
+}
+
 
 igt_main
 {
@@ -183,6 +222,9 @@ igt_main
 	igt_subtest("invalid-ops")
 		invalid_ops(fd);
 
+	igt_subtest("invalid-engine")
+		invalid_engine(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.25.1
