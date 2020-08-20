Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A60E6E3D3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2020 13:01:39 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 20 Aug 2020 18:28:33 +0530
Message-Id: <20200820125833.5558-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] i915/gem_vm_create: Added test
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun.Melkaveri@intel.com, lukasz.fiedorowicz@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description for test and to all the available subtests.

v2:Modified 5th subtest description.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_vm_create.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index e8af68f1..e9172291 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -26,6 +26,11 @@
 #include "igt.h"
 #include "igt_dummyload.h"
 
+IGT_TEST_DESCRIPTION("Test the basic vm creation ioctl,"
+		 "where it checks if invalid combinations are rejected and "
+		 "checks isolation that the same vm_id on different fd are indeed "
+		 "different vm.");
+
 static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
 {
 	int err = 0;
@@ -395,10 +400,10 @@ igt_main
 		igt_require_gem(i915);
 		igt_require(has_vm(i915));
 	}
-
+	igt_describe("Checks if vm creation ioctl returns error for invalid flags and extensions.");
 	igt_subtest("invalid-create")
 		invalid_create(i915);
-
+	igt_describe("Checks if vm destroy ioctl returns error for invalid vmid's, flags and extensions.");
 	igt_subtest("invalid-destroy")
 		invalid_destroy(i915);
 
@@ -406,16 +411,23 @@ igt_main
 		igt_fixture {
 			gem_context_require_param(i915, I915_CONTEXT_PARAM_VM);
 		}
-
+		igt_describe("Checks if offset for same context can be different for different vm's.");
 		igt_subtest("execbuf")
 			execbuf(i915);
 
+		igt_describe("Checks if same vmid in different fd are different vm, also " 
+			     "proves that it cannot be written to vm from another fd.");
 		igt_subtest("isolation")
 			isolation(i915);
-
+		
+		igt_describe("Test creates a vm and is allowed to share between two contexts on the same fd "
+			     "and checks if offset set by one context of an already active vma can be modified"
+			     " by another context or not."); 
 		igt_subtest("create-ext")
 			create_ext(i915);
-
+		
+		igt_describe("Test tries to access same vm and context for "
+			     "two different spin batches when vm has been destroyed asynchronously.");
 		igt_subtest("async-destroy")
 			async_destroy(i915);
 	}
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
