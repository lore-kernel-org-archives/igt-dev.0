Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDBEFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251A410E2C4;
	Tue, 28 Apr 2026 04:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzGLqZwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF3710E2C4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351646; x=1808887646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OORqEIASsyqQN4v2gU2ISw+WRaIy+njLkrqgdO+fZEI=;
 b=WzGLqZwNJ6faXjobK8/bqrmNyS2cY4b3UAA5ZZ9fq6xkzib9yM8usoCC
 emflAJz+mJNDVGgsygZzJhNcDrV1qtGzPbDaTpVGZawGQxCjukWGE9Lyh
 F2R7o7tXSCgcaknjJNTneid7TePfNVSgaiTG8G7VGZ+TlNrtyETwZZHBC
 VLYO+dc9xdSB+7r9ihA/V/6sphDMtzZvNUoonSfHSShU2EkVf29zCvJg0
 xL0vzNGqxcEsHAtgxuShc29pp0EnK/tvRIQe6qsw3FOKvQZBcLLVlCkHt
 JeuwKKB+4SaYhTKoUGuWhvwNS3acU1L5CtAVWdZ6skabtXa36V6ROFrc/ A==;
X-CSE-ConnectionGUID: bt+MZwZ6Tg+nWk2Kv6gxIw==
X-CSE-MsgGUID: Qfg/tLuzRuCDI/YBToiGyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167834"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:26 -0700
X-CSE-ConnectionGUID: 0Pmkj7JCR42xn9jKKaI6rA==
X-CSE-MsgGUID: bWi3hesMSAqlMqVa8SvdQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706710"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:25 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 15/25] lib/chamelium/v3: Introduce the foundation for
 the Chamelium v3 wrapper
Date: Tue, 28 Apr 2026 10:16:24 +0530
Message-ID: <20260428044644.257001-16-mohammed.bilal@intel.com>
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

Adds a build option to enable building the Chamelium v3 wrapper.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c |  9 +++++++++
 lib/chamelium/v3/igt_chamelium.h |  8 ++++++++
 lib/igt_kms.c                    |  8 ++++++++
 lib/meson.build                  | 12 +++++++++++-
 lib/tests/meson.build            |  4 ++++
 meson.build                      | 15 ++++++++++++++-
 meson_options.txt                |  4 ++++
 tests/meson.build                | 25 +++++++++++++++++++++++++
 8 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 lib/chamelium/v3/igt_chamelium.c
 create mode 100644 lib/chamelium/v3/igt_chamelium.h

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
new file mode 100644
index 000000000..152242998
--- /dev/null
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: MIT
+
+#include <igt_core.h>
+#include "igt_chamelium.h"
+
+void chamelium_v3_init(void)
+{
+	igt_info("Using chamelium v3\n");
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
new file mode 100644
index 000000000..3195be2bc
--- /dev/null
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef V3_IGT_CHAMELIUM_H
+#define V3_IGT_CHAMELIUM_H
+
+void chamelium_v3_init(void);
+
+#endif //V3_IGT_CHAMELIUM_H
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 928de2a10..267978f3d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3155,7 +3155,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
+/*
+ * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
+ *
+ * Must be replaced with a configuration file information, so the end user can choose if the
+ * chamelium must be connected or not.
+ */
 #ifdef HAVE_CHAMELIUM_V2
+#ifndef HAVE_CHAMELIUM_V3
 	{
 		struct chamelium *chamelium;
 
@@ -3170,6 +3177,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 			chamelium_deinit_rpc_only(chamelium);
 		}
 	}
+#endif
 #endif
 
 	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
diff --git a/lib/meson.build b/lib/meson.build
index 460b596de..589b2bfdd 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -239,7 +239,6 @@ if chamelium_v2.found()
 		'chamelium/v2/igt_chamelium.c',
 		'chamelium/v2/igt_chamelium_stream.c'
 	]
-	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
 if build_xe_eudebug
@@ -247,6 +246,17 @@ if build_xe_eudebug
 	lib_sources += 'xe/xe_eudebug.c'
 endif
 
+if chamelium_v3.found()
+	lib_deps += chamelium_v3
+	lib_sources += [
+		'chamelium/v3/igt_chamelium.c',
+	]
+endif
+
+if chamelium_v2.found() or chamelium_v3.found()
+	lib_sources += 'monitor_edids/monitor_edids_helper.c'
+endif
+
 if libprocps.found()
 	lib_deps += libprocps
 else
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 483b7fa3f..9b9f29003 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -43,6 +43,10 @@ if chamelium_v2.found()
 	lib_tests += 'igt_audio'
 endif
 
+if chamelium_v3.found()
+	lib_deps += chamelium_v3
+endif
+
 foreach lib_test : lib_tests
 	exec = executable(lib_test, lib_test + '.c', install : false,
 			dependencies : igt_deps)
diff --git a/meson.build b/meson.build
index 1bb5595f8..6e6a66b5e 100644
--- a/meson.build
+++ b/meson.build
@@ -87,6 +87,7 @@ foreach cc_arg : cc_args
 endforeach
 
 build_chamelium_v2 = get_option('chamelium_v2')
+build_chamelium_v3 = get_option('chamelium_v3')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
@@ -183,7 +184,7 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
 	endif
 endif
 
-if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
+if (build_chamelium_v2.enabled() or build_chamelium_v3.enabled()) and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
 	error('Chamelium build forced and required dependency xmlrpc not found')
 endif
 
@@ -206,6 +207,18 @@ endif
 
 build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())
 
+
+if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and libcurl.found()
+	config.set('HAVE_CHAMELIUM_V3', 1)
+	chamelium_v3 = declare_dependency(dependencies : [
+										  xmlrpc,
+										  xmlrpc_util,
+										  xmlrpc_client,
+									  ])
+else
+	chamelium_v3 = disabler()
+endif
+
 pthreads = dependency('threads')
 math = cc.find_library('m')
 realtime = cc.find_library('rt')
diff --git a/meson_options.txt b/meson_options.txt
index 42a1b1294..9107c49d2 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -12,6 +12,10 @@ option('chamelium_v2',
        type : 'feature',
        description : 'Build Chamelium v2 test')
 
+option('chamelium_v3',
+       type : 'feature',
+       description : 'Build Chamelium v3 tests')
+
 option('valgrind',
        type : 'feature',
        description : 'Build with support for valgrind annotations')
diff --git a/tests/meson.build b/tests/meson.build
index 7f7224b38..17677e4e4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -372,6 +372,9 @@ chamelium_v2_progs = [
 	'kms_chamelium_sharpness_filter',
 ]
 
+chamelium_v3_progs = [
+]
+
 test_deps = [ igt_deps ]
 
 if libdrm_nouveau.found()
@@ -500,6 +503,28 @@ if chamelium_v2.found()
 	test_deps += chamelium_v2
 endif
 
+if chamelium_v3.found()
+	foreach prog : chamelium_v3_progs
+		testexe = executable(prog,
+				 [join_paths('chamelium', 'v3', prog + '.c')],
+				 dependencies : test_deps,
+				 install_dir : libexecdir,
+				 install_rpath : libexecdir_rpathdir,
+				 install : true)
+		test_list += prog
+		test_executables += testexe
+		name = prog.split('/').get(-1)
+		if not meson.is_cross_build()
+			testlist_files += custom_target(name + '.testlist',
+				    build_by_default : true,
+				    command : [testexe, '--show-testlist'],
+				    capture : true,
+				    output : name + '.testlist')
+		endif
+	endforeach
+	test_deps += chamelium_v3
+endif
+
 subdir('amdgpu')
 
 subdir('msm')
-- 
2.48.1

