Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C83E6E2D8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:08:50 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:15:37 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210408181537.GB18350@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-3-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-3-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 02/14] tools/intel_display_poller: Unify
 ilk+ and bdw+ codepaths
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

On Mon, Mar 01, 2021 at 12:37:35PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> The ilk+ and bdw+ codepaths are identical, except for the ilk/snb
> pipe C check. Unify them.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Cleanup looks good to me

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 26 +-------------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 15da8e76..bb115598 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -1128,8 +1128,7 @@ int main(int argc, char *argv[])
>  		default:
>  			usage(argv[0]);
>  		}
> -	} else if (HAS_PCH_SPLIT(devid) &&
> -		   (IS_GEN5(devid) || IS_GEN6(devid) || IS_GEN7(devid))) {
> +	} else {
>  		if (pipe > 1 &&
>  		    (IS_GEN5(devid) || IS_GEN6(devid)))
>  			usage(argv[0]);
> @@ -1154,29 +1153,6 @@ int main(int argc, char *argv[])
>  		default:
>  			usage(argv[0]);
>  		}
> -	} else if (intel_gen(devid) >=3D 8) {
> -		if (test_pixelcount)
> -			usage(argv[0]);
> -
> -		switch (test) {
> -		case TEST_IIR:
> -			test =3D TEST_DEIIR;
> -			break;
> -		case TEST_FRAMECOUNT:
> -			test =3D TEST_FRAMECOUNT_G4X;
> -			break;
> -		case TEST_FLIPCOUNT:
> -		case TEST_PAN:
> -		case TEST_FLIP:
> -		case TEST_SURFLIVE:
> -		case TEST_WRAP:
> -		case TEST_FIELD:
> -			break;
> -		default:
> -			usage(argv[0]);
> -		}
> -	} else {
> -		usage(argv[0]);
>  	}
>  =

>  	switch (test) {
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
