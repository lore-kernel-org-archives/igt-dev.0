Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7426E154
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 10:09:46 +0000 (UTC)
Date: Tue, 19 Oct 2021 13:09:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YW6ZVoESdqRdYwPG@intel.com>
References: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
 <20211019094030.553874-2-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211019094030.553874-2-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_draw: Use device coherent
 and cpu coherent mappings for draw methods.
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

On Tue, Oct 19, 2021 at 11:40:30AM +0200, Maarten Lankhorst wrote:
> This will allow kms_frontbuffer_tracking to draw buffers for frontbuffer =
tracking on dg1.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/igt_draw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index da1d39fcba95..62ca4761a9f2 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -341,8 +341,8 @@ static void draw_rect_mmap_cpu(int fd, struct buf_dat=
a *buf, struct rect *rect,
>  	if (tiling !=3D I915_TILING_NONE)
>  		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >=3D 5);
> =20
> -	ptr =3D gem_mmap__cpu(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
> -			    PROT_READ | PROT_WRITE);
> +	ptr =3D gem_mmap__cpu_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size=
),
> +				     PROT_READ | PROT_WRITE);
> =20
>  	switch (tiling) {
>  	case I915_TILING_NONE:
> @@ -391,8 +391,8 @@ static void draw_rect_mmap_wc(int fd, struct buf_data=
 *buf, struct rect *rect,
>  	if (tiling !=3D I915_TILING_NONE)
>  		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >=3D 5);
> =20
> -	ptr =3D gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
> -			   PROT_READ | PROT_WRITE);
> +	ptr =3D gem_mmap__device_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->s=
ize),
> +					PROT_READ | PROT_WRITE);

That seems to have a silent fallback to mmap_gtt, so on
first blush this does not seem to have 100% identical
behaviour anymore.

Then again gem_mmap__wc() should assert if you attempt to
use it on a machine that doesn't support WC mmaps. So I guess
it ends up being the same in practice? Maybe we should have an
assert in draw_rect_mmap_wc() that either lmem or wc mmap is
available?

Or maybe we don't want to conflate mmap_wc and mmap_fixed
(which I guess is some code for "lmem"?) and instead igt_draw
should have separate methods for each?

> =20
>  	switch (tiling) {
>  	case I915_TILING_NONE:
> --=20
> 2.33.0

--=20
Ville Syrj=E4l=E4
Intel
