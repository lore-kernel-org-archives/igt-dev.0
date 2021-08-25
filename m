Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14F66E3E3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Aug 2021 17:09:01 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 25 Aug 2021 22:40:17 +0530
Message-Id: <20210825171018.10821-2-jeevan.b@intel.com>
In-Reply-To: <20210825171018.10821-1-jeevan.b@intel.com>
References: <20210825171018.10821-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_aux: Rename
 igt_debug_manual_check and assert check if all is supplied
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
Cc: jose.souza@intel.com, daniel@ffwll.ch, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

rename igt_debug_manual_check and patch the igt functions
igt_debug_manual_check() and igt_debug_wait_for_keypress()
to assert if "all" is supplied.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_aux.c       | 16 +++++++++++-----
 lib/igt_aux.h       |  2 +-
 tests/kms_dsc.c     |  2 +-
 tests/kms_psr.c     |  2 +-
 tests/kms_psr2_sf.c |  2 +-
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 1217f5e8..4fe29c8e 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -971,8 +971,7 @@ void igt_drop_root(void)
  *
  * Waits for a key press when run interactively and when the corresponding debug
  * var is set in the --interactive-debug=$var variable. Multiple keys
- * can be specified as a comma-separated list or alternatively "all" if a wait
- * should happen for all cases.
+ * can be specified as a comma-separated list and assert if "all" is supplied.
  *
  * When not connected to a terminal interactive_debug is ignored
  * and execution immediately continues.
@@ -993,6 +992,10 @@ void igt_debug_wait_for_keypress(const char *var)
 	if (!igt_interactive_debug)
 		return;
 
+	if (strstr(igt_interactive_debug, var) &&
+	    strstr(igt_interactive_debug, "all"))
+		igt_assert(false);
+
 	if (!strstr(igt_interactive_debug, var) &&
 	    !strstr(igt_interactive_debug, "all"))
 		return;
@@ -1014,8 +1017,7 @@ void igt_debug_wait_for_keypress(const char *var)
  *
  * Waits for a key press when run interactively and when the corresponding debug
  * var is set in the --interactive-debug=$var variable. Multiple vars
- * can be specified as a comma-separated list or alternatively "all" if a wait
- * should happen for all cases.
+ * can be specified as a comma-separated list and assert if "all" is supplied.
  *
  * This is useful for display tests where under certain situation manual
  * inspection of the display is useful. Or when running a testcase in the
@@ -1028,7 +1030,7 @@ void igt_debug_wait_for_keypress(const char *var)
  *
  * Force test fail when N/n is pressed.
  */
-void igt_debug_manual_check(const char *var, const char *expected)
+void igt_debug_interactive_mode_check(const char *var, const char *expected)
 {
 	struct termios oldt, newt;
 	char key;
@@ -1041,6 +1043,10 @@ void igt_debug_manual_check(const char *var, const char *expected)
 	if (!igt_interactive_debug)
 		return;
 
+	if (strstr(igt_interactive_debug, var) &&
+	    strstr(igt_interactive_debug, "all"))
+		igt_assert(false);
+
 	if (!strstr(igt_interactive_debug, var) &&
 	    !strstr(igt_interactive_debug, "all"))
 		return;
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index bf57ccf5..a92eb799 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -193,7 +193,7 @@ int igt_get_autoresume_delay(enum igt_suspend_state state);
 void igt_drop_root(void);
 
 void igt_debug_wait_for_keypress(const char *var);
-void igt_debug_manual_check(const char *var, const char *expected);
+void igt_debug_interactive_mode_check(const char *var, const char *expected);
 
 /* sysinfo cross-arch wrappers from intel_os.c */
 
diff --git a/tests/kms_dsc.c b/tests/kms_dsc.c
index b56e0183..c5596318 100644
--- a/tests/kms_dsc.c
+++ b/tests/kms_dsc.c
@@ -72,7 +72,7 @@ int force_dsc_restore_fd = -1;
 
 static inline void manual(const char *expected)
 {
-	igt_debug_manual_check("all", expected);
+	igt_debug_interactive_mode_check("all", expected);
 }
 
 static void force_dsc_enable(data_t *data)
diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index 8f2fbb8a..4ff8c001 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -246,7 +246,7 @@ static bool psr_enable_if_enabled(data_t *data)
 
 static inline void manual(const char *expected)
 {
-	igt_debug_manual_check("all", expected);
+	igt_debug_interactive_mode_check("all", expected);
 }
 
 static bool drrs_disabled(data_t *data)
diff --git a/tests/kms_psr2_sf.c b/tests/kms_psr2_sf.c
index 1be8c3da..93347327 100644
--- a/tests/kms_psr2_sf.c
+++ b/tests/kms_psr2_sf.c
@@ -331,7 +331,7 @@ static void prepare(data_t *data)
 
 static inline void manual(const char *expected)
 {
-	igt_debug_manual_check("all", expected);
+	igt_debug_interactive_mode_check("all", expected);
 }
 
 static void plane_update_expected_output(int plane_type, int box_count)
-- 
2.19.1
