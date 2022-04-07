Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0E89C56
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 14:08:16 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Apr 2022 10:07:54 -0400
Message-ID: <20220407140755.560546-2-dingchen.zhang@amd.com>
In-Reply-To: <20220407140755.560546-1-dingchen.zhang@amd.com>
References: <20220407140755.560546-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 1/2] tests/amdgpu/amd_psr: add interactive
 option of PSR visual confirm
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

[why & how]
AMDGPU DM debugfs provides a debug option of PSR visual confirm,
we'd make it an interactive option that provides capability to
usermode to choose if or not to enable the PSR visual confirm.

- add interactive option "visual-confirm" and by-default we select
  it as TRUE to enable visual confirm for PSR-SU test cases.
- set PSR visual confirm debugfs if interactive debug option of
  visual confirm set before any test run begins, and reset after
  any test run ends.

changes in v2:
------------------
- drop the "_dm_" from helpers of visual confirm debugfs set/get
- drop the non-necessary visual confirm option check after set
  and reset, before and after the test run, respectively
- align the 2nd line code w/ previous line's opening brace

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 58e40d2b..0ec50c9f 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -62,6 +62,12 @@ typedef struct data {
 	int h;
 } data_t;
 
+struct {
+	bool visual_confirm;
+} opt = {
+	.visual_confirm = true,	/* visual confirm debug option */
+};
+
 static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
 		             double r, double g, double b, double a)
 {
@@ -300,10 +306,31 @@ static void run_check_psr_su_mpo(data_t *data)
 	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i)
 		igt_remove_fb(data->fd, &rect_fb[i]);
 	test_fini(data);
-	close(data->fd);
 }
 
-igt_main
+const char *help_str =
+"  --visual-confirm           PSR visual confirm debug option enable\n";
+
+struct option long_options[] = {
+	{"visual-confirm",	optional_argument, NULL, 'v'},
+	{ 0, 0, 0, 0 }
+};
+
+static int opt_handler(int option, int option_index, void *data)
+{
+	switch (option) {
+	case 'v':
+		opt.visual_confirm = strtol(optarg, NULL, 0);
+		igt_info(" PSR Visual Confirm %s\n", opt.visual_confirm ? "enabled" : "disabled");
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	data_t data;
 
@@ -321,6 +348,13 @@ igt_main
 		igt_display_require(&data.display, data.fd);
 		igt_require(&data.display.is_atomic);
 		igt_display_require_output(&data.display);
+
+		/* check if visual confirm option available */
+		if (opt.visual_confirm) {
+			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
+			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_PSR),
+				      "set PSR visual confirm failed\n");
+		}
 	}
 
 	igt_describe("Test whether PSR can be enabled with static screen");
@@ -335,6 +369,10 @@ igt_main
 
 	igt_fixture
 	{
+		if (opt.visual_confirm) {
+			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
+				      "reset PSR visual confirm option failed\n");
+		}
 		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
 	}
-- 
2.25.1
