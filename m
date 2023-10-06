Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BDB88CFA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:22:25 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 6 Oct 2023 08:21:57 +0000
Message-ID: <DM4PR11MB63124D7401FB13D1E10C992890C9A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
 <20231006075819.3055887-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 3/4] tests/intel/kms_ccs: Rename subtests
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
> Subject: [igt-dev] [i-g-t 3/4] tests/intel/kms_ccs: Rename subtests
>=20
> Use '-' instead of '_' while naming subtests.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_ccs.c | 82 +++++++++++++++++++++----------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)
>=20
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c index
> 9df094a4d..09b98fbec 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -61,14 +61,14 @@
>   *
>   * arg[3]:
>   *
> - * @y_tiled_ccs:               Y tiled ccs
> - * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
> - * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
> - * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
> - * @yf_tiled_ccs:              YF tiled ccs
> - * @4_tiled_mtl_mc_ccs:        4 tiled mtl mc ccs
> - * @4_tiled_mtl_rc_ccs:        4 tiled mtl rc ccs
> - * @4_tiled_mtl_rc_ccs_cc:     4 tiled mtl rc ccs cc
> + * @y-tiled-ccs:               Y tiled ccs
> + * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
> + * @y-tiled-gen12-rc-ccs:      Y tiled gen12 rc ccs
> + * @y-tiled-gen12-rc-ccs-cc:   Y tiled gen12 rc ccs cc
> + * @yf-tiled-ccs:              YF tiled ccs
> + * @4-tiled-mtl-mc-ccs:        4 tiled mtl mc ccs
> + * @4-tiled-mtl-rc-ccs:        4 tiled mtl rc ccs
> + * @4-tiled-mtl-rc-ccs-cc:     4 tiled mtl rc ccs cc
>   */
>=20
>  /**
> @@ -99,17 +99,17 @@
>   *
>   * arg[3]:
>   *
> - * @4_tiled_dg2_mc_ccs:        4 tiled mc ccs
> - * @4_tiled_dg2_rc_ccs:        4 tiled dg2 rc ccs
> - * @4_tiled_dg2_rc_ccs_cc:     4 tiled dg2 rc ccs cc
> - * @4_tiled_mtl_mc_ccs:        4 tiled mtl mc ccs
> - * @4_tiled_mtl_rc_ccs:        4 tiled mtl rc ccs
> - * @4_tiled_mtl_rc_ccs_cc:     4 tiled mtl rc ccs cc
> - * @y_tiled_ccs:               Y tiled ccs
> - * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
> - * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
> - * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
> - * @yf_tiled_ccs:              YF tiled ccs
> + * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
> + * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
> + * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> + * @4-tiled-mtl-mc-ccs:        4 tiled mtl mc ccs
> + * @4-tiled-mtl-rc-ccs:        4 tiled mtl rc ccs
> + * @4-tiled-mtl-rc-ccs-cc:     4 tiled mtl rc ccs cc
> + * @y-tiled-ccs:               Y tiled ccs
> + * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
> + * @y-tiled-gen12-rc-ccs:      Y tiled gen12 rc ccs
> + * @y-tiled-gen12-rc-ccs-cc:   Y tiled gen12 rc ccs cc
> + * @yf-tiled-ccs:              YF tiled ccs
>   */
>=20
>  /**
> @@ -138,17 +138,17 @@
>   *
>   * arg[3]:
>   *
> - * @4_tiled_dg2_mc_ccs:        4 tiled mc ccs
> - * @4_tiled_dg2_rc_ccs:        4 tiled dg2 rc ccs
> - * @4_tiled_dg2_rc_ccs_cc:     4 tiled dg2 rc ccs cc
> - * @4_tiled_mtl_mc_ccs:        4 tiled mtl mc ccs
> - * @4_tiled_mtl_rc_ccs:        4 tiled mtl rc ccs
> - * @4_tiled_mtl_rc_ccs_cc:     4 tiled mtl rc ccs cc
> - * @y_tiled_ccs:               Y tiled ccs
> - * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
> - * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
> - * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
> - * @yf_tiled_ccs:              YF tiled ccs
> + * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
> + * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
> + * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> + * @4-tiled-mtl-mc-ccs:        4 tiled mtl mc ccs
> + * @4-tiled-mtl-rc-ccs:        4 tiled mtl rc ccs
> + * @4-tiled-mtl-rc-ccs-cc:     4 tiled mtl rc ccs cc
> + * @y-tiled-ccs:               Y tiled ccs
> + * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
> + * @y-tiled-gen12-rc-ccs:      Y tiled gen12 rc ccs
> + * @y-tiled-gen12-rc-ccs-cc:   Y tiled gen12 rc ccs cc
> + * @yf-tiled-ccs:              YF tiled ccs
>   */
>=20
>  #define SDR_PLANE_BASE	3
> @@ -218,17 +218,17 @@ static const struct {
>  	uint64_t modifier;
>  	const char *str;
>  } ccs_modifiers[] =3D {
> -	{I915_FORMAT_MOD_Y_TILED_CCS, "y_tiled_ccs"},
> -	{I915_FORMAT_MOD_Yf_TILED_CCS, "yf_tiled_ccs"},
> -	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> "y_tiled_gen12_rc_ccs"},
> -	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC,
> "y_tiled_gen12_rc_ccs_cc"},
> -	{I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
> "y_tiled_gen12_mc_ccs"},
> -	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4_tiled_dg2_rc_ccs"},
> -	{I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4_tiled_dg2_mc_ccs"},
> -	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
> "4_tiled_dg2_rc_ccs_cc"},
> -	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4_tiled_mtl_rc_ccs"},
> -	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4_tiled_mtl_mc_ccs"},
> -	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC,
> "4_tiled_mtl_rc_ccs_cc"},
> +	{I915_FORMAT_MOD_Y_TILED_CCS, "y-tiled-ccs"},
> +	{I915_FORMAT_MOD_Yf_TILED_CCS, "yf-tiled-ccs"},
> +	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y-tiled-gen12-rc-ccs"},
> +	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y-tiled-gen12-rc-
> ccs-cc"},
> +	{I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y-tiled-gen12-mc-
> ccs"},
> +	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4-tiled-dg2-rc-ccs"},
> +	{I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4-tiled-dg2-mc-ccs"},
> +	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, "4-tiled-dg2-rc-ccs-
> cc"},
> +	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
> +	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
> +	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-
> cc"},
>  };
>=20
>  static bool check_ccs_planes;
> --
> 2.40.0
