Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A510EAB9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 06:44:31 +0000 (UTC)
Message-ID: <9afc47b4-03f2-99c2-f4af-b9c1bcaeb491@intel.com>
Date: Thu, 27 Apr 2023 12:14:06 +0530
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
 <20230425154017.374465-14-zbigniew.kempczynski@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230425154017.374465-14-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 13/15] lib/igt_fb: For xe assume vram
 is used on discrete
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


On Tue-25-04-2023 09:10 pm, Zbigniew Kempczyński wrote:
> Assume fb bo's were created on vram on discrete, otherwise use system
> memory.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/igt_fb.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 7379b99aa8..76f2e12456 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2545,6 +2545,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   {
>   	struct intel_buf *buf;
>   	uint32_t bo_name, handle, compression;
> +	uint64_t region;
>   	int num_surfaces;
>   	int i;
>   
> @@ -2571,12 +2572,16 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   	bo_name = gem_flink(fd, fb->gem_handle);
>   	handle = gem_open(fd, bo_name);
>   
> -	buf = intel_buf_create_using_handle_and_size(bops, handle,
> -						     fb->width, fb->height,
> -						     fb->plane_bpp[0], 0,
> -						     igt_fb_mod_to_tiling(fb->modifier),
> -						     compression, fb->size,
> -						     fb->strides[0]);
> +	/* For i915 region doesn't matter, for xe does */
> +	region = buf_ops_get_driver(bops) == INTEL_DRIVER_XE ?
> +				vram_if_possible(fd, 0) : 0;
----------------------------------------------------------^
For i915, region must be -1 right?

- Bhanu

> +	buf = intel_buf_create_full(bops, handle,
> +				    fb->width, fb->height,
> +				    fb->plane_bpp[0], 0,
> +				    igt_fb_mod_to_tiling(fb->modifier),
> +				    compression, fb->size,
> +				    fb->strides[0],
> +				    region);
>   	intel_buf_set_name(buf, name);
>   
>   	/* Make sure we close handle on destroy path */
