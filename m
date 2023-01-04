Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8502010E5F1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:30:20 +0530
Message-Id: <20230104170023.3355190-49-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 48/51] tests/i915/kms_psr2_su: Add support for
 Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_su.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 84dc30c3..3e0a78f2 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -104,7 +104,11 @@ static void setup_output(data_t *data)
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
+		igt_display_reset(display);
 		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
 		data->output = output;
 		data->mode = igt_output_get_mode(output);
 
@@ -116,6 +120,9 @@ static void display_init(data_t *data)
 {
 	igt_display_require(&data->display, data->drm_fd);
 	setup_output(data);
+
+	igt_require_f(data->output, "No available output found\n");
+	igt_require_f(data->mode, "No available mode found on %s\n", data->output->name);
 }
 
 static void display_fini(data_t *data)
-- 
2.39.0
