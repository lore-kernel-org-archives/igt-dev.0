Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0075710E3D8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 11:10:13 +0000 (UTC)
Date: Thu, 5 Oct 2023 13:10:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231005111009.3bhbl4qaz4pwlnir@kamilkon-desk.igk.intel.com>
References: <20231004134722.319334-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231004134722.319334-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: on Xe driver take into
 account adlp with no extended block copy
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

Hi Juha-Pekka,
On 2023-10-04 at 16:47:22 +0300, Juha-Pekka Heikkila wrote:

Could you make your patch title a little shorter?

[PATCH i-g-t] lib/igt_fb: on Xe driver take into account adlp with no extended block copy

imho better:

[PATCH i-g-t] lib/igt_fb: fix for platforms with no extended block copy

> With Xe add check to not use extended block copy if it is not available.
------ ^^
Is it limited to Xe only?

Regards,
Kamil

> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index f0c0681ab..54a66eb6a 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2920,17 +2920,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  			blt_set_copy_object(&blt.src, src);
>  			blt_set_copy_object(&blt.dst, dst);
>  
> -			blt_set_object_ext(&ext.src,
> -					   blt_compression_format(&blt, src_fb),
> -					   src_fb->width, src_fb->height,
> -					   SURFACE_TYPE_2D);
> +			if (blt_uses_extended_block_copy(src_fb->fd)) {
> +				blt_set_object_ext(&ext.src,
> +						blt_compression_format(&blt, src_fb),
> +						src_fb->width, src_fb->height,
> +						SURFACE_TYPE_2D);
>  
> -			blt_set_object_ext(&ext.dst,
> -					   blt_compression_format(&blt, dst_fb),
> -					   dst_fb->width, dst_fb->height,
> -					   SURFACE_TYPE_2D);
> +				blt_set_object_ext(&ext.dst,
> +						blt_compression_format(&blt, dst_fb),
> +						dst_fb->width, dst_fb->height,
> +						SURFACE_TYPE_2D);
>  
> -			pext = &ext;
> +				pext = &ext;
> +			}
>  
>  			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
>  
> -- 
> 2.34.1
> 
