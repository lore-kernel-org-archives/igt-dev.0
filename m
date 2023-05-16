Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C2110E259
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:44:03 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ac88d9edf3so141792651fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 08:44:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 18:43:28 +0300
Message-Id: <20230516154329.9002-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
References: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/i915/kms_ccs: enable mtl aux ccs
 tests
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

Added
I915_FORMAT_MOD_4_TILED_MTL_RC_CCS
I915_FORMAT_MOD_4_TILED_MTL_MC_CCS
I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC
for testing.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_ccs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 1b3462ea..abe464b4 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -101,6 +101,9 @@ static const struct {
 	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4_tiled_dg2_rc_ccs"},
 	{I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4_tiled_dg2_mc_ccs"},
 	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, "4_tiled_dg2_rc_ccs_cc"},
+	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4_tiled_mtl_rc_ccs"},
+	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4_tiled_mtl_mc_ccs"},
+	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4_tiled_mtl_rc_ccs_cc"},
 };
 
 static bool check_ccs_planes;
@@ -161,7 +164,8 @@ create_fb_prepare_add(int drm_fd, int width, int height,
 static bool is_ccs_cc_modifier(uint64_t modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
+	       modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
+	       modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
 }
 
 /*
-- 
2.25.1
