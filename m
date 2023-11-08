Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D1810E71A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 11:19:14 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  8 Nov 2023 16:52:49 +0530
Message-Id: <20231108112251.819141-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20231108112251.819141-1-janga.rahul.kumar@intel.com>
References: <20231108112251.819141-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/intel/xe_waitfence: Add
 invalid-flag subtest
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

Negative test to check ioctl returns expected error when invalid
flag param is used.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_waitfence.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index e0116f181..32ffc6eca 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -98,6 +98,43 @@ waitfence(int fd, enum waittype wt)
 	}
 }
 
+/**
+ * TEST: Negative test for wait ufence ioctl
+ * Category: Software building block
+ * Sub-category: waitfence
+ * Functionality: waitfence
+ * Run type: FULL
+ * Test category: negative test
+ *
+ * SUBTEST: invalid-flag
+ * Description: Check query with invalid flag returns expected error code
+ */
+
+static void
+invalid_flag(int fd)
+{
+	uint32_t bo;
+
+	struct drm_xe_wait_user_fence wait = {
+		.addr = to_user_pointer(&wait_fence),
+		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.flags = -1,
+		.value = 1,
+		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.timeout = -1,
+		.num_engines = 0,
+		.instances = 0,
+	};
+
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+
+	bo = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+
+	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
+}
+
 igt_main
 {
 	int fd;
@@ -111,6 +148,9 @@ igt_main
 	igt_subtest("abstime")
 		waitfence(fd, ABSTIME);
 
+	igt_subtest("invalid-flag")
+		invalid_flag(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.25.1
