Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687B810E488
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 14:52:29 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7873f24e7edso452103439f.3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 07:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230725155141.723nfuzd22nbr6kp@kamilkon-desk1>
In-Reply-To: <20230725155141.723nfuzd22nbr6kp@kamilkon-desk1>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 26 Jul 2023 16:52:14 +0200
Message-ID: <CADSE00JCK3HFV63C_szigOL9+9dDU=cJTwEeV2SHHrg55W_k=A@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Albert Esteve <aesteve@redhat.com>, belmouss@redhat.com, javierm@redhat.com
Content-Type: multipart/alternative; boundary="000000000000e84cb4060164fef7"
Subject: Re: [igt-dev] [PATCH 0/3] Add atomic DRM cursor hotspot test
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

--000000000000e84cb4060164fef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 5:53=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Albert,
>
> please subscribe to igt-dev mailinglist.
>

Done :)

>
> On 2023-07-21 at 15:04:55 +0200, Albert Esteve wrote:
> > Add test to verify the kernel patch at [1].
> >
> > The test modifies the hotspot x and y properties and
> > checks that they get properly updated after every
> > display commit.
> >
> > The first git commit updating the drm header shall be removed,
> > and update the header properly after the kernel patch has
> > landed.
> >
> > [1] -
> https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html
>
> Add this to your 3rd patch with commit message (subject),
> as links tends to rot.
>

Sure! I'll prepare a next drop soon.


>
> Regards,
> Kamil
>
> >
> > Albert Esteve (3):
> >   drm header update: temp commit
> >   igt_kms: add hotspot plane property
> >   kms_cursor_legacy: modeset-atomic-cursor-hotspot
> >
> >  include/drm-uapi/drm.h    | 54 +++++++++++++++++++++++++++-
> >  lib/igt_kms.c             |  9 +++++
> >  lib/igt_kms.h             |  4 ++-
> >  tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 140 insertions(+), 2 deletions(-)
> >
> > --
> > 2.40.0
> >
>
>

--000000000000e84cb4060164fef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 25, 2023 at 5:53=
=E2=80=AFPM Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.int=
el.com">kamil.konieczny@linux.intel.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi Albert,<br>
<br>
please subscribe to igt-dev mailinglist.<br></blockquote><div><br></div><di=
v>Done :)=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 2023-07-21 at 15:04:55 +0200, Albert Esteve wrote:<br>
&gt; Add test to verify the kernel patch at [1].<br>
&gt; <br>
&gt; The test modifies the hotspot x and y properties and<br>
&gt; checks that they get properly updated after every<br>
&gt; display commit.<br>
&gt; <br>
&gt; The first git commit updating the drm header shall be removed,<br>
&gt; and update the header properly after the kernel patch has<br>
&gt; landed.<br>
&gt; <br>
&gt; [1] - <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2023=
-July/414509.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freed=
esktop.org/archives/dri-devel/2023-July/414509.html</a><br>
<br>
Add this to your 3rd patch with commit message (subject),<br>
as links tends to rot.<br></blockquote><div><br></div><div>Sure! I&#39;ll p=
repare a next drop soon.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Regards,<br>
Kamil<br>
<br>
&gt; <br>
&gt; Albert Esteve (3):<br>
&gt;=C2=A0 =C2=A0drm header update: temp commit<br>
&gt;=C2=A0 =C2=A0igt_kms: add hotspot plane property<br>
&gt;=C2=A0 =C2=A0kms_cursor_legacy: modeset-atomic-cursor-hotspot<br>
&gt; <br>
&gt;=C2=A0 include/drm-uapi/drm.h=C2=A0 =C2=A0 | 54 +++++++++++++++++++++++=
++++-<br>
&gt;=C2=A0 lib/igt_kms.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 +++++<br>
&gt;=C2=A0 lib/igt_kms.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 ++-<br>
&gt;=C2=A0 tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 4 files changed, 140 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.40.0<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000e84cb4060164fef7--
