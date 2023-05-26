Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE810E7D7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 10:18:26 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 12:18:03 +0200
Message-Id: <20230526101803.299705-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_persistence: skip heartbeat
 tests with GuC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

GuC does not support fully updating of persisting contexts, especially
heartbeat related parameters.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 584137db454..00fdc19e76c 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -1481,16 +1481,21 @@ igt_main
 	igt_subtest("hang")
 		test_nohangcheck_hang(i915, &empty_cfg);
 
-	igt_subtest("heartbeat-stop")
-		test_noheartbeat_many(i915, 1, 0);
-	igt_subtest("heartbeat-hang")
-		test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
-	igt_subtest("heartbeat-many")
-		test_noheartbeat_many(i915, 16, 0);
-	igt_subtest("heartbeat-close")
-		test_noheartbeat_close(i915, 0);
-	igt_subtest("heartbeat-hostile")
-		test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
+	igt_subtest_group {
+		igt_fixture
+			igt_require(!gem_using_guc_submission(i915));
+
+		igt_subtest("heartbeat-stop")
+			test_noheartbeat_many(i915, 1, 0);
+		igt_subtest("heartbeat-hang")
+			test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
+		igt_subtest("heartbeat-many")
+			test_noheartbeat_many(i915, 16, 0);
+		igt_subtest("heartbeat-close")
+			test_noheartbeat_close(i915, 0);
+		igt_subtest("heartbeat-hostile")
+			test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
+	}
 
 	igt_subtest_group {
 		igt_fixture
-- 
2.34.1
