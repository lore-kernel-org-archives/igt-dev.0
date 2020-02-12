Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BAC6E119
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 21:51:02 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 12 Feb 2020 23:50:36 +0200
Message-Id: <20200212215036.27407-3-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-7-imre.deak@intel.com>
References: <20200211023108.25369-7-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 7/8] lib/igt_draw: Fix igt_draw_fill_fb() on
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

Draw through a WC mapping on platforms w/o a GTT aperture.

v2:
- Use WC instead of CPU mapping. (Ashutosh)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> (v1)
---
 lib/igt_draw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index fa8ab5620..f2340127f 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -728,6 +728,8 @@ void igt_draw_rect_fb(int fd, drm_intel_bufmgr *bufmgr,
  */
 void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint32_t color)
 {
-	igt_draw_rect_fb(fd, NULL, NULL, fb, IGT_DRAW_MMAP_GTT,
+	igt_draw_rect_fb(fd, NULL, NULL, fb,
+			 gem_has_mappable_ggtt(fd) ? IGT_DRAW_MMAP_GTT :
+						     IGT_DRAW_MMAP_WC,
 			 0, 0, fb->width, fb->height, color);
 }
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
