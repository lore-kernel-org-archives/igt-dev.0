Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C92310E044
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:10:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:38:10 +0530
Message-Id: <20221115170855.196572-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 07/52] tests/kms_color_helper: Helper to check
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
---
 tests/kms_color_helper.c | 12 ++++++++++++
 tests/kms_color_helper.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 55f3e409..2f9950f8 100644
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
index f0ae30e3..bfed2fb8 100644
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
2.38.0
