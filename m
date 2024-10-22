Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA35D2C563
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 14:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5599610E698;
	Tue, 22 Oct 2024 14:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XyEsDwhw";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4610E1F4
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 14:49:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30484FF80C;
 Tue, 22 Oct 2024 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729608582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXkDojauygvge2ORE3Mriq+K7R9ecyvnp9M7UBn4b2E=;
 b=XyEsDwhwZZcPbYUFGlIydTeGZxBJA3FqclLcz1SMrwj6K9CQn6PVRLDWg0XQvJjDok9TBb
 dXgmfU28jhGO7DKY3MMi140wPNkiLqjiDp4dV4UUZbd0F9e8DiEbKQaaO5AxG78ouGpnQB
 //nqqSYzwpxlG4UB2ShhVFmUAyHlrQiYoitOz0At4BnwlAqdb/lTkOyjxYLrIf2qL+qdbm
 sB2JCfBO2eReqpa7/DpgxLj0mMvkXwkgPwP0IT/BMTQwA4w2wuYDpuWgBCVZdQ4TaeVpWg
 bG85HNc/VyWU/4DOZKOuhC8QHFvYKB4s4I7QAlkxAoLdBPyPVjAoO757kpsxcQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 16:49:35 +0200
Subject: [PATCH i-g-t 3/4] lib/chamelium/v2: Rename chamelium to chamelium_v2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-03-cv2-split-v1-3-9f7cc8591ff9@bootlin.com>
References: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
In-Reply-To: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5664;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uqIB+l+K3MjLfGl61xvoVmE0WuLFk388QjpMQiNWH6w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF7uCuqcszfwZmy/c0/AojLz1vGIzQUNiCa9IY
 v8vltTPJC2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxe7ggAKCRAgrS7GWxAs
 4qyKD/9A0PAgS1T0wQ+b8gBcNn0bmRHZzUVjrxknUcnuQwqoTW3QkujEJMTDNCKc2KzKANnEc4f
 CBYbF7F/9pUbpg6nd1qyVHMFWataKyXnv+IGDjMVc4wPbcl0N10+k0tbe926wnYHYLaVanKDJNu
 YUxcSU/+42aELMLOjxCZ3NtCTAecjs2Ji81bN9JZxVpvN7VaxNz5ExUHhK9L5SHwyH+Ss6wWo3G
 rcx4Qw22jn9idgNMtGFurQwXorfmbJsz39/1yl9BJe6DpCh3On+aICplB+Q3NdJh/4vUwmLZ1j+
 BePZq/XEYcV7KyV94dAn7VDZuqjV5MM9eoPUYnsKxWmbThsFrMklzXqVzrh2TW+WZeRrqXudJM+
 jh3I7MkcgJGWDkt9At2TfiR0ztm66nFo7a0sUWb5zoKaBKELOHJFp6ftbD1UrFRiFtjhC5Rlr0C
 hAiHIsbox0R4/gFrzHtS8fDfsMMKSnHUYBoH7FGwMIf4GnQn68wfxPhIOIIyAVGglUpzZo1Qpnc
 oklD/9g/sNIQqT2n3i32YGdpkygmLQLLCqJDP54P0SXUETnBZWgfzO4DBaIOKsq/D44MCKSo7cG
 rCPKNs3MMBXgqHr0GpUyBwh8gDYms9bn/q/QCHnv9Uxs5/SqcZ9LTXGqv3OcUa1EgQMtOtZP+ZZ
 JIs6afD7S+MVDrA==
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
index a6c076dba487..ff4f4f94b691 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   MESON_OPTIONS: >
     -Dlibdrm_drivers=intel,nouveau,amdgpu
     -Doverlay=enabled
-    -Dchamelium=enabled
+    -Dchamelium_v2=enabled
     -Dvalgrind=enabled
     -Dman=enabled
     -Dtests=enabled
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
diff --git a/lib/meson.build b/lib/meson.build
index dc70704bd919..5769f96fbdc1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -189,8 +189,8 @@ if alsa.found()
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
index df8092638eca..fa7741b7be61 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -36,8 +36,8 @@ lib_fail_tests = [
 
 lib_tests_deps = igt_deps
 
-if chamelium.found()
-	lib_deps += chamelium
+if chamelium_v2.found()
+	lib_deps += chamelium_v2
 	lib_tests += 'igt_audio'
 endif
 
diff --git a/meson.build b/meson.build
index 64f57f232ad8..df0f7b718986 100644
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
@@ -174,17 +174,17 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
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
@@ -192,10 +192,10 @@ if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.foun
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
index c410f9b777ad..3a6edefba349 100644
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
index 4cb199d34527..4eebe1838979 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -332,7 +332,7 @@ if build_xe_eudebug
 	intel_xe_progs += intel_xe_eudebug_progs
 endif
 
-chamelium_progs = [
+chamelium_v2_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
 	'kms_chamelium_edid',
@@ -435,8 +435,8 @@ foreach prog : intel_progs
 	endif
 endforeach
 
-if chamelium.found()
-	foreach prog : chamelium_progs
+if chamelium_v2.found()
+	foreach prog : chamelium_v2_progs
 		testexe = executable(prog,
 				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
@@ -454,7 +454,7 @@ if chamelium.found()
 				    output : name + '.testlist')
 		endif
 	endforeach
-	test_deps += chamelium
+	test_deps += chamelium_v2
 endif
 
 subdir('amdgpu')

-- 
2.46.2

