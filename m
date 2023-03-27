Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D6510E5C4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:32:12 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1A729580D92
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:32:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgmx4-00ABnY-0T
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:31:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:31:53 +0200
Message-Id: <20230327133155.2428454-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/11] testplan/meson.build: Validate
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
---
 docs/testplan/meson.build | 8 ++++++--
 meson.build               | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index fee568868167..d1ad6ea0461b 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -8,12 +8,16 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
 xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 
-if not build_tests
+check_testlist = ''
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
