Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F0F10E598
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 12:33:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50eaabc36bcso4986501e87.2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 04:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20240110122514.33495-1-zbigniew.kempczynski@intel.com>
 <20240110122514.33495-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240110122514.33495-3-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 10 Jan 2024 12:33:03 +0000
Message-ID: <CAM0jSHPWbbtp+FDieJ3udWAdDYZSfnXCTU5NSJSh=3Cog5ZcvA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v3 2/3] lib/intel_batchbuffer: Select xe2 rendercopy
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

On Wed, 10 Jan 2024 at 12:25, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> Along with rendercopy xe2 pipeline / shader selection for LunarLake
> reorganize if/else conditionals to handle specific selection first.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> ---
> v3: Drop feature selection toward direct ver/platform (Matt)
> ---
>  lib/intel_batchbuffer.c | 40 +++++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index ccab55cec7..85023f9e6f 100644
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
> -       else if (HAS_FLATCCS(devid))
> -               copy =3D gen12p71_render_copyfunc;
> -       else if (IS_METEORLAKE(devid))
> +       if (IS_METEORLAKE(devid))
>                 copy =3D mtl_render_copyfunc;
> +       else if (IS_DG2(devid))
> +               copy =3D gen12p71_render_copyfunc;
> +       else if (IS_GEN(devid, 20))
> +               copy =3D xe2_render_copyfunc;

Nit: Maybe keep this sorted by platform. i.e xe2 at the top.

Reviewed-by: Matthew Auld <matthew.auld@Intel.com>

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
