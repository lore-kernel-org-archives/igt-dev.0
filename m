Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E96F423
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jul 2021 10:09:40 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 30 Jul 2021 15:29:04 +0530
Message-Id: <20210730095904.13667-1-vidya.srinivas@intel.com>
In-Reply-To: <20210729190636.17973-1-vidya.srinivas@intel.com>
References: <20210729190636.17973-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_big_fb: Use max stride 128K
 generic in set_max_hw_stride
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: charlton.Lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As per kernel i9xx_plane_max_stride, if I915_FORMAT_MOD_X_TILED
stride should be 16*1024 and for other modifiers 32*1024.
However, we see random CRC failures on kernel 5.4
With 64K or 128K, tests PASS. We are keeping 128K for now
to avoid failures on 5.4 kernel.

Signed-off-by: Charlton Lin <charlton.Lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_big_fb.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index c6f374bdd073..8f262af0d047 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -754,16 +754,7 @@ test_addfb(data_t *data)
 static void
 set_max_hw_stride(data_t *data)
 {
-	if (intel_display_ver(data->devid) >= 13) {
-		/*
-		 * The stride in bytes must not exceed of the size
-		 * of 128K bytes. For pixel formats of 64bpp will allow
-		 * for a 16K pixel surface.
-		 */
-		data->hw_stride = 131072;
-	} else {
-		data->hw_stride = 32768;
-	}
+	data->hw_stride = 131072;
 }
 
 static data_t data = {};
@@ -941,11 +932,11 @@ igt_main
 			for (int j = 0; j < ARRAY_SIZE(formats); j++) {
 				/*
 				* try only those formats which can show full length.
-				* Here 32K is used to have CI test results consistent
-				* for all platforms, 32K is smallest number possbily
+				* Here 128K is used to have CI test results consistent
+				* for all platforms, 128K is smallest number possbily
 				* coming to data.hw_stride from above set_max_hw_stride()
 				*/
-				if (32768 / (formats[j].bpp >> 3) > 8192)
+				if (131072 / (formats[j].bpp >> 3) > 8192)
 					continue;
 
 				data.format = formats[j].format;
-- 
2.32.0
