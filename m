Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B710E149
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 08:12:39 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-267f61da571so4583567a91.0
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 01:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230728143742.322532-1-aesteve@redhat.com>
 <20230728143742.322532-2-aesteve@redhat.com>
 <a5ada367-5eb6-8b97-82eb-af2d36f120b1@intel.com>
In-Reply-To: <a5ada367-5eb6-8b97-82eb-af2d36f120b1@intel.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Jul 2023 10:12:22 +0200
Message-ID: <CADSE00L-KZQgSs63EbpsEms7F6pqyagB_HVG7KzUKcGc3R0oXA@mail.gmail.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Content-Type: multipart/alternative; boundary="0000000000001617c90601c3fed9"
Subject: Re: [igt-dev] [PATCH v2 1/2] igt_kms: add hotspot plane property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000001617c90601c3fed9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 8:30=E2=80=AFAM Modem, Bhanuprakash <
bhanuprakash.modem@intel.com> wrote:

> Hello,
>
> On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:
> > Introduce LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
> > capability definition until patched drm.h uapi header
> > is upstreamed and lands on IGT.
> >
> > CURSOR_PLANE_HOTSPOT capability is enabled
> > conditionally, and then tracked in the igt_display
> > struct.
> >
> > Add HOTSPOT_X and HOTSPOT_Y properties
> > to the atomic_plane_properties struct.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >   lib/igt_kms.c | 10 ++++++++++
> >   lib/igt_kms.h | 11 ++++++++++-
> >   2 files changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index f2b0eed57..73119d0e5 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -601,6 +601,8 @@ const char * const
> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
> >       [IGT_PLANE_CRTC_Y] =3D "CRTC_Y",
> >       [IGT_PLANE_CRTC_W] =3D "CRTC_W",
> >       [IGT_PLANE_CRTC_H] =3D "CRTC_H",
> > +     [IGT_PLANE_HOTSPOT_X] =3D "HOTSPOT_X",
> > +     [IGT_PLANE_HOTSPOT_Y] =3D "HOTSPOT_Y",
> >       [IGT_PLANE_FB_ID] =3D "FB_ID",
> >       [IGT_PLANE_CRTC_ID] =3D "CRTC_ID",
> >       [IGT_PLANE_IN_FENCE_FD] =3D "IN_FENCE_FD",
> > @@ -2296,6 +2298,11 @@ static void igt_plane_reset(igt_plane_t *plane)
> >       if (igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
> >               igt_plane_set_prop_enum(plane, IGT_PLANE_SCALING_FILTER,
> "Default");
> >
> > +     if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_X))
> > +             igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_X, 0);
> > +     if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
> > +             igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
> > +
> >       igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
> >       plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
> >       plane->gem_handle =3D 0;
> > @@ -2679,6 +2686,9 @@ void igt_display_require(igt_display_t *display,
> int drm_fd)
> >       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> >       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> >               display->is_atomic =3D 1;
> > +
> > +     if (drmSetClientCap(drm_fd,
> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) =3D=3D 0)
> > +             display->set_hotspots =3D 1;
>
> Any special reason to add this to display struct?
> IMHO, it is better to handle it at test level.
>

Hi Bhanu,

Mostly for keeping it consistent with the `is_atomic` capability.

Are you suggesting moving the `drmSetClientCap` to the test?
I am ok with changing this, just trying to understand what would
be the preferred way here.

Thanks!


>
> - Bhanu
>
> >
> >       plane_resources =3D drmModeGetPlaneResources(display->drm_fd);
> >       igt_assert(plane_resources);
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 1b6988c17..cf0a6d82b 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -41,6 +41,12 @@
> >
> >   /* Low-level helpers with kmstest_ prefix */
> >
> > +/**
> > + * Clients which do set cursor hotspot and treat the cursor plane
> > + * like a mouse cursor should set this property.
> > + */
> > +#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT    6
> > +
> >   /**
> >    * pipe:
> >    * @PIPE_NONE: Invalid pipe, used for disconnecting a output from a
> pipe.
> > @@ -318,7 +324,9 @@ enum igt_atomic_plane_properties {
> >          IGT_PLANE_ZPOS,
> >          IGT_PLANE_FB_DAMAGE_CLIPS,
> >          IGT_PLANE_SCALING_FILTER,
> > -       IGT_NUM_PLANE_PROPS
> > +       IGT_PLANE_HOTSPOT_X,
> > +       IGT_PLANE_HOTSPOT_Y,
> > +       IGT_NUM_PLANE_PROPS
> >   };
> >
> >   /**
> > @@ -448,6 +456,7 @@ struct igt_display {
> >       igt_pipe_t *pipes;
> >       bool has_cursor_plane;
> >       bool is_atomic;
> > +     bool set_hotspots;
> >       bool first_commit;
> >
> >       uint64_t *modifiers;
>
>

--0000000000001617c90601c3fed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font=
-family:RedHatText,sans-serif;font-weight:bold;margin:0px;padding:0px;font-=
size:14px"><br></p></div></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 31, 2023 at 8:30=E2=80=AFA=
M Modem, Bhanuprakash &lt;<a href=3D"mailto:bhanuprakash.modem@intel.com">b=
hanuprakash.modem@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello,<br>
<br>
On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:<br>
&gt; Introduce LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT<br>
&gt; capability definition until patched drm.h uapi header<br>
&gt; is upstreamed and lands on IGT.<br>
&gt; <br>
&gt; CURSOR_PLANE_HOTSPOT capability is enabled<br>
&gt; conditionally, and then tracked in the igt_display<br>
&gt; struct.<br>
&gt; <br>
&gt; Add HOTSPOT_X and HOTSPOT_Y properties<br>
&gt; to the atomic_plane_properties struct.<br>
&gt; <br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0lib/igt_kms.c | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0lib/igt_kms.h | 11 ++++++++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 20 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/lib/igt_kms.c b/lib/igt_kms.c<br>
&gt; index f2b0eed57..73119d0e5 100644<br>
&gt; --- a/lib/igt_kms.c<br>
&gt; +++ b/lib/igt_kms.c<br>
&gt; @@ -601,6 +601,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PL=
ANE_PROPS] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_Y] =3D &quot;CRTC_Y&quot;,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_W] =3D &quot;CRTC_W&quot;,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_H] =3D &quot;CRTC_H&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0[IGT_PLANE_HOTSPOT_X] =3D &quot;HOTSPOT_X&quot;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IGT_PLANE_HOTSPOT_Y] =3D &quot;HOTSPOT_Y&quot;,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_FB_ID] =3D &quot;FB_ID&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_ID] =3D &quot;CRTC_ID&quot;,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_IN_FENCE_FD] =3D &quot;IN_FENCE_F=
D&quot;,<br>
&gt; @@ -2296,6 +2298,11 @@ static void igt_plane_reset(igt_plane_t *plane)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_plane_has_prop(plane, IGT_PLANE_SCAL=
ING_FILTER))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_set_pr=
op_enum(plane, IGT_PLANE_SCALING_FILTER, &quot;Default&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_X=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_set_prop_va=
lue(plane, IGT_PLANE_HOTSPOT_X, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_set_prop_va=
lue(plane, IGT_PLANE_HOTSPOT_Y, 0);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_clear_prop_changed(plane, IGT_PLAN=
E_IN_FENCE_FD);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0plane-&gt;values[IGT_PLANE_IN_FENCE_FD] =3D =
~0ULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0plane-&gt;gem_handle =3D 0;<br>
&gt; @@ -2679,6 +2686,9 @@ void igt_display_require(igt_display_t *display,=
 int drm_fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVE=
RSAL_PLANES, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_A=
TOMIC, 1) =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0display-&gt;is_a=
tomic =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_=
CURSOR_PLANE_HOTSPOT, 1) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0display-&gt;set_hotsp=
ots =3D 1;<br>
<br>
Any special reason to add this to display struct?<br>
IMHO, it is better to handle it at test level.<br></blockquote><div><br></d=
iv><div>Hi Bhanu,</div><div><br></div><div>Mostly for keeping it consistent=
 with the `is_atomic` capability.</div><div><br></div><div>Are you suggesti=
ng moving the `drmSetClientCap` to the test?</div><div>I am ok with changin=
g this, just trying to understand what would</div><div>be the preferred way=
 here.</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
- Bhanu<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0plane_resources =3D drmModeGetPlaneResources=
(display-&gt;drm_fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(plane_resources);<br>
&gt; diff --git a/lib/igt_kms.h b/lib/igt_kms.h<br>
&gt; index 1b6988c17..cf0a6d82b 100644<br>
&gt; --- a/lib/igt_kms.h<br>
&gt; +++ b/lib/igt_kms.h<br>
&gt; @@ -41,6 +41,12 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Low-level helpers with kmstest_ prefix */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * Clients which do set cursor hotspot and treat the cursor plane<br>
&gt; + * like a mouse cursor should set this property.<br>
&gt; + */<br>
&gt; +#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=C2=A0 =C2=A0 6<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 * pipe:<br>
&gt;=C2=A0 =C2=A0 * @PIPE_NONE: Invalid pipe, used for disconnecting a outp=
ut from a pipe.<br>
&gt; @@ -318,7 +324,9 @@ enum igt_atomic_plane_properties {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IGT_PLANE_ZPOS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IGT_PLANE_FB_DAMAGE_CLIPS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IGT_PLANE_SCALING_FILTER,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_NUM_PLANE_PROPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_PLANE_HOTSPOT_X,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_PLANE_HOTSPOT_Y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_NUM_PLANE_PROPS<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt; @@ -448,6 +456,7 @@ struct igt_display {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_pipe_t *pipes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cursor_plane;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_atomic;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool set_hotspots;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool first_commit;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *modifiers;<br>
<br>
</blockquote></div></div>

--0000000000001617c90601c3fed9--
