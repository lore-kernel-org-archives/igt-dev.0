Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B054789B84
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 04:38:20 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue, 28 Jul 2020 10:06:52 +0530
Message-Id: <20200728043652.28112-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t]i915/gem_exec_basic: Added test description
 for test case.
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
To: arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description to subtests that are available.

Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_exec_basic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 0d05819c..02ada7e1 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -47,6 +47,7 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("Basic check of execbuf ioctl on every ring.");
 	igt_subtest_with_dynamic("basic") {
 		struct drm_i915_gem_exec_object2 exec = {
 			.handle = batch_create(fd),
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
