Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC8910E591
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 08:41:25 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Jun 2022 14:07:47 +0530
Message-Id: <20220608083747.17387-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_rotation_crc: Limit the test
 combinations on simulation to avoid timeout
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

This is simulation specific patch to limit the combination to avoid
timeout.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 50869a08..22066159 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -724,15 +724,22 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
+			if (igt_run_in_simulation() && planeconfigs[i].rotation == IGT_ROTATION_0)
+				continue;
 			p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
 			p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
 			p[0].modifier = planeconfigs[i].modifier;
 			pointlocation(data, (planeinfos *)&p, mode, 0);
 
 			for (k = 0; k < ARRAY_SIZE(formatlist); k++) {
+				if (igt_run_in_simulation() && formatlist[k] == DRM_FORMAT_P010)
+					continue;
 				p[0].format = formatlist[k];
 
 				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
+					if (igt_run_in_simulation() &&
+					    planeconfigs[j].rotation == IGT_ROTATION_0)
+						continue;
 					p[1].width = (uint64_t)(planeconfigs[j].width * used_w);
 					p[1].height = (uint64_t)(planeconfigs[j].height * used_h);
 					p[1].modifier = planeconfigs[j].modifier;
@@ -740,6 +747,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						      mode, 1);
 
 					for (l = 0; l < ARRAY_SIZE(formatlist); l++) {
+						if (igt_run_in_simulation() && formatlist[l] == DRM_FORMAT_NV12)
+							continue;
 						p[1].format = formatlist[l];
 						/*
 						 * RGB565 90/270 degrees rotation is supported
-- 
2.36.0
