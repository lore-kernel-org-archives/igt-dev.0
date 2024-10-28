Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE964D13570
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 07:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5285010E275;
	Mon, 28 Oct 2024 07:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXV6/TeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90B10E354
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 07:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730099336; x=1761635336;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=oaJCxcAkZXD+LufcGYCU7caxPTSOEYaltBqRQFmMi3o=;
 b=WXV6/TeSHs+dBAjL7tzNzlflkV6P+Er4FlDgQII3sK6hXWLpoeD8jPRa
 LV9m7m1bnrxiWeQLvtwPsEwCUtVcdAsYwtkBXYMBx08v9G7jItTlC9Ie4
 tMe7/roBKQU8ehxL/Z4exoj7AFDpYW/g4nmdY80GfcMmcL1gkzoq/RJ45
 3GdjTZtxRFznCMnlCWSLeVIf/K8TVNEKEUQqOv9lZaX7pK1dGHBIvveYJ
 IsFVSCWVUXdfOdnc9akmKmw/nWnTeNQV0SENAg8D/57eflMz5oN+aVOkT
 /hi2WOBTPiDhj/DJwi92kl1uxHH8bMvYwWq1LQMHvWeLZyJeOVQTimrqR w==;
X-CSE-ConnectionGUID: DbR0CKAYQVWKX/q/3GRhEw==
X-CSE-MsgGUID: uqOP6SddR6qeZR+ZuvHUHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29796295"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; d="scan'208";a="29796295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 00:08:55 -0700
X-CSE-ConnectionGUID: ftYr9rEnRS69gI9u8foxeA==
X-CSE-MsgGUID: dGUfEKQlQJyi6zQ7vczP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; d="scan'208";a="85488946"
Received: from adhamasi-mobl1.ger.corp.intel.com (HELO [10.213.192.141])
 ([10.213.192.141])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 00:08:54 -0700
Message-ID: <6882f0a5-2d71-46eb-bbd3-866b694ab064@linux.intel.com>
Date: Mon, 28 Oct 2024 08:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] RFC: igt-runner fact checking
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

WHAT: THIS IS AN RFC

 These functions collect facts, such as "Is the i915 kmod loaded?" when
 igt-runner starts and then recheck the facts after every test is run.
 Currently the code will abort on fact changes, but this can obviously
 be altered to suit our needs.

TODO

 I have only implemented facts for checking if gpu kmods are loaded. I
 want facts for:
  - GPUs on the PCI bus: pci address and card info: pciid, vendor,
    model, codename
  - DRM Cards: association between card number and pci address

 In the future I want to divide facts into two groups: static and dynamic.
 Static facts are these I talk about here, facts that are expected to be
 relevant to all tests such as which GPUs are present at the PCI bus.

 Dynamic facts are those defined by the tests themselves. The idea is to
 create a convenient mechanism for tests to define facts, and to have
 igt-runner to "dynamically" add these before start running the tests.

 I also want to have a section on results.json to include the facts.

WHY

 Currently igt-runner expects each test to clean up after themselves to
 not change the "state" of the machine. However, tests do change the
 "state" of the machine causing negative side effects downstream.
 As an example, at the time of writing, "igt@core_hotunplug@hotrebind"
 will load gpu kmods and will not unload them after it is done. Then
 trying to run "igt@xe_module_load@reload-no-display" will fail because
 the i915 driver is loaded.

HOW

 Notice that when creating a new fact we provide a name for the fact
 and a function that can get the value. Also notice that we cannot
 change a fact after it is initially set. The rationale is that the
 facts will be set before the first test is run, then they will be
 verified after each test.

EXAMPLE

 $ cat test-list
 igt@core_hotunplug@hotrebind
 igt@xe_module_load@reload-no-display

 $ sudo IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/' \
   ./build/runner/igt_runner --per-test-timeout 400 \
   --test-list /home/gta/igt/test-list /home/gta/igt/30

 Number of facts: 3
 Fact kernel.kmod_is_loaded.amdgpu: false
 Fact kernel.kmod_is_loaded.i915: false
 Fact kernel.kmod_is_loaded.xe: false
 [117.461584] [1/2] core_hotunplug (hotrebind)
 [130.057183] Facts changed by last test:
  kernel.kmod_is_loaded.amdgpu changed from false to true.
  kernel.kmod_is_loaded.i915 changed from false to true.
  kernel.kmod_is_loaded.xe changed from false to true.
 
 (igt_runner:2246) CRITICAL: Test assertion failure function execute, file ../runner/executor.c:2717:
 (igt_runner:2246) CRITICAL: Failed assertion: fact_changes == NULL
 (igt_runner:2246) CRITICAL: Last errno: 9, Bad file descriptor
 Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../runner/executor.c:1020 execute()
   #2 ../runner/runner.c:40 main()
   #3 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
   #5 [_start+0x25]
 Test (null) failed.
 **** DEBUG ****
 (igt_runner:2246) INFO: Number of facts: 3
 (igt_runner:2246) INFO: Fact kernel.kmod_is_loaded.amdgpu: false
 (igt_runner:2246) INFO: Fact kernel.kmod_is_loaded.i915: false
 (igt_runner:2246) INFO: Fact kernel.kmod_is_loaded.xe: false
 (igt_runner:2246) CRITICAL: Test assertion failure function execute, file ../runner/executor.c:2717:
 (igt_runner:2246) CRITICAL: Failed assertion: fact_changes == NULL
 (igt_runner:2246) CRITICAL: Last errno: 9, Bad file descriptor
 (igt_runner:2246) igt_core-INFO: Stack trace:
 (igt_runner:2246) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
 (igt_runner:2246) igt_core-INFO:   #1 ../runner/executor.c:1020 execute()
 (igt_runner:2246) igt_core-INFO:   #2 ../runner/runner.c:40 main()
 (igt_runner:2246) igt_core-INFO:   #3 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
 (igt_runner:2246) igt_core-INFO:   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
 (igt_runner:2246) igt_core-INFO:   #5 [_start+0x25]
 ****  END  ****
 FAIL (-1.000s)

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/executor.c | 191 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..f151898ef 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -36,10 +36,185 @@
 #include "output_strings.h"
 #include "runnercomms.h"
 
+#include "igt_kmod.h"
+
 #define KMSG_HEADER "[IGT] "
 #define KMSG_WARN 4
 #define GRACEFUL_EXITCODE -SIGHUP
 
+
+/* Fact checking functions.
+ *
+ * WHAT: THIS IS AN RFC
+ *
+ * These functions collect facts, such as "Is the i915 kmod loaded?" when
+ * igt-runner starts and then recheck the facts after every test is run.
+ * Currently the code will abort on fact changes, but this can obviously
+ * be altered to suit our needs.
+ *
+ * TODO
+ *
+ * I have only implemented facts for checking if gpu kmods are loaded. I
+ * want facts for:
+ *  - GPUs on the PCI bus: pci address and card info: pciid, vendor,
+ *    model, codename
+ *  - DRM Cards: association between card number and pci address
+ *
+ * In the future I want to divide facts into two groups: static and dynamic.
+ * Static facts are these I talk about here, facts that are expected to be
+ * relevant to all tests such as which GPUs are present at the PCI bus.
+ *
+ * Dynamic facts are those defined by the tests themselves. The idea is to
+ * create a convenient mechanism for tests to define facts, and to have
+ * igt-runner to "dynamically" add these before start running the tests.
+ *
+ * I also want to have a section on results.json to include the facts.
+ *
+ * WHY
+ *
+ * Currently igt-runner expects each test to clean up after themselves to
+ * not change the "state" of the machine. However, tests do change the
+ * "state" of the machine causing negative side effects downstream.
+ * As an example, at the time of writing, "igt@core_hotunplug@hotrebind"
+ * will load gpu kmods and will not unload them after it is done. Then
+ * trying to run "igt@xe_module_load@reload-no-display" will fail because
+ * the i915 driver is loaded.
+ *
+ * HOW
+ *
+ * Notice that when creating a new fact we provide a name for the fact
+ * and a function that can get the value. Also notice that we cannot
+ * change a fact after it is initially set. The rationale is that the
+ * facts will be set before the first test is run, then they will be
+ * verified after each test.
+ *
+ */
+
+/* Type for the fact checking function. It returns the value. Returns
+ * NULL on failure.
+ */
+typedef const char* (*fact_checker)(const char *name);
+
+/* Struct for each fact with a name, a pointer to the checker function,
+ * a bool value, and a string value.
+ */
+typedef struct {
+	const char *name;
+	const char *initial_value; /* Supposed to be set only once */
+	fact_checker checker;
+} igt_runner_fact;
+
+/* Struct for the fact list */
+typedef struct {
+	igt_runner_fact *facts;
+	int num_facts;
+} igt_runner_fact_list;
+
+/* Add a new fact if it doesn't exist. Return false on failure such as when
+ * the fact already exist.
+ */
+static bool set_fact(igt_runner_fact_list *list, const char *name, fact_checker checker)
+{
+	/* Check if the fact exist */
+	for (int i = 0; i < list->num_facts; i++) {
+		if (strcmp(list->facts[i].name, name) == 0)
+			return false;
+	}
+
+	/* Add the fact */
+	list->num_facts++;
+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_runner_fact));
+	list->facts[list->num_facts - 1].name = name;
+	list->facts[list->num_facts - 1].checker = checker;
+	list->facts[list->num_facts - 1].initial_value = checker(name);
+
+	/* Check if initial_value is NULL */
+	if (list->facts[list->num_facts - 1].initial_value == NULL)
+		return false;
+
+	return true;
+}
+
+/* Get a fact by name. Return NULL if fact is not found. */
+static igt_runner_fact *get_fact(igt_runner_fact_list *list, const char *name)
+{
+	for (int i = 0; i < list->num_facts; i++) {
+		if (strcmp(list->facts[i].name, name) == 0)
+			return &list->facts[i];
+	}
+
+	return NULL;
+}
+
+/* print_all_facts: pretty print all facts */
+static void print_all_facts(igt_runner_fact_list *list)
+{
+	igt_info("Number of facts: %d\n", list->num_facts);
+	for (int i = 0; i < list->num_facts; i++)
+		igt_info("Fact %s: %s\n", list->facts[i].name, list->facts[i].initial_value);
+}
+
+/* get_fact_changes() check if there are fact changes compared to *list.
+ * Returns:
+ *  - NULL if there are no changes
+ *  - A string with the changes if there are any
+ *
+ * Free the returned string with g_free()
+ */
+static char *get_fact_changes(igt_runner_fact_list *list)
+{
+	char *changes = NULL;
+	const char *new_value = NULL;
+
+	for (int i = 0; i < list->num_facts; i++) {
+		new_value = list->facts[i].checker(list->facts[i].name);
+		if (list->facts[i].initial_value != new_value) {
+			if (changes == NULL) {
+				changes = malloc(1);
+				changes[0] = '\0';
+			}
+
+			changes = g_strdup_printf("%s %s changed from %s to %s.\n",
+						  changes,
+						  list->facts[i].name,
+						  list->facts[i].initial_value,
+						  new_value);
+		}
+	}
+
+	return changes;
+}
+
+/* Check if the kernel module at the end of name is loaded */
+static const char *fact_check_kmod_loaded(const char *name)
+{
+	const char *module = NULL;
+
+	/* Name will be something like "kernel.kmod_is_loaded.i915".
+	 * Save the string after the last dot on module.
+	 */
+	module = strrchr(name, '.');
+	if (module == NULL)
+		return NULL;
+
+	module++; /* Skip the dot */
+
+	/* Call igt_kmod_is_loaded and convert bool to string */
+	return igt_kmod_is_loaded(module) ? "true" : "false";
+}
+
+/* Function to init all the facts */
+static void init_facts(igt_runner_fact_list *list)
+{
+	/* Init the list */
+	list->num_facts = 0;
+	list->facts = NULL;
+
+	set_fact(list, "kernel.kmod_is_loaded.amdgpu", fact_check_kmod_loaded);
+	set_fact(list, "kernel.kmod_is_loaded.i915", fact_check_kmod_loaded);
+	set_fact(list, "kernel.kmod_is_loaded.xe", fact_check_kmod_loaded);
+}
+
 static struct {
 	int *fds;
 	size_t num_dogs;
@@ -2306,6 +2481,13 @@ bool execute(struct execute_state *state,
 	sigset_t sigmask;
 	double time_spent = 0.0;
 	bool status = true;
+	igt_runner_fact_list facts;
+
+	/* Init the facts */
+	init_facts(&facts);
+
+	/* Print facts */
+	print_all_facts(&facts);
 
 	if (state->dry) {
 		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
@@ -2437,6 +2619,7 @@ bool execute(struct execute_state *state,
 		char *job_name;
 		int result;
 		bool already_written = false;
+		char *fact_changes = NULL;
 
 		if (should_die_because_signal(sigfd)) {
 			status = false;
@@ -2525,6 +2708,14 @@ bool execute(struct execute_state *state,
 			state->time_left = time_left;
 			return execute(state, settings, job_list);
 		}
+
+		/* Abort if facts changed */
+		fact_changes = get_fact_changes(&facts);
+		if (fact_changes) {
+			/* Print fact_changes */
+			errf("Facts changed by last test:\n%s\n", fact_changes);
+			igt_assert(fact_changes == NULL);
+		}
 	}
 
 	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
-- 
2.34.1

