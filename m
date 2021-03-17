Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EDE6E05D
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:51:16 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:46 -0400
Message-Id: <20210317224949.448284-5-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/igt_fb: Remove domain from igt_fb
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
To: nouveau@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

It doesn't look like that this is used by i915 for anything these days, so
let's just remove this while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/igt_fb.c | 3 ---
 lib/igt_fb.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f0fcd1a7..2b478887 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2491,7 +2491,6 @@ static void create_cairo_surface__gpu(int fd, struct igt_fb *fb)
 						    cairo_format,
 						    fb->width, fb->height,
 						    blit->linear.fb.strides[0]);
-	fb->domain = I915_GEM_DOMAIN_GTT;
 
 	cairo_surface_set_user_data(fb->cairo_surface,
 				    (cairo_user_data_key_t *)create_cairo_surface__gpu,
@@ -2571,8 +2570,6 @@ static void create_cairo_surface__gtt(int fd, struct igt_fb *fb)
 		      "Unable to create a cairo surface: %s\n",
 		      cairo_status_to_string(cairo_surface_status(fb->cairo_surface)));
 
-	fb->domain = I915_GEM_DOMAIN_GTT;
-
 	cairo_surface_set_user_data(fb->cairo_surface,
 				    (cairo_user_data_key_t *)create_cairo_surface__gtt,
 				    fb, destroy_cairo_surface__gtt);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 0d64898a..e4f8b2b1 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -64,7 +64,6 @@ struct buf_ops;
  * @modifier: tiling mode as a DRM framebuffer modifier
  * @size: size in bytes of the underlying backing storage
  * @cairo_surface: optionally attached cairo drawing surface
- * @domain: current domain for cache flushing tracking on i915.ko
  * @num_planes: Amount of planes on this fb. >1 for planar formats.
  * @strides: line stride for each plane in bytes
  * @offsets: Offset for each plane in bytes.
@@ -87,7 +86,6 @@ typedef struct igt_fb {
 	uint64_t modifier;
 	uint64_t size;
 	cairo_surface_t *cairo_surface;
-	unsigned int domain;
 	unsigned int num_planes;
 	uint32_t strides[4];
 	uint32_t offsets[4];
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
