Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D056E17D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 05:28:06 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Thu,  8 Apr 2021 10:58:16 +0530
Message-Id: <20210408052816.1154963-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_draw_crc: Add subtest description
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
Cc: Gupta Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_draw_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index ffd655b0..2d7f30dc 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -331,6 +331,7 @@ igt_main
 	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
 	for (tiling_idx = 0; tiling_idx < N_TILING_METHODS; tiling_idx++) {
+		igt_describe("Check if rectangles are drawn correctly on tiled buffer using different methods");
 		igt_subtest_f("draw-method-%s-%s-%s",
 			      format_str(format_idx),
 			      igt_draw_get_method_name(method),
@@ -339,6 +340,7 @@ igt_main
 					    tilings[tiling_idx]);
 	} } }
 
+	igt_describe("Check if colored rectangles are drawn correctly on destination buffer");
 	igt_subtest("fill-fb")
 		fill_fb_subtest();
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
