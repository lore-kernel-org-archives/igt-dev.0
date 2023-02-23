Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82AA10E4DB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:15:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:39:34 +0530
Message-Id: <20230223151018.2565040-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 07/51] tests/kms_color_helper: Helper to check
 Bigjoiner constraint
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

Add a helper to Skip the subtest if a selected pipe/output combo
won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color_helper.c | 12 ++++++++++++
 tests/kms_color_helper.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 55f3e4099..2f9950f80 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,18 @@
 
 #include "kms_color_helper.h"
 
+bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
+{
+	bool ret = true;
+
+	igt_output_set_pipe(data->output, pipe);
+	if (!i915_pipe_output_combo_valid(&data->display))
+		ret = false;
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	return ret;
+}
+
 bool
 panel_supports_deep_color(int drm_fd, char *output_name)
 {
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index f9242232d..78b97b008 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -69,6 +69,7 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
+bool pipe_output_combo_valid(data_t *data, enum pipe pipe);
 bool panel_supports_deep_color(int fd, char *output_name);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
-- 
2.39.1
