Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B54310E452
 for <igt-dev@lists.freedesktop.org>; Wed, 10 May 2023 06:54:21 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Date: Wed, 10 May 2023 12:24:15 +0530
Message-Id: <20230510065415.3599892-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/xe/xe_create: Exercise oversized object
 detection
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Create an oversized object and try to check if it throws an error.

v2: Added it as a new subtest.(Rahul)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Acked-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_create.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index ae841f80..5effabc8 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -87,6 +87,26 @@ static void create_invalid_size(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: create-massive-size
+ * Description: Verifies xe bo create returns expected error code on massive
+ *              buffer sizes.
+ */
+static void create_massive_size(int fd)
+{
+	uint64_t memreg = all_memory_regions(fd), region;
+	uint32_t vm;
+	uint32_t handle;
+	int ret;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+
+	xe_for_each_mem_region(fd, memreg, region) {
+		ret = __create_bo(fd, vm, -1ULL >> 32, region, &handle);
+		igt_assert_eq(ret, -ENOSPC);
+	}
+}
+
 igt_main
 {
 	int xe;
@@ -100,6 +120,11 @@ igt_main
 		create_invalid_size(xe);
 	}
 
+	igt_subtest("create-massive-size") {
+		create_massive_size(xe);
+	}
+
+
 	igt_fixture {
 		xe_device_put(xe);
 		close(xe);
-- 
2.25.1
