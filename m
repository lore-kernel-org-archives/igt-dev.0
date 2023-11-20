Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7610E0FF
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 18:24:51 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 18:24:18 +0000
Message-ID: <20231120182430.88753-4-matthew.auld@intel.com>
In-Reply-To: <20231120182430.88753-1-matthew.auld@intel.com>
References: <20231120182430.88753-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 03/15] lib/igt_draw: mark buffers as
 SCANOUT
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

Display buffers likely will want WC, instead of the default WB on the
CPU side, given that display engine is incoherent with CPU caches.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/igt_draw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 498c69a56..dcaebee2f 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -797,7 +797,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	else
 		tmp.handle = xe_bo_create_flags(fd, 0,
 						ALIGN(tmp.size, xe_get_default_alignment(fd)),
-						visible_vram_if_possible(fd, 0));
+						visible_vram_if_possible(fd, 0) |
+						DRM_XE_GEM_CREATE_FLAG_SCANOUT);
 
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
-- 
2.42.0
