Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE0810E215
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 10:21:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 15:48:07 +0530
Message-Id: <20220523101807.3627871-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220523101807.3627871-1-bhanuprakash.modem@intel.com>
References: <20220523101807.3627871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_color: Skip if current & requested
 BPC doesn't match
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

Due to the limitaion of port clock values supported for HDMI, i915
may downgrade the requested bpc for a given mode.

This patch will skip the subtest if the requested bpc doesn't match
with crtc's current bpc.

Cc: Swati Sharma <swati2.sharma@intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 93957f50..d9ec0306 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -635,6 +635,20 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static bool i915_clock_constraint(int fd, igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	if (!is_i915_device(fd))
+		return false;
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+		return true;
+
+	return false;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -900,7 +914,13 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 
 			if (!igt_check_output_bpc_equal(data->drm_fd, p, output->name, 10)) {
 				igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
-				igt_fail_on_f(true, "Failed to set max_bpc as: 10\n");
+
+				igt_require_f(!i915_clock_constraint(data->drm_fd, output),
+					      "%s won't support 10 bpc, due to the HDMI clock constraint.\n",
+					      output->name);
+
+				igt_fail_on_f(true, "%s: Failed to set max_bpc as: 10\n",
+					      output->name);
 			}
 
 			igt_dynamic_f("gamma-%s", output->name) {
-- 
2.35.1
