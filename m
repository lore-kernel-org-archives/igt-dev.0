Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A796E415
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Nov 2020 01:49:02 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Mon, 30 Nov 2020 07:14:46 +0530
Message-Id: <20201130014446.19709-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_reloc: Added
 gem_require_mappable_ggtt to check mappable aperture
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org, tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added gem_require_mappable_ggtt to check mappable aperture.
This is to avoid any test crash that might happen
if mappable aperture is not avilable.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_reloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 8dcb24a6..596b1157 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -1217,6 +1217,7 @@ igt_main
 			if (!(f->flags & NORELOC)) {
 				igt_subtest_f("%srange%s",
 					      f->basic ? "basic-" : "", f->name) {
+					gem_require_mappable_ggtt(fd);
 					igt_while_interruptible(f->flags & INTERRUPTIBLE)
 						basic_range(fd, f->flags);
 				}
@@ -1264,6 +1265,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("basic-spin") {
+
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
 				active_spin(fd, e->flags);
@@ -1278,6 +1280,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("basic-many-active") {
+		gem_require_mappable_ggtt(fd);
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
 				many_active(fd, e->flags);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
