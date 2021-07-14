Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CB96E207
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:25:28 +0000 (UTC)
Date: Wed, 14 Jul 2021 13:25:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YO67kjKArYFJS5WD@intel.com>
References: <20210714080002.26107-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714080002.26107-1-vidya.srinivas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Fix a
 check in is_6bpc function
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 01:30:02PM +0530, Vidya Srinivas wrote:
> Fixes commit 3bf28f9dffd41b85c262d4e6664ffbdf5b7d9a93.
> =

> is_6bpc is supposed to return false if connector is not eDP or DSI.
> The right check will be DRM_MODE_CONNECTOR_eDP && DRM_MODE_CONNECTOR_DSI
> By mistake DRM_MODE_CONNECTOR_eDP || DRM_MODE_CONNECTOR_DSI
> was being used.

Instead of these incomplete hacks why aren't we just turning
off dithering when doing crc capture?

> =

> Credits-to: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index a3529dc2190f..8020216c1594 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -454,7 +454,7 @@ static bool is_6bpc(igt_display_t *display, enum pipe=
 pipe) {
>  		return false;
>  =

>  	c =3D output->config.connector;
> -	if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP ||
> +	if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP &&
>  		c->connector_type !=3D DRM_MODE_CONNECTOR_DSI)
>  		return false;
>  =

> -- =

> 2.32.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
