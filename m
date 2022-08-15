Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9456AC8B70
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 17:20:41 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id gp7so7467761pjb.4
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 10:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
 <20220815145146.24038-5-tales.aparecida@gmail.com>
 <10bea995-4d44-1f86-a92b-d9e4552e1463@igalia.com>
In-Reply-To: <10bea995-4d44-1f86-a92b-d9e4552e1463@igalia.com>
From: Tales <tales.aparecida@gmail.com>
Date: Mon, 15 Aug 2022 14:20:05 -0300
Message-ID: <CAGVoLp557zL7bVWi7Qcr7QtBcrZjttRyd_jjw_o4_Rdoyfx3qg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <tonyk@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] lib/igt_kmod: add igt_kselftests
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, siqueirajordao@riseup.net,
 Magali Lemes <magalilemes00@gmail.com>, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello,

Em seg., 15 de ago. de 2022 =C3=A0s 13:46, Andr=C3=A9 Almeida <tonyk@igalia=
.com> escreveu:
>
> Hi Tales,
>
> On 8/15/22 11:51, Tales Aparecida wrote:
> > Add documentation for igt_kselftests functions and structs. Also adds
> > comments to non trivial lines.
> >
> > Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> > ---
> >
> > Notes:
> >      v2 -> v3: rephrase igt_kselftest_begin() documentation to say skip=
s instead of fails
> >
> >   lib/igt_kmod.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   lib/igt_kmod.h |  18 ++++++++
> >   2 files changed, 127 insertions(+)
> >
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 5864f68c..a39bec18 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -792,6 +792,12 @@ igt_amdgpu_driver_unload(void)
> >       return IGT_EXIT_SUCCESS;
> >   }
> >
> > +/**
> > + * kmsg_dump:
> > + * @fd: file descriptor for `/dev/kmsg` opened for reading
>
> In other places you refer to this file as
> <filename>/dev/kmsg</filename>, should it be the same here?

I might have skipped this one just to avoid line breaking.
I found that using the <filename> tag provides very similar styling to
`back tick quoting` when rendering the documentation,
but can make the raw code less readable.

I can convert it though!

Thanks for the review, Andr=C3=A9.

Kind regards,
Tales
