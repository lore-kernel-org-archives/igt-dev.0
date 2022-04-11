Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD3910F2AB
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 09:44:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Date: Mon, 11 Apr 2022 15:11:46 +0530
Message-Id: <20220411094147.1650859-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
References: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2 4/5] tests/kms_dither: Adopt to use updated debugfs
 functions
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

Instead of writing our own wrappers of debugfs read,
use updated functions from lib.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 8e18dc83..21c1618a 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -99,14 +99,12 @@ static dither_status_t get_dither_state(data_t *data)
 	igt_require(res > 0);
 	close(dir);
 
-	igt_assert(start_loc = strstr(buf, ", bpp="));
-	igt_assert_eq(sscanf(start_loc, ", bpp=%u", &status.bpc), 1);
-	status.bpc /= 3;
-
 	igt_assert(start_loc = strstr(buf, ", dither="));
 	igt_assert_eq(sscanf(start_loc, ", dither=%s", tmp), 1);
 	status.dither = !strcmp(tmp, "yes,");
 
+	status.bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe_id);
+
 	return status;
 }
 
@@ -145,6 +143,11 @@ static void test_dithering(data_t *data, enum pipe pipe,
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
+	if (!igt_check_output_bpc_equal(data->drm_fd, pipe, output->name, output_bpc)) {
+		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc);
+		igt_fail_on_f(true, "Failed to set max_bpc as: %d\n", output_bpc);
+	}
+
 	/*
 	 * Check the status of Dithering block:
 	 *
-- 
2.35.1
