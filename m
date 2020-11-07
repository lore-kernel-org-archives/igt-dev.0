Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028B6E0A0
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Nov 2020 11:52:42 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat,  7 Nov 2020 17:25:42 +0530
Message-Id: <20201107115542.100899-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_param: Add subtests
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_param.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 72dcb973..2a656a60 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -265,23 +265,29 @@ igt_main
 			arg.param = I915_CONTEXT_PARAM_BANNABLE;
 	}
 
+	igt_describe("Basic test for context get/set param ioctls using valid context");
 	igt_subtest("basic") {
 		arg.ctx_id = ctx;
 		gem_context_get_param(fd, &arg);
 		gem_context_set_param(fd, &arg);
 	}
 
+	igt_describe("Basic test for context get/set param ioctls using default context");
 	igt_subtest("basic-default") {
 		arg.ctx_id = 0;
 		gem_context_get_param(fd, &arg);
 		gem_context_set_param(fd, &arg);
 	}
 
+	igt_describe("Verify that context get param ioctl using invalid context "
+	       "returns relevant error");
 	igt_subtest("invalid-ctx-get") {
 		arg.ctx_id = 2;
 		igt_assert_eq(__gem_context_get_param(fd, &arg), -ENOENT);
 	}
 
+	igt_describe("Verify that context set param ioctl using invalid context "
+	       "returns relevant error");
 	igt_subtest("invalid-ctx-set") {
 		arg.ctx_id = ctx;
 		gem_context_get_param(fd, &arg);
@@ -289,6 +295,7 @@ igt_main
 		igt_assert_eq(__gem_context_set_param(fd, &arg), -ENOENT);
 	}
 
+	igt_describe("Verify that context get param ioctl returns valid size for valid context");
 	igt_subtest("invalid-size-get") {
 		arg.ctx_id = ctx;
 		arg.size = 8;
@@ -296,6 +303,8 @@ igt_main
 		igt_assert(arg.size == 0);
 	}
 
+	igt_describe("Verify that context set param ioctl using invalid size "
+	       "returns relevant error");
 	igt_subtest("invalid-size-set") {
 		arg.ctx_id = ctx;
 		gem_context_get_param(fd, &arg);
@@ -304,6 +313,7 @@ igt_main
 		arg.size = 0;
 	}
 
+	igt_describe("Verify that context set param ioctl returns relevant error in non root mode");
 	igt_subtest("non-root-set") {
 		igt_fork(child, 1) {
 			igt_drop_root();
@@ -317,6 +327,7 @@ igt_main
 		igt_waitchildren();
 	}
 
+	igt_describe("Verify that context set param ioctl works fine in root mode");
 	igt_subtest("root-set") {
 		arg.ctx_id = ctx;
 		gem_context_get_param(fd, &arg);
@@ -326,6 +337,8 @@ igt_main
 
 	arg.param = I915_CONTEXT_PARAM_NO_ZEROMAP;
 
+	igt_describe("Validates context set param ioctl in non root mode with param "
+	       "set to no zeromap");
 	igt_subtest("non-root-set-no-zeromap") {
 		igt_fork(child, 1) {
 			igt_drop_root();
@@ -339,6 +352,7 @@ igt_main
 		igt_waitchildren();
 	}
 
+	igt_describe("Tests the context set param ioctl with no zeromap enabled in root mode");
 	igt_subtest("root-set-no-zeromap-enabled") {
 		arg.ctx_id = ctx;
 		gem_context_get_param(fd, &arg);
@@ -346,6 +360,7 @@ igt_main
 		gem_context_set_param(fd, &arg);
 	}
 
+	igt_describe("Tests the context set param ioctl with no zeromap disabled in root mode");
 	igt_subtest("root-set-no-zeromap-disabled") {
 		arg.ctx_id = ctx;
 		gem_context_get_param(fd, &arg);
@@ -353,11 +368,14 @@ igt_main
 		gem_context_set_param(fd, &arg);
 	}
 
+	igt_describe("Tests that multiple contexts can share the same VMA");
 	igt_subtest("vm")
 		test_vm(fd);
 
 	arg.param = I915_CONTEXT_PARAM_PRIORITY;
 
+	igt_describe("Verify that context set param ioctl returns relevant error if driver "
+	       "doesn't supports assigning custom priorities from userspace");
 	igt_subtest("set-priority-not-supported") {
 		igt_require(!gem_scheduler_has_ctx_priority(fd));
 
@@ -367,11 +385,14 @@ igt_main
 		igt_assert_eq(__gem_context_set_param(fd, &arg), -ENODEV);
 	}
 
+	igt_describe("Test performed with param set to I915_CONTEXT_PARAM_PRIORITY");
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 		}
 
+		igt_describe("Verifies that context get param ioctl returns default priority "
+		       "for newly created context");
 		igt_subtest("get-priority-new-ctx") {
 			struct drm_i915_gem_context_param local_arg = arg;
 			uint32_t local_ctx = gem_context_create(fd);
@@ -384,6 +405,8 @@ igt_main
 			gem_context_destroy(fd, local_ctx);
 		}
 
+		igt_describe("Verifies that context set param ioctl returns relevant error "
+		       "with invalid size and default priority");
 		igt_subtest("set-priority-invalid-size") {
 			struct drm_i915_gem_context_param local_arg = arg;
 			local_arg.ctx_id = ctx;
@@ -393,6 +416,7 @@ igt_main
 			igt_assert_eq(__gem_context_set_param(fd, &local_arg), -EINVAL);
 		}
 
+		igt_describe("Tests the context set param ioctl with different values of priority");
 		igt_subtest("set-priority-range")
 			set_priority(fd);
 	}
@@ -401,11 +425,15 @@ igt_main
 
 	arg.param = -1; /* Should be safely unused for a while */
 
+	igt_describe("Verify that context get param ioctl using invalid param value "
+	       "returns relevant error");
 	igt_subtest("invalid-param-get") {
 		arg.ctx_id = ctx;
 		igt_assert_eq(__gem_context_get_param(fd, &arg), -EINVAL);
 	}
 
+	igt_describe("Verify that context set param ioctl using invalid param value "
+	       "returns relevant error");
 	igt_subtest("invalid-param-set") {
 		arg.ctx_id = ctx;
 		igt_assert_eq(__gem_context_set_param(fd, &arg), -EINVAL);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
