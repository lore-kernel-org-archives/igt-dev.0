Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9A6E2E1
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Oct 2020 16:23:22 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 18 Oct 2020 21:55:48 +0530
Message-Id: <20201018162548.2445717-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_clone: Added test description
 for test case
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

Added test and subtests description

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_clone.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/gem_ctx_clone.c b/tests/i915/gem_ctx_clone.c
index b72269bc..c3f609d4 100644
--- a/tests/i915/gem_ctx_clone.c
+++ b/tests/i915/gem_ctx_clone.c
@@ -27,6 +27,8 @@
 #include "igt.h"
 #include "igt_gt.h"
 
+IGT_TEST_DESCRIPTION("Tests context cloning");
+
 static int ctx_create_ioctl(int i915, struct drm_i915_gem_context_create_ext *arg)
 {
 	int err;
@@ -428,18 +430,23 @@ igt_main
 		igt_fork_hang_detector(i915);
 	}
 
+	igt_describe("Verify context cloning with invalid extension won't be successful");
 	igt_subtest("invalid")
 		invalid_clone(i915);
 
+	igt_describe("Checks that engine cloning is properly done while context clone");
 	igt_subtest("engines")
 		clone_engines(i915);
 
+	igt_describe("Checks that cloning of flags is correct while context clone");
 	igt_subtest("flags")
 		clone_flags(i915);
 
+	igt_describe("Checks that cloning of scheduling attributes is correct while context clone");
 	igt_subtest("scheduler")
 		clone_scheduler(i915);
 
+	igt_describe("Verify that cloning of virtual memory address space is correct while context clone");
 	igt_subtest("vm")
 		clone_vm(i915);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
