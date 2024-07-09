Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA0FC3DA47
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973E110E5C1;
	Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BL2C/NBd";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BBF10E5A5
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9762220009;
 Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3zxieEsGZ4hZASgLeMMe2Ann2WOpAI+egl1vH+MSvk=;
 b=BL2C/NBdeiLQpajWRPOPl6pg58tXMcias2tt2UE89f90p2YElxavNkGDZEcPxqOJKlYKzO
 0eg511swlETTWTgOjLs08AzAICVxK5bLE/8btK+OphFFZEgJFcGxT4lFKzm0PSGb5Uy3Z/
 sQtGFWlsXeY3i79VbwbDa3x7MWsN45bktjqkmj7fEW4ohbf7BTiFrW4Bau+tSe0eCvDTFs
 TbxUBin4BxcQy3lWWQRNk/Ir7/cVaUbq1eH+mqpZXsuZ43lVl4+Q3fvRnnb6umAcRbWRiA
 iDLHnMUiODBCJAnw0PKQ5jOEc9DPvsSNRpsnEU65w67WpmwYXZzhKlyyaqgaqg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:29 +0200
Subject: [PATCH i-g-t v2 13/39] lib/chamelium/v2: Modify build options to
 separate Chamelium v2 and v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-13-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8513;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jMfbE4yzmB1LOOPqs1NDSRVl8T9Mc96023i/QMkYl9g=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViXCfrhCMMMtLs0i9hWEDona9hQYXKMj31ZC
 MVicQSIi7qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4lMED/4tu8QIM6Jxt8CrgrQdPQDJ4cxVj9CQXHgt7IOOH1bqNup9eIe9Lu8qiOEhG6XKFe85buR
 Bjm4djlQ3hxnFF8P72ZBXYfkgiEXDl92ep953K5atG31Rv1nnJRjQ0NvBZfYmvAi9C2dcYqVsR8
 NOq+ie7+F7zXdtu38Eeu2SGCbsBVgx/dxXrdaXhXsK1INjhOwtGqy0GZQrbEM6lkLwqw9MMUrJo
 TlOyDRaTnC/1L+zKkDPpdF98XIyi1osSxuFHI8+aA0k1JW7xIedzQp/VkRh/gMq8F3iZne5y8+X
 /zFWV8RjD4uEl5FOTgtzlZ45umYyJ53ac76ViGcByjv/+HwifT431ctmt2pSYCyFyk/SAsTVt9o
 LljAf1uEiMKZBq3ljo6hshdHkRMkZfAx1Z/BBpv/04Nm6fv+8EHRmRm0pz7SsSHVxkoP6lp03O0
 SSkWShVLwvt9Xsi1LyjpeiJ2o92HPh9TmcLCVQNmXZQvxtqudKWX8d/u5uVa/5oWiJBw22J6zRI
 3knH121Sc1uXKHma5MQczNbvHITccNMqadnjEOrTrhM4HDbPON7zAj/MhALLolgWJY3HTKGw0uf
 mGxmnNCvQ02M/PyjUXfZUWwXdE/UgStt0RGlRZ75Aj9+iUfGKyzhYG25y6aJeJjcIdIGPLeGlCe
 pI9keGfUFw0hEuw==
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

Rename the Chamelium option to "chamelium_v2" in preparation for the
introduction of the v3 wrapper. Additionally, rename the "HAVE_CHAMELIUM"
define to prevent conflicts when v3 is introduced.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 docs/testplan/meson.build     |  4 ++--
 lib/igt.h                     |  2 +-
 lib/igt_kms.c                 |  4 ++--
 lib/meson.build               |  4 ++--
 lib/tests/meson.build         |  4 ++--
 meson.build                   | 30 +++++++++++++++---------------
 meson_options.txt             |  4 ++--
 tests/kms_color_helper.h      |  2 +-
 tests/kms_feature_discovery.c |  4 ++--
 tests/kms_tiled_display.c     |  6 +++---
 tests/meson.build             |  8 ++++----
 11 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 5560347f1337..f60c82ad139c 100644
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
diff --git a/lib/igt.h b/lib/igt.h
index cf91e92eb2d4..390e59cd9b92 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -42,7 +42,7 @@
 #include "igt_sizes.h"
 #include "igt_stats.h"
 #include "igt_dsc.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "igt_alsa.h"
 #include "igt_audio.h"
 #include "chamelium/v2/igt_chamelium.h"
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e12ac94c423f..059c61bf222a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -60,7 +60,7 @@
 #include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "chamelium/v2/igt_chamelium.h"
 #endif
 
@@ -2883,7 +2883,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	{
 		struct chamelium *chamelium;
 
diff --git a/lib/meson.build b/lib/meson.build
index c617a92a6a6e..714990e96485 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -188,8 +188,8 @@ if alsa.found()
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
index fa3d81de6cef..f98c948bc827 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -34,8 +34,8 @@ lib_fail_tests = [
 
 lib_tests_deps = igt_deps
 
-if chamelium.found()
-	lib_deps += chamelium
+if chamelium_v2.found()
+	lib_deps += chamelium_v2
 	lib_tests += 'igt_audio'
 endif
 
diff --git a/meson.build b/meson.build
index 25bf1e4426fb..1fbbe4802ad3 100644
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
@@ -172,28 +172,28 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
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
-	config.set('HAVE_CHAMELIUM', 1)
-	chamelium = declare_dependency(dependencies : [
-		xmlrpc,
-		xmlrpc_util,
-		xmlrpc_client,
-		gsl,
-		alsa,
-	])
+	config.set('HAVE_CHAMELIUM_V2', 1)
+	chamelium_v2 = declare_dependency(dependencies : [
+										  xmlrpc,
+										  xmlrpc_util,
+										  xmlrpc_client,
+										  gsl,
+										  alsa,
+									  ])
 else
-	chamelium = disabler()
+	chamelium_v2 = disabler()
 endif
 
-build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
+build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())
 
 pthreads = dependency('threads')
 math = cc.find_library('m')
diff --git a/meson_options.txt b/meson_options.txt
index 6a9493ea6ecd..fea91fb129aa 100644
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
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944b6f..910de27bf61f 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -57,7 +57,7 @@ typedef struct {
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
 	uint64_t gamma_lut_size;
-	#ifdef HAVE_CHAMELIUM
+	#ifdef HAVE_CHAMELIUM_V2
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index edb0186361a8..76e958c84d51 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -35,7 +35,7 @@
  */
 
 #include "igt.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "chamelium/v2/igt_chamelium.h"
 #endif
 #include "igt_kms.h"
@@ -140,7 +140,7 @@ igt_main {
 			}
 		}
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 		igt_describe("Make sure that Chamelium is configured and reachable.");
 		igt_subtest("chamelium") {
 			struct chamelium *chamelium =
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 2c9d637994d4..834b3e2f18a7 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -82,7 +82,7 @@ typedef struct {
 	struct timeval first_ts;
 	int linetime_us;
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
@@ -394,7 +394,7 @@ static bool got_all_page_flips(data_t *data)
 	return true;
 }
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 static void test_with_chamelium(data_t *data)
 {
 	int i, count = 0;
@@ -607,7 +607,7 @@ igt_main
 		test_cleanup(&data);
 	}
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
 		     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
 	igt_subtest_f("basic-test-pattern-with-chamelium") {
diff --git a/tests/meson.build b/tests/meson.build
index 30cd7982ea77..e7c8416dabcf 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -316,7 +316,7 @@ intel_xe_progs = [
 	'xe_sysfs_scheduler',
 ]
 
-chamelium_progs = [
+chamelium_v2_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
 	'kms_chamelium_edid',
@@ -419,8 +419,8 @@ foreach prog : intel_progs
 	endif
 endforeach
 
-if chamelium.found()
-	foreach prog : chamelium_progs
+if chamelium_v2.found()
+	foreach prog : chamelium_v2_progs
 		testexe = executable(prog,
 				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
@@ -438,7 +438,7 @@ if chamelium.found()
 				    output : name + '.testlist')
 		endif
 	endforeach
-	test_deps += chamelium
+	test_deps += chamelium_v2
 endif
 
 subdir('amdgpu')

-- 
2.44.2

