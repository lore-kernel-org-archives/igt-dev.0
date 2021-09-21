Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31996E908
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 07:57:08 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Tue, 21 Sep 2021 13:27:47 +0530
Message-Id: <20210921075749.13049-2-jeevan.b@intel.com>
In-Reply-To: <20210921075749.13049-1-jeevan.b@intel.com>
References: <20210921075749.13049-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_aux: Rename
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
Cc: daniel@ffwll.ch, jose.souza@intel.com, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

rename igt_debug_manual_check and patch the igt functions
igt_debug_manual_check() and igt_debug_wait_for_keypress()
to assert if "all" is supplied.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_aux.c            | 18 ++++++++++++------
 lib/igt_aux.h            |  2 +-
 tests/i915/kms_dsc.c     |  2 +-
 tests/i915/kms_psr.c     |  2 +-
 tests/i915/kms_psr2_sf.c |  2 +-
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 1217f5e8..96929237 100644
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
@@ -1008,14 +1011,13 @@ void igt_debug_wait_for_keypress(const char *var)
 }
 
 /**
- * igt_debug_manual_check:
+ * igt_debug_interactive_mode_check:
  * @var: var lookup to to enable this wait
  * @expected: message to be printed as expected behaviour before wait for keys Y/n
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
 
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3e450207..772687f4 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -72,7 +72,7 @@ int force_dsc_restore_fd = -1;
 
 static inline void manual(const char *expected)
 {
-	igt_debug_manual_check("all", expected);
+	igt_debug_interactive_mode_check("all", expected);
 }
 
 static void force_dsc_enable(data_t *data)
diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 270d3150..24a10676 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -246,7 +246,7 @@ static bool psr_enable_if_enabled(data_t *data)
 
 static inline void manual(const char *expected)
 {
-	igt_debug_manual_check("all", expected);
+	igt_debug_interactive_mode_check("all", expected);
 }
 
 static bool drrs_disabled(data_t *data)
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 1be8c3da..93347327 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -331,7 +331,7 @@ static void prepare(data_t *data)
 
 static inline void manual(const char *expected)
 {
-	igt_debug_manual_check("all", expected);
+	igt_debug_interactive_mode_check("all", expected);
 }
 
 static void plane_update_expected_output(int plane_type, int box_count)
-- 
2.19.1
