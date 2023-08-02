Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE9210E0A1
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 09:21:11 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-26814a0122dso563143a91.1
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Aug 2023 02:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230801084853.42075-1-aesteve@redhat.com>
 <20230801084853.42075-3-aesteve@redhat.com>
 <2ccde5bf-bcff-b9ac-1bc4-eafc8b781880@intel.com>
In-Reply-To: <2ccde5bf-bcff-b9ac-1bc4-eafc8b781880@intel.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 2 Aug 2023 11:20:55 +0200
Message-ID: <CADSE00+dMe9-nKh1kr8nzOPDDtf=Rt4dkigJmx6UR3N71S7dEA@mail.gmail.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Content-Type: multipart/alternative; boundary="000000000000f76f860601ed2e36"
Subject: Re: [igt-dev] [PATCH v3 2/2] kms_cursor_legacy:
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

--000000000000f76f860601ed2e36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 10:12=E2=80=AFAM Modem, Bhanuprakash <
bhanuprakash.modem@intel.com> wrote:

>
>
> On Tue-01-08-2023 02:18 pm, Albert Esteve wrote:
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
>
> Please keep maintain the history of the patch.
>
> Example:
>
> V2: - Changes on top of Initial version
> V3: - Changes between V2 & Current version
>
> You can update this info while merging the patch. With above comments
> addressed, this patch is
>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>

Thanks.

I should've tracked the history in the cover letters, my bad.

Do you mean to track it in the commit message?
Also, what do you mean I can update it while merging? I do not have
permissions to merge. Should I push a new revision?

BR,
Albert.


>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> > Acked-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> > ---
> >   tests/kms_cursor_legacy.c | 79 ++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 79 insertions(+)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 1ebac9d31..87cfb9e64 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -218,6 +218,12 @@ static   igt_plane_t
> >       return cursor;
> >   }
> >
> > +static void set_cursor_hotspot(igt_plane_t *cursor, int  hot_x, int
> hot_y)
> > +{
> > +     igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_X, hot_x);
> > +     igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);
> > +}
> > +
> >   static void populate_cursor_args(igt_display_t *display, enum pipe
> pipe,
> >                                struct drm_mode_cursor *arg, struct
> igt_fb *fb)
> >   {
> > @@ -1607,6 +1613,68 @@ static void flip_vs_cursor_busy_crc(igt_display_=
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
> > +     uint32_t hot_x, hot_y, init_hot_x, init_hot_y;
> > +
> > +     igt_require(display->is_atomic);
> > +     igt_require(display->has_virt_cursor_plane);
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
> > +     init_hot_x =3D igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_X);
> > +     init_hot_y =3D igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y);
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
> > +             igt_debug("Update cursor hotspot: (%d, %d)\n", hot_x,
> hot_y);
> > +
> > +             /* Set cursor hotspot property values */
> > +             set_cursor_hotspot(cursor, hot_x, hot_y);
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
> > +     set_cursor_hotspot(cursor, init_hot_x, init_hot_y);
> > +     igt_plane_set_fb(cursor, NULL);
> > +     igt_output_set_pipe(output, PIPE_NONE);
> > +     igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +     igt_remove_fb(display->drm_fd, &cursor_fb);
> > +}
> > +
> >   igt_main
> >   {
> >       const int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> > @@ -1681,6 +1749,17 @@ igt_main
> >                       nonblocking_modeset_vs_cursor(&display, 16);
> >       }
> >
> > +     igt_describe("Test changes the cursor hotspot and checks that the=
 "
> > +                   "property is updated accordignly");
> > +     igt_subtest_group {
> > +             igt_fixture
> > +                     igt_display_require_output(&display);
> > +
> > +             igt_subtest("modeset-atomic-cursor-hotspot") {
> > +                     modeset_atomic_cursor_hotspot(&display);
> > +             }
> > +     }
> > +
> >       igt_describe("This test executes flips on both CRTCs "
> >                    "while running cursor updates in parallel");
> >       igt_subtest_group {
>
>

--000000000000f76f860601ed2e36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 2, 2023 at 10:12=
=E2=80=AFAM Modem, Bhanuprakash &lt;<a href=3D"mailto:bhanuprakash.modem@in=
tel.com">bhanuprakash.modem@intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
On Tue-01-08-2023 02:18 pm, Albert Esteve wrote:<br>
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
<br>
Please keep maintain the history of the patch.<br>
<br>
Example:<br>
<br>
V2: - Changes on top of Initial version<br>
V3: - Changes between V2 &amp; Current version<br>
<br>
You can update this info while merging the patch. With above comments <br>
addressed, this patch is<br>
<br>
Reviewed-by: Bhanuprakash Modem &lt;<a href=3D"mailto:bhanuprakash.modem@in=
tel.com" target=3D"_blank">bhanuprakash.modem@intel.com</a>&gt;<br></blockq=
uote><div><br></div><div>Thanks.</div><div><br></div><div>I should&#39;ve t=
racked the history in the cover letters, my bad.</div><div><br></div><div>D=
o you mean to track it in the commit message?</div><div>Also, what do you m=
ean I can update it while merging? I do not have</div><div>permissions to m=
erge. Should I push a new revision?</div><div><br></div><div>BR,</div><div>=
Albert.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; Acked-by: Javier Martinez Canillas &lt;<a href=3D"mailto:javierm@redha=
t.com" target=3D"_blank">javierm@redhat.com</a>&gt;<br>
&gt; Acked-by: Zbigniew Kempczy=C5=84ski &lt;<a href=3D"mailto:zbigniew.kem=
pczynski@intel.com" target=3D"_blank">zbigniew.kempczynski@intel.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/kms_cursor_legacy.c | 79 +++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 79 insertions(+)<br>
&gt; <br>
&gt; diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c<br>
&gt; index 1ebac9d31..87cfb9e64 100644<br>
&gt; --- a/tests/kms_cursor_legacy.c<br>
&gt; +++ b/tests/kms_cursor_legacy.c<br>
&gt; @@ -218,6 +218,12 @@ static=C2=A0 =C2=A0igt_plane_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return cursor;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void set_cursor_hotspot(igt_plane_t *cursor, int=C2=A0 hot_x, =
int hot_y)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_output_set_prop_value(cursor, IGT_PLANE_HOTSP=
OT_X, hot_x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_output_set_prop_value(cursor, IGT_PLANE_HOTSP=
OT_Y, hot_y);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void populate_cursor_args(igt_display_t *display, e=
num pipe pipe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_mode_cursor *arg, stru=
ct igt_fb *fb)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -1607,6 +1613,68 @@ static void flip_vs_cursor_busy_crc(igt_display=
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
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t hot_x, hot_y, init_hot_x, init_hot_y;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(display-&gt;is_atomic);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(display-&gt;has_virt_cursor_plane);<b=
r>
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
&gt; +=C2=A0 =C2=A0 =C2=A0init_hot_x =3D igt_plane_get_prop(cursor, IGT_PLA=
NE_HOTSPOT_X);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init_hot_y =3D igt_plane_get_prop(cursor, IGT_PLA=
NE_HOTSPOT_Y);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_debug(&quot;Updat=
e cursor hotspot: (%d, %d)\n&quot;, hot_x, hot_y);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set cursor hotspot=
 property values */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_cursor_hotspot(cu=
rsor, hot_x, hot_y);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0set_cursor_hotspot(cursor, init_hot_x, init_hot_y=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_plane_set_fb(cursor, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_output_set_pipe(output, PIPE_NONE);<br>
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
&gt; @@ -1681,6 +1749,17 @@ igt_main<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0nonblocking_modeset_vs_cursor(&amp;display, 16);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe(&quot;Test changes the cursor hotspo=
t and checks that the &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;property is updated accordignly&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest_group {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fixture<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_display_require_output(&amp;display);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;mod=
eset-atomic-cursor-hotspot&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0modeset_atomic_cursor_hotspot(&amp;display);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_describe(&quot;This test executes flips =
on both CRTCs &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;while running cursor updates in parallel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_subtest_group {<br>
<br>
</blockquote></div></div>

--000000000000f76f860601ed2e36--
