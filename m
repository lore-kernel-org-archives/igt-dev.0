Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4DA10E292
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 10:48:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.20.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BB3C2580AD7
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 03:48:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q67kq-00D4h3-1N
 for igt-dev@lists.freedesktop.org; Mon, 05 Jun 2023 12:48:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 12:47:58 +0200
Message-Id: <20230605104759.3116294-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: place KUnit tests on a
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: 20230602082721.7818-7-dominik.karol.piatkowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There's a hidden bug at KUnit implementation: as it doesn't
place tests inside a subtest, trying to use it with igt_main
causes a crash:

	$ ./build/tests/drm_mm --list
	skipping is allowed only in fixtures, subtests or igt_simple_main
	please refer to lib/igt_core documentation
	drm_mm: ../lib/igt_core.c:437: internal_assert: Assertion `0' failed.
	Received signal SIGABRT.
	Stack trace:
	 #0 [fatal_sig_handler+0x17b]
	 #1 [__sigaction+0x50]
	 #2 [__pthread_kill_implementation+0x114]
	 #3 [gsignal+0x1e]
	 #4 [abort+0xdf]
	 #5 [__assert_fail_base.cold+0xe]
	 #6 [__assert_fail+0x47]
	 #7 [internal_assert+0xe5]
	 #8 [igt_skip+0x169]
	 #9 [__igt_skip_check+0x1bb]
	 #10 [igt_ktest_begin+0xa6]
	 #11 [igt_kunit+0x70]
	 #12 [main+0x2a]
	 #13 [__libc_start_call_main+0x7a]
	 #14 [__libc_start_main+0x8b]
	 #15 [_start+0x25]

Fix it by using igt_subtests() before actually implememnting
KUnit logic.

After the patch, it should now report subtests:

	$ ./build/tests/drm_mm --list
	all-tests

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 8cb9cb2e90b9..1309ab212b11 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -754,7 +754,7 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
  *
  * Returns: IGT default codes
  */
-int igt_kunit(const char *module_name, const char *opts)
+static int __igt_kunit(const char *module_name, const char *opts)
 {
 	struct igt_ktest tst;
 	struct kmod_module *kunit_kmod;
@@ -852,6 +852,20 @@ unload:
 	return ret;
 }
 
+int igt_kunit(const char *module_name, const char *opts)
+{
+	/*
+	 * We need to use igt_subtest here, as otherwise it may crash with:
+	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
+	 * if used on igt_main. This is also needed in order to provide
+	 * proper namespace for dynamic subtests, with is required for CI
+	 * and for documentation.
+	 */
+	igt_subtest_with_dynamic("all-tests")
+		return __igt_kunit(module_name, opts);
+	return 0;
+}
+
 static int open_parameters(const char *module_name)
 {
 	char path[256];
-- 
2.40.1
