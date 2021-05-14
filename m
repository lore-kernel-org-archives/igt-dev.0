Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC726E2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:47:00 +0000 (UTC)
Date: Fri, 14 May 2021 12:50:14 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514095014.GA8652@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-7-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] tools/intel_watermark: Make reg
 dump section less wide
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

On Wed, Apr 14, 2021 at 05:27:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Don't repeat the register name for each pipe to make the
> register dump portion a bit less wide.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> ---
>  tools/intel_watermark.c | 98 ++++++++++++++++++-----------------------
>  1 file changed, 43 insertions(+), 55 deletions(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 657fff20ec7a..31ce165f282b 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -166,90 +166,80 @@ static int skl_max_planes(uint32_t d)
>  		return 4;
>  }
>  =

> -static const char *skl_plane_name(int pipe, int plane)
> +static const char *skl_plane_name(int plane)
>  {
>  	static char name[32];
>  =

>  	if (plane =3D=3D 0)
>  		snprintf(name, sizeof(name), "CURSOR");
>  	else
> -		snprintf(name, sizeof(name), "PLANE_%1d%c",
> -			 plane, pipe_name(pipe));
> +		snprintf(name, sizeof(name), "PLANE_%1d", plane);
>  =

>  	return name;
>  }
>  =

> -static const char *skl_wm_linetime_reg_name(int pipe)
> +static const char *skl_wm_linetime_reg_name(void)
>  {
>  	static char reg_name[32];
>  =

> -	snprintf(reg_name, sizeof(reg_name), "WM_LINETIME_%c",
> -		 pipe_name(pipe));
> +	snprintf(reg_name, sizeof(reg_name), "WM_LINETIME");
>  =

>  	return reg_name;
>  }
>  =

> -static const char *skl_plane_ctl_reg_name(int pipe, int plane)
> +static const char *skl_plane_ctl_reg_name(int plane)
>  {
>  	static char reg_name[32];
>  =

>  	if (plane =3D=3D 0)
> -		snprintf(reg_name, sizeof(reg_name), "CUR_CTL_%c",
> -			 pipe_name(pipe));
> +		snprintf(reg_name, sizeof(reg_name), "CUR_CTL");
>  	else
> -		snprintf(reg_name, sizeof(reg_name), "PLANE_CTL_%1d_%c",
> -			 plane, pipe_name(pipe));
> +		snprintf(reg_name, sizeof(reg_name), "PLANE_CTL_%1d", plane);
>  =

>  	return reg_name;
>  }
>  =

> -static const char *skl_wm_reg_name(int pipe, int plane, int level)
> +static const char *skl_wm_reg_name(int plane, int level)
>  {
>  	static char reg_name[32];
>  =

>  	if (plane =3D=3D 0)
> -		snprintf(reg_name, sizeof(reg_name), "CUR_WM_%c_%1d",
> -			 pipe_name(pipe), level);
> +		snprintf(reg_name, sizeof(reg_name), "CUR_WM_%1d", level);
>  	else
> -		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_%1d_%c_%1d",
> -			 plane, pipe_name(pipe), level);
> +		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_%1d_%1d", plane, level);
>  =

>  	return reg_name;
>  }
>  =

> -static const char *skl_wm_trans_reg_name(int pipe, int plane)
> +static const char *skl_wm_trans_reg_name(int plane)
>  {
>  	static char reg_name[32];
>  =

>  	if (plane =3D=3D 0)
> -		snprintf(reg_name, sizeof(reg_name), "CUR_WM_TRANS_%c",
> -			 pipe_name(pipe));
> +		snprintf(reg_name, sizeof(reg_name), "CUR_WM_TRANS");
>  	else
> -		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_TRANS_%1d_%c",
> -			 plane, pipe_name(pipe));
> +		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_TRANS_%1d", plane);
> +
>  	return reg_name;
>  }
>  =

> -static const char *skl_buf_cfg_reg_name(int pipe, int plane)
> +static const char *skl_buf_cfg_reg_name(int plane)
>  {
>  	static char reg_name[32];
>  =

>  	if (plane =3D=3D 0)
> -		snprintf(reg_name, sizeof(reg_name), "CUR_BUF_CFG_%c",
> -			 pipe_name(pipe));
> +		snprintf(reg_name, sizeof(reg_name), "CUR_BUF_CFG");
>  	else
> -		snprintf(reg_name, sizeof(reg_name), "PLANE_BUF_CFG_%1d_%c",
> -			 plane, pipe_name(pipe));
> +		snprintf(reg_name, sizeof(reg_name), "PLANE_BUF_CFG_%1d", plane);
>  =

>  	return reg_name;
>  }
>  =

> -static const char *skl_nv12_buf_cfg_reg_name(int pipe, int plane)
> +static const char *skl_nv12_buf_cfg_reg_name(int plane)
>  {
>  	static char reg_name[32];
>  =

> -	snprintf(reg_name, sizeof(reg_name), "PLANE_NV12_BUF_CFG_%1d_%c",
> -		 plane, pipe_name(pipe));
> +	snprintf(reg_name, sizeof(reg_name), "PLANE_NV12_BUF_CFG_%1d", plane);
>  =

>  	return reg_name;
>  }
> @@ -310,21 +300,23 @@ static void skl_wm_dump(void)
>  		}
>  	}
>  =

> -	for (pipe =3D 0; pipe < num_pipes; pipe++) {
> -		printf("%18s 0x%08x\t",
> -		       skl_wm_linetime_reg_name(pipe),
> -		       wm_linetime[pipe]);
> -	}
> +	printf("%21c\t", '\0');
> +	for (pipe =3D 0; pipe < num_pipes; pipe++)
> +		printf("PIPE_%-5c\t", pipe_name(pipe));
> +	printf("\n\n");
> +
> +	printf("%21s\t", skl_wm_linetime_reg_name());
> +	for (pipe =3D 0; pipe < num_pipes; pipe++)
> +		printf("0x%08x\t", wm_linetime[pipe]);
>  	printf("\n\n");
>  =

>  	for (plane =3D 0; plane < max_planes; plane++) {
> +		printf("%21s\t", skl_plane_ctl_reg_name(plane));
> +
>  		for (pipe =3D 0; pipe < num_pipes; pipe++) {
>  			if (plane >=3D skl_num_planes(devid, pipe))
>  				break;
> -
> -			printf("%18s 0x%08x\t" ,
> -			       skl_plane_ctl_reg_name(pipe, plane),
> -			       plane_ctl[pipe][plane]);
> +			printf("0x%08x\t" , plane_ctl[pipe][plane]);
>  		}
>  		printf("\n");
>  	}
> @@ -332,13 +324,12 @@ static void skl_wm_dump(void)
>  =

>  	for (plane =3D 0; plane < max_planes; plane++) {
>  		for (level =3D 0; level < num_levels; level++) {
> +			printf("%21s\t", skl_wm_reg_name(plane, level));
> +
>  			for (pipe =3D 0; pipe < num_pipes; pipe++) {
>  				if (plane >=3D skl_num_planes(devid, pipe))
>  					break;
> -
> -				printf("%18s 0x%08x\t" ,
> -				       skl_wm_reg_name(pipe, plane, level),
> -				       wm[level][pipe][plane]);
> +				printf("0x%08x\t", wm[level][pipe][plane]);
>  			}
>  			printf("\n");
>  		}
> @@ -346,26 +337,24 @@ static void skl_wm_dump(void)
>  	}
>  =

>  	for (plane =3D 0; plane < max_planes; plane++) {
> +		printf("%21s\t", skl_wm_trans_reg_name(plane));
> +
>  		for (pipe =3D 0; pipe < num_pipes; pipe++) {
>  			if (plane >=3D skl_num_planes(devid, pipe))
>  				break;
> -
> -			printf("%18s 0x%08x\t",
> -			       skl_wm_trans_reg_name(pipe, plane),
> -			       wm_trans[pipe][plane]);
> +			printf("0x%08x\t", wm_trans[pipe][plane]);
>  		}
>  		printf("\n");
>  	}
>  	printf("\n");
>  =

>  	for (plane =3D 0; plane < max_planes; plane++) {
> +		printf("%21s\t", skl_buf_cfg_reg_name(plane));
> +
>  		for (pipe =3D 0; pipe < num_pipes; pipe++) {
>  			if (plane >=3D skl_num_planes(devid, pipe))
>  				break;
> -
> -			printf("%18s 0x%08x\t",
> -			       skl_buf_cfg_reg_name(pipe, plane),
> -			       buf_cfg[pipe][plane]);
> +			printf("0x%08x\t", buf_cfg[pipe][plane]);
>  		}
>  		printf("\n");
>  =

> @@ -375,13 +364,12 @@ static void skl_wm_dump(void)
>  		if (plane =3D=3D 0)
>  			continue;
>  =

> +		printf("%21s\t", skl_nv12_buf_cfg_reg_name(plane));
> +
>  		for (pipe =3D 0; pipe < num_pipes; pipe++) {
>  			if (plane >=3D skl_num_planes(devid, pipe))
>  				break;
> -
> -			printf("%18s 0x%08x\t",
> -			       skl_nv12_buf_cfg_reg_name(pipe, plane),
> -			       nv12_buf_cfg[pipe][plane]);
> +			printf("0x%08x\t", nv12_buf_cfg[pipe][plane]);
>  		}
>  		printf("\n");
>  	}
> @@ -405,7 +393,7 @@ static void skl_wm_dump(void)
>  					REG_DECODE1(plane_ctl[pipe][plane], 5, 1);
>  			else
>  				enable =3D REG_DECODE1(plane_ctl[pipe][plane], 31, 1);
> -			printf("%9s%c", skl_plane_name(pipe, plane),
> +			printf("%9s%c", skl_plane_name(plane),
>  			       endis_ast(enable));
>  		}
>  		printf("\n");
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
