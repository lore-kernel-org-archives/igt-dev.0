Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBB36E92E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 18:34:29 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Fri, 22 Jan 2021 00:05:21 +0530
Message-Id: <20210121183522.26799-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: reduce
 execution time
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Restricting the execution to 2 pipes
with this change we see 50% improvement in time efficiency.

v2: Updated commit message
v3: Updated check condition

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 33a97cca..e7072e20 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -405,6 +405,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int pipe_count = 0;
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR)
 		igt_require(display->has_cursor_plane);
@@ -421,6 +422,11 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
 			continue;
 
+		/* restricting the execution to 2 pipes to reduce execution time*/
+		if (pipe_count == 2 && !data->extended)
+			break;
+		pipe_count++;
+
 		igt_output_set_pipe(output, pipe);
 
 		plane = igt_output_get_plane_type(output, plane_type);
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
