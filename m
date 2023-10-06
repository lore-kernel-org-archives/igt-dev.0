Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06ED10E4C3
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:18:47 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 6 Oct 2023 08:18:44 +0000
Message-ID: <DM4PR11MB6312BBF478A0302C44EF0E1590C9A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
 <20231006075819.3055887-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/4] lib/igt_fb: Use small case for modifier
 name
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Friday, October 6, 2023 1:28 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t 1/4] lib/igt_fb: Use small case for modifier na=
me
>=20
> As few tests are using modifier name as subtest, let's keep it as a small=
 case. Also,
> don't mix '_' & '-'.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

> ---
>  lib/igt_fb.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 54a66eb6a..50b49102b 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4919,32 +4919,32 @@ const char *igt_fb_modifier_name(uint64_t
> modifier)
>  	case DRM_FORMAT_MOD_LINEAR:
>  		return "linear";
>  	case I915_FORMAT_MOD_X_TILED:
> -		return "X";
> +		return "x";
>  	case I915_FORMAT_MOD_Y_TILED:
> -		return "Y";
> +		return "y";
>  	case I915_FORMAT_MOD_Yf_TILED:
> -		return "Yf";
> +		return "yf";
>  	case I915_FORMAT_MOD_Y_TILED_CCS:
> -		return "Y-CCS";
> +		return "y-ccs";
>  	case I915_FORMAT_MOD_Yf_TILED_CCS:
> -		return "Yf-CCS";
> +		return "yf-ccs";
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
> -		return "Y-RC_CCS";
> +		return "y-rc-ccs";
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
> -		return "Y-RC_CCS-CC";
> +		return "y-rc-ccs-cc";
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
> -		return "Y-MC_CCS";
> +		return "y-mc-ccs";
>  	case I915_FORMAT_MOD_4_TILED:
>  		return "4";
>  	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> -		return "4-RC_CCS";
> +		return "4-rc-ccs";
>  	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> -		return "4-MC_CCS";
> +		return "4-mc-ccs";
>  	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> -		return "4-RC_CCS-CC";
> +		return "4-rc-ccs-cc";
>  	default:
>  		return "?";
>  	}
> --
> 2.40.0
