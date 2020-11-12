Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4216E249
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 14:17:19 +0000 (UTC)
Date: Thu, 12 Nov 2020 16:17:06 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201112141706.GA486534@ideak-desk.fi.intel.com>
References: <20201112132837.502142-1-mika.kahola@intel.com>
 <20201112132837.502142-3-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112132837.502142-3-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v9 2/4] lib/igt_fb: Modify buffer
 creation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 03:28:35PM +0200, Mika Kahola wrote:
> Modify buffer creation so the process will be more versatile.
> This is change is needed for Clear Color feature.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Please go through the review comments in my last email.

> ---
>  lib/igt_fb.c | 20 ++++++++++++++------
>  lib/igt_fb.h |  3 +++
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 43f8c475..422a9e06 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2141,9 +2141,10 @@ static int yuv_semiplanar_bpp(uint32_t drm_format)
>  	}
>  }
>  
> -static struct intel_buf *create_buf(struct fb_blit_upload *blit,
> -				   const struct igt_fb *fb,
> -				   const char *name)
> +struct intel_buf *
> +igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> +                        const struct igt_fb *fb,
> +                        const char *name)
>  {
>  	struct intel_buf *buf;
>  	uint32_t bo_name, handle, compression;
> @@ -2169,10 +2170,10 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
>  		compression = I915_COMPRESSION_NONE;
>  	}
>  
> -	bo_name = gem_flink(blit->fd, fb->gem_handle);
> -	handle = gem_open(blit->fd, bo_name);
> +	bo_name = gem_flink(fd, fb->gem_handle);
> +	handle = gem_open(fd, bo_name);
>  
> -	buf = intel_buf_create_using_handle(blit->bops, handle,
> +	buf = intel_buf_create_using_handle(bops, handle,
>  					    fb->width, fb->height,
>  					    fb->plane_bpp[0], 0,
>  					    igt_fb_mod_to_tiling(fb->modifier),
> @@ -2213,6 +2214,13 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
>  	return buf;
>  }
>  
> +static struct intel_buf *create_buf(struct fb_blit_upload *blit,
> +				   const struct igt_fb *fb,
> +				   const char *name)
> +{
> +	return igt_fb_create_intel_buf(blit->fd, blit->bops, fb, name);
> +}
> +
>  static void fini_buf(struct intel_buf *buf)
>  {
>  	intel_buf_destroy(buf);
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index b36db965..bc5b8fa0 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -39,6 +39,7 @@
>  
>  #include "igt_color_encoding.h"
>  #include "igt_debugfs.h"
> +#include "intel_bufops.h"
>  
>  /*
>   * Internal format to denote a buffer compatible with pixman's
> @@ -129,6 +130,8 @@ igt_create_fb_with_bo_size(int fd, int width, int height,
>  			   enum igt_color_range color_range,
>  			   struct igt_fb *fb, uint64_t bo_size,
>  			   unsigned bo_stride);
> +struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> +					  const struct igt_fb *fb, const char *name);
>  unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>  			   uint64_t modifier, struct igt_fb *fb);
>  unsigned int igt_create_color_fb(int fd, int width, int height,
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
