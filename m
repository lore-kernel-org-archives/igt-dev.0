Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1864E93DF2
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 10:05:08 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20220715202520.23677-3-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
 <20220715202520.23677-3-ville.syrjala@linux.intel.com>
Date: Thu, 04 Aug 2022 13:05:02 +0300
Message-ID: <87zggknx2p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 02/14] tools/intel_vbt_decode: Extract
 dp_vswing()/dp_preemph()
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

On Fri, 15 Jul 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> A bunch of places need to decode the DP vswing/preemph values.
> Fortunately all of them use the the same format so we can
> extract this stuff into a few helpers.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 110 ++++++++++++---------------------------
>  1 file changed, 34 insertions(+), 76 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 1ed03745bd05..13e927edd17f 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -855,6 +855,28 @@ static void dump_dp_max_link_rate(uint16_t version, =
uint8_t dp_max_link_rate)
>  		       link_rate / 100.0f, dp_max_link_rate);
>  }
>=20=20
> +static const char *dp_vswing(u8 vswing)
> +{
> +	switch (vswing) {
> +	case 0: return "0.4V";
> +	case 1: return "0.6V";
> +	case 2: return "0.8V";
> +	case 3: return "1.2V";
> +	default: return "<unknown>";
> +	}
> +}
> +
> +static const char *dp_preemph(u8 preemph)
> +{
> +	switch (preemph) {
> +	case 0: return "0dB";
> +	case 1: return "3.5dB";
> +	case 2: return "6dB";
> +	case 3: return "9.5dB";
> +	default: return "<unknown>";
> +	}
> +}
> +
>  static void dump_child_device(struct context *context,
>  			      const struct child_device_config *child)
>  {
> @@ -1422,44 +1444,12 @@ static void dump_edp(struct context *context,
>  		}
>  		printf("\t\t\tlanes: X%d",
>  		       edp->fast_link_params[i].lanes + 1);
> -		printf("\t\t\tpre-emphasis: ");
> -		switch (edp->fast_link_params[i].preemphasis) {
> -		case EDP_PREEMPHASIS_NONE:
> -			printf("none\n");
> -			break;
> -		case EDP_PREEMPHASIS_3_5dB:
> -			printf("3.5dB\n");
> -			break;
> -		case EDP_PREEMPHASIS_6dB:
> -			printf("6dB\n");
> -			break;
> -		case EDP_PREEMPHASIS_9_5dB:
> -			printf("9.5dB\n");
> -			break;
> -		default:
> -			printf("(unknown value %d)\n",
> -			       edp->fast_link_params[i].preemphasis);
> -			break;
> -		}
> -		printf("\t\t\tvswing: ");
> -		switch (edp->fast_link_params[i].vswing) {
> -		case EDP_VSWING_0_4V:
> -			printf("0.4V\n");
> -			break;
> -		case EDP_VSWING_0_6V:
> -			printf("0.6V\n");
> -			break;
> -		case EDP_VSWING_0_8V:
> -			printf("0.8V\n");
> -			break;
> -		case EDP_VSWING_1_2V:
> -			printf("1.2V\n");
> -			break;
> -		default:
> -			printf("(unknown value %d)\n",
> -			       edp->fast_link_params[i].vswing);
> -			break;
> -		}
> +		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> +		       dp_preemph(edp->fast_link_params[i].preemphasis),
> +		       edp->fast_link_params[i].preemphasis);
> +		printf("\t\t\tvswing: %s (0x%x)\n",
> +		       dp_preemph(edp->fast_link_params[i].vswing),

Copy-paste fail, should be dp_vswing().

Otherwise,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +		       edp->fast_link_params[i].vswing);
>=20=20
>  		if (context->bdb->version >=3D 162) {
>  			bool val =3D (edp->edp_s3d_feature >> i) & 1;
> @@ -1511,44 +1501,12 @@ static void dump_edp(struct context *context,
>=20=20
>  			printf("\t\tFull link params provided: %s\n", YESNO(val));
>  			printf("\t\tFull link params:\n");
> -			printf("\t\t\tpre-emphasis: ");
> -			switch (edp->full_link_params[i].preemphasis) {
> -			case EDP_PREEMPHASIS_NONE:
> -				printf("none\n");
> -				break;
> -			case EDP_PREEMPHASIS_3_5dB:
> -				printf("3.5dB\n");
> -				break;
> -			case EDP_PREEMPHASIS_6dB:
> -				printf("6dB\n");
> -				break;
> -			case EDP_PREEMPHASIS_9_5dB:
> -				printf("9.5dB\n");
> -				break;
> -			default:
> -				printf("(unknown value %d)\n",
> -				       edp->full_link_params[i].preemphasis);
> -				break;
> -			}
> -			printf("\t\t\tvswing: ");
> -			switch (edp->full_link_params[i].vswing) {
> -			case EDP_VSWING_0_4V:
> -				printf("0.4V\n");
> -				break;
> -			case EDP_VSWING_0_6V:
> -				printf("0.6V\n");
> -				break;
> -			case EDP_VSWING_0_8V:
> -				printf("0.8V\n");
> -				break;
> -			case EDP_VSWING_1_2V:
> -				printf("1.2V\n");
> -				break;
> -			default:
> -				printf("(unknown value %d)\n",
> -				       edp->full_link_params[i].vswing);
> -				break;
> -			}
> +			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> +			       dp_preemph(edp->full_link_params[i].preemphasis),
> +			       edp->full_link_params[i].preemphasis);
> +			printf("\t\t\tvswing: %s (0x%x)\n",
> +			       dp_vswing(edp->full_link_params[i].vswing),
> +			       edp->full_link_params[i].vswing);
>  		}
>=20=20
>  		if (context->bdb->version >=3D 224) {

--=20
Jani Nikula, Intel Open Source Graphics Center
