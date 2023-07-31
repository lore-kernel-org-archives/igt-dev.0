Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F4010E2A5
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 13:36:52 +0000 (UTC)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-268068d80b9so3233364a91.3
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 06:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230728143742.322532-1-aesteve@redhat.com>
 <20230728143742.322532-2-aesteve@redhat.com>
 <a5ada367-5eb6-8b97-82eb-af2d36f120b1@intel.com>
 <CADSE00L-KZQgSs63EbpsEms7F6pqyagB_HVG7KzUKcGc3R0oXA@mail.gmail.com>
 <c9bf9ed1-9370-41d3-7f33-1e953f28cfc4@intel.com>
 <CADSE00JZDhCvDiVuhu_8nFe+BPXekHvCE-S+N-smNiFRKyyTYQ@mail.gmail.com>
In-Reply-To: <CADSE00JZDhCvDiVuhu_8nFe+BPXekHvCE-S+N-smNiFRKyyTYQ@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Jul 2023 15:36:31 +0200
Message-ID: <CADSE00JJTDDQ=nxjv0oFDMDYivAp6EE8WU0Q1B94-MfNUtL1TQ@mail.gmail.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Content-Type: multipart/alternative; boundary="00000000000061e5380601c885f9"
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

--00000000000061e5380601c885f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 1:27=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:

>
>
> On Mon, Jul 31, 2023 at 10:49=E2=80=AFAM Modem, Bhanuprakash <
> bhanuprakash.modem@intel.com> wrote:
>
>>
>>
>> On Mon-31-07-2023 01:42 pm, Albert Esteve wrote:
>> >
>> >
>> >
>> > On Mon, Jul 31, 2023 at 8:30=E2=80=AFAM Modem, Bhanuprakash
>> > <bhanuprakash.modem@intel.com <mailto:bhanuprakash.modem@intel.com>>
>> wrote:
>> >
>> >     Hello,
>> >
>> >     On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:
>> >      > Introduce LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
>> >      > capability definition until patched drm.h uapi header
>> >      > is upstreamed and lands on IGT.
>> >      >
>> >      > CURSOR_PLANE_HOTSPOT capability is enabled
>> >      > conditionally, and then tracked in the igt_display
>> >      > struct.
>> >      >
>> >      > Add HOTSPOT_X and HOTSPOT_Y properties
>> >      > to the atomic_plane_properties struct.
>> >      >
>> >      > Signed-off-by: Albert Esteve <aesteve@redhat.com
>> >     <mailto:aesteve@redhat.com>>
>> >      > ---
>> >      >   lib/igt_kms.c | 10 ++++++++++
>> >      >   lib/igt_kms.h | 11 ++++++++++-
>> >      >   2 files changed, 20 insertions(+), 1 deletion(-)
>> >      >
>> >      > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> >      > index f2b0eed57..73119d0e5 100644
>> >      > --- a/lib/igt_kms.c
>> >      > +++ b/lib/igt_kms.c
>> >      > @@ -601,6 +601,8 @@ const char * const
>> >     igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
>> >      >       [IGT_PLANE_CRTC_Y] =3D "CRTC_Y",
>> >      >       [IGT_PLANE_CRTC_W] =3D "CRTC_W",
>> >      >       [IGT_PLANE_CRTC_H] =3D "CRTC_H",
>> >      > +     [IGT_PLANE_HOTSPOT_X] =3D "HOTSPOT_X",
>> >      > +     [IGT_PLANE_HOTSPOT_Y] =3D "HOTSPOT_Y",
>> >      >       [IGT_PLANE_FB_ID] =3D "FB_ID",
>> >      >       [IGT_PLANE_CRTC_ID] =3D "CRTC_ID",
>> >      >       [IGT_PLANE_IN_FENCE_FD] =3D "IN_FENCE_FD",
>> >      > @@ -2296,6 +2298,11 @@ static void igt_plane_reset(igt_plane_t
>> >     *plane)
>> >      >       if (igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
>> >      >               igt_plane_set_prop_enum(plane,
>> >     IGT_PLANE_SCALING_FILTER, "Default");
>> >      >
>> >      > +     if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_X))
>> >      > +             igt_plane_set_prop_value(plane,
>> >     IGT_PLANE_HOTSPOT_X, 0);
>> >      > +     if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
>> >      > +             igt_plane_set_prop_value(plane,
>> >     IGT_PLANE_HOTSPOT_Y, 0);
>> >      > +
>> >      >       igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD=
);
>> >      >       plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
>> >      >       plane->gem_handle =3D 0;
>> >      > @@ -2679,6 +2686,9 @@ void igt_display_require(igt_display_t
>> >     *display, int drm_fd)
>> >      >       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
>> 1);
>> >      >       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=
=3D 0)
>> >      >               display->is_atomic =3D 1;
>> >      > +
>> >      > +     if (drmSetClientCap(drm_fd,
>> >     LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) =3D=3D 0)
>> >      > +             display->set_hotspots =3D 1;
>> >
>> >     Any special reason to add this to display struct?
>> >     IMHO, it is better to handle it at test level.
>> >
>> >
>> > Hi Bhanu,
>> >
>> > Mostly for keeping it consistent with the `is_atomic` capability.
>> >
>> > Are you suggesting moving the `drmSetClientCap` to the test?
>>
>> Yes.
>>
>> > I am ok with changing this, just trying to understand what would
>> > be the preferred way here.
>>
>> Either way (adding to display struct or checking at test level) is fine.
>>
>> Generally to maintain the re-usability (ex: checking for the same
>> capability multiple times) we used to cache the capabilities to display
>> struct. If multiple tests (or multiple places in your test) want to use
>> this hotspot capability, you can add it to the display struct.
>>
>
> ATM it is only this test. If there is a need for more tests,
> we can move capability setting back to display, but for the time being I
> will follow
> your advice and move it to the test.
>
> Something like...?
> igt_subtest("modeset-atomic-cursor-hotspot") {
>     igt_require(drmSetClientCap(display.drm_fd,
> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) =3D=3D 0);
>     modeset_atomic_cursor_hotspot(&display);
>     igt_assert_eq(drmSetClientCap(display.drm_fd,
> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 0), 0);
> }
>
>

Hi Bhanu,

As I was testing this, I realized that if I delay setting the capability,
the
`igt_display_require` function will not find the cursor planes as they get
disabled
with the kernel patch that I am testing:
https://www.spinics.net/lists/stable/msg667033.html

Specifically, we need to set the capability before:
plane_resources =3D drmModeGetPlaneResources(display->drm_fd);

... or else the test will be skipped.

Therefore, I need to keep it where it is now, and then I can also keep
storing
the capability in the display struct.


>
>> - Bhanu
>>
>> >
>> > Thanks!
>> >
>> >
>> >     - Bhanu
>> >
>> >      >
>> >      >       plane_resources =3D
>> drmModeGetPlaneResources(display->drm_fd);
>> >      >       igt_assert(plane_resources);
>> >      > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> >      > index 1b6988c17..cf0a6d82b 100644
>> >      > --- a/lib/igt_kms.h
>> >      > +++ b/lib/igt_kms.h
>> >      > @@ -41,6 +41,12 @@
>> >      >
>> >      >   /* Low-level helpers with kmstest_ prefix */
>> >      >
>> >      > +/**
>> >      > + * Clients which do set cursor hotspot and treat the cursor
>> plane
>> >      > + * like a mouse cursor should set this property.
>> >      > + */
>> >      > +#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT    6
>> >      > +
>> >      >   /**
>> >      >    * pipe:
>> >      >    * @PIPE_NONE: Invalid pipe, used for disconnecting a output
>> >     from a pipe.
>> >      > @@ -318,7 +324,9 @@ enum igt_atomic_plane_properties {
>> >      >          IGT_PLANE_ZPOS,
>> >      >          IGT_PLANE_FB_DAMAGE_CLIPS,
>> >      >          IGT_PLANE_SCALING_FILTER,
>> >      > -       IGT_NUM_PLANE_PROPS
>> >      > +       IGT_PLANE_HOTSPOT_X,
>> >      > +       IGT_PLANE_HOTSPOT_Y,
>> >      > +       IGT_NUM_PLANE_PROPS
>> >      >   };
>> >      >
>> >      >   /**
>> >      > @@ -448,6 +456,7 @@ struct igt_display {
>> >      >       igt_pipe_t *pipes;
>> >      >       bool has_cursor_plane;
>> >      >       bool is_atomic;
>> >      > +     bool set_hotspots;
>> >      >       bool first_commit;
>> >      >
>> >      >       uint64_t *modifiers;
>> >
>>
>>

--00000000000061e5380601c885f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 31, 2023 at 1:27=
=E2=80=AFPM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><br></div></div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 31, 20=
23 at 10:49=E2=80=AFAM Modem, Bhanuprakash &lt;<a href=3D"mailto:bhanupraka=
sh.modem@intel.com" target=3D"_blank">bhanuprakash.modem@intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Mon-31-07-2023 01:42 pm, Albert Esteve wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jul 31, 2023 at 8:30=E2=80=AFAM Modem, Bhanuprakash <br>
&gt; &lt;<a href=3D"mailto:bhanuprakash.modem@intel.com" target=3D"_blank">=
bhanuprakash.modem@intel.com</a> &lt;mailto:<a href=3D"mailto:bhanuprakash.=
modem@intel.com" target=3D"_blank">bhanuprakash.modem@intel.com</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Introduce LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_H=
OTSPOT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; capability definition until patched drm.h uap=
i header<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; is upstreamed and lands on IGT.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; CURSOR_PLANE_HOTSPOT capability is enabled<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; conditionally, and then tracked in the igt_di=
splay<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; struct.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Add HOTSPOT_X and HOTSPOT_Y properties<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to the atomic_plane_properties struct.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Albert Esteve &lt;<a href=3D"m=
ailto:aesteve@redhat.com" target=3D"_blank">aesteve@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:aesteve@redhat.com" ta=
rget=3D"_blank">aesteve@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0lib/igt_kms.c | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0lib/igt_kms.h | 11 ++++++++++-<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A02 files changed, 20 insertions(+)=
, 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/lib/igt_kms.c b/lib/igt_kms.c<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index f2b0eed57..73119d0e5 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/lib/igt_kms.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/lib/igt_kms.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -601,6 +601,8 @@ const char * const<br>
&gt;=C2=A0 =C2=A0 =C2=A0igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_Y] =
=3D &quot;CRTC_Y&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_W] =
=3D &quot;CRTC_W&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_H] =
=3D &quot;CRTC_H&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0[IGT_PLANE_HOTSPOT_X] =
=3D &quot;HOTSPOT_X&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0[IGT_PLANE_HOTSPOT_Y] =
=3D &quot;HOTSPOT_Y&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_FB_ID] =
=3D &quot;FB_ID&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_CRTC_ID]=
 =3D &quot;CRTC_ID&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[IGT_PLANE_IN_FENCE=
_FD] =3D &quot;IN_FENCE_FD&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -2296,6 +2298,11 @@ static void igt_plane_=
reset(igt_plane_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0*plane)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_plane_has_p=
rop(plane, IGT_PLANE_SCALING_FILTER))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0igt_plane_set_prop_enum(plane,<br>
&gt;=C2=A0 =C2=A0 =C2=A0IGT_PLANE_SCALING_FILTER, &quot;Default&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0if (igt_plane_has_prop(p=
lane, IGT_PLANE_HOTSPOT_X))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_plane_set_prop_value(plane,<br>
&gt;=C2=A0 =C2=A0 =C2=A0IGT_PLANE_HOTSPOT_X, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0if (igt_plane_has_prop(p=
lane, IGT_PLANE_HOTSPOT_Y))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_plane_set_prop_value(plane,<br>
&gt;=C2=A0 =C2=A0 =C2=A0IGT_PLANE_HOTSPOT_Y, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_clear_pro=
p_changed(plane, IGT_PLANE_IN_FENCE_FD);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0plane-&gt;values[IG=
T_PLANE_IN_FENCE_FD] =3D ~0ULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0plane-&gt;gem_handl=
e =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -2679,6 +2686,9 @@ void igt_display_requir=
e(igt_display_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0*display, int drm_fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drmSetClientCap(drm=
_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drmSetClientCap=
(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0display-&gt;is_atomic =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0if (drmSetClientCap(drm_=
fd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) =3D=
=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0display-&gt;set_hotspots =3D 1;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Any special reason to add this to display struct?<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0IMHO, it is better to handle it at test level.<br>
&gt; <br>
&gt; <br>
&gt; Hi Bhanu,<br>
&gt; <br>
&gt; Mostly for keeping it consistent with the `is_atomic` capability.<br>
&gt; <br>
&gt; Are you suggesting moving the `drmSetClientCap` to the test?<br>
<br>
Yes.<br>
<br>
&gt; I am ok with changing this, just trying to understand what would<br>
&gt; be the preferred way here.<br>
<br>
Either way (adding to display struct or checking at test level) is fine.<br=
>
<br>
Generally to maintain the re-usability (ex: checking for the same <br>
capability multiple times) we used to cache the capabilities to display <br=
>
struct. If multiple tests (or multiple places in your test) want to use <br=
>
this hotspot capability, you can add it to the display struct.<br></blockqu=
ote><div><br></div><div>ATM it is only this test. If there is a need for mo=
re tests,</div><div>we can move capability setting back to display, but for=
 the time being I will follow</div><div>your advice and move it to the test=
.</div><div><br></div><div>Something like...?</div><div>igt_subtest(&quot;m=
odeset-atomic-cursor-hotspot&quot;) {<br></div><div>=C2=A0 =C2=A0 igt_requi=
re(drmSetClientCap(display.drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPO=
T, 1) =3D=3D 0);<br>=C2=A0 =C2=A0 modeset_atomic_cursor_hotspot(&amp;displa=
y);<br>=C2=A0 =C2=A0 igt_assert_eq(drmSetClientCap(display.drm_fd, LOCAL_DR=
M_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 0), 0);<br>=09=09}<br></div><div>=C2=A0<=
/div></div></div></blockquote><div><br></div><div>Hi Bhanu,</div><div><br><=
/div><div>As I was testing this, I realized that if I delay setting the cap=
ability, the</div><div>`igt_display_require` function will not find the cur=
sor planes as they get disabled</div><div>with the kernel patch that I am t=
esting:=C2=A0<a href=3D"https://www.spinics.net/lists/stable/msg667033.html=
">https://www.spinics.net/lists/stable/msg667033.html</a></div><div><br></d=
iv><div>Specifically, we need to set the capability before:</div><div>plane=
_resources =3D drmModeGetPlaneResources(display-&gt;drm_fd);<br></div><div>=
<br></div><div>... or else the test will be skipped.</div><div><br></div><d=
iv>Therefore, I need to keep it where it is now, and then I can also keep s=
toring</div><div>the capability in the display struct.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- Bhanu<br>
<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- Bhanu<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0plane_resources =3D=
 drmModeGetPlaneResources(display-&gt;drm_fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(plane_re=
sources);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/lib/igt_kms.h b/lib/igt_kms.h<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 1b6988c17..cf0a6d82b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/lib/igt_kms.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/lib/igt_kms.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -41,6 +41,12 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0/* Low-level helpers with kmstest=
_ prefix */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Clients which do set cursor hotspot and t=
reat the cursor plane<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * like a mouse cursor should set this prope=
rty.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HO=
TSPOT=C2=A0 =C2=A0 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 * pipe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 * @PIPE_NONE: Invalid pipe, used=
 for disconnecting a output<br>
&gt;=C2=A0 =C2=A0 =C2=A0from a pipe.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -318,7 +324,9 @@ enum igt_atomic_plane_pro=
perties {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IGT_PLANE_Z=
POS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IGT_PLANE_F=
B_DAMAGE_CLIPS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IGT_PLANE_S=
CALING_FILTER,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_NUM_PLANE_PRO=
PS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_PLANE_HOTSPOT=
_X,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_PLANE_HOTSPOT=
_Y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT_NUM_PLANE_PRO=
PS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -448,6 +456,7 @@ struct igt_display {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_pipe_t *pipes;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cursor_pla=
ne;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_atomic;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0bool set_hotspots;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool first_commit;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *modifiers=
;<br>
&gt; <br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000061e5380601c885f9--
