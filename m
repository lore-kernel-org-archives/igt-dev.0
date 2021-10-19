Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2332D6E14C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 10:02:12 +0000 (UTC)
Date: Tue, 19 Oct 2021 13:02:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YW6Xn4Ysgnna9NFG@intel.com>
References: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: create i915 bo in lmem,
 if available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 19, 2021 at 11:40:29AM +0200, Maarten Lankhorst wrote:
> create_bo_for_fb() should call gem_buffer_create_fb_obj, as this is the
> function used to create an object in lmem. This will fix the
> kms_frontbuffer_tracking tests failing on DG1.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/igt_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 63f3c86e75f0..216b1d5c4aff 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1092,7 +1092,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool=
 prefer_sysmem)
>  		if (is_i915_device(fd)) {
>  			int err;
> =20
> -			fb->gem_handle =3D gem_create(fd, fb->size);
> +			fb->gem_handle =3D gem_buffer_create_fb_obj(fd, fb->size);

Looks to do what we need.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  			err =3D __gem_set_tiling(fd, fb->gem_handle,
>  					       igt_fb_mod_to_tiling(fb->modifier),
>  					       fb->strides[0]);
> --=20
> 2.33.0

--=20
Ville Syrj=E4l=E4
Intel
