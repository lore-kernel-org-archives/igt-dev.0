Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212410F931
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 19:48:03 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso13230777qkb.11
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 12:48:01 -0700 (PDT)
Message-ID: <a8c79d631c9fca4ba758b33bc0d832d8e91eb7df.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Yacoub <markyacoub@chromium.org>, Khaled Almahallawy
 <khaled.almahallawy@intel.com>
Date: Wed, 10 Aug 2022 15:47:59 -0400
In-Reply-To: <CAJUqKUrbf=jJn=iXf5y9LRGGj-0K0w6KWeoi_axoeA21hpuK9w@mail.gmail.com>
References: <20220809002044.264300-1-khaled.almahallawy@intel.com>
 <CAJUqKUrbf=jJn=iXf5y9LRGGj-0K0w6KWeoi_axoeA21hpuK9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

I'm not sure if I'd count as a maintainer (I did write some of the original
chamelium code for igt though :) but you can consider this:

Acked-by: Lyude Paul <lyude@redhat.com>

On Wed, 2022-08-10 at 10:55 -0400, Mark Yacoub wrote:
> Makes sense to me. Great idea towards the right direction of
> committing more resources to Chamelium.
> Would prefer a maintainer approval over mine to see if it makes sense
> to them as well.
> 
> On Mon, Aug 8, 2022 at 8:20 PM Khaled Almahallawy
> <khaled.almahallawy@intel.com> wrote:
> > 
> > With the introduction of Chamelium V3 and the anticipation of adding more
> > tests for the new features supported by V3 HW and refactoring old ones
> > (e.g. have separate files for separate tests), let’s move Chamelium to
> > its own folder.
> > 
> > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > ---
> >  tests/{ => chamelium}/kms_chamelium.c       |  0
> >  tests/{ => chamelium}/kms_color_chamelium.c |  0
> >  tests/meson.build                           | 26 ++++++++++++++-------
> >  3 files changed, 18 insertions(+), 8 deletions(-)
> >  rename tests/{ => chamelium}/kms_chamelium.c (100%)
> >  rename tests/{ => chamelium}/kms_color_chamelium.c (100%)
> > 
> > diff --git a/tests/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> > similarity index 100%
> > rename from tests/kms_chamelium.c
> > rename to tests/chamelium/kms_chamelium.c
> > diff --git a/tests/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
> > similarity index 100%
> > rename from tests/kms_color_chamelium.c
> > rename to tests/chamelium/kms_color_chamelium.c
> > diff --git a/tests/meson.build b/tests/meson.build
> > index b548dc3b4444..3d21717ab4b0 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -257,6 +257,10 @@ msm_progs = [
> >         'msm_submit'
> >  ]
> > 
> > +chamelium_progs = [
> > +       'kms_chamelium',
> > +]
> > +
> >  test_deps = [ igt_deps ]
> > 
> >  if libdrm_nouveau.found()
> > @@ -269,13 +273,6 @@ if libdrm_nouveau.found()
> >         test_deps += libdrm_nouveau
> >  endif
> > 
> > -if chamelium.found()
> > -       test_progs += [
> > -               'kms_chamelium',
> > -       ]
> > -       test_deps += chamelium
> > -endif
> > -
> >  test_executables = []
> >  test_list = []
> > 
> > @@ -307,6 +304,19 @@ foreach prog : msm_progs
> >         test_list += prog
> >  endforeach
> > 
> > +if chamelium.found()
> > +       foreach prog : chamelium_progs
> > +               test_executables += executable(prog,
> > +                                join_paths('chamelium', prog + '.c'),
> > +                                dependencies : test_deps,
> > +                                install_dir : libexecdir,
> > +                                install_rpath : libexecdir_rpathdir,
> > +                                install : true)
> > +               test_list += prog
> > +       endforeach
> > +       test_deps += chamelium
> > +endif
> > +
> >  test_executables += executable('drm_fdinfo',
> >            join_paths('i915', 'drm_fdinfo.c'),
> >            dependencies : test_deps + [ lib_igt_drm_fdinfo ],
> > @@ -417,7 +427,7 @@ test_list += 'kms_color'
> > 
> >  if chamelium.found()
> >         test_executables += executable('kms_color_chamelium',
> > -                             [ 'kms_color_chamelium.c', 'kms_color_helper.c' ],
> > +                             [ 'chamelium/kms_color_chamelium.c', 'kms_color_helper.c' ],
> >                               dependencies : test_deps + [ chamelium ],
> >                               install_dir : libexecdir,
> >                               install_rpath : libexecdir_rpathdir,
> > --
> > 2.25.1
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
