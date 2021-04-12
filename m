Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087C289D8E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 16:21:48 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id w8so13835645lfr.0
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 09:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210323150851.209365-1-markyacoub@chromium.org>
In-Reply-To: <20210323150851.209365-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 12 Apr 2021 12:21:35 -0400
Message-ID: <CAJUqKUqC=3avfG5L32vw7mcWgpBrx4T1FMFGgyK-PshVbTr4Gw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic_transition: Enable Primary
 Plane on Enabling CRTC.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0297283579=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0297283579==
Content-Type: multipart/alternative; boundary="000000000000f3cf7705bfc8e892"

--000000000000f3cf7705bfc8e892
Content-Type: text/plain; charset="UTF-8"

I noticed I sent a ping on the CI test rather than this patch, so sending a
friendly reminder here instead.
Thanks!

On Tue, Mar 23, 2021 at 11:08 AM Mark Yacoub <markyacoub@chromium.org>
wrote:

> From: Mark Yacoub <markyacoub@google.com>
>
> Setup all plane params before committing anything.
> Do not disable Primary Plane whenever a CRTC is getting enabled.
>
> AMD Driver requires the primary plane to be enabled whenever the CRTC is,
> otherwise
> drm_mode_cursor_universal may end up trying to enable the cursor plane
> while all other
> planes are disabled, which is not supported by the hardware.
>
> Tested on Delbin and Volteer with no regression or added latency.
>
> ---
>  tests/kms_atomic_transition.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 9689bf4d..cfa04dcd 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -172,7 +172,7 @@ wm_setup_plane(data_t *data, enum pipe pipe,
>                         continue;
>
>                 if (!mask || !(parms[i].mask & mask)) {
> -                       if (plane->values[IGT_PLANE_FB_ID]) {
> +                       if (plane->values[IGT_PLANE_FB_ID] && plane->type
> != DRM_PLANE_TYPE_PRIMARY) {
>                                 igt_plane_set_fb(plane, NULL);
>                                 planes_set_up++;
>                         }
> @@ -516,10 +516,9 @@ run_transition_test(data_t *data, enum pipe pipe,
> igt_output_t *output,
>                 igt_output_set_pipe(output, pipe);
>         }
>
> -       igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
>         setup_parms(data, pipe, mode, &fb, &argb_fb, &sprite_fb, parms,
> &iter_max);
> -
> +       igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
>         /*
>          * In some configurations the tests may not run to completion with
> all
>          * sprite planes lit up at 4k resolution, try decreasing
> width/size of secondary
> --
> 2.31.0.rc2.261.g7f71774620-goog
>
>

--000000000000f3cf7705bfc8e892
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I noticed I sent a ping on the CI test rather than this pa=
tch, so sending a friendly reminder here instead.<div>Thanks!</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Mar 23, 2021 at 11:08 AM Mark Yacoub &lt;<a href=3D"mailto:markyacoub@chrom=
ium.org" target=3D"_blank">markyacoub@chromium.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Mark Yacoub &lt;<a =
href=3D"mailto:markyacoub@google.com" target=3D"_blank">markyacoub@google.c=
om</a>&gt;<br>
<br>
Setup all plane params before committing anything.<br>
Do not disable Primary Plane whenever a CRTC is getting enabled.<br>
<br>
AMD Driver requires the primary plane to be enabled whenever the CRTC is, o=
therwise<br>
drm_mode_cursor_universal may end up trying to enable the cursor plane whil=
e all other<br>
planes are disabled, which is not supported by the hardware.<br>
<br>
Tested on Delbin and Volteer with no regression or added latency.<br>
<br>
---<br>
=C2=A0tests/kms_atomic_transition.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c<=
br>
index 9689bf4d..cfa04dcd 100644<br>
--- a/tests/kms_atomic_transition.c<br>
+++ b/tests/kms_atomic_transition.c<br>
@@ -172,7 +172,7 @@ wm_setup_plane(data_t *data, enum pipe pipe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mask || !(parm=
s[i].mask &amp; mask)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (plane-&gt;values[IGT_PLANE_FB_ID]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (plane-&gt;values[IGT_PLANE_FB_ID] &amp;&amp; plane-&gt;type !=
=3D DRM_PLANE_TYPE_PRIMARY) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_plane_set_fb(plane, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 planes_set_up++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
@@ -516,10 +516,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_=
output_t *output,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_output_set_pipe=
(output, pipe);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_display_commit2(&amp;data-&gt;display, COMM=
IT_ATOMIC);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_parms(data, pipe, mode, &amp;fb, &amp;arg=
b_fb, &amp;sprite_fb, parms, &amp;iter_max);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_display_commit2(&amp;data-&gt;display, COMM=
IT_ATOMIC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In some configurations the tests may no=
t run to completion with all<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sprite planes lit up at 4k resolution, =
try decreasing width/size of secondary<br>
-- <br>
2.31.0.rc2.261.g7f71774620-goog<br>
<br>
</blockquote></div>

--000000000000f3cf7705bfc8e892--

--===============0297283579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0297283579==--
