Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FDC27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 18:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EB110E6F9;
	Tue, 11 Jun 2024 18:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m916QIc3";
	dkim-atps=neutral
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FBB10E6F9
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 18:36:35 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7eb85e80661so106024839f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718130994; x=1718735794;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJb9J/FTqJWlPBleNIJnUyoi7oMclCZyXsM7aU7BNL0=;
 b=m916QIc3AUNnZn1HeiCtseaHMw97IOz8EQVWgrGfWvI+3VultLwW8lIMCXCpMdDrO0
 G9eeUuSAtct2EbyJAk36FAI0a/P3zg0+bTGhmxGSFumeSq8uP7j1s0MYYqnj0cMn3F2S
 I6M9xTWFPDVrps3Nt3lCgxMSaWO+ODynRLm/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718130994; x=1718735794;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJb9J/FTqJWlPBleNIJnUyoi7oMclCZyXsM7aU7BNL0=;
 b=qWrwPEEIYHBrfLpKO68OHBMmcJUrjDUWcp5OESnZGfIWw3NbvErLa6+RYurwUJ+OZv
 9L8Uz1f6TVNrJO9NrKOVB+okKccakuG0T8bxJO6b8nSQ01zZmGMLxQN420l5ZdVhanZ8
 +BNvrghjDTScWg8NS68z7bVfEkQ0hfevgYqLuM/x/JAgszEcRZrQKL6VMF0hTlM2F4Xv
 cyjG1tdXGZD5KsvC5pz+mZiKtzB9VCBHhDMa1B/UKqF1G1nFj+wx+3z6pfQ5TyV4k14v
 Tk5ud0VtASXzVLQxFv3bmSLbSpGC7BNof8ZyhJqArhNeaw5AURc2Byw1Ne8thpEdaXDo
 /oIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQVqFiu/1MwqiiuC+wBxgz4FN8iM4QMzrsDhqtpPX/kBSqmgV2SieazC3K5ZOLWt9GwkY2yLt39fJVilFJTYIkaH15apD7e9okrYvKfQ==
X-Gm-Message-State: AOJu0YyqP67FGOxa8Qfns9n/Q2bicCcfCxyAd775eW31C7JbhqhM93Un
 sqBi61Yju8H+32KxclOqwvVMOCk7sN+PFZbHrOSOkQLehRt7QKE5kTXhJfHP9BEb4VP+WftdjiO
 BTDQGV5e7cz4cQIOcbpgxGUG80HbwjB/n6ISb
X-Google-Smtp-Source: AGHT+IE13iugYVpppiQV0KTa7pSVfPYrB6aCYMI1iFAzg711GC9BOuP5el1mHFyv5I/PTnU6kSpY7x182h+w5J6uxhY=
X-Received: by 2002:a05:6602:160a:b0:7eb:7ebd:1f9f with SMTP id
 ca18e2360f4ac-7eb7ebd2365mr832663139f.9.1718130994401; Tue, 11 Jun 2024
 11:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
 <20240610080150.3610871-3-bhanuprakash.modem@intel.com>
 <20240611163957.ljb3sslsarpbuuz3@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240611163957.ljb3sslsarpbuuz3@kamilkon-DESK.igk.intel.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 11 Jun 2024 11:36:22 -0700
Message-ID: <CAJs_Fx7gZUrHKAyc-Qmp4UenfKEksNCcGwi+fs2-BMpkWh5WiQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t 2/3] tests/msm: Move MSM tests to new dir
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Rob Clark <robdclark@chromium.org>, 
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Jun 11, 2024 at 9:40=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Bhanuprakash,
> On 2024-06-10 at 13:31:48 +0530, Bhanuprakash Modem wrote:
> > Move all MSM specific tests (tests/msm_*) to new dir
> > (tests/msm/msm_*).
> >
>
> Added msm devs to Cc:
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Emma Anholt <emma@anholt.net>
>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

a-b

>
> > ---
> >  meson.build           |  8 ++++++++
> >  tests/meson.build     | 19 ++-----------------
> >  tests/msm/meson.build | 16 ++++++++++++++++
> >  3 files changed, 26 insertions(+), 17 deletions(-)
> >  create mode 100644 tests/msm/meson.build
> >
> > diff --git a/meson.build b/meson.build
> > index 701a5cc35..6ae3c2684 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -276,6 +276,7 @@ includedir =3D get_option('includedir')
> >  libdir =3D get_option('libdir')
> >  libexecdir =3D join_paths(get_option('libexecdir'), 'igt-gpu-tools')
> >  amdgpudir =3D join_paths(libexecdir, 'amdgpu')
> > +msmdir =3D join_paths(libexecdir, 'msm')
> >  panfrostdir =3D join_paths(libexecdir, 'panfrost')
> >  v3ddir =3D join_paths(libexecdir, 'v3d')
> >  vc4dir =3D join_paths(libexecdir, 'vc4')
> > @@ -316,6 +317,12 @@ if get_option('use_rpath')
> >       endforeach
> >       amdgpudir_rpathdir =3D join_paths(amdgpudir_rpathdir, libdir)
> >
> > +     msm_rpathdir =3D '$ORIGIN'
> > +     foreach p : msmdir.split('/')
> > +             msm_rpathdir =3D join_paths(msm_rpathdir, '..')
> > +     endforeach
> > +     msm_rpathdir =3D join_paths(msm_rpathdir, libdir)
> > +
> >       panfrost_rpathdir =3D '$ORIGIN'
> >       foreach p : panfrostdir.split('/')
> >               panfrost_rpathdir =3D join_paths(panfrost_rpathdir, '..')
> > @@ -343,6 +350,7 @@ else
> >       bindir_rpathdir =3D ''
> >       libexecdir_rpathdir =3D ''
> >       amdgpudir_rpathdir =3D ''
> > +     msm_rpathdir =3D ''
> >       panfrost_rpathdir =3D ''
> >       v3d_rpathdir =3D ''
> >       vc4_rpathdir =3D ''
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 16896de99..122fbd07c 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -314,14 +314,6 @@ intel_xe_progs =3D [
> >       'xe_sysfs_scheduler',
> >  ]
> >
> > -msm_progs =3D [
> > -     'msm_mapping',
> > -     'msm_recovery',
> > -     'msm_shrink',
> > -     'msm_submit',
> > -     'msm_submitoverhead',
> > -]
> > -
> >  chamelium_progs =3D [
> >       'kms_chamelium_audio',
> >       'kms_chamelium_color',
> > @@ -424,15 +416,6 @@ foreach prog : intel_progs
> >       endif
> >  endforeach
> >
> > -foreach prog : msm_progs
> > -     test_executables +=3D executable(prog, join_paths('msm', prog + '=
.c'),
> > -                                    dependencies : test_deps,
> > -                                    install_dir : libexecdir,
> > -                                    install_rpath : libexecdir_rpathdi=
r,
> > -                                    install : true)
> > -     test_list +=3D prog
> > -endforeach
> > -
> >  if chamelium.found()
> >       foreach prog : chamelium_progs
> >               testexe =3D executable(prog,
> > @@ -457,6 +440,8 @@ endif
> >
> >  subdir('amdgpu')
> >
> > +subdir('msm')
> > +
> >  subdir('panfrost')
> >
> >  subdir('v3d')
> > diff --git a/tests/msm/meson.build b/tests/msm/meson.build
> > new file mode 100644
> > index 000000000..74169b5b2
> > --- /dev/null
> > +++ b/tests/msm/meson.build
> > @@ -0,0 +1,16 @@
> > +msm_progs =3D [
> > +     'msm_mapping',
> > +     'msm_recovery',
> > +     'msm_shrink',
> > +     'msm_submit',
> > +     'msm_submitoverhead',
> > +]
> > +
> > +foreach prog : msm_progs
> > +     test_executables +=3D executable(prog, prog + '.c',
> > +                                    dependencies : test_deps,
> > +                                    install_dir : msmdir,
> > +                                    install_rpath : msm_rpathdir,
> > +                                    install : true)
> > +     test_list +=3D join_paths('msm', prog)
> > +endforeach
> > --
> > 2.43.2
> >
