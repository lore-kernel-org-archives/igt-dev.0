Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4255510E1B3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 18:41:12 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:40:33 -0300
Message-Id: <20221129184038.72946-3-mcanal@igalia.com>
In-Reply-To: <20221129184038.72946-1-mcanal@igalia.com>
References: <20221129184038.72946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/7] tests/v3d: Move V3D tests to their
 own folder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With the introduction of new tests to V3D, in order to avoid polluting
the main tests folder, move the V3D tests to a separate folder.
Moreover, create a subdir "v3d" to install the V3D-specific tests.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 meson.build                         |  8 ++++++++
 tests/meson.build                   |  5 ++---
 tests/v3d/meson.build               | 14 ++++++++++++++
 tests/{ => v3d}/v3d_get_bo_offset.c |  0
 tests/{ => v3d}/v3d_get_param.c     |  0
 tests/{ => v3d}/v3d_mmap.c          |  0
 tests/v3d_ci/v3d.testlist           | 12 ++++++------
 7 files changed, 30 insertions(+), 9 deletions(-)
 create mode 100644 tests/v3d/meson.build
 rename tests/{ => v3d}/v3d_get_bo_offset.c (100%)
 rename tests/{ => v3d}/v3d_get_param.c (100%)
 rename tests/{ => v3d}/v3d_mmap.c (100%)

diff --git a/meson.build b/meson.build
index 3e937f5a..709c7a6c 100644
--- a/meson.build
+++ b/meson.build
@@ -260,6 +260,7 @@ includedir = get_option('includedir')
 libdir = get_option('libdir')
 libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
+v3ddir = join_paths(libexecdir, 'v3d')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
@@ -295,10 +296,17 @@ if get_option('use_rpath')
 		amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, '..')
 	endforeach
 	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
+
+	v3d_rpathdir = '$ORIGIN'
+	foreach p : v3ddir.split('/')
+		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
+	endforeach
+	v3d_rpathdir = join_paths(v3d_rpathdir, libdir)
 else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
 	amdgpudir_rpathdir = ''
+	v3d_rpathdir = ''
 endif
 
 subdir('lib')
diff --git a/tests/meson.build b/tests/meson.build
index 12e53e0b..172f2e9b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -80,9 +80,6 @@ test_progs = [
 	'syncobj_timeline',
 	'template',
 	'tools_test',
-	'v3d_get_bo_offset',
-	'v3d_get_param',
-	'v3d_mmap',
 	'vc4_create_bo',
 	'vc4_dmabuf_poll',
 	'vc4_label_bo',
@@ -453,6 +450,8 @@ test_list += 'sw_sync'
 
 subdir('amdgpu')
 
+subdir('v3d')
+
 gen_testlist = find_program('generate_testlist.sh')
 test_list_target = custom_target('testlist',
 	      output : 'test-list.txt',
diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
new file mode 100644
index 00000000..45f73a88
--- /dev/null
+++ b/tests/v3d/meson.build
@@ -0,0 +1,14 @@
+v3d_progs = [
+	'v3d_get_bo_offset',
+	'v3d_get_param',
+	'v3d_mmap',
+]
+
+foreach prog : v3d_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : v3ddir,
+				       install_rpath : v3d_rpathdir,
+				       install : true)
+	test_list += join_paths('v3d', prog)
+endforeach
diff --git a/tests/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
similarity index 100%
rename from tests/v3d_get_bo_offset.c
rename to tests/v3d/v3d_get_bo_offset.c
diff --git a/tests/v3d_get_param.c b/tests/v3d/v3d_get_param.c
similarity index 100%
rename from tests/v3d_get_param.c
rename to tests/v3d/v3d_get_param.c
diff --git a/tests/v3d_mmap.c b/tests/v3d/v3d_mmap.c
similarity index 100%
rename from tests/v3d_mmap.c
rename to tests/v3d/v3d_mmap.c
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index b55e8e57..442fd731 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -1,6 +1,6 @@
-igt@v3d_get_bo_offset@create-get-offsets
-igt@v3d_get_bo_offset@get-bad-handle
-igt@v3d_get_param@base-params
-igt@v3d_get_param@get-bad-param
-igt@v3d_get_param@get-bad-flags
-igt@v3d_mmap@mmap-bad-handle
+igt@v3d/v3d_get_bo_offset@create-get-offsets
+igt@v3d/v3d_get_bo_offset@get-bad-handle
+igt@v3d/v3d_get_param@base-params
+igt@v3d/v3d_get_param@get-bad-param
+igt@v3d/v3d_get_param@get-bad-flags
+igt@v3d/v3d_mmap@mmap-bad-handle
-- 
2.38.1
