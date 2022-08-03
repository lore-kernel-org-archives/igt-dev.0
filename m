Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BE52B737
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 20:05:08 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id 130so9595928pfv.13
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Aug 2022 13:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
 <20220803052654.98827-4-tales.aparecida@gmail.com>
 <YuqsJLSLSde0H3Qg@kamilkon-desk1>
In-Reply-To: <YuqsJLSLSde0H3Qg@kamilkon-desk1>
From: Tales <tales.aparecida@gmail.com>
Date: Wed, 3 Aug 2022 17:04:32 -0300
Message-ID: <CAGVoLp6QTKRadRO3gqkeHZnKX6zbKQ+FKbMjnyOOjLWqpu-LOQ@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tales Aparecida <tales.aparecida@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/kselftests: return non-zero on
 open(kmsg) failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello, Kamil,

Em qua., 3 de ago. de 2022 =C3=A0s 14:11, Kamil Konieczny
<kamil.konieczny@linux.intel.com> escreveu:
>
> Hi Tales,
>
> On 2022-08-03 at 02:26:53 -0300, Tales Aparecida wrote:
> > Previously igt_kselftest_begin() always returned 0.
> > Return non-zero if failed to open kmsg, instead.
> >
> > Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> > ---
> >  lib/igt_kmod.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index bde0461a..63636243 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -933,6 +933,8 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
> >       igt_require(err =3D=3D 0 || err =3D=3D -ENOENT);
> >
> >       tst->kmsg =3D open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> > +     if (tst->kmsg < 0)
> > +             return 1;
>
>
> This is used everywhere in dumping error messages, for example
> in igt_kselftest_execute() there is:
>         if (err)
>                 kmsg_dump(tst->kmsg);
>
> so leaving this as is may be dangerous. So either fdup on stderr
> or use
>         igt_reguire(test->kmsg >=3D 0);
>
> Regards,
> Kamil
>
> >
> >       return 0;
> >  }
> > --
> > 2.37.0
> >

That's a great point! I guess I prefer the latter, using igt_require,
for it is simpler and I believe errors when opening kmsg are too
seldom to justify anything too complex.
With that said, I think that the function won't need to return, after all.

Thanks for the review!
