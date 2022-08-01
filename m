Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16E9550E
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 18:01:50 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 14:01:43 -0400
Message-Id: <20220801180145.243227-3-rodrigo.vivi@intel.com>
In-Reply-To: <20220801180145.243227-1-rodrigo.vivi@intel.com>
References: <20220801180145.243227-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] lib/igt_aux: Check suspend state
 support directly.
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

Let's simplify the suspend state check directly by using
its name instead of using a mask style. This will allow
us to introduce a new state cleanly.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_aux.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 6cdda077..ba8fab64 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -815,29 +815,24 @@ static void suspend_via_sysfs(int power_dir, enum igt_suspend_state state)
 				 suspend_state_name[state]));
 }
 
-static uint32_t get_supported_suspend_states(int power_dir)
+static bool is_state_supported(int power_dir, enum igt_suspend_state state)
 {
+	const char *str;
 	char *states;
-	char *state_name;
-	uint32_t state_mask;
 
 	igt_assert((states = igt_sysfs_get(power_dir, "state")));
-	state_mask = 0;
-	for (state_name = strtok(states, " "); state_name;
-	     state_name = strtok(NULL, " ")) {
-		enum igt_suspend_state state;
-
-		for (state = SUSPEND_STATE_FREEZE; state < SUSPEND_STATE_NUM;
-		     state++)
-			if (strcmp(state_name, suspend_state_name[state]) == 0)
-				break;
-		igt_assert(state < SUSPEND_STATE_NUM);
-		state_mask |= 1 << state;
-	}
 
-	free(states);
+	fprintf(stderr, "states: %s; state: %s\n",
+		states, suspend_state_name[state]);
 
-	return state_mask;
+	str = strstr(states, suspend_state_name[state]);
+
+	if (!str)
+		igt_info("State %s not supported.\nSupported States: %s\n",
+			 suspend_state_name[state], states);
+
+	free(states);
+	return str;
 }
 
 /**
@@ -868,7 +863,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 	enum igt_suspend_test orig_test;
 
 	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
-	igt_require(get_supported_suspend_states(power_dir) & (1 << state));
+	igt_require(is_state_supported(power_dir, state));
 	igt_require(test == SUSPEND_TEST_NONE ||
 		    faccessat(power_dir, "pm_test", R_OK | W_OK, 0) == 0);
 
-- 
2.35.3
