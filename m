Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6E06E8AF
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:27:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  3 Sep 2021 19:27:37 +0300
Message-Id: <20210903162743.29851-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/7] tests/kms_color_chamelium: Remove
 invalid LUT size tests
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
Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There is zero point in duplicating the invalid LUT size tests
in the chamelium test. Get rid of them.

Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color_chamelium.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index bc4356bfab6a..97741b9c968e 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -752,17 +752,6 @@ igt_main
 	for_each_pipe_static(pipe)
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
-	igt_describe("Negative test case gamma lut size");
-	igt_subtest_f("pipe-invalid-gamma-lut-sizes")
-		invalid_gamma_lut_sizes(&data);
-
-	igt_describe("Negative test case degamma lut size");
-	igt_subtest_f("pipe-invalid-degamma-lut-sizes")
-		invalid_degamma_lut_sizes(&data);
-
-	igt_describe("Negative test case ctm matrix size");
-	igt_subtest_f("pipe-invalid-ctm-matrix-sizes")
-		invalid_ctm_matrix_sizes(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.31.1
