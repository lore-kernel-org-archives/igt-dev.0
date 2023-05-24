Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 12:19:06 -0700
Message-Id: <20230524191906.2160802-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: Skip some
 subtests
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

Hang and heartbeat subtests are not supported with GuC submission
enabled.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 42cf96329..1e122535e 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -1366,19 +1366,25 @@ igt_main
 
 	igt_subtest("hostile")
 		test_nohangcheck_hostile(i915, &empty_cfg);
-	igt_subtest("hang")
-		test_nohangcheck_hang(i915, &empty_cfg);
-
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
+
+	igt_subtest_group {
+		igt_fixture
+			igt_skip_on(gem_using_guc_submission(i915));
+
+		igt_subtest("hang")
+			test_nohangcheck_hang(i915, &empty_cfg);
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
2.38.1
