Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE70112378
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 07:47:08 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 13:14:15 +0530
Message-Id: <20220516074417.3097812-2-riana.tauro@intel.com>
In-Reply-To: <20220516074417.3097812-1-riana.tauro@intel.com>
References: <20220516074417.3097812-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 1/3] lib/igt_aux: add library function to
 read current selected state of mem_sleep
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

Add a library function to read the current state of mem_sleep
Used by suspend tests without i915 to skip s3 cycle, if platform has
default state as s2idle. Reduces CI Execution time

v2: Addressed cosmetic review comments (Anshuman)

Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_aux.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_aux.h | 19 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 03cc38c9..3945bebe 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -710,6 +710,12 @@ static const char *suspend_test_name[] = {
 	[SUSPEND_TEST_CORE] = "core",
 };
 
+static const char *mem_sleep_name[] = {
+	[MEM_SLEEP_FREEZE] = "s2idle",
+	[MEM_SLEEP_STANDBY] = "shallow",
+	[MEM_SLEEP_MEM] = "deep"
+};
+
 static enum igt_suspend_test get_suspend_test(int power_dir)
 {
 	char *test_line;
@@ -951,6 +957,52 @@ int igt_get_autoresume_delay(enum igt_suspend_state state)
 	return delay;
 }
 
+/**
+ * igt_get_memsleep_state
+ *
+ * Reads the value of /sys/power/mem_sleep and
+ * returns the current suspend state associated with 'mem'.
+ *
+ * Returns : an #igt_mem_sleep state, current suspend state associated with 'mem'.
+ */
+int igt_get_memsleep_state(void)
+{
+	char *mem_sleep_states;
+	char *mem_sleep_state;
+	enum igt_mem_sleep mem_sleep;
+	int power_dir;
+
+	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
+
+	if (faccessat(power_dir, "mem_sleep", R_OK, 0))
+		return MEM_SLEEP_NONE;
+
+	igt_assert((mem_sleep_states = igt_sysfs_get(power_dir, "mem_sleep")));
+	for (mem_sleep_state = strtok(mem_sleep_states, " "); mem_sleep_state;
+	     mem_sleep_state = strtok(NULL, " ")) {
+		if (mem_sleep_state[0] == '[') {
+			mem_sleep_state[strlen(mem_sleep_state) - 1] = '\0';
+			mem_sleep_state++;
+			break;
+		}
+	}
+
+	if (!mem_sleep_state) {
+		free(mem_sleep_states);
+		return MEM_SLEEP_NONE;
+	}
+
+	for (mem_sleep = MEM_SLEEP_FREEZE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
+		if (strcmp(mem_sleep_name[mem_sleep], mem_sleep_state) == 0)
+			break;
+	}
+
+	igt_assert_f(mem_sleep < MEM_SLEEP_NUM, "Invalid mem_sleep state\n");
+
+	free(mem_sleep_states);
+	close(power_dir);
+	return mem_sleep;
+}
 /**
  * igt_drop_root:
  *
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 9f2588ae..2f7efd9c 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -186,11 +186,30 @@ enum igt_suspend_test {
 	SUSPEND_TEST_NUM,
 };
 
+/**
+ * igt_mem_sleep:
+ * @MEM_SLEEP_NONE: no support
+ * @MEM_SLEEP_FREEZE: suspend-to-idle target state, aka S0ix or freeze,
+ * @MEM_SLEEP_STANDBY: standby target state, aka S1
+ * @MEM_SLEEP_MEM: suspend-to-mem target state aka S3
+ */
+enum igt_mem_sleep {
+	MEM_SLEEP_NONE,
+	MEM_SLEEP_FREEZE,
+	MEM_SLEEP_STANDBY,
+	MEM_SLEEP_MEM,
+
+	/*<private>*/
+	MEM_SLEEP_NUM,
+};
+
 void igt_system_suspend_autoresume(enum igt_suspend_state state,
 				   enum igt_suspend_test test);
 void igt_set_autoresume_delay(int delay_secs);
 int igt_get_autoresume_delay(enum igt_suspend_state state);
 
+int igt_get_memsleep_state(void);
+
 /* dropping priviledges */
 void igt_drop_root(void);
 
-- 
2.25.1
