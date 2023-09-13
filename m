Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDBA10E0AC
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 13:24:13 +0000 (UTC)
Received: from linux.intel.com (sbyrne1-mobl1.ger.corp.intel.com
 [10.252.25.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4D1E2580AE0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 06:24:11 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qgPqj-000nvb-11
 for igt-dev@lists.freedesktop.org; Wed, 13 Sep 2023 15:24:09 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 15:24:07 +0200
Message-ID: <20230913132407.191913-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/meson.build: fix build on
 cross-compiled environments
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

When using a cross-compilation build, test_list_target
won't be updated. So, it needs to be initialized as a blank
list, otherwise meson will abort with this error message:

	docs/reference/igt-gpu-tools/meson.build:58:1: ERROR: Unknown variable "test_list_target".

Tested using a cross-file named meson-core2.txt with:

	[properties]
	c_args = '-march=core2'

	[binaries]
	c = 'gcc'
	ar = 'ar'
	strip = 'strip'
	pkgconfig = 'pkg-config'

	[host_machine]
	system = 'linux'
	cpu_family = 'aarch64'
	cpu = 'aarch64'
	endian = 'little'

And running meson with:

	meson -Dxe_driver=enabled --cross-file meson-core2.txt core2

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 94b1e2e123ca..a754c7b7612b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -464,6 +464,8 @@ if not meson.is_cross_build()
 		    command : [ gen_testlist, '@OUTPUT@', test_list ],
 		    install : true,
 		    install_dir : libexecdir)
+else
+	test_list_target = []
 endif
 
 test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
-- 
2.41.0
