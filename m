Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A806F896E7
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Feb 2021 14:31:53 +0000 (UTC)
Date: Fri, 12 Feb 2021 16:31:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YCaRVjmkh6sxPNXs@intel.com>
References: <20210212054447.31713-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212054447.31713-1-mario.kleiner.de@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms-hdr: Fix
 HDMI_STATIC_METADATA_TYPE1.
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
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 12, 2021 at 06:44:47AM +0100, Mario Kleiner wrote:
> According to the CTA 861.G specification, table 44
> in section 6.9 and also specifically section 6.9.1,
> the value of the constant must be 0, not 1, so fix
> this.
> =

> An identical fix has been submitted for inclusion into
> the kernel headers (this is not exposed uapi). See:
> =

> https://lists.freedesktop.org/archives/dri-devel/2021-February/297233.html
> =

> Fixing this constant for Kodi also fixed some HDR TVs,
> so the wrong constant has real world consequences on
> some display hardware. See:
> =

> https://github.com/xbmc/xbmc/pull/19129
> =

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks. Pushed.

> ---
>  tests/kms_hdr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index aa7e685b..e9dd7f27 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -35,7 +35,7 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and =
bpc switch");
>  =

>  /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>  enum hdmi_metadata_type {
> -	HDMI_STATIC_METADATA_TYPE1 =3D 1,
> +	HDMI_STATIC_METADATA_TYPE1 =3D 0,
>  };
>  =

>  enum hdmi_eotf {
> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
