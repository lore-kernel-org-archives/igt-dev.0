Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648A6E297
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 02:31:39 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 11 Feb 2020 04:31:07 +0200
Message-Id: <20200211023108.25369-7-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-1-imre.deak@intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 7/8] lib/igt_draw: Fix igt_draw_fill_fb() on
 platforms w/o aperture
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

Draw through a CPU mapping on platforms w/o a GTT aperture.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_draw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index fa8ab562..b9c3ae26 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -728,6 +728,6 @@ void igt_draw_rect_fb(int fd, drm_intel_bufmgr *bufmgr,
  */
 void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint32_t color)
 {
-	igt_draw_rect_fb(fd, NULL, NULL, fb, IGT_DRAW_MMAP_GTT,
+	igt_draw_rect_fb(fd, NULL, NULL, fb, IGT_DRAW_MMAP_CPU,
 			 0, 0, fb->width, fb->height, color);
 }
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
