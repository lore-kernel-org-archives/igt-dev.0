Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B2210E248
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 06:03:32 +0000 (UTC)
From: Chuansheng Liu <chuansheng.liu@intel.com>
Date: Mon,  7 Feb 2022 13:49:51 +0800
Message-Id: <20220207054951.73360-1-chuansheng.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/tests: Pass right ctx id into
 igt_allow_hang()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Just like the commit 74fc362b425c(i915/gem_busy: Prevent context
ban with right ctx id), some codes are using the constant ctx id 0
passed into igt_allow_hang(), it may cause test failures.

This patch is to correct them with right ctx id for the below
tests:

tests/i915/prime_busy
tests/i915/gem_ctx_persistence
tests/i915/gem_exec_schedule
tests/i915/gem_wait

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 2 +-
 tests/i915/gem_exec_schedule.c   | 2 +-
 tests/i915/gem_wait.c            | 2 +-
 tests/prime_busy.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index d7b2488c..9312aec3 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -1267,7 +1267,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(i915);
 
 		igt_require(has_persistence(i915));
-		igt_allow_hang(i915, 0, 0);
+		igt_allow_hang(i915, ctx->id, 0);
 	}
 
 	/* Legacy execbuf engine selection flags. */
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 68457406..119ec2d4 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -3274,7 +3274,7 @@ igt_main
 
 				igt_fixture {
 					igt_stop_hang_detector();
-					hang = igt_allow_hang(fd, 0, 0);
+					hang = igt_allow_hang(fd, ctx->id, 0);
 				}
 
 				test_each_engine_store("preempt-hang", fd, ctx, e)
diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 0d1fea99..b17927b6 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -232,7 +232,7 @@ igt_main
 		igt_hang_t hang;
 
 		igt_fixture {
-			hang = igt_allow_hang(fd, 0, 0);
+			hang = igt_allow_hang(fd, ctx->id, 0);
 			igt_fork_signal_helper();
 		}
 
diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index 0cc011e5..0b657b67 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -195,7 +195,7 @@ static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
 	if ((flags & HANG) == 0)
 		igt_fork_hang_detector(fd);
 	else
-		hang = igt_allow_hang(fd, 0, 0);
+		hang = igt_allow_hang(fd, ctx->id, 0);
 
 	for_each_ctx_engine(fd, ctx, e) {
 		if (!gem_class_can_store_dword(fd, e->class))
-- 
2.25.0.rc2
