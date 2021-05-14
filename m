Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96D6E2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:48:05 +0000 (UTC)
Date: Fri, 14 May 2021 12:51:22 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514095122.GB8652@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-8-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] tools/intel_watermark: Handle ADL-P
 dedicated SAGV watermarks
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

On Wed, Apr 14, 2021 at 05:27:53AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> ADL-P introduces dedicated SAGV watermark registers. Decode them.

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 106 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 102 insertions(+), 4 deletions(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 31ce165f282b..f5613c333dc3 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -166,6 +166,19 @@ static int skl_max_planes(uint32_t d)
>  		return 4;
>  }
>  =

> +static bool skl_has_sagv_wm(uint32_t d)
> +{
> +	return intel_gen(d) >=3D 13;
> +}
> +
> +static int skl_num_wm_levels(uint32_t d)
> +{
> +	if (skl_has_sagv_wm(d))
> +		return 6;
> +	else
> +		return 8;
> +}
> +
>  static const char *skl_plane_name(int plane)
>  {
>  	static char name[32];
> @@ -223,6 +236,30 @@ static const char *skl_wm_trans_reg_name(int plane)
>  	return reg_name;
>  }
>  =

> +static const char *skl_wm_sagv_reg_name(int plane)
> +{
> +	static char reg_name[32];
> +
> +	if (plane =3D=3D 0)
> +		snprintf(reg_name, sizeof(reg_name), "CUR_WM_SAGV");
> +	else
> +		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_SAGV_%1d", plane);
> +
> +	return reg_name;
> +}
> +
> +static const char *skl_wm_sagv_trans_reg_name(int plane)
> +{
> +	static char reg_name[32];
> +
> +	if (plane =3D=3D 0)
> +		snprintf(reg_name, sizeof(reg_name), "CUR_WM_SAGV_TRANS");
> +	else
> +		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_SAGV_TRANS_%1d", plane);
> +
> +	return reg_name;
> +}
> +
>  static const char *skl_buf_cfg_reg_name(int plane)
>  {
>  	static char reg_name[32];
> @@ -266,10 +303,12 @@ static void skl_wm_dump(void)
>  	int pipe, plane, level;
>  	int num_pipes =3D skl_num_pipes(devid);
>  	int max_planes =3D skl_max_planes(devid);
> -	int num_levels =3D 8;
> +	int num_levels =3D skl_num_wm_levels(devid);
>  	uint32_t base_addr =3D 0x70000, addr, wm_offset;
>  	uint32_t wm[num_levels][num_pipes][max_planes];
>  	uint32_t wm_trans[num_pipes][max_planes];
> +	uint32_t wm_sagv[num_pipes][max_planes];
> +	uint32_t wm_sagv_trans[num_pipes][max_planes];
>  	uint32_t buf_cfg[num_pipes][max_planes];
>  	uint32_t nv12_buf_cfg[num_pipes][max_planes];
>  	uint32_t plane_ctl[num_pipes][max_planes];
> @@ -297,6 +336,11 @@ static void skl_wm_dump(void)
>  				wm_offset =3D addr + 0x00140 + level * 0x4;
>  				wm[level][pipe][plane] =3D read_reg(wm_offset);
>  			}
> +
> +			if (skl_has_sagv_wm(devid)) {
> +				wm_sagv[pipe][plane] =3D read_reg(addr + 0x00158);
> +				wm_sagv_trans[pipe][plane] =3D read_reg(addr + 0x0015c);
> +			}
>  		}
>  	}
>  =

> @@ -348,6 +392,32 @@ static void skl_wm_dump(void)
>  	}
>  	printf("\n");
>  =

> +	if (skl_has_sagv_wm(devid)) {
> +		for (plane =3D 0; plane < max_planes; plane++) {
> +			printf("%21s\t", skl_wm_sagv_reg_name(plane));
> +
> +			for (pipe =3D 0; pipe < num_pipes; pipe++) {
> +				if (plane >=3D skl_num_planes(devid, pipe))
> +					break;
> +				printf("0x%08x\t", wm_sagv[pipe][plane]);
> +			}
> +			printf("\n");
> +		}
> +		printf("\n");
> +
> +		for (plane =3D 0; plane < max_planes; plane++) {
> +			printf("%21s\t", skl_wm_sagv_trans_reg_name(plane));
> +
> +			for (pipe =3D 0; pipe < num_pipes; pipe++) {
> +				if (plane >=3D skl_num_planes(devid, pipe))
> +					break;
> +				printf("0x%08x\t", wm_sagv_trans[pipe][plane]);
> +			}
> +			printf("\n");
> +		}
> +		printf("\n");
> +	}
> +
>  	for (plane =3D 0; plane < max_planes; plane++) {
>  		printf("%21s\t", skl_buf_cfg_reg_name(plane));
>  =

> @@ -386,7 +456,7 @@ static void skl_wm_dump(void)
>  		linetime =3D REG_DECODE1(wm_linetime[pipe], 0, 9);
>  		printf("LINETIME: %d (%.3f usec)\n", linetime, linetime* 0.125f);
>  =

> -		printf("LEVEL");
> +		printf("     LEVEL");
>  		for (plane =3D 0; plane < num_planes; plane++) {
>  			if (plane =3D=3D 0)
>  				enable =3D REG_DECODE1(plane_ctl[pipe][plane], 0, 3) ||
> @@ -399,7 +469,7 @@ static void skl_wm_dump(void)
>  		printf("\n");
>  =

>  		for (level =3D 0; level < num_levels; level++) {
> -			printf("%5d", level);
> +			printf("%10d", level);
>  			for (plane =3D 0; plane < num_planes; plane++) {
>  				blocks =3D REG_DECODE1(wm[level][pipe][plane], 0, 11);
>  				lines =3D REG_DECODE1(wm[level][pipe][plane], 14, 5);
> @@ -414,7 +484,7 @@ static void skl_wm_dump(void)
>  			printf("\n");
>  		}
>  =

> -		printf("TRANS");
> +		printf("     TRANS");
>  		for (plane =3D 0; plane < num_planes; plane++) {
>  			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0, 11);
>  			lines =3D REG_DECODE1(wm_trans[pipe][plane], 14, 5);
> @@ -427,6 +497,34 @@ static void skl_wm_dump(void)
>  				printf("(--)");
>  		}
>  =

> +		if (skl_has_sagv_wm(devid)) {
> +			printf("\n      SAGV");
> +			for (plane =3D 0; plane < num_planes; plane++) {
> +				blocks =3D REG_DECODE1(wm_sagv[pipe][plane], 0, 11);
> +				lines =3D REG_DECODE1(wm_sagv[pipe][plane], 14, 5);
> +				enable =3D REG_DECODE1(wm_sagv[pipe][plane], 31, 1);
> +
> +				printf("%5d%c", blocks, endis_ast(enable));
> +				if (!REG_DECODE1(wm_sagv[pipe][plane], 30, 1))
> +					printf("(%2d)", lines);
> +				else
> +					printf("(--)");
> +			}
> +
> +			printf("\nSAGV TRANS");
> +			for (plane =3D 0; plane < num_planes; plane++) {
> +				blocks =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 0, 11);
> +				lines =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 14, 5);
> +				enable =3D REG_DECODE1(wm_sagv_trans[pipe][plane], 31, 1);
> +
> +				printf("%5d%c", blocks, endis_ast(enable));
> +				if (!REG_DECODE1(wm_sagv_trans[pipe][plane], 30, 1))
> +					printf("(%2d)", lines);
> +				else
> +					printf("(--)");
> +			}
> +		}
> +
>  		printf("\nDDB allocation:");
>  =

>  		printf("\nstart");
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
