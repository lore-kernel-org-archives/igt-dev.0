Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A0F10E798
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:46 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 14/15] tests/kms_big_fb: Enable CCS testing for TGL
Date: Fri, 22 Dec 2023 16:31:58 +0200
Message-ID: <20231222143159.24662-15-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

With the TGL clear color/fast clear nonsense sorted we can
finally test big CCS fbs on TGL. Make it so.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 24b6836296f6..90edccffbc64 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -75,6 +75,8 @@
  * @yf-tiled:           TILE-YF modifier
  * @y-tiled-ccs:        TILE-Y+CCS modifier
  * @yf-tiled-ccs:       TILE-YF+CCS modifier
+ * @y-tiled-rc-ccs:     TILE-Y+CCS modifier
+ * @y-tiled-rc-ccs-cc:  TILE-Y+CCS+CC modifier
  *
  * arg[2].values:       8bpp, 16bpp, 32bpp, 64bpp, nv12, p016
  * arg[3].values:       0, 90, 180, 270
@@ -114,6 +116,8 @@
  * @yf-tiled:           TILE-YF modifier
  * @y-tiled-ccs:        TILE-Y+CCS modifier
  * @yf-tiled-ccs:       TILE-YF+CCS modifier
+ * @y-tiled-rc-ccs:     TILE-Y+CCS modifier
+ * @y-tiled-rc-ccs-cc:  TILE-Y+CCS+CC modifier
  *
  * arg[2].values:       32, 64
  * arg[3].values:       0, 180
@@ -140,6 +144,8 @@
  * @yf-tiled:           TILE-YF modifier
  * @y-tiled-ccs:        TILE-Y+CCS modifier
  * @yf-tiled-ccs:       TILE-YF+CCS modifier
+ * @y-tiled-rc-ccs:     TILE-Y+CCS modifier
+ * @y-tiled-rc-ccs-cc:  TILE-Y+CCS+CC modifier
  *
  * arg[2].values:       32, 64
  * arg[3].values:       0, 180
@@ -179,6 +185,8 @@
  * @yf-tiled:   TILE-YF
  * @y-tiled-ccs:        TILE-Y+CCS modifier
  * @yf-tiled-ccs:       TILE-YF+CCS modifier
+ * @y-tiled-rc-ccs:     TILE-Y+CCS modifier
+ * @y-tiled-rc-ccs-cc:  TILE-Y+CCS+CC modifier
  */
 
 IGT_TEST_DESCRIPTION("Test big framebuffers");
@@ -996,6 +1004,8 @@ static const struct {
 	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
 	{ I915_FORMAT_MOD_Y_TILED_CCS, "y-tiled-ccs", },
 	{ I915_FORMAT_MOD_Yf_TILED_CCS, "yf-tiled-ccs", },
+	{ I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y-tiled-rc-ccs", },
+	{ I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y-tiled-rc-ccs-cc", },
 };
 
 static const struct {
-- 
2.41.0
