Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822F810E31A
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 14:54:59 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id k6so5244839vsc.8
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 07:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221007040717.2924978-1-jfree@freebsd.org>
 <20221007040717.2924978-6-jfree@freebsd.org>
 <Y0AFlRRG/qPBTY+8@kamilkon-desk1>
In-Reply-To: <Y0AFlRRG/qPBTY+8@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Fri, 7 Oct 2022 09:54:48 -0500
Message-ID: <CAOgZAGb90BMjGtyrwPMGWuyg7p1m6sO4fb2eZ5rLcF69nTeBLA@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jake Freeland <jake@technologyfriends.net>, Jake Freeland <jfree@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000061666005ea72fec7"
Subject: Re: [igt-dev] [PATCH i-g-t 06/10] lib/tests/igt_fork.c: Fix error
 in mmap() flags
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

--00000000000061666005ea72fec7
Content-Type: text/plain; charset="UTF-8"

Kamil,

I just submitted the patch independently.
https://patchwork.freedesktop.org/patch/506280/

Jake Freeland

On Fri, Oct 7, 2022 at 5:55 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-10-06 at 23:07:14 -0500, Jake Freeland wrote:
> > In subtest_leak(), mmap() is called with the flag PROT_WRITE,
> > but no PROT_READ. Later in the function, the mapped memory is
> > read using `children[i]`. In FreeBSD, the lack of PROT_READ
> > causes SIGSEGV. Adding the PROT_READ flag to the mmap() call
> > fixes this.
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
>
> Nice catch, please send this outside of your series, it can be
> merged as a fix.
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
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
> > 2.37.3
> >
>

--00000000000061666005ea72fec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kamil,<div><br></div><div>I just submitted the patch indep=
endently.</div><div><a href=3D"https://patchwork.freedesktop.org/patch/5062=
80/">https://patchwork.freedesktop.org/patch/506280/</a><br></div><div><br>=
</div><div>Jake Freeland</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 at 5:55 AM Kamil Konieczn=
y &lt;<a href=3D"mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@li=
nux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Jake,<br>
<br>
On 2022-10-06 at 23:07:14 -0500, Jake Freeland wrote:<br>
&gt; In subtest_leak(), mmap() is called with the flag PROT_WRITE,<br>
&gt; but no PROT_READ. Later in the function, the mapped memory is<br>
&gt; read using `children[i]`. In FreeBSD, the lack of PROT_READ<br>
&gt; causes SIGSEGV. Adding the PROT_READ flag to the mmap() call<br>
&gt; fixes this.<br>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
<br>
Nice catch, please send this outside of your series, it can be<br>
merged as a fix.<br>
<br>
Reviewed-by: Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.in=
tel.com" target=3D"_blank">kamil.konieczny@linux.intel.com</a>&gt;<br>
<br>
Regards,<br>
Kamil<br>
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
&gt; 2.37.3<br>
&gt; <br>
</blockquote></div>

--00000000000061666005ea72fec7--
