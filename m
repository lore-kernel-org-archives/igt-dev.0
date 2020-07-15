Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E456C6EBDF
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 16:49:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id w3so6474393wmi.4
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 09:49:42 -0700 (PDT)
Date: Wed, 15 Jul 2020 13:49:33 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <5e8164caa6841e57979f27eec629a670d80479c5.1594831260.git.melissa.srw@gmail.com>
References: <cover.1594831260.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1594831260.git.melissa.srw@gmail.com>
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_fb: change comments with fd
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
 lib/igt_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fd33907b..3864b7a1 100644
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
@@ -3594,7 +3594,7 @@ void igt_put_cairo_ctx(cairo_t *cr)
 
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
