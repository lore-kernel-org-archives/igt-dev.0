Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1511E6EA46
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 10:37:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so5045941wmj.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 03:37:30 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:37:22 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <3c0e76d37030f0d08fff3d8b424be8b8efa40955.1592991729.git.melissa.srw@gmail.com>
References: <cover.1592991729.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1592991729.git.melissa.srw@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: change comments with fd
 description
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
Cc: kernel-usp@googlegroups.com, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

Generalize description of fd so as not restrict it to i915 driver

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 lib/igt_fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 5ed586e7..5a219c57 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3548,7 +3548,7 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
 
 /**
  * igt_get_cairo_ctx:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @fb: pointer to an #igt_fb structure
  *
  * This initializes a cairo surface for @fb and then allocates a drawing context
@@ -3578,7 +3578,7 @@ cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb *fb)
 
 /**
  * igt_put_cairo_ctx:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @fb: pointer to an #igt_fb structure
  * @cr: the cairo context returned by igt_get_cairo_ctx.
  *
@@ -3596,7 +3596,7 @@ void igt_put_cairo_ctx(int fd, struct igt_fb *fb, cairo_t *cr)
 
 /**
  * igt_remove_fb:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @fb: pointer to an #igt_fb structure
  *
  * This function releases all resources allocated in igt_create_fb() for @fb.
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
