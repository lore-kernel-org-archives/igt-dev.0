Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68326E8AB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 00:11:14 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:16:52 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210302001652.GB8099@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-15-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-15-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 14/14] tools/intel_display_poller: Add
 vrr-push test
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

On Mon, Mar 01, 2021 at 12:37:47PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Add another VRR test, this time to dermine on which scanline
> the hardware will clear the push bit.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 59 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 6c417050..fa77f9ea 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -61,6 +61,7 @@ enum test {
>  	TEST_WRAP,
>  	TEST_VRR_WRAP,
>  	TEST_FIELD,
> +	TEST_VRR_PUSH,
>  };
>  =

>  static uint32_t vlv_offset;
> @@ -1230,6 +1231,50 @@ static void poll_dsl_field(int pipe, uint32_t *min=
, uint32_t *max, const int cou
>  	}
>  }
>  =

> +static void poll_dsl_vrr_push(uint32_t devid, int pipe,
> +			      uint32_t *min, uint32_t *max, const int count,
> +			      int vrr_push_scanline)
> +{
> +	uint32_t dsl, dsl1, dsl2;
> +	uint32_t vrr, vrr1, vrr2;
> +	bool field1, field2;
> +	int i[2] =3D {};
> +
> +	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
> +	vrr =3D trans_reg(devid, pipe, TRANS_PUSH_A);
> +
> +	while (!quit) {
> +		push_vrr(devid, pipe, vrr_push_scanline);
> +
> +		while (!quit) {
> +			dsl1 =3D read_reg(dsl);
> +			vrr1 =3D read_reg(vrr);
> +			vrr2 =3D read_reg(vrr);
> +			dsl2 =3D read_reg(dsl);
> +
> +			field1 =3D dsl1 & 0x80000000;
> +			field2 =3D dsl2 & 0x80000000;
> +			dsl1 &=3D ~0x80000000;
> +			dsl2 &=3D ~0x80000000;
> +
> +			if (!(vrr2 & 0x40000000))
> +				break;
> +		}
> +
> +		if (!(vrr1 & 0x40000000))
> +			continue;
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
>  static const char *test_name(enum test test, int pipe, int bit, bool tes=
t_pixel_count)
>  {
>  	static char str[64];
> @@ -1287,6 +1332,9 @@ static const char *test_name(enum test test, int pi=
pe, int bit, bool test_pixel_
>  	case TEST_VRR_WRAP:
>  		snprintf(str, sizeof str, "%s / pipe %c / VRR wrap", type, pipe_name(p=
ipe));
>  		return str;
> +	case TEST_VRR_PUSH:
> +		snprintf(str, sizeof str, "%s / pipe %c / VRR push", type, pipe_name(p=
ipe));
> +		return str;
>  	default:
>  		return "";
>  	}
> @@ -1295,7 +1343,7 @@ static const char *test_name(enum test test, int pi=
pe, int bit, bool test_pixel_
>  static void __attribute__((noreturn)) usage(const char *name)
>  {
>  	fprintf(stderr, "Usage: %s [options]\n"
> -		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestam=
p|pan|flip|flipdone|surflive|wrap|field|vrr-wrap>\n"
> +		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestam=
p|pan|flip|flipdone|surflive|wrap|field|vrr-wrap|vrr-push>\n"
>  		" -p,--pipe <pipe>\n"
>  		" -b,--bit <bit>\n"
>  		" -l,--line <target scanline/pixel>\n"
> @@ -1365,6 +1413,8 @@ int main(int argc, char *argv[])
>  				test =3D TEST_WRAP;
>  			else if (!strcmp(optarg, "field"))
>  				test =3D TEST_FIELD;
> +			else if (!strcmp(optarg, "vrr-push"))
> +				test =3D TEST_VRR_PUSH;
>  			else if (!strcmp(optarg, "vrr-wrap"))
>  				test =3D TEST_VRR_WRAP;
>  			else
> @@ -1549,6 +1599,10 @@ int main(int argc, char *argv[])
>  		case TEST_FLIPDONE:
>  			test =3D TEST_FLIPDONE_DEIIR;
>  			break;
> +		case TEST_VRR_PUSH:
> +			if (vrr_push_scanline < 0)
> +				usage(argv[0]);
> +			/* fallthrough */
>  		case TEST_VRR_WRAP:
>  			if (intel_gen(devid) < 11)
>  				usage(argv[0]);
> @@ -1664,6 +1718,9 @@ int main(int argc, char *argv[])
>  	case TEST_FIELD:
>  		poll_dsl_field(pipe, min, max, count);
>  		break;
> +	case TEST_VRR_PUSH:
> +		poll_dsl_vrr_push(devid, pipe, min, max, count, vrr_push_scanline);
> +		break;
>  	case TEST_VRR_WRAP:
>  		poll_vrr_wrap(devid, pipe, min, max, count, vrr_push_scanline);
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
