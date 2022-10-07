Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185C610E231
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 21:10:16 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id g85so2805765vkf.10
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 14:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221007040717.2924978-1-jfree@freebsd.org>
 <20221007040717.2924978-9-jfree@freebsd.org>
 <Y0AMoWWxwFGqTQj+@kamilkon-desk1>
In-Reply-To: <Y0AMoWWxwFGqTQj+@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Fri, 7 Oct 2022 16:10:04 -0500
Message-ID: <CAOgZAGaSosm9ehgzoJG=12Vdxp8LUWF41_fCqZmV3ce7VzOkCw@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jake Freeland <jake@technologyfriends.net>, Jake Freeland <jfree@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000007643f805ea783c38"
Subject: Re: [igt-dev] [PATCH i-g-t 09/10] Restrict sigev_notify_thread_id
 macro definition to Linux
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

--0000000000007643f805ea783c38
Content-Type: text/plain; charset="UTF-8"

https://patchwork.freedesktop.org/patch/506303/

On Fri, Oct 7, 2022 at 6:25 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-10-06 at 23:07:17 -0500, Jake Freeland wrote:
> > The `#define sigev_notify_thread_id _sigev_un._tid` macro differs on
> > FreeBSD. This patch uses ifdefs to stop the compiler from overriding
> > FreeBSD's existing definition.
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
>
> Please send this outside of your series, it can be merged as
> separate patch. See also some notes below.
>
> > ---
> >  benchmarks/gem_syslatency.c | 2 ++
> >  lib/igt_aux.h               | 2 +-
> >  tests/i915/gem_close_race.c | 2 ++
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
> > index 395d2e71..366c8af6 100644
> > --- a/benchmarks/gem_syslatency.c
> > +++ b/benchmarks/gem_syslatency.c
> > @@ -53,7 +53,9 @@
> >  #include "igt_freebsd.h"
> >  #endif
> >
> > +#ifdef __linux__
> >  #define sigev_notify_thread_id _sigev_un._tid
> > +#endif
>
> Instead of this please just include igt_aux.h header.
>
> >
> >  static volatile int done;
> >
> > diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> > index c98cf28f..569b92d7 100644
> > --- a/lib/igt_aux.h
> > +++ b/lib/igt_aux.h
> > @@ -48,8 +48,8 @@
> >  # ifndef HAVE_GETTID
> >  #  define gettid() (pid_t)(syscall(__NR_gettid))
> >  # endif
> > -#endif
> >  #define sigev_notify_thread_id _sigev_un._tid
> --- ^
> Put space before define to keep style.
>
> > +#endif
> >
> >  /* auxialiary igt helpers from igt_aux.c */
> >  /* generally useful helpers */
> > diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> > index 938fde8f..42fe1657 100644
> > --- a/tests/i915/gem_close_race.c
> > +++ b/tests/i915/gem_close_race.c
> > @@ -61,7 +61,9 @@ static bool has_softpin;
> >  static uint64_t exec_addr;
> >  static uint64_t data_addr;
> >
> > +#ifdef __linux__
> >  #define sigev_notify_thread_id _sigev_un._tid
> > +#endif
>
> Same here, include igt_aux.h
>
> Regards,
> Kamil
>
> >
> >  static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
> >  {
> > --
> > 2.37.3
> >
>

--0000000000007643f805ea783c38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://patchwork.freedesktop.org/patch/506303/=
">https://patchwork.freedesktop.org/patch/506303/</a></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 =
at 6:25 AM Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.inte=
l.com">kamil.konieczny@linux.intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi Jake,<br>
<br>
On 2022-10-06 at 23:07:17 -0500, Jake Freeland wrote:<br>
&gt; The `#define sigev_notify_thread_id _sigev_un._tid` macro differs on<b=
r>
&gt; FreeBSD. This patch uses ifdefs to stop the compiler from overriding<b=
r>
&gt; FreeBSD&#39;s existing definition.<br>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
<br>
Please send this outside of your series, it can be merged as<br>
separate patch. See also some notes below.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 benchmarks/gem_syslatency.c | 2 ++<br>
&gt;=C2=A0 lib/igt_aux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
&gt;=C2=A0 tests/i915/gem_close_race.c | 2 ++<br>
&gt;=C2=A0 3 files changed, 5 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c=
<br>
&gt; index 395d2e71..366c8af6 100644<br>
&gt; --- a/benchmarks/gem_syslatency.c<br>
&gt; +++ b/benchmarks/gem_syslatency.c<br>
&gt; @@ -53,7 +53,9 @@<br>
&gt;=C2=A0 #include &quot;igt_freebsd.h&quot;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +#ifdef __linux__<br>
&gt;=C2=A0 #define sigev_notify_thread_id _sigev_un._tid<br>
&gt; +#endif<br>
<br>
Instead of this please just include igt_aux.h header.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static volatile int done;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/lib/igt_aux.h b/lib/igt_aux.h<br>
&gt; index c98cf28f..569b92d7 100644<br>
&gt; --- a/lib/igt_aux.h<br>
&gt; +++ b/lib/igt_aux.h<br>
&gt; @@ -48,8 +48,8 @@<br>
&gt;=C2=A0 # ifndef HAVE_GETTID<br>
&gt;=C2=A0 #=C2=A0 define gettid() (pid_t)(syscall(__NR_gettid))<br>
&gt;=C2=A0 # endif<br>
&gt; -#endif<br>
&gt;=C2=A0 #define sigev_notify_thread_id _sigev_un._tid<br>
--- ^<br>
Put space before define to keep style.<br>
<br>
&gt; +#endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* auxialiary igt helpers from igt_aux.c */<br>
&gt;=C2=A0 /* generally useful helpers */<br>
&gt; diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c=
<br>
&gt; index 938fde8f..42fe1657 100644<br>
&gt; --- a/tests/i915/gem_close_race.c<br>
&gt; +++ b/tests/i915/gem_close_race.c<br>
&gt; @@ -61,7 +61,9 @@ static bool has_softpin;<br>
&gt;=C2=A0 static uint64_t exec_addr;<br>
&gt;=C2=A0 static uint64_t data_addr;<br>
&gt;=C2=A0 <br>
&gt; +#ifdef __linux__<br>
&gt;=C2=A0 #define sigev_notify_thread_id _sigev_un._tid<br>
&gt; +#endif<br>
<br>
Same here, include igt_aux.h<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int =
loops)<br>
&gt;=C2=A0 {<br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
</blockquote></div>

--0000000000007643f805ea783c38--
