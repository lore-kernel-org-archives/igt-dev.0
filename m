Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C12310E5F9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Mar 2023 09:24:31 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Mar 2023 10:24:28 +0100
Message-Id: <20230303092428.1175360-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/gem_ccs: Remove block-copy-inplace
 subtest
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

In full resolve mode of operation, source and destination have
to use the same tiling format. block-copy-inplace attempts to
decompress and detile in the same step, which is not possible.
Remove the subtest that tries to change the tiling format in-flight.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
v2:
  - Leave the multicopy subtest in, mid and dst surfaces use the same
    tiling format after all

 tests/i915/gem_ccs.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index b7e8bda7..fcac1912 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -694,14 +694,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(i915, &config, ctx, set, BLOCK_MULTICOPY);
 	}
 
-	igt_describe("Check block-copy flatccs inplace decompression blit");
-	igt_subtest_with_dynamic("block-copy-inplace") {
-		struct test_config config = { .compression = true,
-					      .inplace = true };
-
-		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
-	}
-
 	igt_describe("Check block-multicopy flatccs inplace decompression blit");
 	igt_subtest_with_dynamic("block-multicopy-inplace") {
 		struct test_config config = { .compression = true,
-- 
2.25.1
