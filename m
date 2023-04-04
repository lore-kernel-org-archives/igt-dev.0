Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF56510E120
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 07:08:52 +0000 (UTC)
Received: from linux.intel.com (daanders-mobl1.ger.corp.intel.com
 [10.252.28.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E7E95580C7C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 00:08:49 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjamd-000r9k-0h
 for igt-dev@lists.freedesktop.org; Tue, 04 Apr 2023 09:08:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 09:08:44 +0200
Message-Id: <20230404070844.204306-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] testplan/meson.build: only run
 igt_runner if it is compiled
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

While the runner is built by default, if jsonc is not found, it
won't be build. This will cause the documentation validation test
to cause the build to fail.

Prevent that by adding an extra check if jsonc is found, as this
is the same condition that it is used to build igt_runner.

While here, also ensure that igt_doc.py will depend on having the
igt_runner already compiled, when the --check option is used.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

v2:
  - add a dependency for the runner binary when --check option is
    used.

 docs/testplan/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 4c67ec42fc69..b8f94f1d74fb 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -9,9 +9,11 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 
 check_testlist = []
-if build_tests
+doc_dependencies = test_executables
+if build_tests and jsonc.found()
 	# Check if documentation matches the actual tests
 	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
+	doc_dependencies += runner
 else
 	test_executables = []
 endif
@@ -24,7 +26,7 @@ foreach testplan, fields: test_dict
 	rst = custom_target(testplan + '.rst',
 			    build_by_default : true,
 			    command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
-			    depends : test_executables,
+			    depends : doc_dependencies,
 			    input : fields['input'],
 			    output : testplan + '.rst'
 			   )
-- 
2.39.2
