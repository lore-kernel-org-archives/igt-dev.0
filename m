Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E628010E817
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 13:30:32 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 19:01:14 +0530
Message-Id: <20231011133114.68627-4-swati2.sharma@intel.com>
In-Reply-To: <20231011133114.68627-1-swati2.sharma@intel.com>
References: <20231011133114.68627-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_vblank: restrict to 2 pipes
 and add capability to run on all pipes
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

Restrict execution to 2 pipes but add capability to executed
on all pipes.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_vblank.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 4edd3f6bc..593da691e 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -150,6 +150,10 @@ typedef struct {
 #define RPM	0x80
 } data_t;
 
+static bool all_pipes;
+static enum pipe active_pipes[IGT_MAX_PIPES];
+static uint32_t last_pipe;
+
 static double elapsed(const struct timespec *start,
 		      const struct timespec *end,
 		      int loop)
@@ -546,6 +550,10 @@ static void run_subtests(data_t *data)
 					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
 						continue;
 
+					if (!all_pipes && data->pipe != active_pipes[0] &&
+					    data->pipe != active_pipes[last_pipe])
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 						data->flags = m->flags | NOHANG;
 						run_test(data, f->func);
@@ -566,6 +574,10 @@ static void run_subtests(data_t *data)
 					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
 						continue;
 
+					if (!all_pipes && data->pipe != active_pipes[0] &&
+					    data->pipe != active_pipes[last_pipe])
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 						data->flags = m->flags;
 						run_test(data, f->func);
@@ -622,7 +634,23 @@ static void invalid_subtest(data_t *data, int fd)
 	cleanup_crtc(data, fd, output);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+		case 'e':
+			all_pipes = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
 	data_t data;
@@ -632,6 +660,11 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
 		igt_display_require_output(&data.display);
+
+		/* Get active pipes. */
+		for_each_pipe(&data.display, data.pipe)
+			active_pipes[last_pipe++] = data.pipe;
+		last_pipe--;
 	}
 
 	igt_describe("Negative test for vblank request.");
@@ -652,6 +685,10 @@ igt_main
 			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
 				continue;
 
+			if (!all_pipes && data.pipe != active_pipes[0] &&
+					  data.pipe != active_pipes[last_pipe])
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output->name)
 				crtc_id_subtest(&data, fd);
 		}
-- 
2.25.1
