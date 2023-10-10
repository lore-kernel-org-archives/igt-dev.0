Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09310E368
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 13:17:48 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 21B58580DBE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 06:17:47 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qqCcL-002FJr-0F
 for igt-dev@lists.freedesktop.org; Tue, 10 Oct 2023 15:17:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Oct 2023 15:17:19 +0200
Message-ID: <20231010131743.535504-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231010131743.535504-1-mauro.chehab@linux.intel.com>
References: <20231010131743.535504-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] testplan/meson.build: disable kms check
 testlist if not chamelium
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

The KMS JSON file contains some tests that can optionally be disabled.
When those are disabled, the code can't check for missing documents,
as the JSON file specifies both enabled and disabled tests.

Detect that to avoid build problems.

While here, remove a left-over dictionary (xe_test_dict).

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 16dd578266cd..9e0c3aee06af 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -11,12 +11,19 @@ kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.jso
 i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
 
 check_testlist = []
+kms_check_testlist = []
 if build_tests
 	doc_dependencies = testlist_files
 	# Check if documentation matches the actual tests and tests can run
 	if not meson.is_cross_build()
 		build_info += 'Will Check if documentation is in sync with testlist'
 		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
+
+		if not chamelium.found()
+			warning('WARNING: Will not check if documentation is in sync for KMS as chamelium is disabled')
+		else
+			kms_check_testlist = check_testlist
+		endif
 	else
 		warning('WARNING: Will not check if documentation is in sync with testlist')
 	endif
@@ -24,20 +31,16 @@ else
 	doc_dependencies = []
 endif
 
-xe_test_dict = {
-		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
-	       }
-
 if build_xe
 	test_dict = {
 		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
-		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
+		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
 		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 else
 	test_dict = {
 	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
-	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist }
 	    }
 endif
 
-- 
2.41.0
