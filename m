Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5845F10F1F2
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 11:37:22 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Srivastava, Vikas" <vikas.srivastava@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Stolarek,
 Karolina" <karolina.stolarek@intel.com>
Date: Fri, 31 Mar 2023 11:37:18 +0000
Message-ID: <DM6PR11MB44927147C210F4C7A8DCB6C18D8F9@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230331102507.2987857-1-vikas.srivastava@intel.com>
 <20230331102507.2987857-2-vikas.srivastava@intel.com>
In-Reply-To: <20230331102507.2987857-2-vikas.srivastava@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4 v2] lib/intel_batchbuffer: Enable
 XY_FAST_COPY_BLT support for api_intel_bb
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vikas
> Srivastava
> Sent: 31 March 2023 03:55 PM
> To: igt-dev@lists.freedesktop.org; Stolarek, Karolina
> <karolina.stolarek@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 1/4 v2] lib/intel_batchbuffer: Enable
> XY_FAST_COPY_BLT support for api_intel_bb
>=20
> Test case uses legacy command XY_SRC_COPY_BLT_CMD which is not
> supported on newer platforms. Modify test to use XY_FAST_COPY_BLT.
>=20
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/intel_batchbuffer.c | 57 ++++++++++++++++++++++++++---------------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>=20
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c index
> 40e444ad9b..a4cc6c958e 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2409,11 +2409,16 @@ uint32_t intel_bb_copy_data(struct intel_bb
> *ibb,
>   */
>  void intel_bb_blit_start(struct intel_bb *ibb, uint32_t flags)  {
> -	intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> -		     XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		     XY_SRC_COPY_BLT_WRITE_RGB |
> -		     flags |
> -		     (6 + 2 * (ibb->gen >=3D 8)));
> +	if (blt_has_fast_copy(ibb->i915))
> +		intel_bb_out(ibb, XY_FAST_COPY_BLT | flags);
> +	else if (blt_has_xy_src_copy(ibb->i915))
> +		intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			     XY_SRC_COPY_BLT_WRITE_RGB |
> +			     flags |
> +			     (6 + 2 * (ibb->gen >=3D 8)));
> +	else
> +		igt_assert_f(0, "No supported blit command found\n");
>  }
>=20
>  /*
> @@ -2451,12 +2456,20 @@ void intel_bb_emit_blt_copy(struct intel_bb
> *ibb,
>=20
>  	if (gen >=3D 4 && src->tiling !=3D I915_TILING_NONE) {
>  		src_pitch /=3D 4;
> -		cmd_bits |=3D XY_SRC_COPY_BLT_SRC_TILED;
> +		if (blt_has_fast_copy(ibb->i915))
> +			cmd_bits |=3D fast_copy_dword0(src->tiling, dst-
> >tiling);
> +		else if (blt_has_xy_src_copy(ibb->i915))
> +			cmd_bits |=3D XY_SRC_COPY_BLT_SRC_TILED;
> +		else
> +			igt_assert_f(0, "No supported blit command
> found\n");
>  	}
>=20
>  	if (gen >=3D 4 && dst->tiling !=3D I915_TILING_NONE) {
>  		dst_pitch /=3D 4;
> -		cmd_bits |=3D XY_SRC_COPY_BLT_DST_TILED;
> +		if (blt_has_fast_copy(ibb->i915))
> +			cmd_bits |=3D fast_copy_dword0(src->tiling, dst-
> >tiling);
> +		else
> +			cmd_bits |=3D XY_SRC_COPY_BLT_DST_TILED;
>  	}
>=20
>  	CHECK_RANGE(src_x1); CHECK_RANGE(src_y1); @@ -2467,19
> +2480,23 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
>  	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
>=20
>  	br13_bits =3D 0;
> -	switch (bpp) {
> -	case 8:
> -		break;
> -	case 16:		/* supporting only RGB565, not ARGB1555 */
> -		br13_bits |=3D 1 << 24;
> -		break;
> -	case 32:
> -		br13_bits |=3D 3 << 24;
> -		cmd_bits |=3D (XY_SRC_COPY_BLT_WRITE_ALPHA |
> -			     XY_SRC_COPY_BLT_WRITE_RGB);
> -		break;
> -	default:
> -		igt_fail(IGT_EXIT_FAILURE);
> +	if (blt_has_xy_src_copy(ibb->i915)) {
> +		switch (bpp) {
> +		case 8:
> +			break;
> +		case 16:		/* supporting only RGB565, not
> ARGB1555 */
> +			br13_bits |=3D 1 << 24;
> +			break;
> +		case 32:
> +			br13_bits |=3D 3 << 24;
> +			cmd_bits |=3D (XY_SRC_COPY_BLT_WRITE_ALPHA |
> +				     XY_SRC_COPY_BLT_WRITE_RGB);
> +			break;
> +		default:
> +			igt_fail(IGT_EXIT_FAILURE);
> +		}
> +	} else {
> +		br13_bits =3D fast_copy_dword1(ibb->i915, src->tiling, dst-
> >tiling,
> +bpp);
>  	}
>=20
>  	if ((src->tiling | dst->tiling) >=3D I915_TILING_Y) {
> --
LGTM
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 2.25.1
