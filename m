Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE7810E0A2
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 14:26:54 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id s185so5447625vkb.0
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221016172725.1556355-1-jfree@freebsd.org>
 <Y00Ln6XbwnADY1B9@kamilkon-desk1>
In-Reply-To: <Y00Ln6XbwnADY1B9@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Mon, 17 Oct 2022 09:26:42 -0500
Message-ID: <CAOgZAGYQNRC4Ym_JEWz+oaz+KPS+WSxE2HJf9LRoyxz9mbxRzw@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000580fd905eb3bc41d"
Subject: Re: [igt-dev] [PATCH i-g-t] meson.build: Add FreeBSD OS detection
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

--000000000000580fd905eb3bc41d
Content-Type: text/plain; charset="UTF-8"

Hi there Kamil,

After some coordination with the FreeBSD graphics team, I decided
to remove the freebsd-uapi sync_file.h include. The file that I submitted
in a previous patch is simply a copy of the linux-uapi sync_file.h with
minor modifications to compile successfully. It turns out that FreeBSD
does not have a comparable fencing uapi making the freebsd-uapi
sync_file.h technically improper.

This patch introduces the '/usr/local/include' include dir on FreeBSD
systems.
I will return back to the freebsd-uapi sync file when I have a proper
solution.

Thank you,
Jake Freeland

On Mon, Oct 17, 2022 at 3:00 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-10-16 at 12:27:25 -0500, Jake Freeland wrote:
> > Use meson's host_machine.system() to detect the target operating
> > system. If the target is FreeBSD, add /usr/local/include to the
> > include dirs.
>
> Put here also note about change from linux-uapi to freebsd-uapi.
>
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
> > ---
> >  meson.build | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meson.build b/meson.build
> > index 3e937f5a..896efbf8 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -86,7 +86,12 @@ with_libdrm = get_option('libdrm_drivers')
> >
> >  build_info = ['Build type: ' + get_option('buildtype')]
> >
> > +system = host_machine.system()
> > +if system == 'linux'
> >  inc = include_directories('include/drm-uapi', 'include/linux-uapi',
> 'lib', 'lib/stubs/syscalls', '.')
> > +elif system == 'freebsd'
> > +inc = include_directories('include/drm-uapi', 'include/linux-uapi',
> 'lib', 'lib/stubs/syscalls', '.', '/usr/local/include')
> --------------------------------------------------------- ^
> freebsd-uapi
>
> Regards,
> Kamil
>
> > +endif
> >
> >  inc_for_gtkdoc = include_directories('lib')
> >
> > --
> > 2.37.3
> >
>

--000000000000580fd905eb3bc41d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there Kamil,<div><br></div><div>After some coordination=
 with the FreeBSD graphics team, I decided</div><div>to remove the freebsd-=
uapi sync_file.h include. The file that I submitted</div><div>in a previous=
 patch is simply a copy of the linux-uapi sync_file.h with</div><div>minor =
modifications to compile successfully. It turns out that FreeBSD</div><div>=
does not have=C2=A0a comparable=C2=A0fencing uapi making the freebsd-uapi</=
div><div>sync_file.h technically improper.</div><div><br></div><div>This pa=
tch introduces the &#39;/usr/local/include&#39; include=C2=A0dir on FreeBSD=
 systems.</div><div>I will return back to the freebsd-uapi sync file when I=
 have a proper solution.</div><div><br></div><div>Thank you,</div><div>Jake=
 Freeland</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 17, 2022 at 3:00 AM Kamil Konieczny &lt;<a href=
=3D"mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Jake,<br>
<br>
On 2022-10-16 at 12:27:25 -0500, Jake Freeland wrote:<br>
&gt; Use meson&#39;s host_machine.system() to detect the target operating<b=
r>
&gt; system. If the target is FreeBSD, add /usr/local/include to the<br>
&gt; include dirs.<br>
<br>
Put here also note about change from linux-uapi to freebsd-uapi.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 3e937f5a..896efbf8 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -86,7 +86,12 @@ with_libdrm =3D get_option(&#39;libdrm_drivers&#39;=
)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 build_info =3D [&#39;Build type: &#39; + get_option(&#39;buildty=
pe&#39;)]<br>
&gt;=C2=A0 <br>
&gt; +system =3D host_machine.system()<br>
&gt; +if system =3D=3D &#39;linux&#39;<br>
&gt;=C2=A0 inc =3D include_directories(&#39;include/drm-uapi&#39;, &#39;inc=
lude/linux-uapi&#39;, &#39;lib&#39;, &#39;lib/stubs/syscalls&#39;, &#39;.&#=
39;)<br>
&gt; +elif system =3D=3D &#39;freebsd&#39;<br>
&gt; +inc =3D include_directories(&#39;include/drm-uapi&#39;, &#39;include/=
linux-uapi&#39;, &#39;lib&#39;, &#39;lib/stubs/syscalls&#39;, &#39;.&#39;, =
&#39;/usr/local/include&#39;)<br>
--------------------------------------------------------- ^<br>
freebsd-uapi<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inc_for_gtkdoc =3D include_directories(&#39;lib&#39;)<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
</blockquote></div>

--000000000000580fd905eb3bc41d--
