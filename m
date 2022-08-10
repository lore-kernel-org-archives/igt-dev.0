Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07CF18BFAC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 14:55:30 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31f41584236so145328367b3.5
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 07:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220809002044.264300-1-khaled.almahallawy@intel.com>
In-Reply-To: <20220809002044.264300-1-khaled.almahallawy@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 10 Aug 2022 10:55:19 -0400
Message-ID: <CAJUqKUrbf=jJn=iXf5y9LRGGj-0K0w6KWeoi_axoeA21hpuK9w@mail.gmail.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] tests/chamelium: Move Chamelium tests
 to their own folder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, charlton.lin@intel.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Makes sense to me. Great idea towards the right direction of
committing more resources to Chamelium.
Would prefer a maintainer approval over mine to see if it makes sense
to them as well.

On Mon, Aug 8, 2022 at 8:20 PM Khaled Almahallawy
<khaled.almahallawy@intel.com> wrote:
>
> With the introduction of Chamelium V3 and the anticipation of adding more
> tests for the new features supported by V3 HW and refactoring old ones
> (e.g. have separate files for separate tests), let=E2=80=99s move Chameli=
um to
> its own folder.
>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  tests/{ =3D> chamelium}/kms_chamelium.c       |  0
>  tests/{ =3D> chamelium}/kms_color_chamelium.c |  0
>  tests/meson.build                           | 26 ++++++++++++++-------
>  3 files changed, 18 insertions(+), 8 deletions(-)
>  rename tests/{ =3D> chamelium}/kms_chamelium.c (100%)
>  rename tests/{ =3D> chamelium}/kms_color_chamelium.c (100%)
>
> diff --git a/tests/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> similarity index 100%
> rename from tests/kms_chamelium.c
> rename to tests/chamelium/kms_chamelium.c
> diff --git a/tests/kms_color_chamelium.c b/tests/chamelium/kms_color_cham=
elium.c
> similarity index 100%
> rename from tests/kms_color_chamelium.c
> rename to tests/chamelium/kms_color_chamelium.c
> diff --git a/tests/meson.build b/tests/meson.build
> index b548dc3b4444..3d21717ab4b0 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -257,6 +257,10 @@ msm_progs =3D [
>         'msm_submit'
>  ]
>
> +chamelium_progs =3D [
> +       'kms_chamelium',
> +]
> +
>  test_deps =3D [ igt_deps ]
>
>  if libdrm_nouveau.found()
> @@ -269,13 +273,6 @@ if libdrm_nouveau.found()
>         test_deps +=3D libdrm_nouveau
>  endif
>
> -if chamelium.found()
> -       test_progs +=3D [
> -               'kms_chamelium',
> -       ]
> -       test_deps +=3D chamelium
> -endif
> -
>  test_executables =3D []
>  test_list =3D []
>
> @@ -307,6 +304,19 @@ foreach prog : msm_progs
>         test_list +=3D prog
>  endforeach
>
> +if chamelium.found()
> +       foreach prog : chamelium_progs
> +               test_executables +=3D executable(prog,
> +                                join_paths('chamelium', prog + '.c'),
> +                                dependencies : test_deps,
> +                                install_dir : libexecdir,
> +                                install_rpath : libexecdir_rpathdir,
> +                                install : true)
> +               test_list +=3D prog
> +       endforeach
> +       test_deps +=3D chamelium
> +endif
> +
>  test_executables +=3D executable('drm_fdinfo',
>            join_paths('i915', 'drm_fdinfo.c'),
>            dependencies : test_deps + [ lib_igt_drm_fdinfo ],
> @@ -417,7 +427,7 @@ test_list +=3D 'kms_color'
>
>  if chamelium.found()
>         test_executables +=3D executable('kms_color_chamelium',
> -                             [ 'kms_color_chamelium.c', 'kms_color_helpe=
r.c' ],
> +                             [ 'chamelium/kms_color_chamelium.c', 'kms_c=
olor_helper.c' ],
>                               dependencies : test_deps + [ chamelium ],
>                               install_dir : libexecdir,
>                               install_rpath : libexecdir_rpathdir,
> --
> 2.25.1
>
