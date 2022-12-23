Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ACF10E16E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 08:44:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Date: Fri, 23 Dec 2022 14:10:56 +0530
Message-Id: <20221223084056.2541707-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-46-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-46-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v6 45/52] tests/i915/kms_flip_tiling: Add support
 for Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name
V3: - Remove unwanted prints

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_flip_tiling.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 1183feb6..4cc063f6 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -195,8 +195,12 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_plane_t *plane;
 
+			igt_display_reset(&data.display);
 			pipe_crc_free(&data);
+
 			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(&data.display))
+				continue;
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-- 
2.39.0
