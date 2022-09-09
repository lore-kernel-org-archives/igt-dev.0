Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB4E10EDA8
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 14:07:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 19:33:25 +0530
Message-Id: <20220909140331.1041095-47-bhanuprakash.modem@intel.com>
In-Reply-To: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 46/52] tests/i915/kms_frontbuffer_tracking: Add
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
---
 tests/i915/kms_frontbuffer_tracking.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 9518c706..ef041829 100644
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
2.35.1
