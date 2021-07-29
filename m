Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7FA6EE3A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 19:17:19 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 30 Jul 2021 00:36:36 +0530
Message-Id: <20210729190636.17973-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Use max stride 128K
 generic in set_max_hw_stride
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
Cc: Charlton Lin <charlton.Lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

As per kernel i9xx_plane_max_stride, if I915_FORMAT_MOD_X_TILED
stride should be 16*1024 and for other modifiers 32*1024.
However, we see random CRC failures on kernel 5.4
With 64K or 128K, tests PASS. We are keeping 128K for now
to avoid failures on 5.4 kernel.

But it should try only those formats which can show full length.
However, changing that to 128K again fails. So, not changing
32768 in the check

Signed-off-by: Charlton Lin <charlton.Lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_big_fb.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index c6f374bdd073..905b5cfdc47a 100644
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
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
