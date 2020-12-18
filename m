Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7109892A8
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Dec 2020 06:07:16 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Fri, 18 Dec 2020 11:37:13 +0530
Message-Id: <20201218060713.10390-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_rotation_crc: reduce execution time
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

Restricting the execution to 2 pipes.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index ffcc2cc2..8fb0fb57 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -396,6 +396,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int flag = 0;
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR)
 		igt_require(display->has_cursor_plane);
@@ -455,6 +456,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			}
 		}
 		igt_pipe_crc_stop(data->pipe_crc);
+		flag++;
+		if (flag == 2)
+			break;
 	}
 }
 
@@ -562,7 +566,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	igt_output_t *output;
 	igt_crc_t retcrc_sw, retcrc_hw;
 	planeinfos p[2];
-	int c, used_w, used_h;
+	int c, used_w, used_h, flag = 0;
 	struct p_struct *oldplanes;
 	drmModeModeInfo *mode;
 
@@ -660,6 +664,9 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 					}
 				}
 			}
+			flag++;
+			if (flag == 2)
+				break;
 		}
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
