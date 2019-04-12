Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264BD897E0
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 13:41:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r25so7505404lfn.13
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 06:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <1551100999-27427-1-git-send-email-sergii.romantsov@globallogic.com>
 <20190226094605.GB4038@platvala-desk.ger.corp.intel.com>
 <CALWg4ioqQqgF7i89wFkxUP+xh4mkVJiHCiE00Yc7dgTUXqngow@mail.gmail.com>
 <20190226102029.GE4038@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20190226102029.GE4038@platvala-desk.ger.corp.intel.com>
From: Sergii Romantsov <sergii.romantsov@gmail.com>
Date: Fri, 12 Apr 2019 16:41:12 +0300
Message-ID: <CALWg4ipb4pM3z1BwFN1_muGb_A+aVd=VGkO5BNgwq00m7k+-1w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] meson: missed dependency of liblzma
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1462482643=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sergii Romantsov <sergii.romantsov@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1462482643==
Content-Type: multipart/alternative; boundary="00000000000066ead70586557550"

--00000000000066ead70586557550
Content-Type: text/plain; charset="UTF-8"

>
> I'll welcome a patch that makes dependency failures point to the
> Dockerfiles, though

Seems it can be done with meson >= 0.50 - here we can dump a message if
dependency failure.
But it seems to be look as not good solution (one dependency - one message).

As i see in the Dockerfiles listed dependency on liblzma.
So if meson-change is not preferable in that case - so at least readme-file
has to point us about dependencies.

On Tue, Feb 26, 2019 at 12:21 PM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Tue, Feb 26, 2019 at 12:03:07PM +0200, Sergii Romantsov wrote:
> > Hello, Petri.
> >
> >
> > > As I understood you, just installing liblzma-dev makes the build
> > > successful, right?
> >
> >
> > If to be more specific, installing liblzma-dev makes meson-configuration
> > successful.
> >
> > Making this change just lead to better error messages when it's not
> > > installed?
> >
> >
> > Yes, it will show which package exactly leaked instead of unclear error.
> >
> > What is the distro you're using?
> >
> >
> > 4.15.0-45-generic #48~16.04.1-Ubuntu SMP Tue Jan 29 18:03:48 UTC 2019
> > x86_64 x86_64 x86_64 GNU/Linux
> >
> > I think it happens due to specific of meson-dependency - how it looks
> for a
> > package.
> > So command (when liblzma-dev is absent, but liblzma5 is installed)
> >  'pkg-config --cflags --libs libdw'
> > gives:
> > "Package liblzma was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `liblzma.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'liblzma', required by 'libdw', not found"
> >
> > So in my understanding its just because of lack of liblzma.pc
>
>
> Indeed. I checked Ubuntu 16.04's libdw-dev and it:
>
> 1) Has liblzma in Requires.private in libdw.pc
> 2) Does not depend on liblzma-dev
>
> I don't see the bug reported, and I suspect it won't be fixed, with
> 16.04's support ending this year for the desktop version...
>
>
> However, on the patch, I'll have to nak the meson.build change. Having
> better error messages is not a good reason for useless dependency
> declarations. I'll welcome a patch that makes dependency failures
> point to the Dockerfiles, though.
>
>
> --
> Petri Latvala
>

--00000000000066ead70586557550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I&#39;ll welcome a patch that makes dependency failures=C2=A0poi=
nt to the Dockerfiles, though</blockquote><div>Seems it can be done with me=
son &gt;=3D 0.50 - here we can dump a message if dependency failure.</div><=
div>But it seems to be look as not good solution (one dependency - one mess=
age).</div><div><br></div><div>As i see in the Dockerfiles listed dependenc=
y on liblzma.</div><div>So if meson-change is not preferable in that case -=
 so at least readme-file has to point us about dependencies.</div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Feb 26, 2019 at 12:21 PM Petri Latvala &lt;<a href=3D"mailto:petri.lat=
vala@intel.com">petri.latvala@intel.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, Feb 26, 2019 at 12:03:07PM +=
0200, Sergii Romantsov wrote:<br>
&gt; Hello, Petri.<br>
&gt; <br>
&gt; <br>
&gt; &gt; As I understood you, just installing liblzma-dev makes the build<=
br>
&gt; &gt; successful, right?<br>
&gt; <br>
&gt; <br>
&gt; If to be more specific, installing liblzma-dev makes meson-configurati=
on<br>
&gt; successful.<br>
&gt; <br>
&gt; Making this change just lead to better error messages when it&#39;s no=
t<br>
&gt; &gt; installed?<br>
&gt; <br>
&gt; <br>
&gt; Yes, it will show which package exactly leaked instead of unclear erro=
r.<br>
&gt; <br>
&gt; What is the distro you&#39;re using?<br>
&gt; <br>
&gt; <br>
&gt; 4.15.0-45-generic #48~16.04.1-Ubuntu SMP Tue Jan 29 18:03:48 UTC 2019<=
br>
&gt; x86_64 x86_64 x86_64 GNU/Linux<br>
&gt; <br>
&gt; I think it happens due to specific of meson-dependency - how it looks =
for a<br>
&gt; package.<br>
&gt; So command (when liblzma-dev is absent, but liblzma5 is installed)<br>
&gt;=C2=A0 &#39;pkg-config --cflags --libs libdw&#39;<br>
&gt; gives:<br>
&gt; &quot;Package liblzma was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `liblzma.pc&#39;<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; Package &#39;liblzma&#39;, required by &#39;libdw&#39;, not found&quot=
;<br>
&gt; <br>
&gt; So in my understanding its just because of lack of liblzma.pc<br>
<br>
<br>
Indeed. I checked Ubuntu 16.04&#39;s libdw-dev and it:<br>
<br>
1) Has liblzma in Requires.private in libdw.pc<br>
2) Does not depend on liblzma-dev<br>
<br>
I don&#39;t see the bug reported, and I suspect it won&#39;t be fixed, with=
<br>
16.04&#39;s support ending this year for the desktop version...<br>
<br>
<br>
However, on the patch, I&#39;ll have to nak the meson.build change. Having<=
br>
better error messages is not a good reason for useless dependency<br>
declarations. I&#39;ll welcome a patch that makes dependency failures<br>
point to the Dockerfiles, though.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
</blockquote></div>

--00000000000066ead70586557550--

--===============1462482643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1462482643==--
