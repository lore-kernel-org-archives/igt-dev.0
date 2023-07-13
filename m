Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644BD10E608
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:09:04 +0000 (UTC)
Message-ID: <22ba7a96-5452-0527-748e-378143c1cf82@intel.com>
Date: Thu, 13 Jul 2023 09:08:40 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
 <20230712171231.290555-4-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230712171231.290555-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 03/21] lib/intel_blt: Add dump of two
 surfaces comparison in 8x8 blocks
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

On 12.07.2023 19:12, Zbigniew Kempczyński wrote:
> Add limited to 32bit color function which compares two surfaces
> dumping differences in 8x8 as single ascii char. It's globalized
> version of already existed dump_corruption_info() from gem_ccs
> test but I'm planning to use it in xe_ccs so keeping common code
> locally in the test doesn't make sense.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_blt.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/intel_blt.h |  2 ++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index a3d67f5136..1af57c4912 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1516,3 +1516,67 @@ void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   	if (!obj->ptr)
>   		munmap(map, obj->size);
>   }
> +
> +static int compare_nxn(const struct blt_copy_object *surf1,
> +			       const struct blt_copy_object *surf2,
> +			       int xsize, int ysize, int bx, int by)

Alignment seems to be off here

> +{
> +	int x, y, corrupted;
> +	uint32_t pos, px1, px2;
> +
> +	corrupted = 0;
> +	for (y = 0; y < ysize; y++) {
> +		for (x = 0; x < xsize; x++) {
> +			pos = bx * xsize + by * ysize * surf1->pitch / 4;
> +			pos += x + y * surf1->pitch / 4;
> +			px1 = surf1->ptr[pos];
> +			px2 = surf2->ptr[pos];
> +			if (px1 != px2)
> +				corrupted++;
> +		}
> +	}
> +
> +	return corrupted;
> +}
> +
> +/**
> + * blt_dump_corruption_info_32b:
> + * @surf1: first surface
> + * @surf2: second surface
> + *
> + * Function dumps ascii representation of the surfaces corruption. Comparison
> + * is performed on 8x8 32bpp color pixel blocks. Number of differences on
> + * such block varies from 0 (no corruption) to 64 (pixels on those surfaces                                                       ^- all pixels?
> + * differs). It is added then to '0' ascii character to point the corruption
> + * occured, for non affected block '.' is printed out.
       ^- s/occured/occurred/

With fixed alignment and docs:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> + *
> + * Idea of this function is to determine character of the differences between
> + * two surfaces without generating difference image.
> + *
> + * Currently function assumes both @surf1 and @surf2 are 32-bit color surfaces.
> + */
> +void blt_dump_corruption_info_32b(const struct blt_copy_object *surf1,
> +				  const struct blt_copy_object *surf2)
> +{
> +	const int xsize = 8, ysize = 8;
> +	int w, h, bx, by, corrupted;
> +
> +	igt_assert(surf1->x1 == surf2->x1 && surf1->x2 == surf2->x2);
> +	igt_assert(surf1->y1 == surf2->y1 && surf1->y2 == surf2->y2);
> +	w = surf1->x2;
> +	h = surf1->y2;
> +
> +	igt_info("dump corruption - width: %d, height: %d, sizex: %x, sizey: %x\n",
> +		 surf1->x2, surf1->y2, xsize, ysize);
> +
> +	for (by = 0; by < h / ysize; by++) {
> +		for (bx = 0; bx < w / xsize; bx++) {
> +			corrupted = compare_nxn(surf1, surf2, xsize, ysize, bx, by);
> +			if (corrupted == 0)
> +				igt_info(".");
> +			else
> +				igt_info("%c", '0' + corrupted);
> +		}
> +		igt_info("\n");
> +	}
> +}
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 2aa1259ae8..c134466d4d 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -259,5 +259,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>   void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   			const struct blt_copy_object *obj,
>   			uint32_t width, uint32_t height);
> +void blt_dump_corruption_info_32b(const struct blt_copy_object *surf1,
> +				  const struct blt_copy_object *surf2);
>   
>   #endif
