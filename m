Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1FDC3ABD9
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 08:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B8410E148;
	Wed, 14 May 2025 08:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3zQyof9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2F810E148
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747212244; x=1778748244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymlA3+qvv7R/HmNBGSpxhk7YGzJBfKUYgXYv5PRsMSA=;
 b=U3zQyof9Tm3kwyYVbfLsbW66jVHv25LZYAQyPfumX7WHWa+2PkasjeSt
 n2sZSvTa/gHI34nlVNKlpG8O29SvaNakKMyHpGvAVpVmD5uWIlYjUhCya
 0iKVdIcmEpPIdi/vIAi7VsxXu+SR5Fc0u/+DKMvKxjvuD/JP1WTUTRLPK
 iNbexVZ+pWiwLoAg3RJJGJFH2gPYjEQaDwJgtWcfUOIlHfWc1f9UFnmg8
 DjJHIkjoUqGj7Pz9oQjPicbGEM9BdXsZgX6YBD3neRCwT2cvxkzZPOkgZ
 cKkfkHvbjtuUAJrGi+9OXrt0lk5bj+kkBECzl2+Qfqu+TlP5El7Usq7si g==;
X-CSE-ConnectionGUID: nPZ2DuHOShK+PKVS4oJU1w==
X-CSE-MsgGUID: qnHgSiAwQWCKpRE6WCOycA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66647582"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="66647582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:44:03 -0700
X-CSE-ConnectionGUID: a2WESBphRsK5uxE8jFPZLQ==
X-CSE-MsgGUID: ZOVuhP0jQ1GIeOZI4VV3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="168918262"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:44:02 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] RFC: tests/kms_plane_lowres: Refactor test to handle
 tiling formats dynamically
Date: Wed, 14 May 2025 14:29:49 +0530
Message-Id: <20250514085949.1379335-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This commit introduces functions to dynamically query the supported basic and
full tiling modes from the kernel (`igt_get_basic_tiling_mode()` and
`igt_get_full_tiling_mode()`). The goal is to eliminate hardcoding of tiling modes,
ensuring that the test environment reflects the actual supported configurations
for the platform.

By using this approach, we:
- Reduce the number of dynamic test cases, as only the supported tiling modes
  are tested.
- Avoid unnecessary noise in test results by ensuring only relevant tiling
  configurations are included.
- Improve test accuracy and reliability by directly aligning with the kernel's
  reported capabilities.

WIP:
- Added basic tiling mode query function.
- Added full tiling mode query function.
- Introduced helper function for tiling modifier string conversion.
- Defined enums for basic and full tiling modes.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 40 +++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f3bc481f2..99b14bed5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7442,3 +7442,73 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+int igt_get_basic_tiling_mode(int fd, uint64_t *modifiers,
+			      enum igt_tiling_mode *basic_tiling)
+{
+/*
+     * Step 1: Define a local array of known basic tiling modes
+     *         Map each basic tiling to its corresponding I915_TILING_* value
+     */
+
+    /*
+     * Step 2: Loop over each tiling mode supported using the kms_flip_tiling logic
+     *
+     *         For each tiling:
+     *         - Create a small test buffer
+     *         - Attempt to set the tiling mode
+     *         - If ioctl succeeds, store the tiling mode in basic_tiling[]
+     *         - Store a default/zero modifier (optional)
+     */
+
+    /*
+     * Step 3: Return the number of tiling modes successfully supported
+     */
+return 0;
+}
+int igt_get_full_tiling_mode(int fd, uint64_t *modifiers,
+			     enum igt_tiling_mode *basic_tiling,
+			     enum igt_format_modifier *all_tiling)
+{
+/*
+     * Step 1: Define a static list of known Intel format modifiers
+     *         Use enum values from IGT_FMT_MOD_* defined in igt_kms.h
+     */
+
+    /*
+     * Step 2: For each modifier:
+     *         - Try to create an fb with that modifier
+     *         - If the fb is successfully created:
+     *             - Add the modifier to all_tiling[]
+     */
+
+    /*
+     * Step 3: Return the number of supported modifiers detected
+     */
+return 0;
+}
+
+const char *igt_modifier_str(uint64_t modifier)
+{
+	switch (modifier) {
+		case IGT_FMT_MOD_X_TILED: return "X_TILED";
+		case IGT_FMT_MOD_Y_TILED: return "Y_TILED";
+		case IGT_FMT_MOD_Yf_TILED: return "Yf_TILED";
+		case IGT_FMT_MOD_Y_TILED_CCS: return "Y_TILED_CCS";
+		case IGT_FMT_MOD_Yf_TILED_CCS: return "Yf_TILED_CCS";
+		case IGT_FMT_MOD_Y_TILED_GEN12_RC_CCS: return "GEN12_RC_CCS";
+		case IGT_FMT_MOD_Y_TILED_GEN12_MC_CCS: return "GEN12_MC_CCS";
+		case IGT_FMT_MOD_Y_TILED_GEN12_RC_CCS_CC: return "GEN12_RC_CCS_CC";
+		case IGT_FMT_MOD_4_TILED: return "4_TILED";
+		case IGT_FMT_MOD_4_TILED_DG2_RC_CCS: return "DG2_RC_CCS";
+		case IGT_FMT_MOD_4_TILED_DG2_MC_CCS: return "DG2_MC_CCS";
+		case IGT_FMT_MOD_4_TILED_DG2_RC_CCS_CC: return "DG2_RC_CCS_CC";
+		case IGT_FMT_MOD_4_TILED_MTL_RC_CCS: return "MTL_RC_CCS";
+		case IGT_FMT_MOD_4_TILED_MTL_MC_CCS: return "MTL_MC_CCS";
+		case IGT_FMT_MOD_4_TILED_MTL_RC_CCS_CC: return "MTL_RC_CCS_CC";
+		case IGT_FMT_MOD_4_TILED_LNL_CCS: return "LNL_CCS";
+		case IGT_FMT_MOD_4_TILED_BMG_CCS: return "BMG_CCS";
+
+		default: return "UNKNOWN";
+	}
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0381c82ad..f03de1e3d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -168,6 +168,36 @@ enum igt_atomic_crtc_properties {
        IGT_NUM_CRTC_PROPS
 };
 
+/* Basic tiling format modifiers */
+enum igt_basic_tiling_mode {
+    IGT_TILING_NONE = 0,
+    IGT_TILING_X    = 1,
+    IGT_TILING_Y    = 2,
+    IGT_TILING_Yf   = 3,
+    IGT_TILING_4    = 4,
+};
+
+/* Full tiling format modifiers */
+enum igt_full_tiling_mode {
+    IGT_FMT_MOD_X_TILED                 = I915_FORMAT_MOD_X_TILED,
+    IGT_FMT_MOD_Y_TILED                 = I915_FORMAT_MOD_Y_TILED,
+    IGT_FMT_MOD_Yf_TILED                = I915_FORMAT_MOD_Yf_TILED,
+    IGT_FMT_MOD_Y_TILED_CCS             = I915_FORMAT_MOD_Y_TILED_CCS,
+    IGT_FMT_MOD_Yf_TILED_CCS            = I915_FORMAT_MOD_Yf_TILED_CCS,
+    IGT_FMT_MOD_Y_TILED_GEN12_RC_CCS    = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
+    IGT_FMT_MOD_Y_TILED_GEN12_MC_CCS    = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
+    IGT_FMT_MOD_Y_TILED_GEN12_RC_CCS_CC = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC,
+    IGT_FMT_MOD_4_TILED                 = I915_FORMAT_MOD_4_TILED,
+    IGT_FMT_MOD_4_TILED_DG2_RC_CCS      = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
+    IGT_FMT_MOD_4_TILED_DG2_MC_CCS      = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
+    IGT_FMT_MOD_4_TILED_DG2_RC_CCS_CC   = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
+    IGT_FMT_MOD_4_TILED_MTL_RC_CCS      = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
+    IGT_FMT_MOD_4_TILED_MTL_MC_CCS      = I915_FORMAT_MOD_4_TILED_MTL_MC_CCS,
+    IGT_FMT_MOD_4_TILED_MTL_RC_CCS_CC   = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC,
+    IGT_FMT_MOD_4_TILED_LNL_CCS         = I915_FORMAT_MOD_4_TILED_LNL_CCS,
+    IGT_FMT_MOD_4_TILED_BMG_CCS         = I915_FORMAT_MOD_4_TILED_BMG_CCS,
+};
+
 /**
  * igt_crtc_prop_names
  *
@@ -1280,4 +1310,14 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+/* Queries */
+int igt_get_basic_tiling_mode(int fd, uint64_t *modifiers,
+			      enum igt_tiling_mode *basic_tiling);
+int igt_get_full_tiling_mode(int fd, uint64_t *modifiers,
+			     enum igt_tiling_mode *basic_tiling,
+			     enum igt_format_modifier *all_tiling);
+
+/* Helpers */
+const char *igt_modifier_str(uint64_t modifier);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1

