Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1ECE65D03
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 22:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63210E00A;
	Thu, 21 Nov 2024 22:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0jaMxYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307D510E00A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732229734; x=1763765734;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uow/1MZ73CViXHzfkko5B1vJwu53WieP2VQe8hHHERg=;
 b=P0jaMxYURLNcKqNsEo8REPvhbeJBVo24O66pp1Kd92db0luOHF8qTlAy
 0LdkEnA9cry9MwbDLACGXtwJPUqT3YGSqQQIkkjRd4jFLfpj/jxavB2Hc
 8N12N68WLijUBxpXeclaKhjOfwDPXcWMyQk0Hy9DVhX3sSIMAd+U5YPV4
 MI0o5pk0rKLuGLrjn+g69OhNhV4fxrOg+KLsVnjNVcpXcqVh+bcKBr26T
 FFx5RQVPBJXbo5FQ539OnQL2DcbmgKw4govqRl2JQm5p1RusGCYnLNXlb
 tYdP0hlGCGT3LITgYY1rP7g/L0jB8N0a9F3fpRbcqJXb4gHD/ITqYCLkT Q==;
X-CSE-ConnectionGUID: yTl0k4+BS7u/jDEpX3EZDw==
X-CSE-MsgGUID: tMjqxpAXQI+mZhLCzpgtSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36151337"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="36151337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:33 -0800
X-CSE-ConnectionGUID: kTUF6PmIRvSvczE9nwQ3Hg==
X-CSE-MsgGUID: aZt0KIj5Ro6k+Hm9lziRNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="95196915"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI 1/2] lib/igt_kmod: Drop legacy kunit fallback
Date: Thu, 21 Nov 2024 14:55:09 -0800
Message-ID: <20241121225510.3701650-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Kunit has support for listing tests with debugfs for quite some time,
there's no need for the fallback to be happening: let's just start
failing the tests if we can't get the list of tests from debugfs.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 289 ++-----------------------------------------------
 1 file changed, 12 insertions(+), 277 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 87036d06c..5224d36a4 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -959,121 +959,6 @@ static bool kunit_set_filtering(const char *filter_glob, const char *filter,
 	return ret;
 }
 
-struct modprobe_data {
-	struct kmod_module *kmod;
-	const char *opts;
-	int err;
-	pthread_t parent;
-	pthread_mutex_t lock;
-	pthread_t thread;
-};
-
-static void *modprobe_task(void *arg)
-{
-	struct modprobe_data *data = arg;
-
-	data->err = modprobe(data->kmod, data->opts);
-
-	if (igt_debug_on(data->err)) {
-		bool once = false;
-		int err;
-
-		while (err = pthread_mutex_trylock(&data->lock),
-		       err && !igt_debug_on(err != EBUSY)) {
-			igt_debug_on(pthread_kill(data->parent, SIGCHLD) &&
-				     !once);
-			once = true;
-		}
-	} else {
-		/* let main thread use mutex to detect modprobe completion */
-		igt_debug_on(pthread_mutex_lock(&data->lock));
-	}
-
-	return NULL;
-}
-
-static void kunit_sigchld_handler(int signal)
-{
-}
-
-static int kunit_kmsg_result_get(struct igt_list_head *results,
-				 struct modprobe_data *modprobe,
-				 int fd, struct igt_ktap_results *ktap)
-{
-	struct sigaction sigchld = { .sa_handler = kunit_sigchld_handler, },
-			 saved;
-	char record[BUF_LEN + 1], *buf;
-	unsigned long taints;
-	int ret;
-
-	do {
-		int err;
-
-		if (igt_debug_on(igt_kernel_tainted(&taints)))
-			return -ENOTRECOVERABLE;
-
-		if (modprobe) {
-			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, &saved));
-			if (err == -1)
-				return -errno;
-			else if (unlikely(err))
-				return err;
-
-			err = pthread_mutex_lock(&modprobe->lock);
-			switch (err) {
-			case EOWNERDEAD:
-				/* leave the mutex unrecoverable */
-				igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
-				__attribute__ ((fallthrough));
-			case ENOTRECOVERABLE:
-				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
-				if (igt_debug_on(modprobe->err))
-					return modprobe->err;
-				break;
-			case 0:
-				break;
-			default:
-				igt_debug("pthread_mutex_lock() error: %d\n", err);
-				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
-				return -err;
-			}
-		}
-
-		ret = read(fd, record, BUF_LEN);
-
-		if (modprobe && !err) {	/* pthread_mutex_lock() succeeded */
-			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
-			igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
-		}
-
-		if (igt_debug_on(!ret))
-			return -ENODATA;
-		if (igt_debug_on(ret == -1))
-			return -errno;
-		if (unlikely(igt_debug_on(ret < 0)))
-			break;
-
-		/* skip kmsg continuation lines */
-		if (igt_debug_on(*record == ' '))
-			continue;
-
-		/* NULL-terminate the record */
-		record[ret] = '\0';
-
-		/* detect start of log message, continue if not found */
-		buf = strchrnul(record, ';');
-		if (igt_debug_on(*buf == '\0'))
-			continue;
-		buf++;
-
-		ret = igt_ktap_parse(buf, ktap);
-		if (!ret || igt_debug_on(ret != -EINPROGRESS))
-			break;
-	} while (igt_list_empty(results));
-
-	return ret;
-}
-
 static void kunit_result_free(struct igt_ktap_result **r,
 			      char **suite_name, char **case_name)
 {
@@ -1148,147 +1033,7 @@ out_fclose:
 	return err;
 }
 
-static void __igt_kunit_legacy(struct igt_ktest *tst,
-			       const char *subtest,
-			       const char *opts)
-{
-	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
-	char *suite_name = NULL, *case_name = NULL;
-	struct igt_ktap_results *ktap;
-	struct igt_ktap_result *r;
-	pthread_mutexattr_t attr;
-	IGT_LIST_HEAD(results);
-	unsigned long taints;
-	int flags, ret;
-
-	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
-
-	igt_skip_on((flags = fcntl(tst->kmsg, F_GETFL, 0), flags < 0));
-	igt_skip_on_f(fcntl(tst->kmsg, F_SETFL, flags & ~O_NONBLOCK) == -1,
-		      "Could not set /dev/kmsg to blocking mode\n");
-
-	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
-
-	igt_skip_on(pthread_mutexattr_init(&attr));
-	igt_skip_on(pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST));
-	igt_skip_on(pthread_mutex_init(&modprobe.lock, &attr));
-
-	ktap = igt_ktap_alloc(&results);
-	igt_require(ktap);
-
-	if (igt_debug_on(pthread_create(&modprobe.thread, NULL,
-					modprobe_task, &modprobe))) {
-		igt_ktap_free(&ktap);
-		igt_skip("Failed to create a modprobe thread\n");
-	}
-
-	do {
-		ret = kunit_kmsg_result_get(&results, &modprobe,
-					    tst->kmsg, ktap);
-		if (igt_debug_on(ret && ret != -EINPROGRESS))
-			break;
-
-		if (igt_debug_on(igt_list_empty(&results)))
-			break;
-
-		r = igt_list_first_entry(&results, r, link);
-
-		igt_dynamic_f("%s%s%s",
-			      strcmp(r->suite_name, subtest) ?  r->suite_name : "",
-			      strcmp(r->suite_name, subtest) ? "-" : "",
-			      r->case_name) {
-
-			if (r->code == IGT_EXIT_INVALID) {
-				/* parametrized test case, get actual result */
-				kunit_result_free(&r, &suite_name, &case_name);
-
-				igt_assert(igt_list_empty(&results));
-
-				ret = kunit_kmsg_result_get(&results, &modprobe,
-							    tst->kmsg, ktap);
-				if (ret != -EINPROGRESS)
-					igt_fail_on(ret);
-
-				igt_fail_on(igt_list_empty(&results));
-
-				r = igt_list_first_entry(&results, r, link);
-
-				igt_fail_on_f(strcmp(r->suite_name, suite_name),
-					      "suite_name expected: %s, got: %s\n",
-					      suite_name, r->suite_name);
-				igt_fail_on_f(strcmp(r->case_name, case_name),
-					      "case_name expected: %s, got: %s\n",
-					      case_name, r->case_name);
-			}
-
-			igt_assert_neq(r->code, IGT_EXIT_INVALID);
-
-			if (r->msg && *r->msg) {
-				igt_skip_on_f(r->code == IGT_EXIT_SKIP,
-					      "%s\n", r->msg);
-				igt_fail_on_f(r->code == IGT_EXIT_FAILURE,
-					      "%s\n", r->msg);
-				igt_abort_on_f(r->code == IGT_EXIT_ABORT,
-					      "%s\n", r->msg);
-			} else {
-				igt_skip_on(r->code == IGT_EXIT_SKIP);
-				igt_fail_on(r->code == IGT_EXIT_FAILURE);
-				if (r->code == IGT_EXIT_ABORT)
-					igt_fail(r->code);
-			}
-			igt_assert_eq(r->code, IGT_EXIT_SUCCESS);
-
-			switch (pthread_mutex_lock(&modprobe.lock)) {
-			case 0:
-				igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
-				break;
-			case EOWNERDEAD:
-				/* leave the mutex unrecoverable */
-				igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
-				__attribute__ ((fallthrough));
-			case ENOTRECOVERABLE:
-				igt_assert_eq(modprobe.err, 0);
-				break;
-			default:
-				igt_debug("pthread_mutex_lock() failed\n");
-				break;
-			}
-
-			igt_assert_eq(igt_kernel_tainted(&taints), 0);
-		}
-
-		kunit_result_free(&r, &suite_name, &case_name);
-
-	} while (ret == -EINPROGRESS);
-
-	kunit_results_free(&results, &suite_name, &case_name);
-
-	switch (pthread_mutex_lock(&modprobe.lock)) {
-	case 0:
-		igt_debug_on(pthread_cancel(modprobe.thread));
-		igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
-		igt_debug_on(pthread_join(modprobe.thread, NULL));
-		break;
-	case EOWNERDEAD:
-		/* leave the mutex unrecoverable */
-		igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
-		break;
-	case ENOTRECOVERABLE:
-		break;
-	default:
-		igt_debug("pthread_mutex_lock() failed\n");
-		igt_debug_on(pthread_join(modprobe.thread, NULL));
-		break;
-	}
-
-	igt_ktap_free(&ktap);
-
-	igt_skip_on(modprobe.err);
-	igt_skip_on(igt_kernel_tainted(&taints));
-	igt_skip_on_f(ret, "KTAP parser failed\n");
-}
-
-static bool kunit_get_tests(struct igt_list_head *tests,
+static void kunit_get_tests(struct igt_list_head *tests,
 			    struct igt_ktest *tst,
 			    const char *suite,
 			    const char *opts,
@@ -1302,7 +1047,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 
 	*debugfs_dir = opendir(debugfs_path);
 	if (igt_debug_on(!*debugfs_dir))
-		return false;
+		return;
 
 	/*
 	 * To get a list of test cases provided by a kunit test module, ask the
@@ -1313,7 +1058,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	 * a free text list of unknown length from /dev/kmsg.
 	 */
 	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip")))
-		return false;
+		return;
 
 	if (!suite) {
 		seekdir(*debugfs_dir, 2);	/* directory itself and its parent */
@@ -1350,8 +1095,6 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	igt_list_for_each_entry_safe(r, rn, tests, link)
 		igt_require_f(r->code == IGT_EXIT_SKIP,
 			      "Unexpected non-SKIP result while listing test cases\n");
-
-	return true;
 }
 
 static void __igt_kunit(struct igt_ktest *tst,
@@ -1476,8 +1219,13 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		}
 	}
 
+	/* We need the base KUnit module loaded if not built-in */
+	igt_ignore_warn(igt_kmod_load("kunit", NULL));
+	kunit_debugfs_path(debugfs_path);
+
 	igt_fixture {
 		igt_require(subtest);
+		igt_require(*debugfs_path);
 
 		igt_skip_on(igt_ktest_init(&tst, module_name));
 		igt_skip_on(igt_ktest_begin(&tst));
@@ -1485,30 +1233,17 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		igt_assert(igt_list_empty(&tests));
 	}
 
-	/* We need the base KUnit module loaded if not built-in */
-	igt_ignore_warn(igt_kmod_load("kunit", NULL));
-
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
-	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
+	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
 	 * if used on igt_main. This is also needed in order to provide
 	 * proper namespace for dynamic subtests, with is required for CI
 	 * and for documentation.
 	 */
 	igt_subtest_with_dynamic(subtest) {
-		/*
-		 * TODO: As soon as no longer needed by major Linux
-		 *	 distributions, replace the fallback to
-		 *	 __igt_kunit_legacy() processing path, required by
-		 *	 LTS kernels not capable of using KUnit filters for
-		 *	 listing test cases in KTAP format, with igt_require.
-		 */
-		kunit_debugfs_path(debugfs_path);
-		if (igt_debug_on(!*debugfs_path) ||
-		    !kunit_get_tests(&tests, &tst, suite, opts, debugfs_path, &debugfs_dir, &ktap))
-			__igt_kunit_legacy(&tst, subtest, opts);
-		else
-			__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
+		kunit_get_tests(&tests, &tst, suite, opts,
+				debugfs_path, &debugfs_dir, &ktap);
+		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
 	}
 
 	igt_fixture {
-- 
2.47.0

