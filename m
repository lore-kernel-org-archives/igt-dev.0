Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F386E852
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 07:32:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  3 Sep 2021 13:02:50 +0530
Message-Id: <20210903073251.462352-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
References: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v2 5/6] lib/kms: Add GAMMA_LUT_3D support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add basic plumbing for the GAMMA_LUT_3D/GAMMA_LUT_3D_SIZE crtc props.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 5 +++++
 lib/igt_kms.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc38f5a25..5b1f55a50 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -589,6 +589,8 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_GAMMA_LUT_SIZE] = "GAMMA_LUT_SIZE",
 	[IGT_CRTC_DEGAMMA_LUT] = "DEGAMMA_LUT",
 	[IGT_CRTC_DEGAMMA_LUT_SIZE] = "DEGAMMA_LUT_SIZE",
+	[IGT_CRTC_GAMMA_LUT_3D] = "GAMMA_LUT_3D",
+	[IGT_CRTC_GAMMA_LUT_3D_SIZE] = "GAMMA_LUT_3D_SIZE",
 	[IGT_CRTC_MODE_ID] = "MODE_ID",
 	[IGT_CRTC_ACTIVE] = "ACTIVE",
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
@@ -1983,6 +1985,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
 		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT_3D))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_LUT_3D, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ed598f164..960809714 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -121,6 +121,8 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_GAMMA_LUT_SIZE,
        IGT_CRTC_DEGAMMA_LUT,
        IGT_CRTC_DEGAMMA_LUT_SIZE,
+       IGT_CRTC_GAMMA_LUT_3D,
+       IGT_CRTC_GAMMA_LUT_3D_SIZE,
        IGT_CRTC_MODE_ID,
        IGT_CRTC_ACTIVE,
        IGT_CRTC_OUT_FENCE_PTR,
-- 
2.32.0
