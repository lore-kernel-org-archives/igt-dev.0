Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:07 +0100
Message-ID: <20231005153116.452319-4-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/12] lib/igt_draw: mark buffers as SCANOUT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Display buffers likely will want WC, instead of the default WB on the
CPU side, given that display engine is incoherent with CPU caches.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/igt_draw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 476778a13..2332bf94a 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -791,7 +791,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	else
 		tmp.handle = xe_bo_create_flags(fd, 0,
 						ALIGN(tmp.size, xe_get_default_alignment(fd)),
-						visible_vram_if_possible(fd, 0));
+						visible_vram_if_possible(fd, 0) |
+						XE_GEM_CREATE_FLAG_SCANOUT);
 
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
-- 
2.41.0
