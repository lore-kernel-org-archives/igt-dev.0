Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCE16EB22
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 19:15:48 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Fri,  7 Feb 2020 21:15:23 +0200
Message-Id: <20200207191524.19362-7-imre.deak@intel.com>
In-Reply-To: <20200207191524.19362-1-imre.deak@intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/8] lib/igt_draw: Fix igt_draw_fill_fb() on
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

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_draw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index d227a53a..c720a4c2 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -731,6 +731,6 @@ void igt_draw_rect_fb(int fd, drm_intel_bufmgr *bufmgr,
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
