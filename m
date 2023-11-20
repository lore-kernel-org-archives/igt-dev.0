Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA7710E0FF
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 18:24:49 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 18:24:17 +0000
Message-ID: <20231120182430.88753-3-matthew.auld@intel.com>
In-Reply-To: <20231120182430.88753-1-matthew.auld@intel.com>
References: <20231120182430.88753-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 02/15] lib/igt_fb: mark buffers as
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
 lib/igt_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e70d2e3ce..e89df2ea8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1206,7 +1206,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
 		} else if (is_xe_device(fd)) {
 			fb->gem_handle = xe_bo_create_flags(fd, 0, fb->size,
-							visible_vram_if_possible(fd, 0));
+							    visible_vram_if_possible(fd, 0) |
+							    DRM_XE_GEM_CREATE_FLAG_SCANOUT);
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
 
-- 
2.42.0
