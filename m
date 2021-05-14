Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BF56E2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:48:30 +0000 (UTC)
Date: Fri, 14 May 2021 12:51:47 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514095147.GC8652@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-9-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-9-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] tools/intel_watermark: Widen
 register bitfields
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 05:27:54AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Modern platforms have more bits in the registers. Deal with it.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> ---
>  tools/intel_watermark.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index f5613c333dc3..1e235ed30a63 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -471,8 +471,8 @@ static void skl_wm_dump(void)
>  		for (level =3D 0; level < num_levels; level++) {
>  			printf("%10d", level);
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				blocks =3D REG_DECODE1(wm[level][pipe][plane], 0, 11);
> -				lines =3D REG_DECODE1(wm[level][pipe][plane], 14, 5);
> +				blocks =3D REG_DECODE1(wm[level][pipe][plane], 0, 12);
> +				lines =3D REG_DECODE1(wm[level][pipe][plane], 14, 13);
>  				enable =3D REG_DECODE1(wm[level][pipe][plane], 31, 1);
>  =

>  				printf("%5d%c", blocks, endis_ast(enable));
> @@ -486,8 +486,8 @@ static void skl_wm_dump(void)
>  =

>  		printf("     TRANS");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0, 11);
> -			lines =3D REG_DECODE1(wm_trans[pipe][plane], 14, 5);
> +			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0, 12);
> +			lines =3D REG_DECODE1(wm_trans[pipe][plane], 14, 13);
>  			enable =3D REG_DECODE1(wm_trans[pipe][plane], 31, 1);
>  =

>  			printf("%5d%c", blocks, endis_ast(enable));
> @@ -500,8 +500,8 @@ static void skl_wm_dump(void)
>  		if (skl_has_sagv_wm(devid)) {
>  			printf("\n      SAGV");
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				blocks =3D REG_DECODE1(wm_sagv[pipe][plane], 0, 11);
> -				lines =3D REG_DECODE1(wm_sagv[pipe][plane], 14, 5);
> +				blocks =3D REG_DECODE1(wm_sagv[pipe][plane], 0, 12);
> +				lines =3D REG_DECODE1(wm_sagv[pipe][plane], 14, 13);
>  				enable =3D REG_DECODE1(wm_sagv[pipe][plane], 31, 1);
>  =

>  				printf("%5d%c", blocks, endis_ast(enable));
> @@ -513,8 +513,8 @@ static void skl_wm_dump(void)
>  =

>  			printf("\nSAGV TRANS");
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				blocks =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 0, 11);
> -				lines =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 14, 5);
> +				blocks =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 0, 12);
> +				lines =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 14, 13);
>  				enable =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 31, 1);
>  =

>  				printf("%5d%c", blocks, endis_ast(enable));
> @@ -529,20 +529,20 @@ static void skl_wm_dump(void)
>  =

>  		printf("\nstart");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0, 11);
> +			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0, 12);
>  			printf("%10d", start);
>  		}
>  =

>  		printf("\n  end");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			end =3D REG_DECODE1(buf_cfg[pipe][plane], 16, 11);
> +			end =3D REG_DECODE1(buf_cfg[pipe][plane], 16, 12);
>  			printf("%10d", end);
>  		}
>  =

>  		printf("\n size");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0, 11);
> -			end =3D  REG_DECODE1(buf_cfg[pipe][plane], 16, 11);
> +			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0, 12);
> +			end =3D  REG_DECODE1(buf_cfg[pipe][plane], 16, 12);
>  			size =3D end - start + 1;
>  			printf("%10d", (end =3D=3D 0 && size =3D=3D 1) ? 0 : size);
>  		}
> @@ -553,20 +553,20 @@ static void skl_wm_dump(void)
>  =

>  			printf("\nstart");
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				start =3D REG_DECODE1(nv12_buf_cfg[pipe][plane], 0, 11);
> +				start =3D REG_DECODE1(nv12_buf_cfg[pipe][plane], 0, 12);
>  				printf("%10d", start);
>  			}
>  =

>  			printf("\n  end");
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				end =3D REG_DECODE1(nv12_buf_cfg[pipe][plane], 16, 11);
> +				end =3D REG_DECODE1(nv12_buf_cfg[pipe][plane], 16, 12);
>  				printf("%10d", end);
>  			}
>  =

>  			printf("\n size");
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				start =3D REG_DECODE1(nv12_buf_cfg[pipe][plane], 0, 11);
> -				end =3D  REG_DECODE1(nv12_buf_cfg[pipe][plane], 16, 11);
> +				start =3D REG_DECODE1(nv12_buf_cfg[pipe][plane], 0, 12);
> +				end =3D  REG_DECODE1(nv12_buf_cfg[pipe][plane], 16, 12);
>  				size =3D end - start + 1;
>  				printf("%10d", (end =3D=3D 0 && size =3D=3D 1) ? 0 : size);
>  			}
> -- =

> 2.26.3
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
