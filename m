Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0A11B250
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 05:42:53 +0000 (UTC)
Date: Fri, 20 May 2022 08:40:29 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Message-ID: <YocpzY0ty96Q7zbG@platvala-desk.ger.corp.intel.com>
References: <20220516175927.27616-1-andrealmeid@igalia.com>
 <20220516175927.27616-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516175927.27616-2-andrealmeid@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Add support for drawing
 rectangles with random colors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 16, 2022 at 02:59:26PM -0300, André Almeida wrote:
> Add support for drawing rectangles with random colors, useful for tests
> that you don't mind which color will be used.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  lib/igt_fb.c | 20 ++++++++++++++++++++
>  lib/igt_fb.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index eafbe7fd..5ace94cc 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1465,6 +1465,26 @@ void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
>  	cairo_fill(cr);
>  }
>  
> +/**
> + * igt_paint_color:

The function name is igt_paint_color_rand.


-- 
Petri Latvala


> + * @cr: cairo drawing context
> + * @x: pixel x-coordination of the fill rectangle
> + * @y: pixel y-coordination of the fill rectangle
> + * @w: width of the fill rectangle
> + * @h: height of the fill rectangle
> + *
> + * This functions draws a solid rectangle with random colors using the drawing
> + * context @cr.
> + */
> +void igt_paint_color_rand(cairo_t *cr, int x, int y, int w, int h)
> +{
> +	double r = rand() / (double)RAND_MAX;
> +	double g = rand() / (double)RAND_MAX;
> +	double b = rand() / (double)RAND_MAX;
> +
> +	igt_paint_color(cr, x, y, w, h, r, g, b);
> +}
> +
>  /**
>   *
>   * igt_fill_cts_color_square_framebuffer:
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 623a8caa..b3f096fe 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -191,6 +191,7 @@ cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb *fb);
>  void igt_put_cairo_ctx(cairo_t *cr);
>  void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
>  			 double r, double g, double b);
> +void igt_paint_color_rand(cairo_t *cr, int x, int y, int w, int h);
>  void igt_paint_color_alpha(cairo_t *cr, int x, int y, int w, int h,
>  			       double r, double g, double b, double a);
>  void igt_paint_color_gradient(cairo_t *cr, int x, int y, int w, int h,
> -- 
> 2.36.0
> 
