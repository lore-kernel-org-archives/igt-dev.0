Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A976E2D1
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:23:49 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:30:34 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210408183034.GE18350@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-11-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-11-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 10/14] tools/intel_display_poller: Add
 frame timestamp tests
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

On Mon, Mar 01, 2021 at 12:37:43PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Add a couple of new test modes to verify how frame timestamps
> work.
> * frametimestamp determines on which scanline the frame
>   timestamp is sampled
> * timestamp returns the difference between the current timestamp
>   on a specific scanline from the last sampled frame timestamp.
>   This can be used to determine if the timestamp ticks at the
>   expected rate.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 103 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 260818db..ae3f993f 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -49,6 +49,8 @@ enum test {
>  	TEST_FRAMECOUNT,
>  	TEST_FRAMECOUNT_GEN3,
>  	TEST_FRAMECOUNT_G4X,
> +	TEST_FRAMETIMESTAMP,
> +	TEST_TIMESTAMP,
>  	TEST_FLIPCOUNT,
>  	TEST_PAN,
>  	TEST_FLIP,
> @@ -732,6 +734,80 @@ static void poll_dsl_framecount_gen3(int pipe, uint3=
2_t *min, uint32_t *max, con
>  	}
>  }
>  =

> +
> +static void poll_dsl_frametimestamp(uint32_t devid, int pipe,
> +				    uint32_t *min, uint32_t *max, const int count)
> +{
> +	uint32_t dsl, dsl1, dsl2, frm, frm1, frm2;
> +	bool field1, field2;
> +	int i[2] =3D {};
> +
> +	frm =3D PIPE_REG(pipe, PIPEAFRMTMSMTP);
> +	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
> +
> +	while (!quit) {
> +		while (!quit) {
> +			dsl1 =3D read_reg(dsl);
> +			frm1 =3D read_reg(frm);
> +			frm2 =3D read_reg(frm);
> +			dsl2 =3D read_reg(dsl);
> +
> +			field1 =3D dsl1 & 0x80000000;
> +			field2 =3D dsl2 & 0x80000000;
> +			dsl1 &=3D ~0x80000000;
> +			dsl2 &=3D ~0x80000000;
> +
> +			if (frm1 !=3D frm2)
> +				break;
> +		}
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
> +}
> +
> +static uint32_t timestamp_reg(uint32_t devid)
> +{
> +	if (intel_gen(devid) >=3D 7)
> +		return IVB_TIMESTAMP_CTR;
> +	else if (intel_gen(devid) >=3D 5)
> +		return ILK_TIMESTAMP_HI;
> +	else
> +		return TIMESTAMP_QW + 4;
> +}
> +
> +static void poll_dsl_timestamp(uint32_t devid, int pipe, int target_scan=
line,
> +			       uint32_t *min, uint32_t *max, const int count)
> +{
> +	uint32_t dsl1, frm, frm1, ts, ts1;
> +	bool field1;
> +	int i[2] =3D {};
> +
> +	ts =3D timestamp_reg(devid);
> +	frm =3D PIPE_REG(pipe, PIPEAFRMTMSMTP);
> +
> +	while (!quit) {
> +		dsl1 =3D wait_scanline(pipe, target_scanline, &field1);
> +
> +		frm1 =3D read_reg(frm);
> +		ts1 =3D read_reg(ts);
> +
> +		field1 =3D dsl1 & 0x80000000;
> +		dsl1 &=3D ~0x80000000;
> +
> +		min[field1*count+i[field1]] =3D dsl1;
> +		max[field1*count+i[field1]] =3D ts1 - frm1;
> +		if (++i[field1] >=3D count)
> +			break;
> +	}
> +}
> +
>  static void poll_dsl_pan(uint32_t devid, int pipe, int target_scanline, =
int target_fuzz,
>  			 uint32_t *min, uint32_t *max, const int count)
>  {
> @@ -1087,6 +1163,12 @@ static const char *test_name(enum test test, int p=
ipe, int bit, bool test_pixel_
>  	case TEST_FRAMECOUNT_G4X:
>  		snprintf(str, sizeof str, "%s / pipe %c / Frame count (g4x+)", type, p=
ipe_name(pipe));
>  		return str;
> +	case TEST_FRAMETIMESTAMP:
> +		snprintf(str, sizeof str, "%s / pipe %c / Frame timestamp", type, pipe=
_name(pipe));
> +		return str;
> +	case TEST_TIMESTAMP:
> +		snprintf(str, sizeof str, "%s / pipe %c / Timestamp", type, pipe_name(=
pipe));
> +		return str;
>  	case TEST_FLIPCOUNT:
>  		snprintf(str, sizeof str, "%s / pipe %c / Flip count (g4x+)", type, pi=
pe_name(pipe));
>  		return str;
> @@ -1119,7 +1201,7 @@ static const char *test_name(enum test test, int pi=
pe, int bit, bool test_pixel_
>  static void __attribute__((noreturn)) usage(const char *name)
>  {
>  	fprintf(stderr, "Usage: %s [options]\n"
> -		" -t,--test <pipestat|iir|framecount|flipcount|pan|flip|flipdone|surfl=
ive|wrap|field>\n"
> +		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestam=
p|pan|flip|flipdone|surflive|wrap|field>\n"
>  		" -p,--pipe <pipe>\n"
>  		" -b,--bit <bit>\n"
>  		" -l,--line <target scanline/pixel>\n"
> @@ -1170,6 +1252,10 @@ int main(int argc, char *argv[])
>  				test =3D TEST_FRAMECOUNT;
>  			else if (!strcmp(optarg, "flipcount"))
>  				test =3D TEST_FLIPCOUNT;
> +			else if (!strcmp(optarg, "frametimestamp"))
> +				test =3D TEST_FRAMETIMESTAMP;
> +			else if (!strcmp(optarg, "timestamp"))
> +				test =3D TEST_TIMESTAMP;
>  			else if (!strcmp(optarg, "pan"))
>  				test =3D TEST_PAN;
>  			else if (!strcmp(optarg, "flip"))
> @@ -1318,6 +1404,11 @@ int main(int argc, char *argv[])
>  		case TEST_WRAP:
>  		case TEST_FIELD:
>  			break;
> +		case TEST_FRAMETIMESTAMP:
> +		case TEST_TIMESTAMP:
> +			if (!IS_G4X(devid))
> +				usage(argv[0]);
> +			break;
>  		default:
>  			usage(argv[0]);
>  		}
> @@ -1348,6 +1439,8 @@ int main(int argc, char *argv[])
>  		case TEST_SURFLIVE:
>  		case TEST_WRAP:
>  		case TEST_FIELD:
> +		case TEST_TIMESTAMP:
> +		case TEST_FRAMETIMESTAMP:
>  			break;
>  		default:
>  			usage(argv[0]);
> @@ -1403,6 +1496,14 @@ int main(int argc, char *argv[])
>  		assert(!test_pixelcount);
>  		poll_dsl_framecount_g4x(pipe, min, max, count);
>  		break;
> +	case TEST_FRAMETIMESTAMP:
> +		assert(!test_pixelcount);
> +		poll_dsl_frametimestamp(devid, pipe, min, max, count);
> +		break;
> +	case TEST_TIMESTAMP:
> +		assert(!test_pixelcount);
> +		poll_dsl_timestamp(devid, pipe, target_scanline, min, max, count);
> +		break;
>  	case TEST_FLIPCOUNT:
>  		assert(!test_pixelcount);
>  		poll_dsl_flipcount_g4x(devid, pipe, min, max, count);
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
