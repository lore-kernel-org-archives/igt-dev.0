Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7B10E485
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 14:43:02 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2680f0cc480so1662000a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 07:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-3-aesteve@redhat.com>
 <87fs5cjeia.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87fs5cjeia.fsf@minerva.mail-host-address-is-not-set>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 26 Jul 2023 16:42:47 +0200
Message-ID: <CADSE00KJN0pt2E8iH5SCGtgyaqohTyCzX2oY=yQ-sGDTTfkVEw@mail.gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000256f11060164dd90"
Subject: Re: [igt-dev] [PATCH 2/3] igt_kms: add hotspot plane property
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

--000000000000256f11060164dd90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 3:40=E2=80=AFPM Javier Martinez Canillas <javierm@r=
edhat.com>
wrote:

>
> Hello Albert,
>
> Patch looks good to me. But I'm not really familiar with the IGT codebase=
.
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> I've one question below though:
>
> Albert Esteve <aesteve@redhat.com> writes:
>
> [...]
>
> > @@ -2679,6 +2686,8 @@ void igt_display_require(igt_display_t *display,
> int drm_fd)
> >       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> >       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> >               display->is_atomic =3D 1;
> > +
> > +     drmSetClientCap(drm_fd, DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1);
> >
>
> Should this capability be set unconditionally?
>
>
Probably could be set similarly to how the atomic capability is set, track
the property in the display
structure, and run the hotspot test only in cases where client understands
hotspot properties.
I can change this in the next drop.


> Do we want to also test the case when user-space doesn't opt-in and does
> not know how to handle the hostpost properties ?
>

In those cases, if setting the capability fails, it is probably better to
just skip the test.


>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
>

--000000000000256f11060164dd90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 25, 2023 at 3:40=
=E2=80=AFPM Javier Martinez Canillas &lt;<a href=3D"mailto:javierm@redhat.c=
om">javierm@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
Hello Albert,<br>
<br>
Patch looks good to me. But I&#39;m not really familiar with the IGT codeba=
se.<br>
<br>
Acked-by: Javier Martinez Canillas &lt;<a href=3D"mailto:javierm@redhat.com=
" target=3D"_blank">javierm@redhat.com</a>&gt;<br>
<br>
I&#39;ve one question below though:<br>
<br>
Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" target=3D"_blank">a=
esteve@redhat.com</a>&gt; writes:<br>
<br>
[...]<br>
<br>
&gt; @@ -2679,6 +2686,8 @@ void igt_display_require(igt_display_t *display,=
 int drm_fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVE=
RSAL_PLANES, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_A=
TOMIC, 1) =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0display-&gt;is_a=
tomic =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drmSetClientCap(drm_fd, DRM_CLIENT_CAP_CURSOR_PLA=
NE_HOTSPOT, 1);<br>
&gt;<br>
<br>
Should this capability be set unconditionally? <br>
<br></blockquote><div><br></div><div>Probably could be set similarly to how=
 the atomic capability is set, track the property in the display</div><div>=
structure, and run the hotspot test only in cases where client understands =
hotspot properties.</div><div>I can change this in the next drop.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Do we want to also test the case when user-space doesn&#39;t opt-in and doe=
s<br>
not know how to handle the hostpost properties ?<br></blockquote><div><br><=
/div><div>In those cases, if setting the capability fails, it=C2=A0is proba=
bly better to just skip the test.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
-- <br>
Best regards,<br>
<br>
Javier Martinez Canillas<br>
Core Platforms<br>
Red Hat<br>
<br>
</blockquote></div></div>

--000000000000256f11060164dd90--
