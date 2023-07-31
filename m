Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BE510E0D7
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 08:19:02 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2684828e793so2612701a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 01:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230728143742.322532-1-aesteve@redhat.com>
 <20230728143742.322532-3-aesteve@redhat.com>
 <8c2e8d57-589c-4555-4968-20ab8d5b9395@intel.com>
In-Reply-To: <8c2e8d57-589c-4555-4968-20ab8d5b9395@intel.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Jul 2023 10:18:46 +0200
Message-ID: <CADSE00JRQW1nSE8-4KmgLqsaKVBkndbWeHSmVcPvWXSHRomjRQ@mail.gmail.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Content-Type: multipart/alternative; boundary="000000000000fed2970601c41459"
Subject: Re: [igt-dev] [PATCH v2 2/2] kms_cursor_legacy:
 modeset-atomic-cursor-hotspot
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

--000000000000fed2970601c41459
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 9:30=E2=80=AFAM Modem, Bhanuprakash <
bhanuprakash.modem@intel.com> wrote:

> Hello,
>
> On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:
> > Add a test for modesetting an atomic cursor plane
> > hotspot property. Test added to verify the kernel
> > patch at [1]. The test first checks if the
> > plane is atomic and has the hotspot property.
> > and if it does, it sets different random hot_x
> > and hot_y values and checks that it is updated
> > correctly after an atomic commit.
> >
> > [1]
> https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >   tests/kms_cursor_legacy.c | 76 ++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 76 insertions(+)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 1ebac9d31..ba68dc481 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -1607,6 +1607,71 @@ static void flip_vs_cursor_busy_crc(igt_display_=
t
> *display, bool atomic)
> >       put_ahnd(ahnd);
> >   }
> >
> > +static void modeset_atomic_cursor_hotspot(igt_display_t *display)
> > +{
> > +     struct igt_fb cursor_fb;
> > +     igt_output_t *output;
> > +     enum pipe pipe;
> > +     igt_plane_t *cursor =3D NULL;
> > +     bool has_hotspot_prop;
> > +     uint64_t cursor_width, cursor_height;
> > +     uint32_t hot_x, hot_y, prev_hot_x, prev_hot_y;
> > +
> > +     igt_require(display->is_atomic);
> > +     igt_require(display->set_hotspots);
> > +     pipe =3D find_connected_pipe(display, false, &output);
> > +     igt_require(output);
> > +
> > +     igt_info("Using pipe %s & %s\n",
> > +              kmstest_pipe_name(pipe), igt_output_name(output));
> > +
> > +     cursor_width =3D cursor_height =3D 64;
> > +     igt_create_color_fb(display->drm_fd, cursor_width, cursor_height,
> DRM_FORMAT_ARGB8888,
> > +                         DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb=
);
> > +
> > +     igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +     cursor =3D set_cursor_on_pipe(display, pipe, &cursor_fb);
> > +
> > +     has_hotspot_prop =3D cursor->props[IGT_PLANE_HOTSPOT_X] ||
> > +             cursor->props[IGT_PLANE_HOTSPOT_Y];
> > +     igt_require_f(has_hotspot_prop, "Cursor plane lacks the hotspot
> property");
> > +
> > +     /*
> > +      * Change the hotspot coordinates randomly and check that the
> property
> > +      * is updated accordingly.
> > +      */
> > +     srand(time(NULL));
> > +     for (int i =3D 0; i < 20; i++) {
> > +             hot_x =3D rand() % cursor_width;
> > +             hot_y =3D rand() % cursor_height;
> > +             prev_hot_x =3D igt_plane_get_prop(cursor,
> IGT_PLANE_HOTSPOT_X);
> > +             prev_hot_y =3D igt_plane_get_prop(cursor,
> IGT_PLANE_HOTSPOT_Y);
> > +             igt_debug("Update cursor hotspot: (%d, %d)\n", hot_x,
> hot_y);
> > +
> > +             /* Set cursor hotspot property values */
> > +             igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_X,
> hot_x);
> > +             igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y,
> hot_y);
> > +
> > +             /* Properties are not updated until the commit */
> > +             igt_assert_eq(igt_plane_get_prop(cursor,
> IGT_PLANE_HOTSPOT_X), prev_hot_x);
> > +             igt_assert_eq(igt_plane_get_prop(cursor,
> IGT_PLANE_HOTSPOT_Y), prev_hot_y);
>
> I think, this check is not required since it is an obvious.
>

It is indeed a bit redundant, and probably out of the scope of the hotspot
setting.
But it was low effort and adds a layer that helps to understand what the
test is doing, and how the properties are updated.
That said, I am ok with removing this. Actually, I added these checks only
in a
later step of the development.


>
> > +
> > +             igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +             /* After the commit, the cursor hotspot property values
> are updated */
> > +             igt_assert_eq(igt_plane_get_prop(cursor,
> IGT_PLANE_HOTSPOT_X), hot_x);
> > +             igt_assert_eq(igt_plane_get_prop(cursor,
> IGT_PLANE_HOTSPOT_Y), hot_y);
> > +     }
> > +
> > +     /* Clean-up */
> > +     igt_plane_set_fb(cursor, NULL);
> > +     igt_output_set_pipe(output, PIPE_NONE);
>
> We need to cleanup/set to default hotspot before exiting the subtest.
>

Sure, will do!


>
> - Bhanu
>
> > +     igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +     igt_remove_fb(display->drm_fd, &cursor_fb);
> > +}
> > +
> >   igt_main
> >   {
> >       const int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> > @@ -1681,6 +1746,17 @@ igt_main
> >                       nonblocking_modeset_vs_cursor(&display, 16);
> >       }
> >
> > +     igt_describe("Test changes the cursor hotspot and checks that the=
 "
> > +                   "property is updated accordignly");
> > +     igt_subtest_group {
> > +             igt_fixture {
> > +                     igt_display_require_output(&display);
> > +             }
> > +
> > +             igt_subtest("modeset-atomic-cursor-hotspot")
> > +                     modeset_atomic_cursor_hotspot(&display);
> > +     }
> > +
> >       igt_describe("This test executes flips on both CRTCs "
> >                    "while running cursor updates in parallel");
> >       igt_subtest_group {
>
>

--000000000000fed2970601c41459
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 31, 2023 at 9:30=
=E2=80=AFAM Modem, Bhanuprakash &lt;<a href=3D"mailto:bhanuprakash.modem@in=
tel.com">bhanuprakash.modem@intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:<br>
&gt; Add a test for modesetting an atomic cursor plane<br>
&gt; hotspot property. Test added to verify the kernel<br>
&gt; patch at [1]. The test first checks if the<br>
&gt; plane is atomic and has the hotspot property.<br>
&gt; and if it does, it sets different random hot_x<br>
&gt; and hot_y values and checks that it is updated<br>
&gt; correctly after an atomic commit.<br>
&gt; <br>
&gt; [1] <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2023-J=
uly/414509.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedes=
ktop.org/archives/dri-devel/2023-July/414509.html</a><br>
&gt; <br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/kms_cursor_legacy.c | 76 +++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 76 insertions(+)<br>
&gt; <br>
&gt; diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c<br>
&gt; index 1ebac9d31..ba68dc481 100644<br>
&gt; --- a/tests/kms_cursor_legacy.c<br>
&gt; +++ b/tests/kms_cursor_legacy.c<br>
&gt; @@ -1607,6 +1607,71 @@ static void flip_vs_cursor_busy_crc(igt_display=
_t *display, bool atomic)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0put_ahnd(ahnd);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void modeset_atomic_cursor_hotspot(igt_display_t *display)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct igt_fb cursor_fb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_output_t *output;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum pipe pipe;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_plane_t *cursor =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool has_hotspot_prop;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint64_t cursor_width, cursor_height;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t hot_x, hot_y, prev_hot_x, prev_hot_y;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(display-&gt;is_atomic);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(display-&gt;set_hotspots);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pipe =3D find_connected_pipe(display, false, &amp=
;output);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(output);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_info(&quot;Using pipe %s &amp; %s\n&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kmstest_pipe_name(pi=
pe), igt_output_name(output));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cursor_width =3D cursor_height =3D 64;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_create_color_fb(display-&gt;drm_fd, cursor_wi=
dth, cursor_height, DRM_FORMAT_ARGB8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &amp;cursor_fb);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_display_commit2(display, COMMIT_ATOMIC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cursor =3D set_cursor_on_pipe(display, pipe, &amp=
;cursor_fb);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0has_hotspot_prop =3D cursor-&gt;props[IGT_PLANE_H=
OTSPOT_X] ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cursor-&gt;props[IGT_=
PLANE_HOTSPOT_Y];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require_f(has_hotspot_prop, &quot;Cursor plan=
e lacks the hotspot property&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Change the hotspot coordinates randomly and ch=
eck that the property<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * is updated accordingly.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0srand(time(NULL));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; 20; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hot_x =3D rand() % cu=
rsor_width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hot_y =3D rand() % cu=
rsor_height;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prev_hot_x =3D igt_pl=
ane_get_prop(cursor, IGT_PLANE_HOTSPOT_X);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prev_hot_y =3D igt_pl=
ane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_debug(&quot;Updat=
e cursor hotspot: (%d, %d)\n&quot;, hot_x, hot_y);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set cursor hotspot=
 property values */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_output_set_prop_v=
alue(cursor, IGT_PLANE_HOTSPOT_X, hot_x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_output_set_prop_v=
alue(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Properties are not=
 updated until the commit */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(igt_pla=
ne_get_prop(cursor, IGT_PLANE_HOTSPOT_X), prev_hot_x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(igt_pla=
ne_get_prop(cursor, IGT_PLANE_HOTSPOT_Y), prev_hot_y);<br>
<br>
I think, this check is not required since it is an obvious.<br></blockquote=
><div><br></div><div>It is indeed a bit redundant, and probably out of the =
scope of the hotspot setting.</div><div>But it was low effort and adds a la=
yer that helps to understand what the</div><div>test is doing, and how the =
properties are updated.</div><div>That said, I am ok with removing this. Ac=
tually, I added these checks only in a</div><div>later step of the developm=
ent.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_display_commit2(d=
isplay, COMMIT_ATOMIC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* After the commit, =
the cursor hotspot property values are updated */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(igt_pla=
ne_get_prop(cursor, IGT_PLANE_HOTSPOT_X), hot_x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(igt_pla=
ne_get_prop(cursor, IGT_PLANE_HOTSPOT_Y), hot_y);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Clean-up */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_plane_set_fb(cursor, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_output_set_pipe(output, PIPE_NONE);<br>
<br>
We need to cleanup/set to default hotspot before exiting the subtest.<br></=
blockquote><div><br></div><div>Sure, will do!</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
- Bhanu<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_display_commit2(display, COMMIT_ATOMIC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_remove_fb(display-&gt;drm_fd, &amp;cursor_fb)=
;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0igt_main<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPROCESSORS_=
ONLN);<br>
&gt; @@ -1681,6 +1746,17 @@ igt_main<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0nonblocking_modeset_vs_cursor(&amp;display, 16);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe(&quot;Test changes the cursor hotspo=
t and checks that the &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;property is updated accordignly&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest_group {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fixture {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_display_require_output(&amp;display);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;mod=
eset-atomic-cursor-hotspot&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0modeset_atomic_cursor_hotspot(&amp;display);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_describe(&quot;This test executes flips =
on both CRTCs &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;while running cursor updates in parallel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_subtest_group {<br>
<br>
</blockquote></div></div>

--000000000000fed2970601c41459--
