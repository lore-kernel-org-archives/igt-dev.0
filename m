Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC91D2CDFD
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05CA10E6C7;
	Tue, 22 Oct 2024 16:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YLDiTglL";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4497010E6C6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:31:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94237E0008;
 Tue, 22 Oct 2024 16:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729614718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05QMvPjXoalBOHMMGOHRXdxtlpmfh4I5skSLBnpCtKQ=;
 b=YLDiTglL+qlJ7cRINhrSVHzpsCTpk7Oeb1thy7MaaBY2zcp71hDVKHTjJM4OwbH8slgqQi
 4CTHxT7uwcK9dzy//tlD3Q0XK7ihEKvTNuRa2vWJJU/o5+UQvqUBDKalkgK6VY6XjQbzHF
 lV1AU0Z9ghcaoLE+/1AY2F6tAM0k/n6iw6I1gsKj0pi6F4kRhG7tO8FR0F5Lcr4aL8C9Km
 UTiBTr80PiugBNLZSERMktPyfM424blZDWWkcGd8QQDCDifCrnHVB9OEhfcPSrkwWyDkkm
 fmknzawoLXeUWT9z6LneGhtOZyi0/+ZvCp4c8amkf5LTv5XkWvczEZeNrdI7mw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 18:31:50 +0200
Subject: [PATCH i-g-t v3 1/5] lib/chamelium/v3: Introduce the foundation
 for the Chamelium v3 wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dev-remove-static-ports-v3-1-bfbc7b2a83b9@bootlin.com>
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com, 
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6298;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=99NaWiA90w7YHWETG4gH66W6Qu8oxWF4W1Sdyv8qD14=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF9N7TXiZ/fzIfDw5djl+0YFO9rmCRVBgIKzhy
 k2HyYHsZLyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxfTewAKCRAgrS7GWxAs
 4n3SEACb635M9u+iB/7Ev3OJpK8aPmqB7vzH2ScCCpLH2b2jYwBB5elqVLFNDIIManncTTRmgpV
 7Z3ztL2RlXjHtk+2ysD/S+nMy7bkba1sgQGKd+4wwKmnWstV+GeFjaBi2p6m+Nwo8ladFAPH0X3
 g5IUz+tCOx2mgtGjiFWmjYiymOcK01ky3wa/sl4uL9Wx28CzgyzzDwACJY5HJ8ScQEvxkRROuk9
 iPWgw0PRf3eXluMrtWZr4ZjjysB+5X5Z0AnGa8f2Qaor9GZe8sgp1yydaqRtdNOKragbbS47H4O
 ydE0qPG5UlASxxEc5/5rP7FxjKty5LCgubsjD8k9oEBERYkDy3nRIi9OAj7ngnknZlcdpZ39Fny
 2IBLrTagvOYljH9Mm7l7UWdhbcAVnYduxLnxzmdBo6QHKtGJDxsdyWJjmb7bdh2y08AOHSoMTVT
 4fbUxZ/fx4NvI8l55lxq93TzZpjQcOq0soZqOT+gzqOH/armXmjVyjgqiqgj/ErpKLcPMyAVlOm
 O1F1DV118fN0km5JcDtJjUXvCibgFBzHGs+noq+m1sVrFKpBU5hDQdUX9pU1W/3Y+4xblA1xoKI
 B+j5e/nWlp40wJgQo1p+4oBCqTyM9sSGU7i6ydWtOv/d7U651pKaG/lS4R8929ba5FhYwXgGPrk
 fHLRUR+bX6Z9fjA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
new file mode 100644
index 000000000000..152242998013
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
index 000000000000..3195be2bc384
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
index 56003ceaf9dc..4d9df90e771f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2908,7 +2908,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
 
@@ -2923,6 +2930,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 			chamelium_deinit_rpc_only(chamelium);
 		}
 	}
+#endif
 #endif
 
 	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
diff --git a/lib/meson.build b/lib/meson.build
index 5769f96fbdc1..8bcbd58bc0e6 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -195,7 +195,6 @@ if chamelium_v2.found()
 		'chamelium/v2/igt_chamelium.c',
 		'chamelium/v2/igt_chamelium_stream.c'
 	]
-	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
 if build_xe_eudebug
@@ -203,6 +202,17 @@ if build_xe_eudebug
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
index fa7741b7be61..8a96cd73ee42 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -41,6 +41,10 @@ if chamelium_v2.found()
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
index b4b1026acb4c..d5d7b325eacd 100644
--- a/meson.build
+++ b/meson.build
@@ -87,6 +87,7 @@ foreach cc_arg : cc_args
 endforeach
 
 build_chamelium_v2 = get_option('chamelium_v2')
+build_chamelium_v3 = get_option('chamelium_v3')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
@@ -174,7 +175,7 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
 	endif
 endif
 
-if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
+if (build_chamelium_v2.enabled() or build_chamelium_v3.enabled()) and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
 	error('Chamelium build forced and required dependency xmlrpc not found')
 endif
 
@@ -197,6 +198,18 @@ endif
 
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
index 3a6edefba349..ebdb9976da1a 100644
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
index 4eebe1838979..861101c2534e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -340,6 +340,9 @@ chamelium_v2_progs = [
 	'kms_chamelium_hpd',
 ]
 
+chamelium_v3_progs = [
+]
+
 test_deps = [ igt_deps ]
 
 if libdrm_nouveau.found()
@@ -457,6 +460,28 @@ if chamelium_v2.found()
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
2.46.2

