Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5C10E340
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 07:27:49 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Tue, 13 Jun 2023 09:27:20 +0200
Message-Id: <20230613072726.4164-5-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/10] tests: DRM selftests: switch to KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Isabella Basso <isabbasso@riseup.net>
List-ID: <igt-dev@lists.freedesktop.org>

From: Isabella Basso <isabbasso@riseup.net>

As the DRM selftests are now using KUnit [1], update IGT tests as well.

[1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/

Signed-off-by: Isabella Basso <isabbasso@riseup.net>

v1 -> v2:
- drm_buddy|drm_mm: fallback to igt_kselftests if igt_kunit failed
  with code other than IGT_EXIT_ABORT
- kms_selftest: move igt_kunit tests to separate subtests
- kms_selftest: fallback to igt_kselftests if all subtests failed

v2 -> v3:
- expose all subtests

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/drm_buddy.c    | 4 +++-
 tests/drm_mm.c       | 4 +++-
 tests/kms_selftest.c | 8 ++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 06876e0cd..3261f0d61 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -10,5 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_bu
 
 igt_main
 {
-	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
+	int ret = igt_kunit("drm_buddy_test", NULL);
+	if (ret != 0 && ret != IGT_EXIT_ABORT)
+		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 0bce7139d..88f76a57c 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)"
 
 igt_main
 {
-	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
+	int ret = igt_kunit("drm_mm_test", NULL);
+	if (ret != 0 && ret != IGT_EXIT_ABORT)
+		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
 }
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index abc4bfe98..b27f60fb3 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -28,5 +28,13 @@ IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
 igt_main
 {
+	static const char *kunit_subtests[] = { "drm_cmdline_parser_test", "drm_damage_helper_test",
+						"drm_dp_mst_helper_test", "drm_format_helper_test",
+						"drm_format_test", "drm_framebuffer_test",
+						"drm_plane_helper_test", NULL };
+
+	for (int i = 0; kunit_subtests[i] != NULL; i++)
+		igt_kunit(kunit_subtests[i], NULL);
+
 	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
 }
-- 
2.34.1


