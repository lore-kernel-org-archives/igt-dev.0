Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EBB6ECB0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Feb 2021 16:46:22 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 10 Feb 2021 22:18:30 +0530
Message-Id: <20210210164830.17270-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_rotation_crc: restrict execution based
 on number of outputs connected
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

With multidisplay set ups, the test ran only on first pipe with 2 outputs
and it would skip on other displays connected. so added a variable to
correct this behavior.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_rotation_crc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 6d4e87ed..eb66260b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -424,13 +424,16 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	enum pipe pipe;
-	int pipe_count = 0;
+	int pipe_count = 0, connected_outputs = 0;
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR)
 		igt_require(display->has_cursor_plane);
 
 	igt_display_require_output(display);
 
+	for_each_connected_output(&data->display, output)
+		connected_outputs++;
+
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_plane_t *plane;
 		int i, j, c;
@@ -467,7 +470,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			continue;
 
 		/* restricting the execution to 2 pipes to reduce execution time*/
-		if (pipe_count == 2 && !data->extended)
+		if (pipe_count == 2 * connected_outputs && !data->extended)
 			break;
 		pipe_count++;
 
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
