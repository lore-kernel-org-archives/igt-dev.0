Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5E110E4AE
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 11:27:52 +0000 (UTC)
Date: Mon, 24 Apr 2023 13:27:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230424112747.huli4jjmawuwrz6k@kamilkon-desk1>
References: <20230424073907.158701-1-zbigniew.kempczynski@intel.com>
 <20230424073907.158701-12-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424073907.158701-12-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 11/11] lib/igt_fb: For xe assume vram
 is used on discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-04-24 at 09:39:07 +0200, Zbigniew Kempczyński wrote:
> Assume fb bo's were created on vram on discrete, otherwise use system
> memory.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_fb.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 7379b99aa8..2c1d48783a 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2545,6 +2545,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>  {
>  	struct intel_buf *buf;
>  	uint32_t bo_name, handle, compression;
> +	uint64_t region;
>  	int num_surfaces;
>  	int i;
>  
> @@ -2571,12 +2572,15 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>  	bo_name = gem_flink(fd, fb->gem_handle);
>  	handle = gem_open(fd, bo_name);
>  
> -	buf = intel_buf_create_using_handle_and_size(bops, handle,
> -						     fb->width, fb->height,
> -						     fb->plane_bpp[0], 0,
> -						     igt_fb_mod_to_tiling(fb->modifier),
> -						     compression, fb->size,
> -						     fb->strides[0]);
> +	/* For i915 region doesn't matter, for xe does */
> +	region = is_i915_device(fd) ? 0 : vram_if_possible(fd, 0);
> +	buf = intel_buf_create_full(bops, handle,
> +				    fb->width, fb->height,
> +				    fb->plane_bpp[0], 0,
> +				    igt_fb_mod_to_tiling(fb->modifier),
> +				    compression, fb->size,
> +				    fb->strides[0],
> +				    region);
>  	intel_buf_set_name(buf, name);
>  
>  	/* Make sure we close handle on destroy path */
> -- 
> 2.34.1
> 
