Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDF010E485
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 14:50:56 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2685bc4f867so228032a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-4-aesteve@redhat.com>
 <87cz0gjcd6.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87cz0gjcd6.fsf@minerva.mail-host-address-is-not-set>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 26 Jul 2023 16:50:41 +0200
Message-ID: <CADSE00L4H_fAEXizdyoPZJLztr7b3dBZoiXECRnUpLcevR+Dzw@mail.gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005a95a1060164f92f"
Subject: Re: [igt-dev] [PATCH 3/3] kms_cursor_legacy:
 modeset-atomic-cursor-hotspot
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, belmouss@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000005a95a1060164f92f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 4:26=E2=80=AFPM Javier Martinez Canillas <javierm@r=
edhat.com>
wrote:

> Albert Esteve <aesteve@redhat.com> writes:
>
> The patch looks good to me as well.
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Some comments below though:
>
> > Add a test for modesetting an atomic cursor plane
> > hotspot property. The test first checks if the
> > plane is atomic and has the hotspot property.
> > and if it does, it sets different random hot_x
> > and hot_y values and checks that it is updated
> > correctly after an atomic commit.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 1ebac9d31..38258ed8d 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
>
> This file is called kms_cursor_legacy.c but it seems there are tests for
> both legacy KMS and atomic KMS? That confused me :)
>

+1 :)


>
> > @@ -1607,6 +1607,70 @@ static void flip_vs_cursor_busy_crc(igt_display_=
t
> *display, bool atomic)
> >       put_ahnd(ahnd);
> >  }
> >
> > +static void modeset_atomic_cursot_hotspot(igt_display_t *display)
> > +{
>
> I think you meant this to be "cursor_hotspot" instead ?
>
>
Oh, the typo, yes. Nice catch!


> [...]
>
> > +
> > +     width =3D height =3D 64;
>
> maybe you can rename these to cursor_{width,height} ?
>
>
Ok.


> Also, there's
> https://docs.kernel.org/gpu/drm-uapi.html#c.DRM_CAP_CURSOR_WIDTH
> and DRM_CAP_CURSOR_HEIGHT to query the hardware cursor size. Maybe you
> should
> use that instead of assume a 64x64 cursor size ?
>

In many other tests in the same file the size of the cursor is hardcoded to
64, same as here.
So I kept it consistent.
Could be a nice refactor, but I guess it is outside the scope of this patch=
.


>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
>

--0000000000005a95a1060164f92f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font=
-family:RedHatText,sans-serif;font-weight:bold;margin:0px;padding:0px;font-=
size:14px"><br></p></div></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 25, 2023 at 4:26=E2=80=AFP=
M Javier Martinez Canillas &lt;<a href=3D"mailto:javierm@redhat.com">javier=
m@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" target=
=3D"_blank">aesteve@redhat.com</a>&gt; writes:<br>
<br>
The patch looks good to me as well.<br>
<br>
Acked-by: Javier Martinez Canillas &lt;<a href=3D"mailto:javierm@redhat.com=
" target=3D"_blank">javierm@redhat.com</a>&gt;<br>
<br>
Some comments below though:<br>
<br>
&gt; Add a test for modesetting an atomic cursor plane<br>
&gt; hotspot property. The test first checks if the<br>
&gt; plane is atomic and has the hotspot property.<br>
&gt; and if it does, it sets different random hot_x<br>
&gt; and hot_y values and checks that it is updated<br>
&gt; correctly after an atomic commit.<br>
&gt;<br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 75 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c<br>
&gt; index 1ebac9d31..38258ed8d 100644<br>
&gt; --- a/tests/kms_cursor_legacy.c<br>
&gt; +++ b/tests/kms_cursor_legacy.c<br>
<br>
This file is called kms_cursor_legacy.c but it seems there are tests for<br=
>
both legacy KMS and atomic KMS? That confused me :)<br></blockquote><div><b=
r></div><div>+1 :)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; @@ -1607,6 +1607,70 @@ static void flip_vs_cursor_busy_crc(igt_display=
_t *display, bool atomic)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0put_ahnd(ahnd);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void modeset_atomic_cursot_hotspot(igt_display_t *display)<br>
&gt; +{<br>
<br>
I think you meant this to be &quot;cursor_hotspot&quot; instead ?<br>
<br></blockquote><div><br></div><div>Oh, the typo, yes. Nice catch!</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
[...]<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0width =3D height =3D 64;<br>
<br>
maybe you can rename these to cursor_{width,height} ?<br>
<br></blockquote><div><br></div><div>Ok.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Also, there&#39;s <a href=3D"https://docs.kernel.org/gpu/drm-uapi.html#c.DR=
M_CAP_CURSOR_WIDTH" rel=3D"noreferrer" target=3D"_blank">https://docs.kerne=
l.org/gpu/drm-uapi.html#c.DRM_CAP_CURSOR_WIDTH</a><br>
and DRM_CAP_CURSOR_HEIGHT to query the hardware cursor size. Maybe you shou=
ld<br>
use that instead of assume a 64x64 cursor size ?<br></blockquote><div><br><=
/div><div>In many other tests in the same file the size of the cursor is ha=
rdcoded to 64, same as here.</div><div>So I kept it consistent.</div><div>C=
ould be a nice refactor, but I guess it is outside the scope of this patch.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Best regards,<br>
<br>
Javier Martinez Canillas<br>
Core Platforms<br>
Red Hat<br>
<br>
</blockquote></div></div>

--0000000000005a95a1060164f92f--
