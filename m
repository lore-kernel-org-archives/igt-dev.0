Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9082189D3E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 14:27:24 +0000 (UTC)
Date: Mon, 11 Oct 2021 17:24:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YWRJBvGbsrcSIbXh@intel.com>
References: <20211011140719.11733-1-tzimmermann@suse.de>
 <20211011140719.11733-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211011140719.11733-3-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH 2/2] tests/fbdev: Add tests for display panning
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

On Mon, Oct 11, 2021 at 04:07:19PM +0200, Thomas Zimmermann wrote:
> Add tests that perform panning / page flip operations on an fbdev
> device. Panning should work when the viewport wi within the virtual
> screen and fail otherwise.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index c9903f8b..17727cd0 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -86,6 +86,98 @@ static void mode_tests(int fd)
>  			     "vertical virtual resolution (%u) with pitch %u exceeds availabl=
e video memory\n",
>  			     var_info.yres_virtual, fix_info.line_length);
>  	}
> +
> +	igt_describe("Check panning / page flipping");
> +	igt_subtest("pan") {
> +		struct fb_var_screeninfo pan_var, new_var;
> +		int ret;
> +
> +		/* jump to opposite end of virtual screen */
> +		pan_var.xoffset =3D var_info.xres_virtual - var_info.xres - var_info.x=
offset;
> +		pan_var.yoffset =3D var_info.yres_virtual - var_info.yres - var_info.y=
offset;

Should look at {x,y}panstep probably before assuming this stuff will do exa=
ctly
what you ask it.

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
> +		pan_var.xoffset =3D 0;
> +		pan_var.yoffset =3D 0;
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
> +		/* jump to maximum extend */
> +		pan_var.xoffset =3D var_info.xres_virtual - var_info.xres;
> +		pan_var.yoffset =3D var_info.yres_virtual - var_info.yres;
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
> +		pan_var.xoffset =3D var_info.xres_virtual - var_info.xres + 1;
> +		pan_var.yoffset =3D 0;
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
> +		/* jump beyond maximum vertical extend */
> +		pan_var.xoffset =3D 0;
> +		pan_var.yoffset =3D var_info.yres_virtual - var_info.yres + 1;
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
> +		/* jump beyond horizontal virtual resolution */
> +		pan_var.xoffset =3D var_info.xres_virtual;
> +		pan_var.yoffset =3D 0;
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
> +		/* jump beyond vertical virtual resolution */
> +		pan_var.xoffset =3D 0;
> +		pan_var.yoffset =3D var_info.yres_virtual;
> +		ret =3D ioctl(fd, FBIOPAN_DISPLAY, &pan_var);
> +		igt_assert_f(ret =3D=3D -1, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n=
", ret);

Another YWRAP issue here.

> +		ret =3D ioctl(fd, FBIOGET_VSCREENINFO, &new_var);
> +		igt_assert_f(ret =3D=3D 0, "ioctl(FBIOPAN_DISPLAY) failed, ret=3D%d\n"=
, ret);
> +		igt_assert_f(var_info.xoffset =3D=3D new_var.xoffset && var_info.yoffs=
et =3D=3D new_var.yoffset,
> +			     "panning to (%u, %u) moved to (%u, %u)\n",
> +			     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffs=
et);
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
