Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AB26E9A8
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 14:17:13 +0000 (UTC)
Date: Wed, 20 Oct 2021 17:17:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YXAk4jM0IRXWxIam@intel.com>
References: <20211014134517.26473-1-tzimmermann@suse.de>
 <20211014134517.26473-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014134517.26473-3-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v2 2/2] tests/fbdev: Add tests for display
 panning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 03:45:17PM +0200, Thomas Zimmermann wrote:
> Add tests that perform panning / page flip operations on an fbdev
> device. Panning should work when the viewport wi within the virtual
> screen and fail otherwise.
>=20
> v2:
> 	* set offset to respect panning offsets (Ville)
> 	* respect FB_VMODE_YWRAP (Ville)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>=20
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 2cf137d2..e1f18718 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -39,6 +39,20 @@
> =20
>  #include "igt.h"
> =20
> +#define PANSTEP(panstep_) \
> +	((panstep_) ? (panstep_) : 1)
> +
> +static unsigned int __panoffset(unsigned int offset, unsigned int panste=
p)
> +{
> +	return offset - (offset % PANSTEP(panstep));
> +}
> +
> +#define XOFFSET(offset_) \
> +	__panoffset(offset_, fix_info.xpanstep)
> +
> +#define YOFFSET(offset_) \
> +	__panoffset(offset_, fix_info.ypanstep)
> +
>  static void mode_tests(int fd)
>  {
>  	struct fb_var_screeninfo var_info;
> @@ -92,6 +106,127 @@ static void mode_tests(int fd)
>  			     "vertical virtual resolution (%u) with line length %u exceeds av=
ailable video memory\n",
>  			     var_info.yres_virtual, fix_info.line_length);
>  	}
> +
> +	igt_describe("Check panning / page flipping");
> +	igt_subtest("pan") {
> +		struct fb_var_screeninfo pan_var, new_var;
> +		int ret;
> +
> +		/* jump to opposite end of virtual screen */
> +		pan_var.xoffset =3D XOFFSET(var_info.xres_virtual - var_info.xres - va=
r_info.xoffset);
> +		pan_var.yoffset =3D YOFFSET(var_info.yres_virtual - var_info.yres - va=
r_info.yoffset);
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		igt_assert_f(pan_var.xoffset =3D=3D new_var.xoffset && pan_var.yoffset=
 =3D=3D new_var.yoffset,
> +			     "panning to (%u, %u) moved to (%u, %u)\n",
> +			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffs=
et);
> +
> +		/* jump to (0, 0) */
> +		pan_var.xoffset =3D XOFFSET(0);
> +		pan_var.yoffset =3D YOFFSET(0);
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		igt_assert_f(pan_var.xoffset =3D=3D new_var.xoffset && pan_var.yoffset=
 =3D=3D new_var.yoffset,
> +			     "panning to (%u, %u) moved to (%u, %u)\n",
> +			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffs=
et);

A bit repetivive this stuff. Could put that block of code
into a helper maybe?

Otherwise looks sensible enough to me. For the series:
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +
> +		/* jump to maximum extend */
> +		pan_var.xoffset =3D XOFFSET(var_info.xres_virtual - var_info.xres);
> +		pan_var.yoffset =3D YOFFSET(var_info.yres_virtual - var_info.yres);
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		igt_assert_f(pan_var.xoffset =3D=3D new_var.xoffset && pan_var.yoffset=
 =3D=3D new_var.yoffset,
> +			     "panning to (%u, %u) moved to (%u, %u)\n",
> +			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffs=
et);
> +
> +		/* return to original offsets for next tests */
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &var_info);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +
> +		/* jump beyond maximum horizontal extend */
> +		pan_var.xoffset =3D XOFFSET(var_info.xres_virtual - var_info.xres + PA=
NSTEP(fix_info.xpanstep));
> +		pan_var.yoffset =3D YOFFSET(0);
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +		igt_assert_f(ret =3D=3D -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);
> +		ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		igt_assert_f(var_info.xoffset =3D=3D new_var.xoffset && var_info.yoffs=
et =3D=3D new_var.yoffset,
> +			     "panning to (%u, %u) moved to (%u, %u)\n",
> +			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffs=
et);
> +
> +		/* jump beyond horizontal virtual resolution */
> +		pan_var.xoffset =3D XOFFSET(var_info.xres_virtual);
> +		pan_var.yoffset =3D YOFFSET(0);
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +		igt_assert_f(ret =3D=3D -1, "ioctl(FBIOPAN_DISPLAY), ret=3D%d\n", ret);
> +		ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		igt_assert_f(var_info.xoffset =3D=3D new_var.xoffset && var_info.yoffs=
et =3D=3D new_var.yoffset,
> +			     "panning to (%u, %u) moved to (%u, %u)\n",
> +			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffs=
et);
> +
> +		/*
> +		 * With FB_MODE_YWRAP set, the display is expected to wrap around when=
 reaching
> +		 * the limits of the vertical resolution. Otherwise, this should fail.
> +		 */
> +
> +		if (var_info.vmode & FB_VMODE_YWRAP) {
> +			/* jump beyond maximum vertical extend */
> +			pan_var.xoffset =3D XOFFSET(0);
> +			pan_var.yoffset =3D YOFFSET(var_info.yres_virtual - var_info.yres + P=
ANSTEP(fix_info.ypanstep));
> +			ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +			igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY), ret=3D%d\n", ret);
> +			ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +			igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);
> +			igt_assert_f(pan_var.xoffset =3D=3D new_var.xoffset && pan_var.yoffse=
t =3D=3D new_var.yoffset,
> +				     "panning to (%u, %u) moved to (%u, %u)\n",
> +				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoff=
set);
> +
> +			/* jump beyond vertical virtual resolution */
> +			pan_var.xoffset =3D XOFFSET(0);
> +			pan_var.yoffset =3D YOFFSET(var_info.yres_virtual);
> +			ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +			igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);
> +			ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +			igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);
> +			igt_assert_f(pan_var.xoffset =3D=3D new_var.xoffset && pan_var.yoffse=
t =3D=3D new_var.yoffset,
> +				     "panning to (%u, %u) moved to (%u, %u)\n",
> +				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoff=
set);
> +		} else {
> +			/* jump beyond maximum vertical extend */
> +			pan_var.xoffset =3D XOFFSET(0);
> +			pan_var.yoffset =3D YOFFSET(var_info.yres_virtual - var_info.yres + P=
ANSTEP(fix_info.ypanstep));
> +			ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +			igt_assert_f(ret =3D=3D -1, "ioctl(FBIOPAN_DISPLAY), ret=3D%d\n", ret=
);
> +			ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +			igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);
> +			igt_assert_f(var_info.xoffset =3D=3D new_var.xoffset && var_info.yoff=
set =3D=3D new_var.yoffset,
> +				     "panning to (%u, %u) moved to (%u, %u)\n",
> +				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoff=
set);
> +
> +			/* jump beyond vertical virtual resolution */
> +			pan_var.xoffset =3D XOFFSET(0);
> +			pan_var.yoffset =3D YOFFSET(var_info.yres_virtual);
> +			ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +			igt_assert_f(ret =3D=3D -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\=
n", ret);
> +			ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +			igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);
> +			igt_assert_f(var_info.xoffset =3D=3D new_var.xoffset && var_info.yoff=
set =3D=3D new_var.yoffset,
> +				     "panning to (%u, %u) moved to (%u, %u)\n",
> +				     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoff=
set);
> +		}
> +	}
> +
> +	igt_fixture {
> +		/* restore original panning offsets */
> +		ioctl(fd, FBIOPAN_DISPLAY, &var_info);
> +	}
>  }
> =20
>  static void framebuffer_tests(int fd)
> --=20
> 2.33.0

--=20
Ville Syrj=E4l=E4
Intel
