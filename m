Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4817710E281
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 06:50:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 59455580D95
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 23:50:09 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pesIR-007NXY-1L
 for igt-dev@lists.freedesktop.org; Wed, 22 Mar 2023 07:50:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 07:50:00 +0100
Message-Id: <20230322065003.1758611-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230322065003.1758611-1-mauro.chehab@linux.intel.com>
References: <20230322065003.1758611-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 5/8] meson: get rid of
 tests/xe/meson.build
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

Currently, this holds just a variable used by testplan. Drop it,
cleaning up the building system.

This change allows building the testplan documentation without
needing to build tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/meson.build          | 5 +----
 docs/testplan/meson.build | 6 ++++++
 tests/meson.build         | 1 -
 tests/xe/meson.build      | 1 -
 4 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 tests/xe/meson.build

diff --git a/docs/meson.build b/docs/meson.build
index 9bfec8fee80b..01edf64f04a8 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,5 +1,2 @@
 subdir('reference')
-
-if xe_test_config != ''
-	subdir('testplan')
-endif
+subdir('testplan')
diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 50063aa2e84f..d34a8212df76 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -9,6 +9,12 @@ rst2pdf = find_program('rst2pdf', required: false)
 
 stylesheet = meson.current_source_dir() + '/testplan.css'
 
+xe_test_config = source_root + '/tests/xe/xe_test_config.json'
+
+if not build_tests
+    test_executables = []
+endif
+
 test_dict = { 'xe_tests': {
                  'input': xe_test_config, 'extra_args': []
               }
diff --git a/tests/meson.build b/tests/meson.build
index 632e36e059d8..e1cccf6298a6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -502,7 +502,6 @@ test_executables += executable('sw_sync', 'sw_sync.c',
 test_list += 'sw_sync'
 
 subdir('amdgpu')
-subdir('xe')
 
 subdir('v3d')
 
diff --git a/tests/xe/meson.build b/tests/xe/meson.build
deleted file mode 100644
index bb344f95d59d..000000000000
--- a/tests/xe/meson.build
+++ /dev/null
@@ -1 +0,0 @@
-xe_test_config = meson.current_source_dir() + '/xe_test_config.json'
-- 
2.39.2
