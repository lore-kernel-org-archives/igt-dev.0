Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0481F10E751
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 11:25:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e7abe4be4so5155002e87.2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 03:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
 <20240108113012.382557-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240108113012.382557-3-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 10 Jan 2024 11:25:18 +0000
Message-ID: <CAM0jSHP-mzpUDQVse-ZmDisqWvm+b11sTWaRWBRT2o60WgDv3A@mail.gmail.com>
Subject: Re: [PATCH i-g-t 2/3] lib/intel_batchbuffer: Select xe2 rendercopy
 for LunarLake
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Mon, 8 Jan 2024 at 11:36, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> Along with rendercopy xe2 pipeline / shader selection for LunarLake
> reorganize if/else conditionals to handle specific selection first.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/intel_batchbuffer.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index ccab55cec7..d374645d99 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -656,28 +656,30 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int d=
evid)
>  {
>         igt_render_copyfunc_t copy =3D NULL;
>
> -       if (IS_GEN2(devid))
> -               copy =3D gen2_render_copyfunc;
> -       else if (IS_GEN3(devid))
> -               copy =3D gen3_render_copyfunc;
> -       else if (IS_GEN4(devid) || IS_GEN5(devid))
> -               copy =3D gen4_render_copyfunc;
> -       else if (IS_GEN6(devid))
> -               copy =3D gen6_render_copyfunc;
> -       else if (IS_GEN7(devid))
> -               copy =3D gen7_render_copyfunc;
> -       else if (IS_GEN8(devid))
> -               copy =3D gen8_render_copyfunc;
> -       else if (IS_GEN9(devid) || IS_GEN10(devid))
> -               copy =3D gen9_render_copyfunc;
> -       else if (IS_GEN11(devid))
> -               copy =3D gen11_render_copyfunc;
> +       if (IS_METEORLAKE(devid))
> +               copy =3D mtl_render_copyfunc;
> +       else if (IS_LUNARLAKE(devid))
> +               copy =3D genxe2_render_copyfunc;

This doesn't work with any xe2? Can we not make this conditional on
graphics version =3D=3D 20?

>         else if (HAS_FLATCCS(devid))
>                 copy =3D gen12p71_render_copyfunc;

Should we not not make this a normal platform or graphics version
check? This will also catch all xe2+ platforms that are not LNL, but
have flat_ccs support. I think it is better to just return NULL for
new platforms, that way we get a clear skip in tests using this
instead of seeing job timeouts due to using the wrong shader/kernel.
See VLK-54191 for example. What do you think?

> -       else if (IS_METEORLAKE(devid))
> -               copy =3D mtl_render_copyfunc;
>         else if (IS_GEN12(devid))
>                 copy =3D gen12_render_copyfunc;
> +       else if (IS_GEN11(devid))
> +               copy =3D gen11_render_copyfunc;
> +       else if (IS_GEN9(devid) || IS_GEN10(devid))
> +               copy =3D gen9_render_copyfunc;
> +       else if (IS_GEN8(devid))
> +               copy =3D gen8_render_copyfunc;
> +       else if (IS_GEN7(devid))
> +               copy =3D gen7_render_copyfunc;
> +       else if (IS_GEN6(devid))
> +               copy =3D gen6_render_copyfunc;
> +       else if (IS_GEN4(devid) || IS_GEN5(devid))
> +               copy =3D gen4_render_copyfunc;
> +       else if (IS_GEN3(devid))
> +               copy =3D gen3_render_copyfunc;
> +       else if (IS_GEN2(devid))
> +               copy =3D gen2_render_copyfunc;
>
>         return copy;
>  }
> --
> 2.34.1
>
