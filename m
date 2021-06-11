Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184B6E4F3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 05:30:54 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 11 Jun 2021 10:49:59 +0530
Message-Id: <20210611052005.303-11-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/17] tests/kms_big_fb: Optimize setup_fb
 function
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Kunal Joshi <kunal1.joshi@intel.com>

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_big_fb.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index 89ea0f23e2..3e19450a42 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -115,12 +115,15 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 		f.offsets[n] = newfb->offsets[n];
 	}
 
-	cr = igt_get_cairo_ctx(data->drm_fd, newfb);
-	igt_paint_color(cr, 0, 0, newfb->width, newfb->height,
-			data->planeclearrgb[0],
-			data->planeclearrgb[1],
-			data->planeclearrgb[2]);
-	igt_put_cairo_ctx(cr);
+       if (data->planeclearrgb[0] != 0.0 || data->planeclearrgb[1] != 0.0 ||
+           data->planeclearrgb[2] != 0.0) {
+               cr = igt_get_cairo_ctx(data->drm_fd, newfb);
+               igt_paint_color(cr, 0, 0, newfb->width, newfb->height,
+                               data->planeclearrgb[0],
+                               data->planeclearrgb[1],
+                               data->planeclearrgb[2]);
+               igt_put_cairo_ctx(cr);
+       }
 
 	igt_assert(drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 	newfb->fb_id = f.fb_id;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
