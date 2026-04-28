Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A77FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F323810E29C;
	Tue, 28 Apr 2026 04:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWhjdGAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209DA10E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351643; x=1808887643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2znGv+3MGaEh7XslhkG2npw4Dkx+8b1N8YU1XtyN1CE=;
 b=PWhjdGAvCfnP9kI1KMqcS2MsU8pK3XJS6lUyusKcvQzfzWUs8Kib4i/H
 r1+dXYy7D62OpNWvrRJhdJ04A3ckGqYVyjlCJx5rKvErunbAetM0gmxy7
 gK/Ab3cqckryZWSBcI9qxHWqEWrcYiSx/8HIbjlFAbFxZMYnJmoT42qnD
 g/NH9/8g1AE3mjLNpV4ar6GPj3485HkWIIzj2+6E2vBBtxSTzrDKUY1Ru
 IysEku5TBkw6DGjOyRmvBlUSGnkQ1TusiKucsscUr2Wak/YUj8ZHTxHMa
 uUoINmwOAaIv8COZn/w+kEzo1xaRrAygw+j3jPG1eVWybB2UIH24zMBe0 w==;
X-CSE-ConnectionGUID: /fTkOAhKT/ejjjkyKdU7PQ==
X-CSE-MsgGUID: XXOXbj5UQXya4WU3qBmjCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167828"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167828"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:23 -0700
X-CSE-ConnectionGUID: idtCIoHmSW+Ki6dqdQ+MpQ==
X-CSE-MsgGUID: 15i5xxFrSn2heN/tsouDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706690"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:22 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 13/25] lib/chamelium/v2: Rename chamelium to
 chamelium_v2
Date: Tue, 28 Apr 2026 10:16:22 +0530
Message-ID: <20260428044644.257001-14-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

To avoid confusion in meson build file, rename the variable chamlium to
chamlium_v2.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 .gitlab-ci.yml            |  2 +-
 docs/testplan/meson.build |  4 ++--
 lib/meson.build           |  4 ++--
 lib/tests/meson.build     |  4 ++--
 meson.build               | 16 ++++++++--------
 meson_options.txt         |  4 ++--
 tests/meson.build         |  8 ++++----
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 34daba4d5..25f4337d8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -6,7 +6,7 @@ variables:
   MESON_OPTIONS: >
     -Dlibdrm_drivers=intel,nouveau,amdgpu
     -Doverlay=enabled
-    -Dchamelium=enabled
+    -Dchamelium_v2=enabled
     -Dvalgrind=enabled
     -Dman=enabled
     -Dtests=enabled
diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 5560347f1..f60c82ad1 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -21,8 +21,8 @@ if build_tests
 		build_info += 'Will Check if documentation is in sync with testlist'
 		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
 
-		if not chamelium.found()
-			warning('WARNING: Will not check if documentation is in sync for KMS as chamelium is disabled')
+		if not chamelium_v2.found()
+			warning('WARNING: Will not check if documentation is in sync for KMS as chamelium v2 is disabled')
 		else
 			kms_check_testlist = check_testlist
 		endif
diff --git a/lib/meson.build b/lib/meson.build
index 0d94db9cd..460b596de 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -233,8 +233,8 @@ if alsa.found()
 	lib_sources += 'igt_alsa.c'
 endif
 
-if chamelium.found()
-	lib_deps += chamelium
+if chamelium_v2.found()
+	lib_deps += chamelium_v2
 	lib_sources += [
 		'chamelium/v2/igt_chamelium.c',
 		'chamelium/v2/igt_chamelium_stream.c'
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 124a9ecae..483b7fa3f 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -38,8 +38,8 @@ lib_fail_tests = [
 
 lib_tests_deps = igt_deps
 
-if chamelium.found()
-	lib_deps += chamelium
+if chamelium_v2.found()
+	lib_deps += chamelium_v2
 	lib_tests += 'igt_audio'
 endif
 
diff --git a/meson.build b/meson.build
index 79051be21..6816c2ee1 100644
--- a/meson.build
+++ b/meson.build
@@ -86,7 +86,7 @@ foreach cc_arg : cc_args
   endif
 endforeach
 
-build_chamelium = get_option('chamelium')
+build_chamelium_v2 = get_option('chamelium_v2')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
@@ -183,17 +183,17 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
 	endif
 endif
 
-if build_chamelium.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
+if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
 	error('Chamelium build forced and required dependency xmlrpc not found')
 endif
 
-gsl = dependency('gsl', required : build_chamelium)
-alsa = dependency('alsa', required : build_chamelium)
-libcurl = dependency('libcurl', required : build_chamelium)
+gsl = dependency('gsl', required : build_chamelium_v2)
+alsa = dependency('alsa', required : build_chamelium_v2)
+libcurl = dependency('libcurl', required : build_chamelium_v2)
 
 if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.found() and alsa.found() and libcurl.found()
 	config.set('HAVE_CHAMELIUM', 1)
-	chamelium = declare_dependency(dependencies : [
+	chamelium_v2 = declare_dependency(dependencies : [
 		xmlrpc,
 		xmlrpc_util,
 		xmlrpc_client,
@@ -201,10 +201,10 @@ if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.foun
 		alsa,
 	])
 else
-	chamelium = disabler()
+	chamelium_v2 = disabler()
 endif
 
-build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
+build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())
 
 pthreads = dependency('threads')
 math = cc.find_library('m')
diff --git a/meson_options.txt b/meson_options.txt
index e23402b36..42a1b1294 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -8,9 +8,9 @@ option('overlay_backends',
        choices : [ 'auto', 'x', 'xv' ],
        description : 'Overlay backends to enable')
 
-option('chamelium',
+option('chamelium_v2',
        type : 'feature',
-       description : 'Build Chamelium test')
+       description : 'Build Chamelium v2 test')
 
 option('valgrind',
        type : 'feature',
diff --git a/tests/meson.build b/tests/meson.build
index 4455b55c0..7f7224b38 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -363,7 +363,7 @@ if build_xe_eudebug
 	intel_xe_progs += intel_xe_eudebug_progs
 endif
 
-chamelium_progs = [
+chamelium_v2_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
 	'kms_chamelium_edid',
@@ -478,8 +478,8 @@ foreach prog : intel_progs
 	endif
 endforeach
 
-if chamelium.found()
-	foreach prog : chamelium_progs
+if chamelium_v2.found()
+	foreach prog : chamelium_v2_progs
 		testexe = executable(prog,
 				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
@@ -497,7 +497,7 @@ if chamelium.found()
 				    output : name + '.testlist')
 		endif
 	endforeach
-	test_deps += chamelium
+	test_deps += chamelium_v2
 endif
 
 subdir('amdgpu')
-- 
2.48.1

