Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18D76E444
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 07:30:44 +0000 (UTC)
Date: Wed, 11 Mar 2020 09:30:41 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200311073041.GB14594@platvala-desk.ger.corp.intel.com>
References: <20200311004235.138072-1-jose.souza@intel.com>
 <20200311004235.138072-3-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311004235.138072-3-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH v2 3/4] tests/kms_frontbuffer_tracking: Enable
 positive test on linear tiling
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
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 05:42:34PM -0700, Jos=E9 Roberto de Souza wrote:
> i915 is making fences not mandatory to enable FBC in newer platforms.
> As BSpec do not have restrictions against tiling formats to enable
> FBC it will be possible to enable FBC with linear tiling, so lets test
> it.
> =

> v2:
> - changed from GEN11 to GEN9 following kernel patches
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_frontbuffer_tracking.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tra=
cking.c
> index 12ba9bba..76bd22e6 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -2172,11 +2172,15 @@ static void format_draw_subtest(const struct test=
_mode *t)
>  =

>  static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
>  {
> +	int devid =3D intel_get_drm_devid(drm.fd);
> +
>  	if (!(feature_flags & FEATURE_FBC))
>  		return true;
>  =

>  	switch (tiling) {
>  	case TILING_LINEAR:
> +		if (AT_LEAST_GEN(devid, 9))
> +			return true;
>  		return false;

return AT_LEAST_GEN(devid, 9);

?



-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
