Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F2F93CF2
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 10:03:18 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20220715202520.23677-2-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
 <20220715202520.23677-2-ville.syrjala@linux.intel.com>
Date: Thu, 04 Aug 2022 13:03:14 +0300
Message-ID: <874jyspbq5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 01/14] tools/intel_vbt_decode: Simplify
 fast link training lane count
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
> Get rid of the pointless switch statement and decode the
> fast link training lane count as just <val>+1. We already
> do the same for the DSI lane count.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 5494a34bdca3..1ed03745bd05 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1420,22 +1420,8 @@ static void dump_edp(struct context *context,
>  			       edp->fast_link_params[i].rate);
>  			break;
>  		}
> -		printf("\t\t\tlanes: ");
> -		switch (edp->fast_link_params[i].lanes) {
> -		case EDP_LANE_1:
> -			printf("x1 mode\n");
> -			break;
> -		case EDP_LANE_2:
> -			printf("x2 mode\n");
> -			break;
> -		case EDP_LANE_4:
> -			printf("x4 mode\n");
> -			break;
> -		default:
> -			printf("(unknown value %d)\n",
> -			       edp->fast_link_params[i].lanes);
> -			break;
> -		}
> +		printf("\t\t\tlanes: X%d",
> +		       edp->fast_link_params[i].lanes + 1);
>  		printf("\t\t\tpre-emphasis: ");
>  		switch (edp->fast_link_params[i].preemphasis) {
>  		case EDP_PREEMPHASIS_NONE:

--=20
Jani Nikula, Intel Open Source Graphics Center
