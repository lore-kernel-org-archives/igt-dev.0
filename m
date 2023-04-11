Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB1510E4D6
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 07:51:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 10:50:54 +0300
Message-Id: <20230411075101.2785-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
References: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] tests/kms_color: Use legacy LUT for
 chopping off the lsbs
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Trying to use an interpolated gamma mode (as is the case currently
on eg. icl/tgl) for chopping off the lsbs doesn't really work. Use
the legacy LUT instead. Also get rid of the degamma LUT as that
can't even be enabled alognside the legacy LUT on split gamma i915
platforms (ivb-skl).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index cd03c1354c0a..369dc8057d83 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -504,13 +504,10 @@ static bool test_pipe_ctm(data_t *data,
 	 * rounding issues and inaccuracies leading to crc mismatch.
 	 */
 	if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(color_t))) {
-		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
-		gamma_linear = generate_table(data->gamma_lut_size, 1.0);
+		gamma_linear = generate_table(256, 1.0);
 
-		set_degamma(data, primary->pipe, degamma_linear);
 		set_gamma(data, primary->pipe, gamma_linear);
 	}
 
-- 
2.39.2
