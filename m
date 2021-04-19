Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF76E214
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Apr 2021 09:31:55 +0000 (UTC)
Date: Mon, 19 Apr 2021 12:33:00 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YH1OTAZqUSHkRtBT@platvala-desk.ger.corp.intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
 <20210416174841.20132-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416174841.20132-3-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib: Fix option parsing
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 08:48:39PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> --skip-crc-compare and --trace-on-oops mistakenly abort further
> option parsing. So depending on where you have them in your command line
> you get some very confusing behaviour where some of the options get
> totally ignored.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 6a43d955d562..ec05535cd56e 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1014,10 +1014,10 @@ static int common_init(int *argc, char **argv,
>  			goto out;
>  		case OPT_SKIP_CRC:
>  			igt_skip_crc_compare =3D true;
> -			goto out;
> +			break;
>  		case OPT_TRACE_OOPS:
>  			show_ftrace =3D true;
> -			goto out;
> +			break;
>  		case OPT_DEVICE:
>  			assert(optarg);
>  			/* if set by env IGT_DEVICE we need to free it */
> -- =

> 2.26.3
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
