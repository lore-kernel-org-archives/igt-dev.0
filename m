Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3740C10FF75
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 05:02:06 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Tue, 28 Jun 2022 10:21:22 +0530
Message-Id: <20220628045123.1586448-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220628045123.1586448-1-priyanka.dandamudi@intel.com>
References: <20220628045123.1586448-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_ringfill : Added test
 description
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

Added global description and description to all the available subtests.

v2: Minor corrections.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_ringfill.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index ecfa0bea..e097c874 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -51,6 +51,8 @@
 #define HIBERNATE 0x40
 #define NEWFD 0x80
 
+IGT_TEST_DESCRIPTION("Exercise many tiny batchbuffer operations, in the hope of catching"
+		     " failure to manage the ring properly near full.");
 static unsigned int ring_size;
 
 static void check_bo(int fd, uint32_t handle)
@@ -291,16 +293,23 @@ igt_main
 		const char *suffix;
 		unsigned flags;
 		unsigned timeout;
+		const char *description;
 	} modes[] = {
-		{ "basic", 0, 0 },
-		{ "interruptible", INTERRUPTIBLE, 1 },
-		{ "hang", HANG, 10 },
-		{ "child", CHILD, 0 },
-		{ "forked", FORKED, 0 },
-		{ "fd", FORKED | NEWFD, 0 },
-		{ "bomb", BOMB | NEWFD | INTERRUPTIBLE, 150 },
-		{ "S3", BOMB | SUSPEND, 30 },
-		{ "S4", BOMB | HIBERNATE, 30 },
+		{ "basic", 0, 0, "Basic check how the driver handles a full ring"},
+		{ "interruptible", INTERRUPTIBLE, 1, "Exercise all potential injection sites by "
+						     "using igt_sigiter interface to repeat the "
+						     "ringfill testing"},
+		{ "hang", HANG, 10, "Exercise many batchbuffer operations along with"
+				    " a hang batch until ring is full"},
+		{ "child", CHILD, 0, "Check to fill the ring parallely using fork" },
+		{ "forked", FORKED, 0, "Check to fill the ring parallely using fork" },
+		{ "fd", FORKED | NEWFD, 0, "Fills the ring upto maximim parallely using"
+					   " fork with different fd's" },
+		{ "bomb", BOMB | NEWFD | INTERRUPTIBLE, 150, "Fills the ring upto maximim parallely"
+							     " using fork with different fd's along "
+							     "with interruptions" },
+		{ "S3", BOMB | SUSPEND, 30, "Handle a full ring across suspend cycle"},
+		{ "S4", BOMB | HIBERNATE, 30, "Handle a full ring across hibernate cycle"},
 		{ NULL }
 	}, *m;
 	bool master = false;
@@ -330,6 +339,7 @@ igt_main
 
 	/* Legacy path for selecting "rings". */
 	for (m = modes; m->suffix; m++) {
+		igt_describe_f("%s - on legacy ring.", m->description);
 		igt_subtest_with_dynamic_f("legacy-%s", m->suffix) {
 			igt_skip_on(m->flags & NEWFD && master);
 
@@ -350,6 +360,7 @@ igt_main
 
 	/* New interface for selecting "engines". */
 	for (m = modes; m->suffix; m++) {
+		igt_describe_f("%s.", m->description);
 		igt_subtest_with_dynamic_f("engines-%s", m->suffix) {
 			const struct intel_execution_engine2 *e;
 
@@ -371,6 +382,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Basic check to fill the ring upto maximum on all engines simultaneously.");
 	igt_subtest("basic-all") {
 		const struct intel_execution_engine2 *e;
 		intel_allocator_multiprocess_start();
-- 
2.25.1
