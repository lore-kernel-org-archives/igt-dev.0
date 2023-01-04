Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743110E5D3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:29:42 +0530
Message-Id: <20230104170023.3355190-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 10/51] tests/kms_content_protection: Add
 support for Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_content_protection.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index aa28b7bf..638e1301 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -174,7 +174,6 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 	igt_plane_t *primary;
 
 	mode = igt_output_get_mode(output);
-	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.red);
@@ -502,6 +501,11 @@ test_content_protection(enum igt_commit_style s, int content_type)
 				continue;
 
 			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(display))
+				continue;
+
 			modeset_with_fb(pipe, output, s);
 
 			if (!output_hdcp_capable(output, content_type))
-- 
2.39.0
