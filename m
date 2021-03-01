Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9A98930C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 23:38:00 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:43:38 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210301234338.GD7960@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-5-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-5-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 04/14] tools/intel_display_poller: Add
 pipe D support
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

On Mon, Mar 01, 2021 at 12:37:37PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Let's support 4 pipes for tgl+.
> =

> v2: Fix up pipe_offsets[] as well
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 0594e918..826833b3 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -58,7 +58,7 @@ enum test {
>  };
>  =

>  static uint32_t vlv_offset;
> -static uint16_t pipe_offset[3] =3D { 0, 0x1000, 0x2000, };
> +static uint16_t pipe_offset[4] =3D { 0, 0x1000, 0x2000, 0x3000, };
>  =

>  #define PIPE_REG(pipe, reg_a) (pipe_offset[(pipe)] + (reg_a))
>  =

> @@ -1023,7 +1023,7 @@ int main(int argc, char *argv[])
>  				pipe -=3D '0';
>  			else
>  				usage(argv[0]);
> -			if (pipe < 0 || pipe > 2)
> +			if (pipe < 0 || pipe > 3)
>  				usage(argv[0]);
>  			break;
>  		case 'b':
> @@ -1104,6 +1104,8 @@ int main(int argc, char *argv[])
>  =

>  		if (pipe > 1 && !IS_CHERRYVIEW(devid))
>  			usage(argv[0]);
> +		if (pipe > 2)
> +			usage(argv[0]);
>  =

>  		if (test_pixelcount)
>  			usage(argv[0]);
> @@ -1129,6 +1131,10 @@ int main(int argc, char *argv[])
>  	} else {
>  		if (pipe > 1 && intel_gen(devid) < 7)
>  			usage(argv[0]);
> +		if (pipe > 2 && intel_gen(devid) < 12)
> +			usage(argv[0]);
> +		if (pipe > 3)
> +			usage(argv[0]);
>  =

>  		if (test_pixelcount)
>  			usage(argv[0]);
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
