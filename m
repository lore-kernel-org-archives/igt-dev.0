Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6968FF97
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 18:01:49 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 14:01:41 -0400
Message-Id: <20220801180145.243227-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/igt_aux: Let's use the official
 mem_sleep names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Mixing the names with the state names can cause confusion.
Let's stick with the official names.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_aux.c             | 8 ++++----
 lib/igt_aux.h             | 6 +++---
 tests/i915/i915_suspend.c | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index b37bae87..6cdda077 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -712,9 +712,9 @@ static const char *suspend_test_name[] = {
 };
 
 static const char *mem_sleep_name[] = {
-	[MEM_SLEEP_FREEZE] = "s2idle",
-	[MEM_SLEEP_STANDBY] = "shallow",
-	[MEM_SLEEP_MEM] = "deep"
+	[MEM_SLEEP_S2IDLE] = "s2idle",
+	[MEM_SLEEP_SHALLOW] = "shallow",
+	[MEM_SLEEP_DEEP] = "deep"
 };
 
 static enum igt_suspend_test get_suspend_test(int power_dir)
@@ -993,7 +993,7 @@ int igt_get_memsleep_state(void)
 		return MEM_SLEEP_NONE;
 	}
 
-	for (mem_sleep = MEM_SLEEP_FREEZE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
+	for (mem_sleep = MEM_SLEEP_S2IDLE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
 		if (strcmp(mem_sleep_name[mem_sleep], mem_sleep_state) == 0)
 			break;
 	}
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index af663d2c..9d5b7bd2 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -196,9 +196,9 @@ enum igt_suspend_test {
  */
 enum igt_mem_sleep {
 	MEM_SLEEP_NONE,
-	MEM_SLEEP_FREEZE,
-	MEM_SLEEP_STANDBY,
-	MEM_SLEEP_MEM,
+	MEM_SLEEP_S2IDLE,
+	MEM_SLEEP_SHALLOW,
+	MEM_SLEEP_DEEP,
 
 	/*<private>*/
 	MEM_SLEEP_NUM,
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 23e451d3..f992d447 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -209,7 +209,7 @@ test_suspend_without_i915(int state)
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
 
-	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_FREEZE && state > SUSPEND_STATE_FREEZE,
+	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE && state > SUSPEND_STATE_FREEZE,
 		      "Platform default mem_sleep state is s2idle\n");
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 
-- 
2.35.3
