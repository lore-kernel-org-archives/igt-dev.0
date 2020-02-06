Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E516FA34
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 11:58:14 +0000 (UTC)
Date: Thu, 6 Feb 2020 13:58:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200206115810.GP13686@intel.com>
References: <20200206020944.338033-1-jose.souza@intel.com>
 <20200206020944.338033-3-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206020944.338033-3-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/kms_frontbuffer_tracking:
 Enable positive test on linear tiling
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

On Wed, Feb 05, 2020 at 06:09:43PM -0800, Jos=E9 Roberto de Souza wrote:
> i915 is making fences not mandatory to enable FBC in newer platforms.
> As BSpec do not have restrictions against tiling formats to enable
> FBC it will be possible to enable FBC with linear tiling, so lets test
> it.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_frontbuffer_tracking.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tra=
cking.c
> index d5a64a4d..2fda9ab7 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -2161,11 +2161,15 @@ static void format_draw_subtest(const struct test=
_mode *t)
>  =

>  static bool tiling_is_valid(int feature_flags, enum tile_type tile)
>  {
> +	int devid =3D intel_get_drm_devid(drm.fd);
> +
>  	if (!(feature_flags & FEATURE_FBC))
>  		return true;
>  =

>  	switch (tile) {
>  	case TILE_LINEAR:
> +		if (AT_LEAST_GEN(devid, 11))

gen9+ IIRC

> +			return true;
>  		return false;
>  	case TILE_X:
>  	case TILE_Y:
> -- =

> 2.25.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
