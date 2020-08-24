Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD7E6E1A3
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2020 08:35:15 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 24 Aug 2020 11:35:05 +0300
Message-Id: <20200824083505.24925-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Add option to not build the assembler
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

New option -Dassembler=disabled will omit assembler/ from the build.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
---
 meson.build       | 4 +++-
 meson_options.txt | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f4ee14f1..e8c8aaab 100644
--- a/meson.build
+++ b/meson.build
@@ -82,6 +82,7 @@ endforeach
 build_chamelium = get_option('chamelium')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
+build_assembler = get_option('assembler')
 with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
@@ -306,9 +307,10 @@ build_info += 'Build tests: @0@'.format(build_tests)
 subdir('benchmarks')
 subdir('tools')
 subdir('runner')
-if libdrm_intel.found()
+if libdrm_intel.found() and build_assembler.enabled()
 	subdir('assembler')
 endif
+build_info += 'Build shader assembler: @0@'.format(build_assembler.enabled())
 subdir('overlay')
 subdir('man')
 
diff --git a/meson_options.txt b/meson_options.txt
index ff3abf08..6f0b9252 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -42,6 +42,10 @@ option('runner',
        type : 'feature',
        description : 'Build test runner')
 
+option('assembler',
+       type : 'feature',
+       description : 'Build shader assembler')
+
 option('oping',
        type : 'feature',
        description : 'Build test runner with liboping for pinging support')
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
