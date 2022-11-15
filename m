Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1753710E159
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 20:21:30 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 17:20:57 -0300
Message-Id: <20221115202101.278995-2-mcanal@igalia.com>
In-Reply-To: <20221115202101.278995-1-mcanal@igalia.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/vc4: Move VC4 tests to their own
 folder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

VC4 contains a substantial number of tests. In order to avoid polluting
the main tests folder, move the VC4 tests to a separate folder.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/meson.build                  | 28 ++++++++++++++++++++--------
 tests/{ => vc4}/vc4_create_bo.c    |  0
 tests/{ => vc4}/vc4_dmabuf_poll.c  |  0
 tests/{ => vc4}/vc4_label_bo.c     |  0
 tests/{ => vc4}/vc4_lookup_fail.c  |  0
 tests/{ => vc4}/vc4_purgeable_bo.c |  0
 tests/{ => vc4}/vc4_tiling.c       |  0
 tests/{ => vc4}/vc4_wait_bo.c      |  0
 tests/{ => vc4}/vc4_wait_seqno.c   |  0
 9 files changed, 20 insertions(+), 8 deletions(-)
 rename tests/{ => vc4}/vc4_create_bo.c (100%)
 rename tests/{ => vc4}/vc4_dmabuf_poll.c (100%)
 rename tests/{ => vc4}/vc4_label_bo.c (100%)
 rename tests/{ => vc4}/vc4_lookup_fail.c (100%)
 rename tests/{ => vc4}/vc4_purgeable_bo.c (100%)
 rename tests/{ => vc4}/vc4_tiling.c (100%)
 rename tests/{ => vc4}/vc4_wait_bo.c (100%)
 rename tests/{ => vc4}/vc4_wait_seqno.c (100%)

diff --git a/tests/meson.build b/tests/meson.build
index 12e53e0b..c42efdef 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -83,14 +83,6 @@ test_progs = [
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
-	'vc4_create_bo',
-	'vc4_dmabuf_poll',
-	'vc4_label_bo',
-	'vc4_lookup_fail',
-	'vc4_purgeable_bo',
-	'vc4_tiling',
-	'vc4_wait_bo',
-	'vc4_wait_seqno',
 	'vgem_basic',
 	'vgem_slow',
 ]
@@ -258,6 +250,17 @@ msm_progs = [
 	'msm_submit'
 ]
 
+vc4_progs = [
+	'vc4_create_bo',
+	'vc4_dmabuf_poll',
+	'vc4_label_bo',
+	'vc4_lookup_fail',
+	'vc4_purgeable_bo',
+	'vc4_tiling',
+	'vc4_wait_bo',
+	'vc4_wait_seqno',
+]
+
 chamelium_progs = [
 	'kms_chamelium',
 ]
@@ -305,6 +308,15 @@ foreach prog : msm_progs
 	test_list += prog
 endforeach
 
+foreach prog : vc4_progs
+	test_executables += executable(prog, join_paths('vc4', prog + '.c'),
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
diff --git a/tests/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
similarity index 100%
rename from tests/vc4_create_bo.c
rename to tests/vc4/vc4_create_bo.c
diff --git a/tests/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
similarity index 100%
rename from tests/vc4_dmabuf_poll.c
rename to tests/vc4/vc4_dmabuf_poll.c
diff --git a/tests/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
similarity index 100%
rename from tests/vc4_label_bo.c
rename to tests/vc4/vc4_label_bo.c
diff --git a/tests/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
similarity index 100%
rename from tests/vc4_lookup_fail.c
rename to tests/vc4/vc4_lookup_fail.c
diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
similarity index 100%
rename from tests/vc4_purgeable_bo.c
rename to tests/vc4/vc4_purgeable_bo.c
diff --git a/tests/vc4_tiling.c b/tests/vc4/vc4_tiling.c
similarity index 100%
rename from tests/vc4_tiling.c
rename to tests/vc4/vc4_tiling.c
diff --git a/tests/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
similarity index 100%
rename from tests/vc4_wait_bo.c
rename to tests/vc4/vc4_wait_bo.c
diff --git a/tests/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
similarity index 100%
rename from tests/vc4_wait_seqno.c
rename to tests/vc4/vc4_wait_seqno.c
-- 
2.38.1
