Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C93710E996
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 09:41:29 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 10:40:41 +0100
Message-Id: <20230315094042.5032-5-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230315094042.5032-1-dominik.karol.piatkowski@intel.com>
References: <20230315094042.5032-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests: DRM selftests: switch to KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
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
---
 tests/drm_buddy.c    | 4 +++-
 tests/drm_mm.c       | 4 +++-
 tests/kms_selftest.c | 8 ++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 06876e0c..3261f0d6 100644
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
index 2052b115..46d0142f 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -28,5 +28,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)"
 
 igt_main
 {
-	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
+	int ret = igt_kunit("drm_mm_test", NULL);
+	if (ret != 0 && ret != IGT_EXIT_ABORT)
+		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
 }
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index abc4bfe9..b27f60fb 100644
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
