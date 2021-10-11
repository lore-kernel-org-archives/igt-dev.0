Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7BB6E4FB
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 14:20:49 +0000 (UTC)
Date: Mon, 11 Oct 2021 17:20:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YWRIPrBMMszKrqXW@intel.com>
References: <20211011140719.11733-1-tzimmermann@suse.de>
 <20211011140719.11733-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211011140719.11733-2-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH 1/2] tests/fbdev: Test for validity of video
 mode settings
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

On Mon, Oct 11, 2021 at 04:07:18PM +0200, Thomas Zimmermann wrote:
> Add basic tests for video mode resolution and color on fbdev
> devices.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 43 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 443a43dc..c9903f8b 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -50,14 +50,41 @@ static void mode_tests(int fd)
> =20
>  	igt_describe("Check if screeninfo is valid");
>  	igt_subtest("info") {
> -		unsigned long size;
> -
> -		size =3D var_info.yres * fix_info.line_length;
> -		igt_assert_f(size <=3D fix_info.smem_len,
> -			     "screen size (%d x %d) of pitch %d does not fit within mappable =
area of size %u\n",
> -			     var_info.xres, var_info.yres,
> -			     fix_info.line_length,
> -			     fix_info.smem_len);
> +		unsigned long nlines;
> +
> +		/* video memory configuration */
> +		igt_assert_f(fix_info.line_length, "line pitch not set\n");
> +		igt_assert_f(fix_info.smem_len, "size of video memory not set\n");
> +		igt_assert_f(fix_info.line_length <=3D fix_info.smem_len,
> +			     "line length (%u) exceeds available video memory (%u)\n",
> +			     fix_info.line_length, fix_info.smem_len);
> +
> +		/* color format */
> +		igt_assert_f(var_info.bits_per_pixel, "bits-per-pixel not set\n");
> +
> +		/* horizontal resolution */
> +		igt_assert_f(var_info.xres, "horizontal resolution not set\n");
> +		igt_assert_f(var_info.xres_virtual, "horizontal virtual resolution not=
 set\n");
> +		igt_assert_f(var_info.xres <=3D var_info.xres_virtual,
> +			     "horizontal virtual resolution (%u) less than horizontal resolut=
ion (%u)\n",
> +			     var_info.xres_virtual, var_info.xres);
> +		igt_assert_f(var_info.xoffset <=3D (var_info.xres_virtual - var_info.x=
res),
> +			     "screen horizontal offset (%u) overflow\n",
> +			     var_info.xoffset);
> +
> +		/* vertical resolution */
> +		igt_assert_f(var_info.yres, "vertical resolution not set\n");
> +		igt_assert_f(var_info.yres_virtual, "vertical virtual resolution not s=
et\n");
> +		igt_assert_f(var_info.yres <=3D var_info.yres_virtual,
> +			     "vertical virtual resolution (%u) less than vertical resolution =
(%u)\n",
> +			     var_info.yres_virtual, var_info.yres);
> +		igt_assert_f(var_info.yoffset <=3D (var_info.yres_virtual - var_info.y=
res),
> +			     "screen vertical offset (%u) overflow\n",
> +			     var_info.yoffset);

YWRAP does allow for that IIRC. So maybe should check that, or maybe we
don't care about drivers that support it?

> +		nlines =3D fix_info.smem_len / fix_info.line_length;
> +		igt_assert_f(var_info.yres_virtual <=3D nlines,
> +			     "vertical virtual resolution (%u) with pitch %u exceeds availabl=
e video memory\n",
> +			     var_info.yres_virtual, fix_info.line_length);

Maybe add the counterpart for the horizontal direction?

>  	}
>  }
> =20
> --=20
> 2.33.0

--=20
Ville Syrj=E4l=E4
Intel
