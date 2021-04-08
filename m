Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486B66E2D8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:11:24 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:18:10 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210408181810.GC18350@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-10-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-10-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/14] tools/intel_display_poller:
 Extract wait_scanline()
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 12:37:42PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Pull the code to wait for a specific scanline to a helper.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 69 ++++++++++++------------------------
>  1 file changed, 23 insertions(+), 46 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index d6a77d35..260818db 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -173,6 +173,21 @@ static void enable_async_flip(uint32_t devid, int pi=
pe, bool enable)
>  	write_reg(PIPE_REG(plane, DSPACNTR), tmp);
>  }
>  =

> +static int wait_scanline(int pipe, int target_scanline, bool *field)
> +{
> +	uint32_t dsl_reg =3D PIPE_REG(pipe, PIPEA_DSL);
> +
> +	while (!quit) {
> +		uint32_t dsl =3D read_reg(dsl_reg);
> +		*field =3D dsl & 0x80000000;
> +		dsl &=3D ~0x80000000;
> +		if (dsl =3D=3D target_scanline)
> +			return dsl;
> +	}
> +
> +	return 0;
> +}
> +
>  static void poll_pixel_pipestat(int pipe, int bit, uint32_t *min, uint32=
_t *max, const int count)
>  {
>  	uint32_t pix, pix1, pix2, iir, iir1, iir2, iir_bit, iir_mask;
> @@ -720,34 +735,21 @@ static void poll_dsl_framecount_gen3(int pipe, uint=
32_t *min, uint32_t *max, con
>  static void poll_dsl_pan(uint32_t devid, int pipe, int target_scanline, =
int target_fuzz,
>  			 uint32_t *min, uint32_t *max, const int count)
>  {
> -	uint32_t dsl, dsl1 =3D 0, dsl2 =3D 0;
> +	uint32_t dsl1 =3D 0, dsl2 =3D 0;
>  	bool field1 =3D false, field2 =3D false;
>  	uint32_t saved, surf =3D 0;
>  	int i[2] =3D {};
>  =

> -	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
>  	surf =3D dspoffset_reg(devid, pipe);
>  =

>  	saved =3D read_reg(surf);
>  =

>  	while (!quit) {
> -		while (!quit) {
> -			dsl1 =3D read_reg(dsl);
> -			field1 =3D dsl1 & 0x80000000;
> -			dsl1 &=3D ~0x80000000;
> -			if (dsl1 =3D=3D target_scanline)
> -				break;
> -		}
> +		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		write_reg(surf, saved+256);
>  =

> -		while (!quit) {
> -			dsl2 =3D read_reg(dsl);
> -			field2 =3D dsl1 & 0x80000000;
> -			dsl2 &=3D ~0x80000000;
> -			if (dsl2 =3D=3D target_scanline + target_fuzz)
> -				break;
> -		}
> +		dsl2 =3D wait_scanline(pipe, target_scanline + target_fuzz, &field2);
>  =

>  		write_reg(surf, saved);
>  =

> @@ -767,12 +769,11 @@ static void poll_dsl_pan(uint32_t devid, int pipe, =
int target_scanline, int targ
>  static void poll_dsl_flip(uint32_t devid, int pipe, int target_scanline,=
 int target_fuzz,
>  			  uint32_t *min, uint32_t *max, const int count, bool async)
>  {
> -	uint32_t dsl, dsl1 =3D 0, dsl2 =3D 0;
> +	uint32_t dsl1 =3D 0, dsl2 =3D 0;
>  	bool field1 =3D false, field2 =3D false;
>  	uint32_t saved, surf =3D 0;
>  	int i[2] =3D {};
>  =

> -	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
>  	surf =3D dspsurf_reg(devid, pipe, async);
>  =

>  	saved =3D read_reg(surf);
> @@ -780,23 +781,11 @@ static void poll_dsl_flip(uint32_t devid, int pipe,=
 int target_scanline, int tar
>  	enable_async_flip(devid, pipe, async);
>  =

>  	while (!quit) {
> -		while (!quit) {
> -			dsl1 =3D read_reg(dsl);
> -			field1 =3D dsl1 & 0x80000000;
> -			dsl1 &=3D ~0x80000000;
> -			if (dsl1 =3D=3D target_scanline)
> -				break;
> -		}
> +		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		write_reg(surf, saved+256*1024);
>  =

> -		while (!quit) {
> -			dsl2 =3D read_reg(dsl);
> -			field2 =3D dsl1 & 0x80000000;
> -			dsl2 &=3D ~0x80000000;
> -			if (dsl2 =3D=3D target_scanline + target_fuzz)
> -				break;
> -		}
> +		dsl2 =3D wait_scanline(pipe, target_scanline + target_fuzz, &field2);
>  =

>  		write_reg(surf, saved);
>  =

> @@ -839,13 +828,7 @@ static void poll_dsl_flipdone_pipestat(uint32_t devi=
d, int pipe, int target_scan
>  	enable_async_flip(devid, pipe, async);
>  =

>  	while (!quit) {
> -		while (!quit) {
> -			dsl1 =3D read_reg(dsl);
> -			field1 =3D dsl1 & 0x80000000;
> -			dsl1 &=3D ~0x80000000;
> -			if (dsl1 =3D=3D target_scanline)
> -				break;
> -		}
> +		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		write_reg(pipestat, pipestat1 | bit);
>  		if (next =3D=3D saved)
> @@ -928,13 +911,7 @@ static void poll_dsl_flipdone_deiir(uint32_t devid, =
int pipe, int target_scanlin
>  	enable_async_flip(devid, pipe, async);
>  =

>  	while (!quit) {
> -		while (!quit) {
> -			dsl1 =3D read_reg(dsl);
> -			field1 =3D dsl1 & 0x80000000;
> -			dsl1 &=3D ~0x80000000;
> -			if (dsl1 =3D=3D target_scanline)
> -				break;
> -		}
> +		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		write_reg(iir, bit);
>  		if (next =3D=3D saved)
> -- =

> 2.19.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
