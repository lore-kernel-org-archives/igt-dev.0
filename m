Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64AE10E614
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 09:53:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:19:47 +0530
Message-Id: <20220906095030.486152-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
References: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 09/52] tests/chamelium/kms_color_chamelium: Add
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
 tests/chamelium/kms_color_chamelium.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index 678931aa..42289e91 100644
--- a/tests/chamelium/kms_color_chamelium.c
+++ b/tests/chamelium/kms_color_chamelium.c
@@ -458,6 +458,9 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (!test_constraint(data, p))
+		return;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
 		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
 }
@@ -493,6 +496,9 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (!test_constraint(data, p))
+		return;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
 		int i;
@@ -538,6 +544,9 @@ run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (!test_constraint(data, p))
+		return;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
 		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
 }
-- 
2.35.1
