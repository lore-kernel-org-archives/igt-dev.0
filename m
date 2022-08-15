Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129EC201B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 14:52:30 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id q190so7363213vsb.7
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 07:52:30 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: Petri Latvala <petri.latvala@intel.com>,
	igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 11:51:46 -0300
Message-Id: <20220815145146.24038-5-tales.aparecida@gmail.com>
In-Reply-To: <20220815145146.24038-1-tales.aparecida@gmail.com>
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/4] lib/igt_kmod: add igt_kselftests
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for igt_kselftests functions and structs. Also adds
comments to non trivial lines.

Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---

Notes:
    v2 -> v3: rephrase igt_kselftest_begin() documentation to say skips instead of fails

 lib/igt_kmod.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kmod.h |  18 ++++++++
 2 files changed, 127 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 5864f68c..a39bec18 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -792,6 +792,12 @@ igt_amdgpu_driver_unload(void)
 	return IGT_EXIT_SUCCESS;
 }
 
+/**
+ * kmsg_dump:
+ * @fd: file descriptor for `/dev/kmsg` opened for reading
+ *
+ * Dump kmsg output into stderr.
+ */
 static void kmsg_dump(int fd)
 {
 	char record[4096 + 1];
@@ -832,6 +838,13 @@ static void kmsg_dump(int fd)
 	}
 }
 
+/**
+ * tests_add:
+ * @tl: (in): test to be inserted
+ * @list: (inout): ordered list of tests sorted by test->number
+ *
+ * Insert test at the correct position in the ordered list
+ */
 static void tests_add(struct igt_kselftest_list *tl, struct igt_list_head *list)
 {
 	struct igt_kselftest_list *pos;
@@ -843,6 +856,14 @@ static void tests_add(struct igt_kselftest_list *tl, struct igt_list_head *list)
 	igt_list_add_tail(&tl->link, &pos->link);
 }
 
+/**
+ * igt_kselftest_get_tests:
+ * @kmod: (in): kernel module from which to parse module_params' names into IGT tests
+ * @filter: (in)(nullable): get only tests with a prefix matching this filter
+ * @tests: (inout): resulting ordered list of tests
+ *
+ * Get IGT tests' names from module_params' names, given a module.
+ */
 void igt_kselftest_get_tests(struct kmod_module *kmod,
 			     const char *filter,
 			     struct igt_list_head *tests)
@@ -856,25 +877,35 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 	if (!kmod_module_get_info(kmod, &pre))
 		return;
 
+	/*
+	 * iter through module infos trying to find tests, which should be
+	 * named following the pattern: "igt__{test_number}__{test_name}:bool",
+	 * e.g.: "igt__18__perf_engine_cs:bool"
+	 */
 	kmod_list_foreach(d, pre) {
 		const char *key, *val;
 		char *colon;
 		int offset;
 
+		/* skip any info that is not a module param */
 		key = kmod_module_info_get_key(d);
 		if (strcmp(key, "parmtype"))
 			continue;
 
+		/* skip any module param that don't have the IGT test prefix */
 		val = kmod_module_info_get_value(d);
 		if (!val || strncmp(val, param_prefix, prefix_len))
 			continue;
 
+		/* alloc list-node that will store the module_param name */
 		offset = strlen(val) + 1;
 		tl = malloc(sizeof(*tl) + offset);
 		if (!tl)
 			continue;
 
 		memcpy(tl->param, val, offset);
+
+		/* find and replace colon with \0 to discard module_param type */
 		colon = strchr(tl->param, ':');
 		*colon = '\0';
 
@@ -884,6 +915,7 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 			   &tl->number, &offset) == 1)
 			tl->name += offset;
 
+		/* skip any test that doesn't match the prefix filter */
 		if (filter && strncmp(tl->name, filter, strlen(filter))) {
 			free(tl);
 			continue;
@@ -902,6 +934,22 @@ static int open_parameters(const char *module_name)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * igt_kselftest_init:
+ * @tst: (inout): pointer of #igt_kselftest to be initialized
+ * @module_name: (in): name of the module with IGT tests declared as module_params
+ *
+ * Initialize the given struct igt_kselftest and the inner struct kmod_module.
+ *
+ * @Note: This function initialize @tst->kmsg with `-1`, call
+ * igt_kselftest_begin() to actually open the <filename>/dev/kmsg</filename> stream.
+ * @tst->module_name should be freed by the caller with free(), @tst->kmod 
+ * refcount needs to be decremented to be released using
+ * <function>kmod_module_unref</function>.
+ *
+ * Returns: 0 on success, non-zero otherwise. It fails if name is not a valid
+ * module name or if memory allocation failed.
+ */
 int igt_kselftest_init(struct igt_kselftest *tst,
 		       const char *module_name)
 {
@@ -922,6 +970,17 @@ int igt_kselftest_init(struct igt_kselftest *tst,
 	return 0;
 }
 
+/**
+ * igt_kselftest_begin:
+ * @tst: (inout): pointer to #igt_kselftest with `kmod_module` handler to unload
+ * 	and where the file descriptor for <filename>/dev/kmsg</filename> will be
+ * 	stored.
+ *
+ * Unload the module that will be tested and open kmsg to start reading it.
+ * If module is i915, unloads some of its dependencies as well.
+ *
+ * Skips kselftest if an error occurs while opening kmsg.
+ */
 void igt_kselftest_begin(struct igt_kselftest *tst)
 {
 	int err;
@@ -936,6 +995,21 @@ void igt_kselftest_begin(struct igt_kselftest *tst)
 	igt_require_fd(tst->kmsg);
 }
 
+/**
+ * igt_kselftest_execute:
+ * @tst: (in): handler for module to be tested and inner kmsg file descriptor
+ * @tl: (in): contains the name of the test to be executed
+ * @options: (in)(nullable): Extra parameters for the module. NULL in case no
+ * 	parameters are to be passed, or a '\0' terminated string otherwise.
+ * @result: (in)(nullable): NULL if the result of loading the module should be
+ * 	returned, or a '\0' terminated string with the name of the module_param
+ * 	holding the test's result, if that should be returned instead.
+ *
+ * Execute the given test by loading the module and asserts its success.
+ *
+ * Returns: 0 on success, non-zero otherwise. If @result is set, returns the
+ * value from the given module_param after running the test.
+ */
 int igt_kselftest_execute(struct igt_kselftest *tst,
 			  struct igt_kselftest_list *tl,
 			  const char *options,
@@ -949,6 +1023,7 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
 
 	lseek(tst->kmsg, 0, SEEK_END);
 
+	/* prepare modprobe parameters to enable a test with extra options */
 	snprintf(buf, sizeof(buf), "%s=1 %s", tl->param, options ?: "");
 
 	err = modprobe(tst->kmod, buf);
@@ -974,18 +1049,40 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
 	return err;
 }
 
+/**
+ * igt_kselftest_end:
+ * @tst: (in): handler for module to be unloaded and kmsg file descriptor
+ *
+ * Unload the module and close the kmsg file descriptor.
+ */
 void igt_kselftest_end(struct igt_kselftest *tst)
 {
 	kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
 	close(tst->kmsg);
 }
 
+/**
+ * igt_kselftest_fini:
+ * @tst: (in): container of items to be freed
+ *
+ * Free memory from @tst->module_name and remove reference for @tst->kmod
+ */
 void igt_kselftest_fini(struct igt_kselftest *tst)
 {
 	free(tst->module_name);
 	kmod_module_unref(tst->kmod);
 }
 
+/**
+ * unfilter:
+ * @filter: (in)(nullable): prefix to be removed
+ * @name: (in): string to be trimmed
+ *
+ * Remove prefix @filter from @name, removing an additional non-alpha char,
+ * if there's one.
+ *
+ * Returns: a pointer to the resulting string
+ */
 static const char *unfilter(const char *filter, const char *name)
 {
 	if (!filter)
@@ -998,6 +1095,18 @@ static const char *unfilter(const char *filter, const char *name)
 	return name;
 }
 
+/**
+ * igt_kselftests:
+ * @module_name: (in): name of the module to find and run tests for
+ * @options: (in)(nullable): Extra parameters for the module. NULL in case no
+ * 	parameters are to be passed, or a '\0' terminated string otherwise.
+ * @result: (in)(nullable): NULL if the result of loading the module should be
+ * 	returned, or a '\0' terminated string with the name of the module_param
+ * 	holding the test's result, if that should be returned instead.
+ * @filter: (in)(nullable): run only tests with a prefix matching this filter
+ *
+ * Find and execute kselftests defined as module_params of the given module.
+ */
 void igt_kselftests(const char *module_name,
 		    const char *options,
 		    const char *result,
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 0d80451b..74c5fb2a 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -50,12 +50,30 @@ void igt_kselftests(const char *module_name,
 		    const char *result_option,
 		    const char *filter);
 
+/**
+ * igt_kselftest:
+ * @kmod: reference for <structname>kmod_module</structname> used to load and
+ * 	unload the module
+ * @module_name: name of the module containing the kselftests for IGT
+ * @kmsg: holds a file descriptor for <filename>/dev/kmsg</filename>
+ *
+ * Handle a kernel module with kselftests and their output
+ */
 struct igt_kselftest {
 	struct kmod_module *kmod;
 	char *module_name;
 	int kmsg;
 };
 
+/**
+ * igt_kselftest_list:
+ * @link: doubly linked list attributes
+ * @number: defines the relative position of each element in the ordered list
+ * @name: pointer to the test's name, a suffix of <structfield>param</structfield>
+ * @param: name of the module_param that enables/disables the test
+ *
+ * Node of an ordered list of test names
+ */
 struct igt_kselftest_list {
 	struct igt_list_head link;
 	unsigned int number;
-- 
2.37.1
