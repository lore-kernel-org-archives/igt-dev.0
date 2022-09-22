Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D173410E14F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:14:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:41:38 +0530
Message-Id: <20220922051142.2003118-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 4/8] Revert "tests/kms_color: Fix memory leaks"
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

This reverts commit cd21565a5fffc451e2cae5f1a0fe20104dc2a2cf.
---
 tests/kms_color.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 6ea721f1..0b03fb9a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -397,13 +397,8 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	drmModeFreeCrtc(kms_crtc);
 
 	red_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
-	igt_assert(red_lut);
-
 	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
-	igt_assert(green_lut);
-
 	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
-	igt_assert(blue_lut);
 
 	for (i = 0; i < legacy_lut_size; i++)
 		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
@@ -432,17 +427,13 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 			   lut[i].blue == 0xffff);
 	drmModeFreePropertyBlob(blob);
 
-	free(red_lut);
-	free(green_lut);
-	free(blue_lut);
-
-end:
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(&data->display);
 
 	free_lut(degamma_linear);
 	free_lut(gamma_zero);
+end:
 	return ret;
 }
 
-- 
2.37.3
