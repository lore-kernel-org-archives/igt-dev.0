Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779C310E0D0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 05:02:21 +0000 (UTC)
Date: Tue, 6 Dec 2022 06:02:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20221206050217.khuyqc4wm2ttygrv@zkempczy-mobl2>
References: <20221205230348.2086715-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221205230348.2086715-1-lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Support all future platforms in
 bufops
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 03:03:48PM -0800, Lucas De Marchi wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> The basic assumption is that any future/unknown platform will derive its
> feature set from the last known generation, so we can use their
> definitions as our defaults.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_bufops.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index c63a5760..72c2189e 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -101,7 +101,7 @@ struct buf_ops {
>  	int fd;
>  	int gen_start;
>  	int gen_end;
> -	int intel_gen;
> +	unsigned int intel_gen;
>  	uint32_t supported_tiles;
>  	uint32_t supported_hw_tiles;
>  	uint32_t swizzle_x;
> @@ -440,8 +440,8 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
>  		       uint32_t *linear, enum ccs_copy_direction dir)
>  {
>  	uint64_t size, offset, ccs_size;
> +	unsigned int gen;
>  	void *map;
> -	int gen;
>  
>  	if (!buf->compression || HAS_FLATCCS(intel_get_drm_devid(bops->fd)))
>  		return;
> @@ -1214,7 +1214,7 @@ static void __intel_buf_write_to_png(struct buf_ops *bops,
>  	cairo_status_t ret;
>  	void *linear;
>  	int format, width, height, stride, offset;
> -	int gen = bops->intel_gen;
> +	unsigned int gen = bops->intel_gen;
>  
>  	igt_assert_eq(posix_memalign(&linear, 16, intel_buf_size(buf)), 0);
>  
> @@ -1265,7 +1265,7 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
>  	.ys_to_linear       = copy_ys_to_linear, \
>  	.tile4_to_linear    = copy_tile4_to_linear
>  
> -struct buf_ops buf_ops_arr[] = {
> +static const struct buf_ops buf_ops_arr[] = {
>  	{
>  		DEFAULT_BUFOPS(2, 8),
>  		.supported_tiles    = TILE_NONE | TILE_X | TILE_Y,
> @@ -1277,7 +1277,7 @@ struct buf_ops buf_ops_arr[] = {
>  	},
>  
>  	{
> -		DEFAULT_BUFOPS(12, 12),
> +		DEFAULT_BUFOPS(12, ~0U),
>  		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4,
>  	},
>  };
> @@ -1394,28 +1394,27 @@ uint64_t intel_buf_bo_size(const struct intel_buf *buf)
>  static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>  {
>  	struct buf_ops *bops = calloc(1, sizeof(*bops));
> +	unsigned int generation;
>  	uint32_t devid;
> -	int generation;
>  
>  	igt_assert(bops);
>  
>  	devid = intel_get_drm_devid(fd);
>  	generation = intel_gen(devid);
>  
> -	/* Predefined settings */
> +	/* Predefined settings: see intel_device_info? */

+Karolina

Above is likely partially true, for 4tile only. We're working how to provide
valid information about format support. Bufops were written at the moment
of dg1, so no flatccs and no differences in supported formats / compression
were known to me yet (so for dg1 TILE_X is not true).

Main problem we got now with graphics_ver >= 12 is that format support diverge
across graphics_rel and there's no single place where you can get this info
yet. Adding .has_FMT might me not reliable for auxiliary blitters/other
engines (previously we thought to add simple .blitter_formats = TILE_X |
..., but according to differences between blitter engines it would extend
this structure a bit). Anyway rework in this area is already happening and
you can expect some patches soon.

But for this change:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
>  		if (generation >= buf_ops_arr[i].gen_start &&
>  		    generation <= buf_ops_arr[i].gen_end) {
>  			memcpy(bops, &buf_ops_arr[i], sizeof(*bops));
> -			bops->fd = fd;
> -			bops->intel_gen = generation;
> -			igt_debug("generation: %d, supported tiles: 0x%02x\n",
> -				  generation, bops->supported_tiles);
>  			break;
>  		}
>  	}
>  
> -	igt_assert(bops->intel_gen);
> +	bops->fd = fd;
> +	bops->intel_gen = generation;
> +	igt_debug("generation: %d, supported tiles: 0x%02x\n",
> +		  bops->intel_gen, bops->supported_tiles);
>  
>  	/*
>  	 * Warning!
> -- 
> 2.38.1
> 
