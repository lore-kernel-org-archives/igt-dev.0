Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05EF6E8A7
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 23:48:47 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:54:25 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210301235410.GE7960@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-6-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-6-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 05/14] tools/intel_display_poller: Add
 flipdone tests
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

On Mon, Mar 01, 2021 at 12:37:38PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Add test for determining on which scanline the flipdone interrupt
> is signalled. ilk+ and vlv/chv have this. Earlier platforms had
> a "flip pending" bit instead which only seems to respond to CS flips
> so not relevant for MMIO based flips.
> =

> v2: Rework the loops a bit to ease VRR in the future
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Looks good to me in general for checking the flipdone interrupt.
So for the changes here:

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Quick question here:
How do we test this TEST_FLIPDONE with vrr enabled, we need to add setting =
vrr prop etc here?

Manasi

> ---
>  tools/intel_display_poller.c | 187 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 186 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 826833b3..be237221 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -52,6 +52,9 @@ enum test {
>  	TEST_FLIPCOUNT,
>  	TEST_PAN,
>  	TEST_FLIP,
> +	TEST_FLIPDONE,
> +	TEST_FLIPDONE_PIPESTAT,
> +	TEST_FLIPDONE_DEIIR,
>  	TEST_SURFLIVE,
>  	TEST_WRAP,
>  	TEST_FIELD,
> @@ -789,6 +792,158 @@ static void poll_dsl_flip(uint32_t devid, int pipe,=
 int target_scanline, int tar
>  	write_reg(surf, saved);
>  }
>  =

> +static void poll_dsl_flipdone_pipestat(uint32_t devid, int pipe, int tar=
get_scanline, int target_fuzz,
> +				       uint32_t *min, uint32_t *max, const int count)
> +{
> +	uint32_t dsl, dsl1 =3D 0, dsl2 =3D 0;
> +	uint32_t pipestat, pipestat1, pipestat2, pipestat_save;
> +	bool field1 =3D false, field2 =3D false;
> +	uint32_t saved, next, surf =3D 0, bit;
> +	int i[2] =3D {};
> +
> +	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
> +	pipestat =3D PIPE_REG(pipe, PIPEASTAT);
> +	surf =3D dspsurf_reg(devid, pipe);
> +
> +	bit =3D 1 << 10;
> +
> +	saved =3D read_reg(surf);
> +	next =3D saved;
> +
> +	pipestat_save =3D read_reg(pipestat) & 0x7fff0000;
> +	pipestat1 =3D pipestat_save & ~(1 << (bit<<16));
> +	write_reg(pipestat, pipestat1 | bit);
> +
> +	while (!quit) {
> +		while (!quit) {
> +			dsl1 =3D read_reg(dsl);
> +			field1 =3D dsl1 & 0x80000000;
> +			dsl1 &=3D ~0x80000000;
> +			if (dsl1 =3D=3D target_scanline)
> +				break;
> +		}
> +
> +		write_reg(pipestat, pipestat1 | bit);
> +		if (next =3D=3D saved)
> +			next =3D saved+256*1024;
> +		else
> +			next =3D saved;
> +		write_reg(surf, next);
> +
> +		while (!quit) {
> +			pipestat2 =3D read_reg(pipestat);
> +			dsl2 =3D read_reg(dsl);
> +
> +			field2 =3D dsl2 & 0x80000000;
> +			dsl2 &=3D ~0x80000000;
> +
> +			if (pipestat2 & bit)
> +				break;
> +		}
> +
> +		write_reg(pipestat, pipestat1 | bit);
> +
> +		if (field1 !=3D field2)
> +			printf("fields are different (%u:%u -> %u:%u)\n",
> +			       field1, dsl1, field2, dsl2);
> +
> +		min[field1*count+i[field1]] =3D dsl1;
> +		max[field1*count+i[field1]] =3D dsl2;
> +		if (++i[field1] >=3D count)
> +			break;
> +	}
> +
> +	write_reg(surf, saved);
> +	write_reg(pipestat, pipestat_save);
> +}
> +
> +static void poll_dsl_flipdone_deiir(uint32_t devid, int pipe, int target=
_scanline, int target_fuzz,
> +				    uint32_t *min, uint32_t *max, const int count)
> +{
> +	uint32_t dsl, dsl1 =3D 0, dsl2 =3D 0;
> +	uint32_t iir, iir2, ier, imr;
> +	uint32_t ier_save, imr_save;
> +	bool field1 =3D false, field2 =3D false;
> +	uint32_t saved, next, surf =3D 0, bit;
> +	int i[2] =3D {};
> +
> +	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
> +	surf =3D dspsurf_reg(devid, pipe);
> +
> +	if (intel_gen(devid) >=3D 9)
> +		bit =3D 3;
> +	else if (intel_gen(devid) >=3D 8)
> +		bit =3D 4;
> +	else if (intel_gen(devid) >=3D 7)
> +		bit =3D 3 + 5 * pipe;
> +	else if (intel_gen(devid) >=3D 5)
> +		bit =3D 26 + pipe;
> +	else
> +		abort();
> +	bit =3D 1 << bit;
> +
> +	if (intel_gen(devid) >=3D 8) {
> +		iir =3D GEN8_DE_PIPE_IIR(pipe);
> +		ier =3D GEN8_DE_PIPE_IER(pipe);
> +		imr =3D GEN8_DE_PIPE_IMR(pipe);
> +	} else {
> +		iir =3D DEIIR;
> +		ier =3D DEIER;
> +		imr =3D DEIMR;
> +	}
> +
> +	saved =3D read_reg(surf);
> +	next =3D saved;
> +
> +	imr_save =3D read_reg(imr);
> +	ier_save =3D read_reg(ier);
> +	write_reg(ier, ier_save & ~bit);
> +	write_reg(imr, imr_save & ~bit);
> +
> +	while (!quit) {
> +		while (!quit) {
> +			dsl1 =3D read_reg(dsl);
> +			field1 =3D dsl1 & 0x80000000;
> +			dsl1 &=3D ~0x80000000;
> +			if (dsl1 =3D=3D target_scanline)
> +				break;
> +		}
> +
> +		write_reg(iir, bit);
> +		if (next =3D=3D saved)
> +			next =3D saved+256*1024;
> +		else
> +			next =3D saved;
> +		write_reg(surf, next);
> +
> +		while (!quit) {
> +			iir2 =3D read_reg(iir);
> +			dsl2 =3D read_reg(dsl);
> +
> +			field2 =3D dsl2 & 0x80000000;
> +			dsl2 &=3D ~0x80000000;
> +
> +			if (iir2 & bit)
> +				break;
> +		}
> +
> +		write_reg(iir, bit);
> +
> +		if (field1 !=3D field2)
> +			printf("fields are different (%u:%u -> %u:%u)\n",
> +			       field1, dsl1, field2, dsl2);
> +
> +		min[field1*count+i[field1]] =3D dsl1;
> +		max[field1*count+i[field1]] =3D dsl2;
> +		if (++i[field1] >=3D count)
> +			break;
> +	}
> +
> +	write_reg(surf, saved);
> +	write_reg(imr, imr_save);
> +	write_reg(ier, ier_save);
> +}
> +
>  static void poll_dsl_surflive(uint32_t devid, int pipe,
>  			      uint32_t *min, uint32_t *max, const int count)
>  {
> @@ -933,6 +1088,12 @@ static const char *test_name(enum test test, int pi=
pe, int bit, bool test_pixel_
>  	case TEST_FLIP:
>  		snprintf(str, sizeof str, "%s / pipe %c / Flip", type, pipe_name(pipe)=
);
>  		return str;
> +	case TEST_FLIPDONE_PIPESTAT:
> +		snprintf(str, sizeof str, "%s / pipe %c / Flip done (vlv/chv)", type, =
pipe_name(pipe));
> +		return str;
> +	case TEST_FLIPDONE_DEIIR:
> +		snprintf(str, sizeof str, "%s / pipe %c / Flip done (pch)", type, pipe=
_name(pipe));
> +		return str;
>  	case TEST_SURFLIVE:
>  		snprintf(str, sizeof str, "%s / pipe %c / Surflive", type, pipe_name(p=
ipe));
>  		return str;
> @@ -950,7 +1111,7 @@ static const char *test_name(enum test test, int pip=
e, int bit, bool test_pixel_
>  static void __attribute__((noreturn)) usage(const char *name)
>  {
>  	fprintf(stderr, "Usage: %s [options]\n"
> -		" -t,--test <pipestat|iir|framecount|flipcount|pan|flip|surflive|wrap|=
field>\n"
> +		" -t,--test <pipestat|iir|framecount|flipcount|pan|flip|flipdone|surfl=
ive|wrap|field>\n"
>  		" -p,--pipe <pipe>\n"
>  		" -b,--bit <bit>\n"
>  		" -l,--line <target scanline/pixel>\n"
> @@ -1002,6 +1163,8 @@ int main(int argc, char *argv[])
>  				test =3D TEST_PAN;
>  			else if (!strcmp(optarg, "flip"))
>  				test =3D TEST_FLIP;
> +			else if (!strcmp(optarg, "flipdone"))
> +				test =3D TEST_FLIPDONE;
>  			else if (!strcmp(optarg, "surflive"))
>  				test =3D TEST_SURFLIVE;
>  			else if (!strcmp(optarg, "wrap"))
> @@ -1117,6 +1280,16 @@ int main(int argc, char *argv[])
>  		case TEST_FRAMECOUNT:
>  			test =3D TEST_FRAMECOUNT_G4X;
>  			break;
> +		case TEST_FLIPDONE:
> +			/*
> +			 * g4x has no apparent "flip done" interrupt,
> +			 * and the "flip pending" interrupt does not
> +			 * seem to do anything with mmio flips.
> +			 */
> +			if (IS_G4X(devid))
> +				usage(argv[0]);
> +			test =3D TEST_FLIPDONE_PIPESTAT;
> +			break;
>  		case TEST_FLIPCOUNT:
>  		case TEST_PIPESTAT:
>  		case TEST_PAN:
> @@ -1146,6 +1319,9 @@ int main(int argc, char *argv[])
>  		case TEST_FRAMECOUNT:
>  			test =3D TEST_FRAMECOUNT_G4X;
>  			break;
> +		case TEST_FLIPDONE:
> +			test =3D TEST_FLIPDONE_DEIIR;
> +			break;
>  		case TEST_FLIPCOUNT:
>  		case TEST_PAN:
>  		case TEST_FLIP:
> @@ -1161,6 +1337,7 @@ int main(int argc, char *argv[])
>  	switch (test) {
>  	case TEST_IIR:
>  	case TEST_FRAMECOUNT:
> +	case TEST_FLIPDONE:
>  		/* should no longer have the generic tests here */
>  		assert(0);
>  	default:
> @@ -1226,6 +1403,14 @@ int main(int argc, char *argv[])
>  			poll_dsl_flip(devid, pipe, target_scanline, target_fuzz,
>  				      min, max, count);
>  		break;
> +	case TEST_FLIPDONE_PIPESTAT:
> +		poll_dsl_flipdone_pipestat(devid, pipe, target_scanline, target_fuzz,
> +					   min, max, count);
> +		break;
> +	case TEST_FLIPDONE_DEIIR:
> +		poll_dsl_flipdone_deiir(devid, pipe, target_scanline, target_fuzz,
> +					min, max, count);
> +		break;
>  	case TEST_SURFLIVE:
>  		poll_dsl_surflive(devid, pipe, min, max, count);
>  		break;
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
