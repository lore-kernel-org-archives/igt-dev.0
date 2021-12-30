Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D9510E203
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 00:46:06 +0000 (UTC)
From: "Katragadda, MastanX" <mastanx.katragadda@intel.com>
Date: Thu, 30 Dec 2021 00:46:01 +0000
Message-ID: <BN9PR11MB529008205A60142A6DD2051697459@BN9PR11MB5290.namprd11.prod.outlook.com>
References: <20211229144251.3709751-1-mastanx.katragadda@intel.com>
 <87lf039mlu.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87lf039mlu.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/gem_media_vme : skip on no media
 Samplers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Moved this check to   igt_get_media_vme_func is it fine ?       =20

igt_vme_func_t fill =3D NULL;
+       const struct intel_device_info *devinfo =3D intel_get_device_info(d=
evid);
+
+       igt_skip_on_f(devinfo->is_elkhartlake || devinfo->is_jasperlake,
+                       "media-vme samplers not present\n");

        if (IS_GEN11(devid))
                fill =3D gen11_media_vme_func;

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: 30 December 2021 02:04
To: Katragadda, MastanX <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tej=
askumarx.surendrakumar.upadhyay@intel.com>; Ye, Tony <tony.ye@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/gem_media_vme : skip on no media =
Samplers

On Wed, 29 Dec 2021 06:42:51 -0800, Mastan Katragadda wrote:
>
> Media sampers are not present on some of Gen11 platforms adding skip=20
> on EHL and JSL as per Bspec.
>
> Bspec:29151
>
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> ---
>  tests/i915/gem_media_vme.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/i915/gem_media_vme.c b/tests/i915/gem_media_vme.c=20
> index 3ea70386..29e0fda3 100644
> --- a/tests/i915/gem_media_vme.c
> +++ b/tests/i915/gem_media_vme.c
> @@ -90,6 +90,15 @@ static void shut_non_vme_subslices(int drm_fd,=20
> uint32_t ctx)
>
>	gem_context_set_param(drm_fd, &arg);
>  }
> +static bool is_jsl_ehl(uint32_t devid) {
> +	const struct intel_device_info *devinfo =3D=20
> +intel_get_device_info(devid);
> +
> +	if (devinfo->is_elkhartlake || devinfo->is_jasperlake)
> +		return true;
> +
> +	return false;
> +}
>
>  igt_simple_main
>  {
> @@ -104,6 +113,8 @@ igt_simple_main
>
>	devid =3D intel_get_drm_devid(drm_fd);
>
> +	igt_skip_on_f(is_jsl_ehl(devid), "media-vme samplers not=20
> +present\n");
> +
>	media_vme =3D igt_get_media_vme_func(devid);
>	igt_require_f(media_vme, "no media-vme function\n");

I think we should just add the checks to igt_get_media_vme_func().
