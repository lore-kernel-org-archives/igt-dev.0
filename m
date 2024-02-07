Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E0C4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 14:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D41110EA4F;
	Wed,  7 Feb 2024 14:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="X828FqeR";
	dkim-atps=neutral
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A9010EA4F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 14:52:14 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2046b2cd2d3so582306fac.0
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Feb 2024 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707317533; x=1707922333;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vH7Ylh1wCScl0FYa8GQjrljDO0FwB6XDYmmNQ+de/lw=;
 b=X828FqeRYkbyl8xqWGJXuT/wyZtdmCaMQJuYPFozRaJ0DFpSO2y1Suthn6uY/aOUKd
 hfmo8xjWhBIA90uaFPugVBRuteSAJnEeW3WaGn1VadacQ6FLkvQ4vOzbxjCVg19hlb9c
 fWNWjdiALg+L1taEjUk+FB2NGW7gdKsb1AoMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707317533; x=1707922333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vH7Ylh1wCScl0FYa8GQjrljDO0FwB6XDYmmNQ+de/lw=;
 b=mXi+733lTFnFERvM3qtkqEngtZQmFPePncNq1BzH/5SqcQb9XXwEF4jc2W6q5WP9Xe
 e+jDlRFK10u4mbfR2VvZ4p0r6XSfy/z4Zhfh4zXDqTvgh7/7U44umZ5d/KVVLDIrcqFF
 PmXoLpgIZYkqwKKXEquoBNhGwcNd+Y7bps6dbTSbWWAC7042bge/cNoW3/eaWVDVWnbt
 7vlBNK5dK1Zc9Va+DGTzKPTzzL3comMeKVLxoMltg/gjOe9Y7AwA70a3tPpJ46IiSncE
 p1t1NImonpi1bMgHNm82EbrVhU60iVvmcWCpZxjhOJCe3NpRK051PhMNxBFdOn8144jo
 NVqw==
X-Gm-Message-State: AOJu0YyF8AdKpvVnyJrhyQEYBZjCaU/qS5bE6cQU2AA9npgk6SFRnIeV
 UrryoEJiLrIhmv7xA74O71PDHfOwVL5CmA0VOYn/BcZkfNVplb6W4zTQ/XWvOlHFMZCt03xsDRI
 =
X-Google-Smtp-Source: AGHT+IHksMBofUnqo35sLZHO8dbuOYEcmjlodfoD7xV3pV5i5sW960S2VfNdQR83gNnzYV3gVmQLqg==
X-Received: by 2002:a05:6870:1588:b0:214:82c6:ee14 with SMTP id
 j8-20020a056870158800b0021482c6ee14mr6764580oab.58.1707317532949; 
 Wed, 07 Feb 2024 06:52:12 -0800 (PST)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 m6-20020a9d6ac6000000b006ddd0bb5a56sm210970otq.52.2024.02.07.06.52.11
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:52:11 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-599fc25071bso433471eaf.3
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Feb 2024 06:52:11 -0800 (PST)
X-Received: by 2002:a4a:8111:0:b0:59a:b1f:3fd3 with SMTP id
 b17-20020a4a8111000000b0059a0b1f3fd3mr5612964oog.8.1707317530811; Wed, 07 Feb
 2024 06:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
 <20240130054235.533132-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240130054235.533132-2-bhanuprakash.modem@intel.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 7 Feb 2024 09:51:34 -0500
X-Gmail-Original-Message-ID: <CAOw6vbLRbDDZTrPKuW7S=pDA8DK_GWM0FDonF83BxsPz1yLvCA@mail.gmail.com>
Message-ID: <CAOw6vbLRbDDZTrPKuW7S=pDA8DK_GWM0FDonF83BxsPz1yLvCA@mail.gmail.com>
Subject: Re: [i-g-t v5 1/9] tests/kms_vrr: Move fb0 and fb1 to an array
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000f21ad90610cbd6eb"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--000000000000f21ad90610cbd6eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for revising these. The changes look good to me.

FWIW,

Reviewed-by: Sean Paul <seanpaul@chromium.org>

On Tue, Jan 30, 2024 at 12:49=E2=80=AFAM Bhanuprakash Modem <
bhanuprakash.modem@intel.com> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>
> Consolidate the 2 fb variables into an array. No functional changes.
>
> v2:
> - Clarified commit msg (Bhanu)
> v3: (Bhanu)
> - Rebase
>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 9de0ffc85..a9fcde821 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -104,8 +104,7 @@ typedef struct data {
>         igt_display_t display;
>         int drm_fd;
>         igt_plane_t *primary;
> -       igt_fb_t fb0;
> -       igt_fb_t fb1;
> +       igt_fb_t fb[2];
>         range_t range;
>         drmModeModeInfo switch_modes[RR_MODES_COUNT];
>  } data_t;
> @@ -280,13 +279,13 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
>         /* Prepare resources */
>         igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
>                             DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -                           0.50, 0.50, 0.50, &data->fb0);
> +                           0.50, 0.50, 0.50, &data->fb[0]);
>
>         igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
>                             DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -                           0.50, 0.50, 0.50, &data->fb1);
> +                           0.50, 0.50, 0.50, &data->fb[1]);
>
> -       cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb0);
> +       cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
>
>         igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
>                         1.00, 0.00, 0.00);
> @@ -295,7 +294,7 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
>
>         /* Take care of any required modesetting before the test begins. =
*/
>         data->primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -       igt_plane_set_fb(data->primary, &data->fb0);
> +       igt_plane_set_fb(data->primary, &data->fb[0]);
>
>         /* Clear vrr_enabled state before enabling it, because
>          * it might be left enabled if the previous test fails.
> @@ -358,7 +357,7 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
>                         rate_ns, threshold_hi, threshold_lo);
>
>         /* Align with the flip completion event to speed up convergence. =
*/
> -       do_flip(data, &data->fb0);
> +       do_flip(data, &data->fb[0]);
>         start_ns =3D last_event_ns =3D target_ns =3D get_kernel_event_ns(=
data,
>
> DRM_EVENT_FLIP_COMPLETE);
>
> @@ -367,7 +366,7 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
>                 int64_t diff_ns;
>
>                 front =3D !front;
> -               do_flip(data, front ? &data->fb1 : &data->fb0);
> +               do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>
>                 /* We need to cpture flip event instead of vblank event,
>                  * because vblank is triggered after each frame, but
> depending
> @@ -573,8 +572,8 @@ static void test_cleanup(data_t *data, enum pipe pipe=
,
> igt_output_t *output)
>         igt_output_override_mode(output, NULL);
>         igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
> -       igt_remove_fb(data->drm_fd, &data->fb1);
> -       igt_remove_fb(data->drm_fd, &data->fb0);
> +       igt_remove_fb(data->drm_fd, &data->fb[1]);
> +       igt_remove_fb(data->drm_fd, &data->fb[0]);
>  }
>
>  static bool output_constraint(data_t *data, igt_output_t *output,
> uint32_t flags)
> --
> 2.43.0
>
>

--000000000000f21ad90610cbd6eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for revising these. The changes look good to me.<di=
v><br></div><div>FWIW,</div><div><br></div><div>Reviewed-by: Sean Paul &lt;=
<a href=3D"mailto:seanpaul@chromium.org">seanpaul@chromium.org</a>&gt;</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Jan 30, 2024 at 12:49=E2=80=AFAM Bhanuprakash Modem &lt;<a href=3D=
"mailto:bhanuprakash.modem@intel.com">bhanuprakash.modem@intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Sea=
n Paul &lt;<a href=3D"mailto:seanpaul@chromium.org" target=3D"_blank">seanp=
aul@chromium.org</a>&gt;<br>
<br>
Consolidate the 2 fb variables into an array. No functional changes.<br>
<br>
v2:<br>
- Clarified commit msg (Bhanu)<br>
v3: (Bhanu)<br>
- Rebase<br>
<br>
Cc: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@chromium.org" target=3D"_b=
lank">markyacoub@chromium.org</a>&gt;<br>
Reviewed-by: Bhanuprakash Modem &lt;<a href=3D"mailto:bhanuprakash.modem@in=
tel.com" target=3D"_blank">bhanuprakash.modem@intel.com</a>&gt;<br>
Signed-off-by: Sean Paul &lt;<a href=3D"mailto:seanpaul@chromium.org" targe=
t=3D"_blank">seanpaul@chromium.org</a>&gt;<br>
Signed-off-by: Bhanuprakash Modem &lt;<a href=3D"mailto:bhanuprakash.modem@=
intel.com" target=3D"_blank">bhanuprakash.modem@intel.com</a>&gt;<br>
---<br>
=C2=A0tests/kms_vrr.c | 19 +++++++++----------<br>
=C2=A01 file changed, 9 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c<br>
index 9de0ffc85..a9fcde821 100644<br>
--- a/tests/kms_vrr.c<br>
+++ b/tests/kms_vrr.c<br>
@@ -104,8 +104,7 @@ typedef struct data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_display_t display;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int drm_fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_plane_t *primary;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fb_t fb0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fb_t fb1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fb_t fb[2];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 range_t range;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drmModeModeInfo switch_modes[RR_MODES_COUNT];<b=
r>
=C2=A0} data_t;<br>
@@ -280,13 +279,13 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Prepare resources */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_create_color_fb(data-&gt;drm_fd, mode.hdisp=
lay, mode.vdisplay,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.50, 0.50, 0.50, &amp;data-&gt;fb0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.50, 0.50, 0.50, &amp;data-&gt;fb[0]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_create_color_fb(data-&gt;drm_fd, mode.hdisp=
lay, mode.vdisplay,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.50, 0.50, 0.50, &amp;data-&gt;fb1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.50, 0.50, 0.50, &amp;data-&gt;fb[1]);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cr =3D igt_get_cairo_ctx(data-&gt;drm_fd, &amp;=
data-&gt;fb0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cr =3D igt_get_cairo_ctx(data-&gt;drm_fd, &amp;=
data-&gt;fb[0]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_paint_color(cr, 0, 0, mode.hdisplay / 10, m=
ode.vdisplay / 10,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1.00, 0.00, 0.00);<br>
@@ -295,7 +294,7 @@ static void prepare_test(data_t *data, igt_output_t *ou=
tput, enum pipe pipe)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Take care of any required modesetting before=
 the test begins. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;primary =3D igt_output_get_plane_type(=
output, DRM_PLANE_TYPE_PRIMARY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_set_fb(data-&gt;primary, &amp;data-&g=
t;fb0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_plane_set_fb(data-&gt;primary, &amp;data-&g=
t;fb[0]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear vrr_enabled state before enabling it, =
because<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it might be left enabled if the previou=
s test fails.<br>
@@ -358,7 +357,7 @@ flip_and_measure(data_t *data, igt_output_t *output, en=
um pipe pipe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rate_ns, threshold_hi, threshold_lo);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Align with the flip completion event to spee=
d up convergence. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do_flip(data, &amp;data-&gt;fb0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do_flip(data, &amp;data-&gt;fb[0]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 start_ns =3D last_event_ns =3D target_ns =3D ge=
t_kernel_event_ns(data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_EVENT_FLIP_COMPLETE);<=
br>
<br>
@@ -367,7 +366,7 @@ flip_and_measure(data_t *data, igt_output_t *output, en=
um pipe pipe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t diff_ns;<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 front =3D !front;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_flip(data, front=
 ? &amp;data-&gt;fb1 : &amp;data-&gt;fb0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_flip(data, front=
 ? &amp;data-&gt;fb[1] : &amp;data-&gt;fb[0]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We need to cptur=
e flip event instead of vblank event,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because vbl=
ank is triggered after each frame, but depending<br>
@@ -573,8 +572,8 @@ static void test_cleanup(data_t *data, enum pipe pipe, =
igt_output_t *output)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_output_override_mode(output, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_display_commit2(&amp;data-&gt;display, COMM=
IT_ATOMIC);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb=
1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb=
0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb=
[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb=
[0]);<br>
=C2=A0}<br>
<br>
=C2=A0static bool output_constraint(data_t *data, igt_output_t *output, uin=
t32_t flags)<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000f21ad90610cbd6eb--
