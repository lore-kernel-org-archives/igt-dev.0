Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD10710E5F4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 21:41:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb72b9so1591945e9.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 14:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-5-mauro.chehab@linux.intel.com>
 <20230710181709.234ki5ihaoh6cj5l@kamilkon-desk1>
In-Reply-To: <20230710181709.234ki5ihaoh6cj5l@kamilkon-desk1>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 30 Aug 2023 17:41:32 -0400
Message-ID: <CAJUqKUo9rKSqQ6h17gbiEWVhQSaAsvwD51_fmpBr+MTm_R7Rug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/7] tests/meson.build: create
 testlists for tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Ewelina Musial <ewelina.musial@intel.com>, ihf@google.com
List-ID: <igt-dev@lists.freedesktop.org>

This is causing issues for IGT ChromeOS. Adding +ihf@google.com for
more context.

On Mon, Jul 10, 2023 at 2:17=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mauro,
>
> On 2023-07-10 at 13:53:51 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> > Let's dynamically create testlists for during build time, as this
> ------------------------------------ ^^^
> s/for//
>
> Also, in subject:
> tests/meson.build: create testlists for tests
> ----------------------------------- ^^^^^^^^^
> s/for tests/dynamically/
> or /at build time/ ?
>
> With that fixed you can add my r-b.
>
> > can speed up a lot the validation check for testplan.
> >
> > Ideally, all it would need to to that would be to use this
> > logic at the end of tests/meson.build:
> >
> >     foreach testexe : test_executables
> >         prog =3D testexe.name()
> >
> >         output =3D prog.split('/').get(-1) + '.testlist'
> >         custom_target(output,
> >                      build_by_default : true,
> >                      command : [ testexe, '--show-testlist'],
> >                      capture : true,
> >                      output : output)
> >
> > Unfortunately, this requies Meson >=3D 0.54. So, we need to add
> > one custom_target per executable() call.
>
> As this is touching testlist for CI, +Cc Ewelina.
>
> Regards,
> Kamil
>
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  docs/testplan/meson.build |  2 +-
> >  tests/meson.build         | 55 ++++++++++++++++++++++++++++++++++-----
> >  2 files changed, 49 insertions(+), 8 deletions(-)
> >
> > diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> > index bf73dd32a15f..e838f2eb1540 100644
> > --- a/docs/testplan/meson.build
> > +++ b/docs/testplan/meson.build
> > @@ -12,7 +12,7 @@ i915_test_config =3D join_paths(source_root, 'tests',=
 'i915', 'i915_test_config.js
> >
> >  check_testlist =3D []
> >  if build_tests
> > -     doc_dependencies =3D test_executables
> > +     doc_dependencies =3D testlist_files
> >       # Check if documentation matches the actual tests and tests can r=
un
> >       if not meson.is_cross_build()
> >               build_info +=3D 'Will Check if documentation is in sync w=
ith testlist'
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 3116c458d60b..897f17ab4561 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -351,35 +351,57 @@ extra_dependencies =3D {
> >
> >  test_executables =3D []
> >  test_list =3D []
> > +testlist_files =3D []
> >
> >  foreach prog : test_progs
> > -     test_executables +=3D executable(prog, [prog + '.c'] + extra_sour=
ces.get(prog, []),
> > +     testexe =3D executable(prog, [prog + '.c'] + extra_sources.get(pr=
og, []),
> >                  dependencies : test_deps + extra_dependencies.get(prog=
, []),
> >                  install_dir : libexecdir,
> >                  install_rpath : libexecdir_rpathdir,
> >                  install : true)
> > +     test_executables +=3D testexe
> >       test_list +=3D prog
> > +     name =3D prog.split('/').get(-1)
> > +     testlist_files +=3D custom_target(name + '.testlist',
> > +                  build_by_default : true,
> > +                  command : [testexe, '--show-testlist'],
> > +                  capture : true,
> > +                  output : name + '.testlist')
> >  endforeach
> >
> >  foreach prog : i915_progs
> > -     test_executables +=3D executable(prog,
> > +     testexe =3D executable(prog,
> >                  [join_paths('i915', prog + '.c')] + extra_sources.get(=
prog, []),
> >                  dependencies : test_deps + extra_dependencies.get(prog=
, []),
> >                  install_dir : libexecdir,
> >                  install_rpath : libexecdir_rpathdir,
> >                  install : true)
> > +     test_executables +=3D testexe
> >       test_list +=3D prog
> > +     name =3D prog.split('/').get(-1)
> > +     testlist_files +=3D custom_target(name + '.testlist',
> > +                  build_by_default : true,
> > +                  command : [testexe, '--show-testlist'],
> > +                  capture : true,
> > +                  output : name + '.testlist')
> >  endforeach
> >
> >  if build_xe
> >       foreach prog : xe_progs
> > -             test_executables +=3D executable(prog,
> > +             testexe =3D executable(prog,
> >                          [join_paths('xe', prog + '.c')] + extra_source=
s.get(prog, []),
> >                          dependencies : test_deps + extra_dependencies.=
get(prog, []),
> >                          install_dir : libexecdir,
> >                          install_rpath : libexecdir_rpathdir,
> >                          install : true)
> >               test_list +=3D prog
> > +             test_executables +=3D testexe
> > +             name =3D prog.split('/').get(-1)
> > +             testlist_files +=3D custom_target(name + '.testlist',
> > +                          build_by_default : true,
> > +                          command : [testexe, '--show-testlist'],
> > +                          capture : true,
> > +                          output : name + '.testlist')
> >       endforeach
> >       build_info +=3D 'Xe **experimental** tests enabled.'
> >  endif
> > @@ -395,7 +417,7 @@ endforeach
> >
> >  if chamelium.found()
> >       foreach prog : chamelium_progs
> > -             test_executables +=3D executable(prog,
> > +             testexe =3D executable(prog,
> >                                [join_paths('chamelium', prog + '.c'),
> >                                       join_paths('chamelium', 'kms_cham=
elium_helper.c')],
> >                                dependencies : test_deps,
> > @@ -403,16 +425,30 @@ if chamelium.found()
> >                                install_rpath : libexecdir_rpathdir,
> >                                install : true)
> >               test_list +=3D prog
> > +             test_executables +=3D testexe
> > +             name =3D prog.split('/').get(-1)
> > +             testlist_files +=3D custom_target(name + '.testlist',
> > +                          build_by_default : true,
> > +                          command : [testexe, '--show-testlist'],
> > +                          capture : true,
> > +                          output : name + '.testlist')
> >       endforeach
> >       test_deps +=3D chamelium
> >
> > -     test_executables +=3D executable('kms_chamelium_color',
> > +     name =3D 'kms_chamelium_color'
> > +     testexe =3D executable('kms_chamelium_color',
> >                               [ 'chamelium/kms_chamelium_color.c', 'kms=
_color_helper.c' ],
> >                               dependencies : test_deps + [ chamelium ],
> >                               install_dir : libexecdir,
> >                               install_rpath : libexecdir_rpathdir,
> >                               install : true)
> > -     test_list +=3D 'kms_chamelium_color'
> > +     test_list +=3D name
> > +     test_executables +=3D testexe
> > +     testlist_files +=3D custom_target(name + '.testlist',
> > +                  build_by_default : true,
> > +                  command : [testexe, '--show-testlist'],
> > +                  capture : true,
> > +                  output : name + '.testlist')
> >  endif
> >
> >  subdir('amdgpu')
> > @@ -448,11 +484,16 @@ foreach prog : test_list
> >       test('testcase check ' + prog, test_script, args : prog)
> >  endforeach
> >
> > -executable('gem_stress', 'i915/gem_stress.c',
> > +testexe =3D executable('gem_stress', 'i915/gem_stress.c',
> >          install : true,
> >          install_dir : libexecdir,
> >          install_rpath : libexecdir_rpathdir,
> >          dependencies : igt_deps)
> > +testlist_files +=3D custom_target('gem_stress.testlist',
> > +                build_by_default : true,
> > +                command : [testexe, '--show-testlist'],
> > +                capture : true,
> > +                output : 'gem_stress.testlist')
> >
> >  image_files =3D [
> >    '1080p-left.png',
> > --
> > 2.40.1
> >

