Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B296E8B2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 00:08:32 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:14:08 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210302001408.GA8099@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-13-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-13-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 12/14] tools/intel_display_poller: Add
 VRR push support
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

On Mon, Mar 01, 2021 at 12:37:45PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Add a new command line knob to specify the scanline on which we
> should send the VRR push. This allows many of the test modes
> to probe the hardware behaviour in the presence of VRR pushes.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 134 +++++++++++++++++++++++++++++------
>  1 file changed, 112 insertions(+), 22 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 3b3375ec..37383dc8 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -159,6 +159,29 @@ static uint32_t dspsurf_reg(uint32_t devid, int pipe=
, bool async)
>  		return PIPE_REG(plane, DSPASURF);
>  }
>  =

> +static int pipe_to_transcoder(uint32_t devid, int pipe)
> +{
> +	int gen =3D intel_gen(devid);
> +
> +	if (IS_HASWELL(devid) || IS_BROADWELL(devid) ||
> +	    gen =3D=3D 9 || gen =3D=3D 10 || gen =3D=3D 11) {
> +		/* FIXME not 100% robust */
> +		if (read_reg(PIPE_REG(pipe, PIPEACONF)) & PIPEACONF_ENABLE)
> +			return pipe;
> +		else
> +			return 0xf; /* EDP */
> +	} else {
> +		return pipe;
> +	}
> +}
> +
> +static uint32_t trans_reg(uint32_t devid, int pipe, uint32_t reg)
> +{
> +	int trans =3D pipe_to_transcoder(devid, pipe);
> +
> +	return PIPE_REG(trans, reg);
> +}
> +
>  static void enable_async_flip(uint32_t devid, int pipe, bool enable)
>  {
>  	int plane =3D pipe_to_plane(devid, pipe);
> @@ -175,6 +198,26 @@ static void enable_async_flip(uint32_t devid, int pi=
pe, bool enable)
>  	write_reg(PIPE_REG(plane, DSPACNTR), tmp);
>  }
>  =

> +static void push_vrr(uint32_t devid, int pipe, int vrr_push_scanline)
> +{
> +	uint32_t dsl =3D PIPE_REG(pipe, PIPEA_DSL);
> +	uint32_t push =3D trans_reg(devid, pipe, TRANS_PUSH_A);
> +
> +	if (vrr_push_scanline < 0)
> +		return;
> +
> +	if (read_reg(push) & 0x40000000)
> +		return;
> +
> +	while (!quit) {
> +		uint32_t dsl1 =3D read_reg(dsl) & ~0x80000000;
> +		if (dsl1 =3D=3D vrr_push_scanline)
> +			break;
> +	}
> +
> +	write_reg(push, 0xc0000000);
> +}
> +
>  static int wait_scanline(int pipe, int target_scanline, bool *field)
>  {
>  	uint32_t dsl_reg =3D PIPE_REG(pipe, PIPEA_DSL);
> @@ -545,7 +588,8 @@ static void poll_dsl_iir_gen3(int pipe, int bit,
>  }
>  =

>  static void poll_dsl_deiir(uint32_t devid, int pipe, int bit,
> -			   uint32_t *min, uint32_t *max, const int count)
> +			   uint32_t *min, uint32_t *max, const int count,
> +			   int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1, dsl2, iir1, iir2, imr_save, ier_save;
>  	bool field1, field2;
> @@ -574,6 +618,8 @@ static void poll_dsl_deiir(uint32_t devid, int pipe, =
int bit,
>  	write_reg(iir, bit);
>  =

>  	while (!quit) {
> +		push_vrr(devid, pipe, vrr_push_scanline);
> +
>  		while (!quit) {
>  			dsl1 =3D read_reg(dsl);
>  			iir1 =3D read_reg(iir);
> @@ -608,7 +654,9 @@ static void poll_dsl_deiir(uint32_t devid, int pipe, =
int bit,
>  	write_reg(ier, ier_save);
>  }
>  =

> -static void poll_dsl_framecount_g4x(int pipe, uint32_t *min, uint32_t *m=
ax, const int count)
> +static void poll_dsl_framecount_g4x(uint32_t devid, int pipe,
> +				    uint32_t *min, uint32_t *max, const int count,
> +				    int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1, dsl2, frm, frm1, frm2;
>  	bool field1, field2;
> @@ -618,6 +666,8 @@ static void poll_dsl_framecount_g4x(int pipe, uint32_=
t *min, uint32_t *max, cons
>  	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
>  =

>  	while (!quit) {
> +		push_vrr(devid, pipe, vrr_push_scanline);
> +
>  		while (!quit) {
>  			dsl1 =3D read_reg(dsl);
>  			frm1 =3D read_reg(frm);
> @@ -645,7 +695,8 @@ static void poll_dsl_framecount_g4x(int pipe, uint32_=
t *min, uint32_t *max, cons
>  }
>  =

>  static void poll_dsl_flipcount_g4x(uint32_t devid, int pipe,
> -				   uint32_t *min, uint32_t *max, const int count)
> +				   uint32_t *min, uint32_t *max, const int count,
> +				   int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1, dsl2, flp, flp1, flp2, surf;
>  	bool field1, field2;
> @@ -676,6 +727,7 @@ static void poll_dsl_flipcount_g4x(uint32_t devid, in=
t pipe,
>  			return;
>  =

>  		write_reg(surf, read_reg(surf));
> +		push_vrr(devid, pipe, vrr_push_scanline);
>  =

>  		while (!quit) {
>  			dsl1 =3D read_reg(dsl);
> @@ -738,7 +790,8 @@ static void poll_dsl_framecount_gen3(int pipe, uint32=
_t *min, uint32_t *max, con
>  =

>  =

>  static void poll_dsl_frametimestamp(uint32_t devid, int pipe,
> -				    uint32_t *min, uint32_t *max, const int count)
> +				    uint32_t *min, uint32_t *max, const int count,
> +				    int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1, dsl2, frm, frm1, frm2;
>  	bool field1, field2;
> @@ -748,6 +801,8 @@ static void poll_dsl_frametimestamp(uint32_t devid, i=
nt pipe,
>  	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
>  =

>  	while (!quit) {
> +		push_vrr(devid, pipe, vrr_push_scanline);
> +
>  		while (!quit) {
>  			dsl1 =3D read_reg(dsl);
>  			frm1 =3D read_reg(frm);
> @@ -785,7 +840,8 @@ static uint32_t timestamp_reg(uint32_t devid)
>  }
>  =

>  static void poll_dsl_timestamp(uint32_t devid, int pipe, int target_scan=
line,
> -			       uint32_t *min, uint32_t *max, const int count)
> +			       uint32_t *min, uint32_t *max, const int count,
> +			       int vrr_push_scanline)
>  {
>  	uint32_t dsl1, frm, frm1, ts, ts1;
>  	bool field1;
> @@ -795,6 +851,8 @@ static void poll_dsl_timestamp(uint32_t devid, int pi=
pe, int target_scanline,
>  	frm =3D PIPE_REG(pipe, PIPEAFRMTMSMTP);
>  =

>  	while (!quit) {
> +		push_vrr(devid, pipe, vrr_push_scanline);
> +
>  		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		frm1 =3D read_reg(frm);
> @@ -811,7 +869,8 @@ static void poll_dsl_timestamp(uint32_t devid, int pi=
pe, int target_scanline,
>  }
>  =

>  static void poll_dsl_pan(uint32_t devid, int pipe, int target_scanline, =
int target_fuzz,
> -			 uint32_t *min, uint32_t *max, const int count)
> +			 uint32_t *min, uint32_t *max, const int count,
> +			 int vrr_push_scanline)
>  {
>  	uint32_t dsl1 =3D 0, dsl2 =3D 0;
>  	bool field1 =3D false, field2 =3D false;
> @@ -826,6 +885,7 @@ static void poll_dsl_pan(uint32_t devid, int pipe, in=
t target_scanline, int targ
>  		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		write_reg(surf, saved+256);
> +		push_vrr(devid, pipe, vrr_push_scanline);
>  =

>  		dsl2 =3D wait_scanline(pipe, target_scanline + target_fuzz, &field2);
>  =

> @@ -845,7 +905,8 @@ static void poll_dsl_pan(uint32_t devid, int pipe, in=
t target_scanline, int targ
>  }
>  =

>  static void poll_dsl_flip(uint32_t devid, int pipe, int target_scanline,=
 int target_fuzz,
> -			  uint32_t *min, uint32_t *max, const int count, bool async)
> +			  uint32_t *min, uint32_t *max, const int count, bool async,
> +			  int vrr_push_scanline)
>  {
>  	uint32_t dsl1 =3D 0, dsl2 =3D 0;
>  	bool field1 =3D false, field2 =3D false;
> @@ -862,6 +923,7 @@ static void poll_dsl_flip(uint32_t devid, int pipe, i=
nt target_scanline, int tar
>  		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
>  =

>  		write_reg(surf, saved+256*1024);
> +		push_vrr(devid, pipe, vrr_push_scanline);
>  =

>  		dsl2 =3D wait_scanline(pipe, target_scanline + target_fuzz, &field2);
>  =

> @@ -944,7 +1006,8 @@ static void poll_dsl_flipdone_pipestat(uint32_t devi=
d, int pipe, int target_scan
>  }
>  =

>  static void poll_dsl_flipdone_deiir(uint32_t devid, int pipe, int target=
_scanline, int target_fuzz,
> -				    uint32_t *min, uint32_t *max, const int count, bool async)
> +				    uint32_t *min, uint32_t *max, const int count, bool async,
> +				    int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1 =3D 0, dsl2 =3D 0;
>  	uint32_t iir, iir2, ier, imr;
> @@ -997,6 +1060,7 @@ static void poll_dsl_flipdone_deiir(uint32_t devid, =
int pipe, int target_scanlin
>  		else
>  			next =3D saved;
>  		write_reg(surf, next);
> +		push_vrr(devid, pipe, vrr_push_scanline);
>  =

>  		while (!quit) {
>  			iir2 =3D read_reg(iir);
> @@ -1028,7 +1092,8 @@ static void poll_dsl_flipdone_deiir(uint32_t devid,=
 int pipe, int target_scanlin
>  }
>  =

>  static void poll_dsl_surflive(uint32_t devid, int pipe,
> -			      uint32_t *min, uint32_t *max, const int count, bool async)
> +			      uint32_t *min, uint32_t *max, const int count, bool async,
> +			      int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1 =3D 0, dsl2 =3D 0, surf, surf1, surf2, surflive, sur=
fl1 =3D 0, surfl2, saved, tmp;
>  	bool field1 =3D false, field2 =3D false;
> @@ -1047,6 +1112,7 @@ static void poll_dsl_surflive(uint32_t devid, int p=
ipe,
>  =

>  	while (!quit) {
>  		write_reg(surf, surf2);
> +		push_vrr(devid, pipe, vrr_push_scanline);
>  =

>  		while (!quit) {
>  			dsl1 =3D read_reg(dsl);
> @@ -1083,7 +1149,9 @@ static void poll_dsl_surflive(uint32_t devid, int p=
ipe,
>  	write_reg(surf, saved);
>  }
>  =

> -static void poll_dsl_wrap(int pipe, uint32_t *min, uint32_t *max, const =
int count)
> +static void poll_dsl_wrap(uint32_t devid, int pipe,
> +			  uint32_t *min, uint32_t *max, const int count,
> +			  int vrr_push_scanline)
>  {
>  	uint32_t dsl, dsl1, dsl2;
>  	bool field1, field2;
> @@ -1092,6 +1160,8 @@ static void poll_dsl_wrap(int pipe, uint32_t *min, =
uint32_t *max, const int coun
>  	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
>  =

>  	while (!quit) {
> +		push_vrr(devid, pipe, vrr_push_scanline);
> +
>  		while (!quit) {
>  			dsl1 =3D read_reg(dsl);
>  			dsl2 =3D read_reg(dsl);
> @@ -1211,7 +1281,8 @@ static void __attribute__((noreturn)) usage(const c=
har *name)
>  		" -l,--line <target scanline/pixel>\n"
>  		" -f,--fuzz <target fuzz>\n"
>  		" -x,--pixel\n"
> -		" -a,--async\n",
> +		" -a,--async\n"
> +		" -v,--vrr-push <push scanline>\n",
>  		name);
>  	exit(1);
>  }
> @@ -1223,6 +1294,7 @@ int main(int argc, char *argv[])
>  	int pipe =3D 0, bit =3D 0, target_scanline =3D 0, target_fuzz =3D 1;
>  	bool test_pixelcount =3D false;
>  	bool test_async_flip =3D false;
> +	int vrr_push_scanline =3D -1;
>  	uint32_t devid;
>  	uint32_t min[2*128] =3D {};
>  	uint32_t max[2*128] =3D {};
> @@ -1239,10 +1311,11 @@ int main(int argc, char *argv[])
>  			{ .name =3D "fuzz", .has_arg =3D required_argument, },
>  			{ .name =3D "pixel", .has_arg =3D no_argument, },
>  			{ .name =3D "async", .has_arg =3D no_argument, },
> +			{ .name =3D "vrr-push", .has_arg =3D required_argument, },
>  			{ },
>  		};
>  =

> -		int opt =3D getopt_long(argc, argv, "t:p:b:l:f:xa", long_options, NULL=
);
> +		int opt =3D getopt_long(argc, argv, "t:p:b:l:f:xav:", long_options, NU=
LL);
>  		if (opt =3D=3D -1)
>  			break;
>  =

> @@ -1311,6 +1384,11 @@ int main(int argc, char *argv[])
>  		case 'a':
>  			test_async_flip =3D true;
>  			break;
> +		case 'v':
> +			vrr_push_scanline =3D atoi(optarg);
> +			if (vrr_push_scanline < 0)
> +				usage(argv[0]);
> +			break;
>  		}
>  	}
>  =

> @@ -1330,6 +1408,9 @@ int main(int argc, char *argv[])
>  		if (test_async_flip)
>  			usage(argv[0]);
>  =

> +		if (vrr_push_scanline >=3D 0)
> +			usage(argv[0]);
> +
>  		switch (test) {
>  		case TEST_IIR:
>  			test =3D TEST_IIR_GEN2;
> @@ -1350,6 +1431,9 @@ int main(int argc, char *argv[])
>  		if (test_async_flip)
>  			usage(argv[0]);
>  =

> +		if (vrr_push_scanline >=3D 0)
> +			usage(argv[0]);
> +
>  		switch (test) {
>  		case TEST_IIR:
>  			test =3D TEST_IIR_GEN3;
> @@ -1383,6 +1467,9 @@ int main(int argc, char *argv[])
>  		if (test_pixelcount)
>  			usage(argv[0]);
>  =

> +		if (vrr_push_scanline >=3D 0)
> +			usage(argv[0]);
> +
>  		switch (test) {
>  		case TEST_IIR:
>  			test =3D TEST_IIR_GEN3;
> @@ -1427,6 +1514,9 @@ int main(int argc, char *argv[])
>  		if (test_pixelcount)
>  			usage(argv[0]);
>  =

> +		if (vrr_push_scanline >=3D 0 && intel_gen(devid) < 11)
> +			usage(argv[0]);
> +
>  		switch (test) {
>  		case TEST_IIR:
>  			test =3D TEST_DEIIR;
> @@ -1488,7 +1578,7 @@ int main(int argc, char *argv[])
>  		break;
>  	case TEST_DEIIR:
>  		assert(!test_pixelcount);
> -		poll_dsl_deiir(devid, pipe, bit, min, max, count);
> +		poll_dsl_deiir(devid, pipe, bit, min, max, count, vrr_push_scanline);
>  		break;
>  	case TEST_FRAMECOUNT_GEN3:
>  		if (test_pixelcount)
> @@ -1498,19 +1588,19 @@ int main(int argc, char *argv[])
>  		break;
>  	case TEST_FRAMECOUNT_G4X:
>  		assert(!test_pixelcount);
> -		poll_dsl_framecount_g4x(pipe, min, max, count);
> +		poll_dsl_framecount_g4x(devid, pipe, min, max, count, vrr_push_scanlin=
e);
>  		break;
>  	case TEST_FRAMETIMESTAMP:
>  		assert(!test_pixelcount);
> -		poll_dsl_frametimestamp(devid, pipe, min, max, count);
> +		poll_dsl_frametimestamp(devid, pipe, min, max, count, vrr_push_scanlin=
e);
>  		break;
>  	case TEST_TIMESTAMP:
>  		assert(!test_pixelcount);
> -		poll_dsl_timestamp(devid, pipe, target_scanline, min, max, count);
> +		poll_dsl_timestamp(devid, pipe, target_scanline, min, max, count, vrr_=
push_scanline);
>  		break;
>  	case TEST_FLIPCOUNT:
>  		assert(!test_pixelcount);
> -		poll_dsl_flipcount_g4x(devid, pipe, min, max, count);
> +		poll_dsl_flipcount_g4x(devid, pipe, min, max, count, vrr_push_scanline=
);
>  		break;
>  	case TEST_PAN:
>  		if (test_pixelcount)
> @@ -1518,7 +1608,7 @@ int main(int argc, char *argv[])
>  				       min, max, count);
>  		else
>  			poll_dsl_pan(devid, pipe, target_scanline, target_fuzz,
> -				     min, max, count);
> +				     min, max, count, vrr_push_scanline);
>  		break;
>  	case TEST_FLIP:
>  		if (test_pixelcount)
> @@ -1526,7 +1616,7 @@ int main(int argc, char *argv[])
>  					min, max, count);
>  		else
>  			poll_dsl_flip(devid, pipe, target_scanline, target_fuzz,
> -				      min, max, count, test_async_flip);
> +				      min, max, count, test_async_flip, vrr_push_scanline);
>  		break;
>  	case TEST_FLIPDONE_PIPESTAT:
>  		poll_dsl_flipdone_pipestat(devid, pipe, target_scanline, target_fuzz,
> @@ -1534,16 +1624,16 @@ int main(int argc, char *argv[])
>  		break;
>  	case TEST_FLIPDONE_DEIIR:
>  		poll_dsl_flipdone_deiir(devid, pipe, target_scanline, target_fuzz,
> -					min, max, count, test_async_flip);
> +					min, max, count, test_async_flip, vrr_push_scanline);
>  		break;
>  	case TEST_SURFLIVE:
> -		poll_dsl_surflive(devid, pipe, min, max, count, test_async_flip);
> +		poll_dsl_surflive(devid, pipe, min, max, count, test_async_flip, vrr_p=
ush_scanline);
>  		break;
>  	case TEST_WRAP:
>  		if (test_pixelcount)
>  			poll_pixel_wrap(pipe, min, max, count);
>  		else
> -			poll_dsl_wrap(pipe, min, max, count);
> +			poll_dsl_wrap(devid, pipe, min, max, count, vrr_push_scanline);
>  		break;
>  	case TEST_FIELD:
>  		poll_dsl_field(pipe, min, max, count);
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
