Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F678933D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 23:36:08 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:41:42 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210301234142.GC7960@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-4-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-4-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/14] tools/intel_display_poller: Use
 intel_gen()
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

On Mon, Mar 01, 2021 at 12:37:36PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Use intel_gen() to simplify some of the conditions. And for
> the same of consistency we'll replace all the IS_GEN*()s.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index bb115598..0594e918 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -96,7 +96,7 @@ static char pipe_name(int pipe)
>  =

>  static int pipe_to_plane(uint32_t devid, int pipe)
>  {
> -	if (!IS_GEN2(devid) && !IS_GEN3(devid))
> +	if (intel_gen(devid) >=3D 4)
>  		return pipe;
>  =

>  	switch (pipe) {
> @@ -145,7 +145,7 @@ static uint32_t dspsurf_reg(uint32_t devid, int pipe)
>  {
>  	int plane =3D pipe_to_plane(devid, pipe);
>  =

> -	if (IS_GEN2(devid) || IS_GEN3(devid))
> +	if (intel_gen(devid) < 4)
>  		return PIPE_REG(plane, DSPABASE);
>  	else
>  		return PIPE_REG(plane, DSPASURF);
> @@ -1053,7 +1053,7 @@ int main(int argc, char *argv[])
>  	 * check if the requires registers are
>  	 * avilable on the current platform.
>  	 */
> -	if (IS_GEN2(devid)) {
> +	if (intel_gen(devid) =3D=3D 2) {
>  		if (pipe > 1)
>  			usage(argv[0]);
>  =

> @@ -1073,8 +1073,7 @@ int main(int argc, char *argv[])
>  		default:
>  			usage(argv[0]);
>  		}
> -	} else if (IS_GEN3(devid) ||
> -		   (IS_GEN4(devid) && !IS_G4X(devid))) {
> +	} else if (intel_gen(devid) < 5 && !IS_G4X(devid)) {
>  		if (pipe > 1)
>  			usage(argv[0]);
>  =

> @@ -1091,14 +1090,13 @@ int main(int argc, char *argv[])
>  		case TEST_FIELD:
>  			break;
>  		case TEST_FLIP:
> -			if (IS_GEN3(devid))
> +			if (intel_gen(devid) =3D=3D 3)
>  				test =3D TEST_PAN;
>  			break;
>  		default:
>  			usage(argv[0]);
>  		}
> -	} else if (IS_G4X(devid) ||
> -		   IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
> +	} else if (IS_G4X(devid) || IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid=
)) {
>  		if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))
>  			vlv_offset =3D 0x180000;
>  		if (IS_CHERRYVIEW(devid))
> @@ -1129,8 +1127,7 @@ int main(int argc, char *argv[])
>  			usage(argv[0]);
>  		}
>  	} else {
> -		if (pipe > 1 &&
> -		    (IS_GEN5(devid) || IS_GEN6(devid)))
> +		if (pipe > 1 && intel_gen(devid) < 7)
>  			usage(argv[0]);
>  =

>  		if (test_pixelcount)
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
