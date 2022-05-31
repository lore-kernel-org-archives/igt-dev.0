Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440B10E446
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 07:12:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 12:38:51 +0530
Message-Id: <20220531070851.3887976-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220531053625.3886441-5-bhanuprakash.modem@intel.com>
References: <20220531053625.3886441-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 4/4] HAX: Add hdr & deep color tests to BAT
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c                         | 2 ++
 tests/intel-ci/fast-feedback.testlist | 7 +++++++
 tests/kms_color.c                     | 1 +
 tests/kms_hdr.c                       | 1 +
 4 files changed, 11 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ada42cc8..df675384 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5560,6 +5560,8 @@ static unsigned int get_current_bpc(int drmfd, enum pipe pipe,
 	unsigned int maximum = igt_get_output_max_bpc(drmfd, output_name);
 	unsigned int current = igt_get_pipe_current_bpc(drmfd, pipe);
 
+	igt_info("Debug --> Max bpc: %d, Current bpc: %d\n", maximum, current);
+
 	igt_require_f(maximum >= bpc,
 		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
 		      maximum);
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b579c20a..aa4db852 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -105,6 +105,13 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
 igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_color@pipe-A-deep-color
+igt@kms_color@pipe-B-deep-color
+igt@kms_color@pipe-C-deep-color
+igt@kms_color@pipe-D-deep-color
+igt@kms_hdr@bpc-switch
+igt@kms_hdr@static-toggle
+igt@kms_hdr@static-swap
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
diff --git a/tests/kms_color.c b/tests/kms_color.c
index cb50cbbf..aad40962 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -646,6 +646,7 @@ static bool i915_clock_constraint(data_t *data, enum pipe pipe, int bpc)
 		igt_output_override_mode(output, &connector->modes[j__]);
 		igt_display_commit(&data->display);
 
+		kmstest_dump_mode(&connector->modes[j__]);
 		if (!igt_check_output_bpc_equal(data->drm_fd, pipe,
 						data->output->name, bpc))
 			continue;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 224216b9..79dc5ad5 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -213,6 +213,7 @@ static bool i915_clock_constraint(data_t *data, int bpc, bool is_hdr)
 	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
 
 	for_each_connector_mode(output) {
+		kmstest_dump_mode(&connector->modes[j__]);
 		if (is_hdr && connector->modes[j__].hdisplay < 3840)
 			goto out;
 
-- 
2.35.1
