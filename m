Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF70F10E499
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 09:14:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 14:44:22 +0530
Message-Id: <20230531091422.368128-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/i915/kms_dsc: add limited flag
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

Add limited flag to restrict test execution to one valid pipe-output
combination. By default all tests will run on all valid pipe-output
combinations.

v2: -rename extended to limited (Kamil)
v3: -add -l in help_str (Zbigniew)
    -remove static from data_t (Zbigniew)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/kms_dsc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3ce28f84..3b0ce0d2 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -51,6 +51,7 @@ typedef struct {
 	int input_bpc;
 	int disp_ver;
 	enum pipe pipe;
+	bool limited;
 } data_t;
 
 static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
@@ -250,13 +251,34 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 
 		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
 			update_display(data, test_type);
+
+		if (data->limited)
+			break;
 	}
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
 {
-	data_t data = {};
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'l':
+		data->limited = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char help_str[] =
+	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
 
+data_t data = {};
+
+igt_main_args("l", NULL, help_str, opt_handler, &data)
+{
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
-- 
2.25.1
