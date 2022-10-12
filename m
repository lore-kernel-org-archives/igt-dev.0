Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6FE10E4E3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 13:27:38 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id k6so15283487vsp.0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 06:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221007210112.3153308-1-jfree@freebsd.org>
 <Y0Uu5fp40unW+8KO@kamilkon-desk1>
In-Reply-To: <Y0Uu5fp40unW+8KO@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 12 Oct 2022 08:27:26 -0500
Message-ID: <CAOgZAGaLKf=W0AMAsDHBUiQDRqU1zocAp4REQVoYaeE=jZgJcA@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jake Freeland <jake@technologyfriends.net>, Jake Freeland <jfree@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000003458dc05ead65b39"
Subject: Re: [igt-dev] [PATCH i-g-t] [r-b] tests/i915/gem_mmap_*: Add NULL
 to ptrace() calls
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

--0000000000003458dc05ead65b39
Content-Type: text/plain; charset="UTF-8"

Kamil,

Understood. Thank you for clarifying that.

Jake Freeland

On Tue, Oct 11, 2022 at 3:52 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-10-07 at 16:01:12 -0500, Jake Freeland wrote:
> > In FreeBSD, the ptrace() function cannot take a variable
> > length list of arguments. This patch adds NULL in the @data
> > parameter to allow for compilation on FreeBSD systems.
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
>
> When I wrote about "adding r-b" that means you can add:
>
> Reviewed-by: Name of Reviewer <reviewer@address>
>
> after your s-b (signed-off-by) line, so it will look like:
>
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
> > ---
> >  tests/i915/gem_mmap_gtt.c    | 2 +-
> >  tests/i915/gem_mmap_offset.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> > index e39b9047..4f05eb18 100644
> > --- a/tests/i915/gem_mmap_gtt.c
> > +++ b/tests/i915/gem_mmap_gtt.c
> > @@ -566,7 +566,7 @@ test_ptrace(int fd)
> >       for (int i = 0; i < sz / sizeof(long); i++) {
> >               long ret;
> >
> > -             ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i);
> > +             ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i, NULL);
> >               igt_assert_eq_u64(ret, CC);
> >               cpy[i] = ret;
> >
> > diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> > index 2b416edd..d1a67f45 100644
> > --- a/tests/i915/gem_mmap_offset.c
> > +++ b/tests/i915/gem_mmap_offset.c
> > @@ -520,7 +520,7 @@ static void test_ptrace(int i915)
> >                               for (int i = 0; i < SZ / sizeof(long);
> i++) {
> >                                       long ret;
> >
> > -                                     ret = ptrace(PTRACE_PEEKDATA, pid,
> ptr + i);
> > +                                     ret = ptrace(PTRACE_PEEKDATA, pid,
> ptr + i, NULL);
> >                                       igt_assert_eq_u64(ret, CC);
> >                                       cpy[i] = ret;
> >
> > --
> > 2.37.3
> >
>

--0000000000003458dc05ead65b39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kamil,<div><br></div><div>Understood. Thank you for clarif=
ying that.</div><div><br></div><div>Jake Freeland</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 11, 2022=
 at 3:52 AM Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.int=
el.com">kamil.konieczny@linux.intel.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi Jake,<br>
<br>
On 2022-10-07 at 16:01:12 -0500, Jake Freeland wrote:<br>
&gt; In FreeBSD, the ptrace() function cannot take a variable<br>
&gt; length list of arguments. This patch adds NULL in the @data<br>
&gt; parameter to allow for compilation on FreeBSD systems.<br>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
<br>
When I wrote about &quot;adding r-b&quot; that means you can add:<br>
<br>
Reviewed-by: Name of Reviewer &lt;reviewer@address&gt;<br>
<br>
after your s-b (signed-off-by) line, so it will look like:<br>
<br>
Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" targe=
t=3D"_blank">jfree@freebsd.org</a>&gt;<br>
Reviewed-by: Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.in=
tel.com" target=3D"_blank">kamil.konieczny@linux.intel.com</a>&gt;<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; ---<br>
&gt;=C2=A0 tests/i915/gem_mmap_gtt.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 tests/i915/gem_mmap_offset.c | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c<br>
&gt; index e39b9047..4f05eb18 100644<br>
&gt; --- a/tests/i915/gem_mmap_gtt.c<br>
&gt; +++ b/tests/i915/gem_mmap_gtt.c<br>
&gt; @@ -566,7 +566,7 @@ test_ptrace(int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; sz / sizeof(long); =
i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ptrace(PTRACE=
_PEEKDATA, pid, gtt + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ptrace(PTRACE=
_PEEKDATA, pid, gtt + i, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq_u6=
4(ret, CC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpy[i] =3D ret;<=
br>
&gt;=C2=A0 <br>
&gt; diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset=
.c<br>
&gt; index 2b416edd..d1a67f45 100644<br>
&gt; --- a/tests/i915/gem_mmap_offset.c<br>
&gt; +++ b/tests/i915/gem_mmap_offset.c<br>
&gt; @@ -520,7 +520,7 @@ static void test_ptrace(int i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; SZ / size=
of(long); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long r=
et;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ptra=
ce(PTRACE_PEEKDATA, pid, ptr + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ptra=
ce(PTRACE_PEEKDATA, pid, ptr + i, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_as=
sert_eq_u64(ret, CC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpy[i]=
 =3D ret;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
</blockquote></div>

--0000000000003458dc05ead65b39--
