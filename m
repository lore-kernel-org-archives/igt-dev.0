Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FCF10ED6C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 09:35:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Wed,  6 Jul 2022 15:02:53 +0530
Message-Id: <20220706093253.494798-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220706034846.441338-1-bhanuprakash.modem@intel.com>
References: <20220706034846.441338-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] tests/kms_color: Fix memory leaks
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

Free allocated memory before return.

Fixes: d61e4598
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0b03fb9a..6ea721f1 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -397,8 +397,13 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	drmModeFreeCrtc(kms_crtc);
 
 	red_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
+	igt_assert(red_lut);
+
 	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
+	igt_assert(green_lut);
+
 	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
+	igt_assert(blue_lut);
 
 	for (i = 0; i < legacy_lut_size; i++)
 		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
@@ -427,13 +432,17 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 			   lut[i].blue == 0xffff);
 	drmModeFreePropertyBlob(blob);
 
+	free(red_lut);
+	free(green_lut);
+	free(blue_lut);
+
+end:
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(&data->display);
 
 	free_lut(degamma_linear);
 	free_lut(gamma_zero);
-end:
 	return ret;
 }
 
-- 
2.35.1
