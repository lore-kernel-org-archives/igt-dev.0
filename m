Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE59510E5EC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:30:17 +0530
Message-Id: <20230104170023.3355190-46-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 45/51] tests/i915/kms_frontbuffer_tracking: Add
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

As many 2x tests are currently running on Pipe-A & B only, those
tests will always SKIP if there is any 8K supported panel in the
config. Instead of Skipping the test, add some intelligence to
the subtest to identify the valid pipe/output combo to execute
the subtest.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 5b47999e..650e14a7 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -403,15 +403,23 @@ static bool find_connector(bool edp_only, bool pipe_a,
 		if (pipe_a && pipe != PIPE_A)
 			continue;
 
-		if (output == forbidden_output || pipe == forbidden_pipe)
+		if (output == forbidden_output || pipe == forbidden_pipe) {
+			igt_output_set_pipe(output, pipe);
+			igt_output_override_mode(output, connector_get_mode(output));
+
 			continue;
+		}
 
 		if (c->connector_type == DRM_MODE_CONNECTOR_eDP && opt.no_edp)
 			continue;
 
-		*ret_output = output;
-		*ret_pipe = pipe;
-		return true;
+		igt_output_set_pipe(output, pipe);
+		igt_output_override_mode(output, connector_get_mode(output));
+		if (i915_pipe_output_combo_valid(&drm.display)) {
+			*ret_output = output;
+			*ret_pipe = pipe;
+			return true;
+		}
 	}
 
 	return false;
-- 
2.39.0
