Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318910E53A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 23:57:55 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 20:57:20 -0300
Message-Id: <20221108235724.126287-3-mcanal@igalia.com>
In-Reply-To: <20221108235724.126287-1-mcanal@igalia.com>
References: <20221108235724.126287-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/v3d: Move V3D tests to their own
 folder
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

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/meson.build                   | 18 +++++++++++++++---
 tests/{ => v3d}/v3d_get_bo_offset.c |  0
 tests/{ => v3d}/v3d_get_param.c     |  0
 tests/{ => v3d}/v3d_mmap.c          |  0
 4 files changed, 15 insertions(+), 3 deletions(-)
 rename tests/{ => v3d}/v3d_get_bo_offset.c (100%)
 rename tests/{ => v3d}/v3d_get_param.c (100%)
 rename tests/{ => v3d}/v3d_mmap.c (100%)

diff --git a/tests/meson.build b/tests/meson.build
index 12e53e0b..5c9b1829 100644
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
@@ -258,6 +255,12 @@ msm_progs = [
 	'msm_submit'
 ]
 
+v3d_progs = [
+	'v3d_get_bo_offset',
+	'v3d_get_param',
+	'v3d_mmap',
+]
+
 chamelium_progs = [
 	'kms_chamelium',
 ]
@@ -305,6 +308,15 @@ foreach prog : msm_progs
 	test_list += prog
 endforeach
 
+foreach prog : v3d_progs
+	test_executables += executable(prog, join_paths('v3d', prog + '.c'),
+				       dependencies : test_deps,
+				       install_dir : libexecdir,
+				       install_rpath : libexecdir_rpathdir,
+				       install : true)
+	test_list += prog
+endforeach
+
 if chamelium.found()
 	foreach prog : chamelium_progs
 		test_executables += executable(prog,
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
-- 
2.38.1
