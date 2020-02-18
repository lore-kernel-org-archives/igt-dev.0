Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9121F6E9C4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 09:23:12 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 18 Feb 2020 11:23:08 +0200
Message-Id: <20200218092308.29434-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Remove unnecessary defines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We have defined different unit sizes for GEN12+ platforms. These
are not needed anymore so let's just get rid of these.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_ccs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 7130054a..86681a26 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -181,15 +181,9 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	uint32_t format;
 	uint64_t modifier;
 	cairo_t *cr;
-	int unit;
 	int index;
 	int ret;
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) >= 12)
-		unit = 64;
-	else
-		unit = 128;
-
 	/* Use either compressed or Y-tiled to test. However, given the lack of
 	 * available bandwidth, we use linear for the primary plane when
 	 * testing sprites, since we cannot fit two CCS planes into the
@@ -218,13 +212,13 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		if (fb_flags & FB_MISALIGN_AUX_STRIDE) {
 			igt_skip_on_f(width <= 1024,
 				      "FB already has the smallest possible stride\n");
-			f.pitches[index] -= (unit/2);
+			f.pitches[index] -= 64;
 		}
 
 		if (fb_flags & FB_SMALL_AUX_STRIDE) {
 			igt_skip_on_f(width <= 1024,
 				      "FB already has the smallest possible stride\n");
-			f.pitches[index] = ALIGN(f.pitches[1]/2, unit);
+			f.pitches[index] = ALIGN(f.pitches[1]/2, 128);
 		}
 
 		if (fb_flags & FB_ZERO_AUX_STRIDE)
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
