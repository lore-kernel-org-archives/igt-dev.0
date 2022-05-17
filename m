Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6224E10F786
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 20:27:23 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: =?iso-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 17 May 2022 20:27:21 +0000
Message-ID: <DM6PR12MB3051285C4C4C6FBA5FD2107FF7CE9@DM6PR12MB3051.namprd12.prod.outlook.com>
References: <20220516175927.27616-1-andrealmeid@igalia.com>
 <20220516175927.27616-2-andrealmeid@igalia.com>
In-Reply-To: <20220516175927.27616-2-andrealmeid@igalia.com>
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Add support for drawing
 rectangles with random colors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "petri.latvala@intel.com" <petri.latvala@intel.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Alex Hung <alex.hung@amd.com>


From: igt-dev <igt-dev-bounces@lists.freedesktop.org> on behalf of Andr=E9 =
Almeida <andrealmeid@igalia.com>
Sent: 16 May 2022 11:59
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: petri.latvala@intel.com <petri.latvala@intel.com>; kernel-dev@igalia.co=
m <kernel-dev@igalia.com>; markyacoub@google.com <markyacoub@google.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Add support for drawing re=
ctangles with random colors

Add support for drawing rectangles with random colors, useful for tests
that you don't mind which color will be used.

Signed-off-by: Andr=E9 Almeida <andrealmeid@igalia.com>
---
 lib/igt_fb.c | 20 ++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index eafbe7fd..5ace94cc 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1465,6 +1465,26 @@ void igt_paint_color(cairo_t *cr, int x, int y, int =
w, int h,
         cairo_fill(cr);
 }

+/**
+ * igt_paint_color:
+ * @cr: cairo drawing context
+ * @x: pixel x-coordination of the fill rectangle
+ * @y: pixel y-coordination of the fill rectangle
+ * @w: width of the fill rectangle
+ * @h: height of the fill rectangle
+ *
+ * This functions draws a solid rectangle with random colors using the dra=
wing
+ * context @cr.
+ */
+void igt_paint_color_rand(cairo_t *cr, int x, int y, int w, int h)
+{
+       double r =3D rand() / (double)RAND_MAX;
+       double g =3D rand() / (double)RAND_MAX;
+       double b =3D rand() / (double)RAND_MAX;
+
+       igt_paint_color(cr, x, y, w, h, r, g, b);
+}
+
 /**
  *
  * igt_fill_cts_color_square_framebuffer:
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 623a8caa..b3f096fe 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -191,6 +191,7 @@ cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb *fb);
 void igt_put_cairo_ctx(cairo_t *cr);
 void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
                          double r, double g, double b);
+void igt_paint_color_rand(cairo_t *cr, int x, int y, int w, int h);
 void igt_paint_color_alpha(cairo_t *cr, int x, int y, int w, int h,
                                double r, double g, double b, double a);
 void igt_paint_color_gradient(cairo_t *cr, int x, int y, int w, int h,
--
2.36.0
