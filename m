Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6433B89D43
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 10:03:20 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h10so9155008lfc.12
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 02:03:20 -0800 (PST)
MIME-Version: 1.0
References: <1551100999-27427-1-git-send-email-sergii.romantsov@globallogic.com>
 <20190226094605.GB4038@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20190226094605.GB4038@platvala-desk.ger.corp.intel.com>
From: Sergii Romantsov <sergii.romantsov@gmail.com>
Date: Tue, 26 Feb 2019 12:03:07 +0200
Message-ID: <CALWg4ioqQqgF7i89wFkxUP+xh4mkVJiHCiE00Yc7dgTUXqngow@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] meson: missed dependency of liblzma
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1118034002=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sergii Romantsov <sergii.romantsov@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1118034002==
Content-Type: multipart/alternative; boundary="0000000000009fa4480582c92ae0"

--0000000000009fa4480582c92ae0
Content-Type: text/plain; charset="UTF-8"

Hello, Petri.


> As I understood you, just installing liblzma-dev makes the build
> successful, right?


If to be more specific, installing liblzma-dev makes meson-configuration
successful.

Making this change just lead to better error messages when it's not
> installed?


Yes, it will show which package exactly leaked instead of unclear error.

What is the distro you're using?


4.15.0-45-generic #48~16.04.1-Ubuntu SMP Tue Jan 29 18:03:48 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

I think it happens due to specific of meson-dependency - how it looks for a
package.
So command (when liblzma-dev is absent, but liblzma5 is installed)
 'pkg-config --cflags --libs libdw'
gives:
"Package liblzma was not found in the pkg-config search path.
Perhaps you should add the directory containing `liblzma.pc'
to the PKG_CONFIG_PATH environment variable
Package 'liblzma', required by 'libdw', not found"

So in my understanding its just because of lack of liblzma.pc

On Tue, Feb 26, 2019 at 11:46 AM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Mon, Feb 25, 2019 at 03:23:19PM +0200, Sergii Romantsov wrote:
> > Failed to configure intel-gpu-tools with error:
> >
> >       meson.build:151:0: ERROR:  Could not generate cargs for libdw:
> >
> > libdw depends on liblzma.
> > Installation of liblzma-dev fixes issue.
> >
> > Fixes: e39e09910fc8 (lib/core: Use libdw to decode stack trace with
> debugging symbols, v2.)
> > CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Sergii Romantsov <sergii.romantsov@globallogic.com>
> > ---
> >  meson.build | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meson.build b/meson.build
> > index 099db89..4c58ca8 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -148,6 +148,7 @@ if with_libunwind != 'false'
> >  endif
> >  build_info += 'With libunwind: ' + libunwindinfo
> >
> > +liblzma = dependency('liblzma', required : true)
>
> _We_ don't use liblzma for anything though, so this is kind of
> superfluous. As I understood you, just installing liblzma-dev makes
> the build successful, right? Making this change just lead to better
> error messages when it's not installed?
>
> What is the distro you're using? The ones we build-test on in gitlab
> CI (Fedora, Debian) both have libdw's development package depend on
> liblzma.
>
>
> --
> Petri Latvala
>

--0000000000009fa4480582c92ae0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Hello, Petri.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">As I understood you, just installing liblzma-dev =
makes=C2=A0the build successful, right?</blockquote><div><br></div><div>If =
to be more specific,=C2=A0installing liblzma-dev makes meson-configuration =
successful.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Making this change just lead to better error messages when it&#39;s =
not installed?</blockquote><div><br></div><div>Yes, it will show which pack=
age exactly leaked instead of unclear error.</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">What is the distro you&#39;re using=
?=C2=A0</blockquote><div><br></div><div>4.15.0-45-generic #48~16.04.1-Ubunt=
u SMP Tue Jan 29 18:03:48 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux</div><div=
><br></div><div>I think it happens due to specific of meson-<span style=3D"=
color:rgb(80,0,80)">dependency</span>=C2=A0- how it looks for a package.</d=
iv><div>So command (when liblzma-dev is absent, but liblzma5 is installed)<=
/div><div>=C2=A0&#39;pkg-config --cflags --libs libdw&#39;</div><div>gives:=
</div><div><div>&quot;Package liblzma was not found in the pkg-config searc=
h path.</div><div>Perhaps you should add the directory containing `liblzma.=
pc&#39;</div><div>to the PKG_CONFIG_PATH environment variable</div><div>Pac=
kage &#39;liblzma&#39;, required by &#39;libdw&#39;, not found&quot;</div><=
/div><div><br></div><div>So in my understanding its just because of lack of=
 liblzma.pc</div></div></div></div></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 26, 2019 at 11:46 AM P=
etri Latvala &lt;<a href=3D"mailto:petri.latvala@intel.com">petri.latvala@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, Feb 25, 2019 at 03:23:19PM +0200, Sergii Romantsov wrote:<b=
r>
&gt; Failed to configure intel-gpu-tools with error:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meson.build:151:0: ERROR:=C2=A0 Could not ge=
nerate cargs for libdw:<br>
&gt; <br>
&gt; libdw depends on liblzma.<br>
&gt; Installation of liblzma-dev fixes issue.<br>
&gt; <br>
&gt; Fixes: e39e09910fc8 (lib/core: Use libdw to decode stack trace with de=
bugging symbols, v2.)<br>
&gt; CC: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@linux.in=
tel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<br>
&gt; Signed-off-by: Sergii Romantsov &lt;<a href=3D"mailto:sergii.romantsov=
@globallogic.com" target=3D"_blank">sergii.romantsov@globallogic.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 099db89..4c58ca8 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -148,6 +148,7 @@ if with_libunwind !=3D &#39;false&#39;<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 build_info +=3D &#39;With libunwind: &#39; + libunwindinfo<br>
&gt;=C2=A0 <br>
&gt; +liblzma =3D dependency(&#39;liblzma&#39;, required : true)<br>
<br>
_We_ don&#39;t use liblzma for anything though, so this is kind of<br>
superfluous. As I understood you, just installing liblzma-dev makes<br>
the build successful, right? Making this change just lead to better<br>
error messages when it&#39;s not installed?<br>
<br>
What is the distro you&#39;re using? The ones we build-test on in gitlab<br=
>
CI (Fedora, Debian) both have libdw&#39;s development package depend on<br>
liblzma.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
</blockquote></div>

--0000000000009fa4480582c92ae0--

--===============1118034002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1118034002==--
