Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148C289E32
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 01:55:55 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 11 Jan 2021 20:57:26 -0500
Message-Id: <20210112015726.2785-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_suspend: Fix cached/uncached
 test names
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

9e7c581519 ("i915/gem_exec_suspend: Remove legacy ring abi") botched up
cached/uncached test names. Fix these:

Before:

uncached-
cached-
uncached--S3
cached--S3
uncached--S4
cached--S4

After:

uncached
cached
uncached-S3
cached-S3
uncached-S4
cached-S4

Fixes: 9e7c581519 ("i915/gem_exec_suspend: Remove legacy ring abi")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_suspend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index a31dd6625..b6558a144 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -297,7 +297,7 @@ igt_main
 		run_test(fd, ALL_ENGINES, HIBERNATE);
 
 	for (m = modes; m->suffix; m++) {
-		igt_subtest_with_dynamic_f("uncached-%s", m->suffix) {
+		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
 			__for_each_physical_engine(fd, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
@@ -306,7 +306,7 @@ igt_main
 			}
 		}
 
-		igt_subtest_with_dynamic_f("cached-%s", m->suffix) {
+		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
 			__for_each_physical_engine(fd, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
