Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39FC10E18E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 14:30:02 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 16:29:24 +0200
Message-Id: <20230524142931.119823-3-dominik.grzegorzek@intel.com>
In-Reply-To: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
References: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/9] meson: Introduce xe_staging build option
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

There are some major features, which in a current state cannot be merged
upstream. A good example here in an EU debugger, which does not
meet the requirement of having an opensourced client. While those
features are in the development we need a way of providing them
validation. So introduce xe_staging build option under which
we can keep tests of features that are under haevy development and not
yet accepted upstream or not yet completed.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 meson.build       |  1 +
 meson_options.txt |  5 +++++
 tests/meson.build | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/meson.build b/meson.build
index 1c872cc9c..ae2206d6e 100644
--- a/meson.build
+++ b/meson.build
@@ -86,6 +86,7 @@ build_chamelium = get_option('chamelium')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
+build_xe_staging = not get_option('xe_staging').disabled()
 with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
diff --git a/meson_options.txt b/meson_options.txt
index 7b5a818cb..46ee91fe6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -46,6 +46,11 @@ option('xe_driver',
        type : 'feature',
        description : 'Build tests for Xe driver (experimental)')
 
+option('xe_staging',
+       type : 'feature',
+       value : 'disabled',
+       description : 'Build tests for Xe features that cannot be upstreamed yet (experimental)')
+
 option('libdrm_drivers',
        type : 'array',
        value : ['auto'],
diff --git a/tests/meson.build b/tests/meson.build
index 38f080f7c..8c7055ed9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -269,6 +269,9 @@ xe_progs = [
 	'xe_waitfence',
 ]
 
+xe_staging_progs = [
+]
+
 msm_progs = [
 	'msm_mapping',
 	'msm_recovery',
@@ -330,6 +333,19 @@ if build_xe
 	build_info += 'Xe **experimental** tests enabled.'
 endif
 
+if build_xe_staging
+        foreach prog : xe_staging_progs
+		test_executables += executable(prog,
+		           join_paths('xe/staging', prog + '.c'),
+			   dependencies : test_deps,
+			   install_dir : libexecdir,
+			   install_rpath : libexecdir_rpathdir,
+			   install : true)
+		test_list += prog
+	endforeach
+	build_info += 'Work in progress tests enabled.'
+endif
+
 foreach prog : msm_progs
 	test_executables += executable(prog, join_paths('msm', prog + '.c'),
 				       dependencies : test_deps,
-- 
2.34.1
