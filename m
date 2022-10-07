Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A02910E12E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 20:18:16 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id t18so6078559vsr.12
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 13:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145241.44592-1-jfree@freebsd.org>
 <Y0B5GS3uCf3+ltXT@kamilkon-desk1>
In-Reply-To: <Y0B5GS3uCf3+ltXT@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Fri, 7 Oct 2022 15:18:04 -0500
Message-ID: <CAOgZAGZygHC4jgr=WWD0EfDHrCCLCUhCwFTWk7cLvRkkm9-m+A@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jake Freeland <jake@technologyfriends.net>, Jake Freeland <jfree@freebsd.org>,
 Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="00000000000089880005ea77826a"
Subject: Re: [igt-dev] [PATCH i-g-t] lib/tests/igt_fork.c: Fix error in
 mmap() flags
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

--00000000000089880005ea77826a
Content-Type: text/plain; charset="UTF-8"

Kamil,

Good to know for both of those points. Thanks for telling me.

Jake Freeland

On Fri, Oct 7, 2022 at 2:08 PM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-10-07 at 09:52:41 -0500, Jake Freeland wrote:
> > In subtest_leak(), mmap() is called with the flag PROT_WRITE,
> > but no PROT_READ. Later in the function, the mapped memory is
> > read using `children[i]`. In FreeBSD, the lack of PROT_READ
> > causes SIGSEGV. Adding the PROT_READ flag to the mmap() call
> > fixes this.
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
>
> Please note that when you got r-b (review-by) and you do just
> resend with no modifications to your patch, you can add r-b
> tag to this one patch which got r-b and send it. It will save
> time for other people.
>
> Please also read e-mails from CI when it says there was a
> failure and if that is unrelated, replay with cc: to Lakshmi
> Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
> and ask for adding exception and rescan.
>
> Regards,
> Kamil
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> > ---
> >  lib/tests/igt_fork.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
> > index d19d0945..d883aba4 100644
> > --- a/lib/tests/igt_fork.c
> > +++ b/lib/tests/igt_fork.c
> > @@ -109,7 +109,7 @@ __noreturn static void igt_fork_timeout_leak(void)
> >  __noreturn static void subtest_leak(void)
> >  {
> >       pid_t *children =
> > -             mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > +             mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED |
> MAP_ANON, -1, 0);
> >       const int num_children = 4096 / sizeof(*children);
> >
> >       igt_subtest_init(fake_argc, fake_argv);
> > --
> > 2.37.0 (Apple Git-136)
> >
>

--00000000000089880005ea77826a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kamil,<div><br></div><div>Good to know for both of=C2=A0th=
ose points. Thanks for telling me.</div><div><br></div><div>Jake Freeland</=
div><div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 7, 2022 at 2:08 PM Kamil Konieczny &lt;<a href=
=3D"mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Jake,<br>
<br>
On 2022-10-07 at 09:52:41 -0500, Jake Freeland wrote:<br>
&gt; In subtest_leak(), mmap() is called with the flag PROT_WRITE,<br>
&gt; but no PROT_READ. Later in the function, the mapped memory is<br>
&gt; read using `children[i]`. In FreeBSD, the lack of PROT_READ<br>
&gt; causes SIGSEGV. Adding the PROT_READ flag to the mmap() call<br>
&gt; fixes this.<br>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
<br>
Please note that when you got r-b (review-by) and you do just<br>
resend with no modifications to your patch, you can add r-b<br>
tag to this one patch which got r-b and send it. It will save<br>
time for other people.<br>
<br>
Please also read e-mails from CI when it says there was a<br>
failure and if that is unrelated, replay with cc: to Lakshmi<br>
Lakshminarayana Vudum &lt;<a href=3D"mailto:lakshminarayana.vudum@intel.com=
" target=3D"_blank">lakshminarayana.vudum@intel.com</a>&gt; <br>
and ask for adding exception and rescan.<br>
<br>
Regards,<br>
Kamil<br>
<br>
Reviewed-by: Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.in=
tel.com" target=3D"_blank">kamil.konieczny@linux.intel.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 lib/tests/igt_fork.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c<br>
&gt; index d19d0945..d883aba4 100644<br>
&gt; --- a/lib/tests/igt_fork.c<br>
&gt; +++ b/lib/tests/igt_fork.c<br>
&gt; @@ -109,7 +109,7 @@ __noreturn static void igt_fork_timeout_leak(void)=
<br>
&gt;=C2=A0 __noreturn static void subtest_leak(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t *children =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(0, 4096, PROT_WR=
ITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(0, 4096, PROT_RE=
AD | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const int num_children =3D 4096 / sizeof(*ch=
ildren);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_subtest_init(fake_argc, fake_argv);<br>
&gt; -- <br>
&gt; 2.37.0 (Apple Git-136)<br>
&gt; <br>
</blockquote></div>

--00000000000089880005ea77826a--
