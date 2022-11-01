Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4992110E3F8
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 16:14:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Nov 2022 21:41:47 +0530
Message-Id: <20221101161147.3922207-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_cursor_crc: Fix the usage of pipe
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

Update the pipe before checking if the driver supports the given
cursor size.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 2d6b43f7..737720f9 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -721,15 +721,15 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 	}
 
 	create_cursor_fb(data, w, h);
-	if (require_cursor_size(data, w, h)) {
-		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
-
-		igt_remove_fb(data->drm_fd, &data->fb);
-		return;
-	}
 
 	for_each_pipe(&data->display, pipe) {
 		data->pipe = pipe;
+
+		if (require_cursor_size(data, w, h)) {
+			igt_info("Cursor size %dx%d not supported by driver\n", w, h);
+			continue;
+		}
+
 		igt_dynamic_f("pipe-%s-%s",
 			      kmstest_pipe_name(pipe), igt_output_name(data->output))
 			run_test(data, testfunc, w, h);
-- 
2.38.0
