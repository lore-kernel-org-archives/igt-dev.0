Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280EF6E5D5
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jan 2021 05:29:23 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Fri,  8 Jan 2021 11:07:58 +0530
Message-Id: <20210108053758.15645-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_draw_crc: added test description
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_draw_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index ffd655b0..14d35a6d 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -331,6 +331,8 @@ igt_main
 	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
 	for (tiling_idx = 0; tiling_idx < N_TILING_METHODS; tiling_idx++) {
+		igt_describe("This subtest verfies igt_draw library works"
+			     "with different tilings, DRM_FORMATS, DRAW_METHODS");
 		igt_subtest_f("draw-method-%s-%s-%s",
 			      format_str(format_idx),
 			      igt_draw_get_method_name(method),
@@ -339,6 +341,8 @@ igt_main
 					    tilings[tiling_idx]);
 	} } }
 
+	igt_describe("This subtest verifies CRC after filling fb with x-tiling"
+		     "or none");
 	igt_subtest("fill-fb")
 		fill_fb_subtest();
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
