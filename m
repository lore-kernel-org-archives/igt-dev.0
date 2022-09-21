Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A5E10E92D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 15:49:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 mwen@igalia.com
Date: Wed, 21 Sep 2022 21:16:57 +0530
Message-Id: <20220921154657.1947293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] Revert "tests/kms_color: fix crc assert condition"
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

This reverts commit c27dcb9e0baca05abce8527c245b513f7a8f1059.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index ab285af8..c202547e 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -99,7 +99,7 @@ static bool test_pipe_degamma(data_t *data,
 	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the degamma LUT transformation output.
 	 */
-	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
 	disable_degamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
@@ -188,7 +188,7 @@ static bool test_pipe_gamma(data_t *data,
 	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
-	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
 	disable_gamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
@@ -289,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
-	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
 	/* Reset output. */
 	for (i = 1; i < legacy_lut_size; i++)
@@ -534,7 +534,7 @@ static bool test_pipe_ctm(data_t *data,
 	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the CTM matrix transformation output.
 	 */
-	ret &= igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
+	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-- 
2.37.3
