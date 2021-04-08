Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2991B6E2C7
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 17:56:44 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:03:29 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210408180323.GB18296@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-14-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-14-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 13/14] tools/intel_display_poller: Add
 vrr-wrap test
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

On Mon, Mar 01, 2021 at 12:37:46PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> The VRR_STATUS2 registers contains yet anoher scanline counter.
> Let's add a test to check when it wraps.
> =

> Not sure this is actually useful. A better way might be to
> allow wholesale replacement of the normal scanline counter
> register with the VRR STATUS2? Not sure we care about this
> register at all actually.

Why do we need this test? This vertical scanline counter is just used
to issue flip on a particular scanline mostly used for HW debug.
How did you use the wrap test for testing VRR?

Manasi

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_display_poller.c | 43 ++++++++++++++++++++++++++++++------
>  1 file changed, 36 insertions(+), 7 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 37383dc8..6c417050 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -59,6 +59,7 @@ enum test {
>  	TEST_FLIPDONE_DEIIR,
>  	TEST_SURFLIVE,
>  	TEST_WRAP,
> +	TEST_VRR_WRAP,
>  	TEST_FIELD,
>  };
>  =

> @@ -1149,16 +1150,14 @@ static void poll_dsl_surflive(uint32_t devid, int=
 pipe,
>  	write_reg(surf, saved);
>  }
>  =

> -static void poll_dsl_wrap(uint32_t devid, int pipe,
> -			  uint32_t *min, uint32_t *max, const int count,
> -			  int vrr_push_scanline)
> +static void _poll_dsl_wrap(uint32_t devid, int pipe,
> +			   uint32_t *min, uint32_t *max, const int count,
> +			   int vrr_push_scanline, uint32_t dsl)
>  {
> -	uint32_t dsl, dsl1, dsl2;
> +	uint32_t dsl1, dsl2;
>  	bool field1, field2;
>  	int i[2] =3D {};
>  =

> -	dsl =3D PIPE_REG(pipe, PIPEA_DSL);
> -
>  	while (!quit) {
>  		push_vrr(devid, pipe, vrr_push_scanline);
>  =

> @@ -1186,6 +1185,24 @@ static void poll_dsl_wrap(uint32_t devid, int pipe,
>  	}
>  }
>  =

> +static void poll_dsl_wrap(uint32_t devid,
> +			  int pipe, uint32_t *min, uint32_t *max, const int count,
> +			  int vrr_push_scanline)
> +{
> +	return _poll_dsl_wrap(devid, pipe, min, max, count,
> +			      vrr_push_scanline,
> +			      PIPE_REG(pipe, PIPEA_DSL));
> +}
> +
> +static void poll_vrr_wrap(uint32_t devid,
> +			  int pipe, uint32_t *min, uint32_t *max, const int count,
> +			  int vrr_push_scanline)
> +{
> +	return _poll_dsl_wrap(devid, pipe, min, max, count,
> +			      vrr_push_scanline,
> +			      trans_reg(devid, pipe, TRANS_VRR_STATUS2_A));
> +}
> +
>  static void poll_dsl_field(int pipe, uint32_t *min, uint32_t *max, const=
 int count)
>  {
>  	uint32_t dsl, dsl1, dsl2;
> @@ -1267,6 +1284,9 @@ static const char *test_name(enum test test, int pi=
pe, int bit, bool test_pixel_
>  	case TEST_FIELD:
>  		snprintf(str, sizeof str, "%s / pipe %c / Field", type, pipe_name(pipe=
));
>  		return str;
> +	case TEST_VRR_WRAP:
> +		snprintf(str, sizeof str, "%s / pipe %c / VRR wrap", type, pipe_name(p=
ipe));
> +		return str;
>  	default:
>  		return "";
>  	}
> @@ -1275,7 +1295,7 @@ static const char *test_name(enum test test, int pi=
pe, int bit, bool test_pixel_
>  static void __attribute__((noreturn)) usage(const char *name)
>  {
>  	fprintf(stderr, "Usage: %s [options]\n"
> -		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestam=
p|pan|flip|flipdone|surflive|wrap|field>\n"
> +		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestam=
p|pan|flip|flipdone|surflive|wrap|field|vrr-wrap>\n"
>  		" -p,--pipe <pipe>\n"
>  		" -b,--bit <bit>\n"
>  		" -l,--line <target scanline/pixel>\n"
> @@ -1345,6 +1365,8 @@ int main(int argc, char *argv[])
>  				test =3D TEST_WRAP;
>  			else if (!strcmp(optarg, "field"))
>  				test =3D TEST_FIELD;
> +			else if (!strcmp(optarg, "vrr-wrap"))
> +				test =3D TEST_VRR_WRAP;
>  			else
>  				usage(argv[0]);
>  			break;
> @@ -1527,6 +1549,10 @@ int main(int argc, char *argv[])
>  		case TEST_FLIPDONE:
>  			test =3D TEST_FLIPDONE_DEIIR;
>  			break;
> +		case TEST_VRR_WRAP:
> +			if (intel_gen(devid) < 11)
> +				usage(argv[0]);
> +			break;
>  		case TEST_FLIPCOUNT:
>  		case TEST_PAN:
>  		case TEST_FLIP:
> @@ -1638,6 +1664,9 @@ int main(int argc, char *argv[])
>  	case TEST_FIELD:
>  		poll_dsl_field(pipe, min, max, count);
>  		break;
> +	case TEST_VRR_WRAP:
> +		poll_vrr_wrap(devid, pipe, min, max, count, vrr_push_scanline);
> +		break;
>  	default:
>  		assert(0);
>  	}
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
