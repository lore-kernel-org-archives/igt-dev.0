Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C9710EE02
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 13:06:07 +0000 (UTC)
Received: from linux.intel.com (pludynia-mobl.ger.corp.intel.com [10.252.3.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6BA9E580D9E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 06:05:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phrxy-00BSax-1Q
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 15:05:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 15:05:15 +0200
Message-Id: <20230330130518.2731441-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
References: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 09/12] testplan/meson.build: Validate
 documentation at build time
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

If the tests are build too, check if the documentation match
the name of the tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 docs/testplan/meson.build | 8 ++++++--
 meson.build               | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index fee568868167..4c67ec42fc69 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -8,12 +8,16 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
 xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 
-if not build_tests
+check_testlist = []
+if build_tests
+	# Check if documentation matches the actual tests
+	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
+else
 	test_executables = []
 endif
 
 test_dict = { 'xe_tests':
-		{ 'input': xe_test_config, 'extra_args': [] }
+		{ 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 
 foreach testplan, fields: test_dict
diff --git a/meson.build b/meson.build
index 7360634fe199..bef590f465dc 100644
--- a/meson.build
+++ b/meson.build
@@ -15,6 +15,7 @@ endif
 
 # meson.source_root is marked as a future-deprecated feature
 source_root = meson.current_source_dir()
+build_root = meson.current_build_dir()
 
 cc = meson.get_compiler('c')
 
-- 
2.39.2
