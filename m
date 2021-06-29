Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B976E88A
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jun 2021 12:32:35 +0000 (UTC)
From: sai.krishna.kuchi@intel.com
Date: Tue, 29 Jun 2021 18:02:32 +0530
Message-Id: <20210629123232.1898-1-sai.krishna.kuchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_busy: Added description to all
 subtests
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

From: "Kuchi, Sai Krishna" <sai.krishna.kuchi@intel.com>

Cc: Melkaveri, Arjun<arjun.melkaveri@intel.com>
Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>

Signed-off-by: Kuchi, Sai Krishna<sai.krishna.kuchi@intel.com>
---
 tests/i915/gem_busy.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index dc481f3c..03cd545c 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -413,18 +413,23 @@ igt_main
 		igt_require_gem(fd);
 	}
 
+	igt_describe_f("Checking busy-ioctl without hang");
 	igt_subtest_group {
 		igt_fixture {
 			igt_fork_hang_detector(fd);
 		}
 
+		igt_describe_f("Basic checking of busy-ioctl for physical engines");
 		igt_subtest_with_dynamic("busy") {
+			igt_describe_f("Basic busy check for all engines by creating seperate"
+			" processes");
 			igt_dynamic("all") {
 				gem_quiescent_gpu(fd);
 				all(fd);
 			}
 
 			__for_each_physical_engine(fd, e) {
+				igt_describe_f("Basic busy check for %s engine", e->name);
 				igt_dynamic_f("%s", e->name) {
 					gem_quiescent_gpu(fd);
 					basic(fd, e, 0);
@@ -432,6 +437,7 @@ igt_main
 			}
 		}
 
+		igt_describe_f("Extended checking of busy-ioctl for phusical engines");
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_extended_busy_ioctl(fd));
@@ -439,18 +445,22 @@ igt_main
 			}
 
 			test_each_engine_store("extended", fd, e) {
+				igt_describe_f("Extended busy check for %s engine", e->name);
 				gem_quiescent_gpu(fd);
 				one(fd, e, 0);
 				gem_quiescent_gpu(fd);
 			}
 
 			test_each_engine_store("parallel", fd, e) {
+				igt_describe_f("Extended busy check for %s along with"
+				" all other engines", e->name);
 				gem_quiescent_gpu(fd);
 				one(fd, e, PARALLEL);
 				gem_quiescent_gpu(fd);
 			}
 		}
 
+		igt_describe_f("Checking busy-ioctl with Semaphore");
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_extended_busy_ioctl(fd));
@@ -458,12 +468,15 @@ igt_main
 			}
 
 			test_each_engine("semaphore", fd, e) {
+				igt_describe_f("Busy check for %s engine with semaphore", e->name);
 				gem_quiescent_gpu(fd);
 				semaphore(fd, e);
 				gem_quiescent_gpu(fd);
 			}
 		}
 
+		igt_describe_f("Checking busy-ioctl with race b/w two threads, one checking"
+		" busyness and other randomly closing handles");
 		igt_subtest("close-race")
 			close_race(fd);
 
@@ -472,6 +485,7 @@ igt_main
 		}
 	}
 
+	igt_describe_f("Checking busy-ioctl with hang");
 	igt_subtest_group {
 		igt_hang_t hang;
 
@@ -480,11 +494,13 @@ igt_main
 		}
 
 		test_each_engine("hang", fd, e) {
+			igt_describe_f("Basic busy check for %s with hang", e->name);
 			gem_quiescent_gpu(fd);
 			basic(fd, e, HANG);
 			gem_quiescent_gpu(fd);
 		}
 
+		igt_describe_f("Extended checking of busy-ioctl for all physical engines");
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_extended_busy_ioctl(fd));
@@ -492,6 +508,7 @@ igt_main
 			}
 
 			test_each_engine_store("hang-extended", fd, e) {
+				igt_describe_f("Extended busy check for %s with hang", e->name);
 				gem_quiescent_gpu(fd);
 				one(fd, e, HANG);
 				gem_quiescent_gpu(fd);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
