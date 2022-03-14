Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BFA10E0F8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Mar 2022 17:18:05 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Mar 2022 18:17:47 +0100
Message-Id: <20220314171747.24668-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_create: lower active
 subtests timeout
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

Active subtests measure time for one cycle of context creation
and bufexec execution per engine and this is done until timeout
of 20 seconds expires. On old gpu gens there are low number of
engines so it runs in reasonable time, but on new ones it can
take as long as over 800s. Lower timeout to only 2s to keep it
low on CI. Below is example of dmesg output on new machine with
long 20 seconds timeout:

[ 3683.594715] [IGT] gem_ctx_create: executing
[ 3895.606195] [IGT] gem_ctx_create: starting subtest basic-active
[ 3895.606343] [IGT] gem_ctx_create: starting dynamic subtest bcs0
[ 3915.890896] [IGT] gem_ctx_create: starting dynamic subtest bcs1
[ 3937.463308] [IGT] gem_ctx_create: starting dynamic subtest bcs2
[ 3957.849851] [IGT] gem_ctx_create: starting dynamic subtest bcs3
[ 3981.950263] [IGT] gem_ctx_create: starting dynamic subtest bcs4
[ 4004.387712] [IGT] gem_ctx_create: starting dynamic subtest bcs5
[ 4026.379749] [IGT] gem_ctx_create: starting dynamic subtest bcs6
[ 4049.476240] [IGT] gem_ctx_create: starting dynamic subtest bcs7
[ 4071.459781] [IGT] gem_ctx_create: starting dynamic subtest bcs8
[ 4094.289894] [IGT] gem_ctx_create: starting dynamic subtest bcs9
[ 4115.836807] [IGT] gem_ctx_create: starting dynamic subtest bcs10
[ 4137.660152] [IGT] gem_ctx_create: starting dynamic subtest bcs11
[ 4158.003191] [IGT] gem_ctx_create: starting dynamic subtest bcs12
[ 4179.631347] [IGT] gem_ctx_create: starting dynamic subtest bcs13
[ 4200.043429] [IGT] gem_ctx_create: starting dynamic subtest bcs14
[ 4221.887682] [IGT] gem_ctx_create: starting dynamic subtest bcs15
[ 4243.864100] [IGT] gem_ctx_create: starting dynamic subtest vcs0
[ 4266.711902] [IGT] gem_ctx_create: starting dynamic subtest vcs1
[ 4289.776354] [IGT] gem_ctx_create: starting dynamic subtest vcs2
[ 4311.965040] [IGT] gem_ctx_create: starting dynamic subtest vcs3
[ 4333.856301] [IGT] gem_ctx_create: starting dynamic subtest vcs4
[ 4355.431020] [IGT] gem_ctx_create: starting dynamic subtest vcs5
[ 4376.878056] [IGT] gem_ctx_create: starting dynamic subtest ccs0
[ 4398.554019] [IGT] gem_ctx_create: starting dynamic subtest ccs1
[ 4418.947135] [IGT] gem_ctx_create: starting dynamic subtest ccs2
[ 4441.688846] [IGT] gem_ctx_create: starting dynamic subtest ccs3
[ 4464.843852] [IGT] gem_ctx_create: starting dynamic subtest ccs4
[ 4485.289491] [IGT] gem_ctx_create: starting dynamic subtest ccs5
[ 4507.076429] [IGT] gem_ctx_create: starting dynamic subtest ccs6
[ 4529.704434] [IGT] gem_ctx_create: starting dynamic subtest ccs7
[ 4551.486436] [IGT] gem_ctx_create: exiting, ret=0

so it took around 868s.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_ctx_create.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 44846652..8052e17c 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -37,6 +37,7 @@
 #include "sw_sync.h"
 
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
+#define ACTIVE_TIMEOUT 20
 
 static unsigned all_engines[I915_EXEC_RING_MASK + 1];
 static unsigned all_nengine;
@@ -613,26 +614,26 @@ igt_main
 
 	/* NULL value means all engines */
 	igt_subtest("active-all")
-		active(fd, &cfg, NULL, 20, 1);
+		active(fd, &cfg, NULL, ACTIVE_TIMEOUT, 1);
 	igt_subtest("forked-active-all")
-		active(fd, &cfg, NULL, 20, ncpus);
+		active(fd, &cfg, NULL, ACTIVE_TIMEOUT, ncpus);
 
 	igt_subtest_with_dynamic("active") {
 		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-				active(fd, &cfg, e, 20, 1);
+				active(fd, &cfg, e, ACTIVE_TIMEOUT, 1);
 		}
 	}
 	igt_subtest_with_dynamic("forked-active") {
 		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-				active(fd, &cfg, e, 20, ncpus);
+				active(fd, &cfg, e, ACTIVE_TIMEOUT, ncpus);
 		}
 	}
 	igt_subtest_with_dynamic("hog") {
 		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-				active(fd, &cfg, e, 20, -1);
+				active(fd, &cfg, e, ACTIVE_TIMEOUT, -1);
 		}
 	}
 
-- 
2.32.0
