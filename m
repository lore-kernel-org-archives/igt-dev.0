Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 28 Aug 2022 21:09:20 -0300
Message-Id: <20220829000920.38185-5-isabbasso@riseup.net>
In-Reply-To: <20220829000920.38185-1-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] tests: DRM selftests: switch to KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kselftest@vger.kernel.org, daniel@ffwll.ch,
 kunit-dev@googlegroups.com, magalilemes00@gmail.com, maira.canal@usp.br,
 dlatypov@google.com, n@nfraprado.net, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 davidgow@google.com, tales.aparecida@gmail.com, skhan@linuxfoundation.org,
 andrealmeid@riseup.net, Isabella Basso <isabbasso@riseup.net>,
 brendanhiggins@google.com, twoerner@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As the DRM selftests are now using KUnit [1], update IGT tests as well.

[1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 tests/drm_buddy.c    |  7 ++++---
 tests/drm_mm.c       |  7 ++++---
 tests/kms_selftest.c | 12 +++++++++---
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 06876e0c..74c06dce 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -6,9 +6,10 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
+IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct \
+		      drm_buddy) using KUnit");
 
-igt_main
+igt_simple_main
 {
-	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
+	igt_kunit("drm_buddy_test", NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 2052b115..75fc6682 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -24,9 +24,10 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
+IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)\
+		     using KUnit");
 
-igt_main
+igt_simple_main
 {
-	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
+	igt_kunit("drm_mm_test", NULL);
 }
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index abc4bfe9..bbf24c2b 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -24,9 +24,15 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
+IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests using KUnit");
 
-igt_main
+igt_simple_main
 {
-	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
+	igt_kunit("drm_cmdline_parser_test", NULL);
+	igt_kunit("drm_damage_helper_test", NULL);
+	igt_kunit("drm_dp_mst_helper_test", NULL);
+	igt_kunit("drm_format_helper_test", NULL);
+	igt_kunit("drm_format_test", NULL);
+	igt_kunit("drm_framebuffer_test", NULL);
+	igt_kunit("drm_plane_helper_test", NULL);
 }
-- 
2.37.2
