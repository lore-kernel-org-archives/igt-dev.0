Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401BF6E8B3
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:27:58 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  3 Sep 2021 19:27:39 +0300
Message-Id: <20210903162743.29851-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/7] tests/kms_color: Store r/g/b
 separately for LUT color tests
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

Store the r/g/b values separately for each LUT. A lot of hw
has a separate 1D LUT for each channel, so with this we can
potentially do more interesting tests. Also needed for 3D LUTs
(if we should ever support them).

Reviewed-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color_helper.c | 29 +++++++++++++++++++----------
 tests/kms_color_helper.h |  2 +-
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 68fa5f0e42ea..8b08cdaeea5f 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -103,14 +103,19 @@ void free_lut(gamma_lut_t *gamma)
 	free(gamma);
 }
 
+static void set_rgb(color_t *coeff, double value)
+{
+	coeff->r = coeff->g = coeff->b = value;
+}
+
 gamma_lut_t *generate_table(int lut_size, double exp)
 {
 	gamma_lut_t *gamma = alloc_lut(lut_size);
 	int i;
 
-	gamma->coeffs[0] = 0.0;
+	set_rgb(&gamma->coeffs[0], 0.0);
 	for (i = 1; i < lut_size; i++)
-		gamma->coeffs[i] = pow(i * 1.0 / (lut_size - 1), exp);
+		set_rgb(&gamma->coeffs[i], pow(i * 1.0 / (lut_size - 1), exp));
 
 	return gamma;
 }
@@ -120,9 +125,9 @@ gamma_lut_t *generate_table_max(int lut_size)
 	gamma_lut_t *gamma = alloc_lut(lut_size);
 	int i;
 
-	gamma->coeffs[0] = 0.0;
+	set_rgb(&gamma->coeffs[0], 0.0);
 	for (i = 1; i < lut_size; i++)
-		gamma->coeffs[i] = 1.0;
+		set_rgb(&gamma->coeffs[i], 1.0);
 
 	return gamma;
 }
@@ -133,7 +138,7 @@ gamma_lut_t *generate_table_zero(int lut_size)
 	int i;
 
 	for (i = 0; i < lut_size; i++)
-		gamma->coeffs[i] = 0.0;
+		set_rgb(&gamma->coeffs[i], 0.0);
 
 	return gamma;
 }
@@ -158,7 +163,9 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	if (IS_CHERRYVIEW(data->devid))
 		lut_size -= 1;
 	for (i = 0; i < lut_size; i++) {
-		uint32_t v = (gamma->coeffs[i] * max_value);
+		uint32_t r = gamma->coeffs[i].r * max_value;
+		uint32_t g = gamma->coeffs[i].g * max_value;
+		uint32_t b = gamma->coeffs[i].b * max_value;
 
 		/*
 		 * Hardware might encode colors on a different number of bits
@@ -166,11 +173,13 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 		 * Mask the lower bits not provided by the framebuffer so we
 		 * can do CRC comparisons.
 		 */
-		v &= mask;
+		r &= mask;
+		g &= mask;
+		b &= mask;
 
-		lut[i].red = v;
-		lut[i].green = v;
-		lut[i].blue = v;
+		lut[i].red = r;
+		lut[i].green = g;
+		lut[i].blue = b;
 	}
 
 	if (IS_CHERRYVIEW(data->devid))
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 88890724c2e4..3f49e7cae4c0 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -61,7 +61,7 @@ typedef struct {
 
 typedef struct {
 	int size;
-	double coeffs[];
+	color_t coeffs[];
 } gamma_lut_t;
 
 void paint_gradient_rectangles(data_t *data,
-- 
2.31.1
