Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B036E21B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2020 10:37:45 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Thu, 30 Apr 2020 16:06:12 +0530
Message-Id: <20200430103612.12579-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]i915/gem_sync:Corrected legacy
 Dynamic test case name
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Test case for legacy and new engines is same, when listed out.
adding "legacy" in front of test case name to differentiate it.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index b50ad4f2..fd200e50 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -1189,7 +1189,7 @@ igt_main
 
 	/* Legacy for selecting rings. */
 	for_each_test(t, individual) {
-		igt_subtest_with_dynamic_f("%s", t->name) {
+		igt_subtest_with_dynamic_f("legacy-%s", t->name) {
 			for (const struct intel_execution_engine *l = intel_execution_engines; l->name; l++) {
 				igt_dynamic_f("%s", l->name) {
 					t->func(fd, eb_ring(l),
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
