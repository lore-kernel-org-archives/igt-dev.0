Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DACE6918F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 20:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136310E096;
	Fri, 22 Nov 2024 20:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dv22ZnGu";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB2D10E096
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 20:19:56 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2e3010478e6so2140426a91.1
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 12:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732306796; x=1732911596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2b5y+VTPX5auq7jQy0StOBUK9aR7UOrxifzjmeyCG4g=;
 b=dv22ZnGuZx7bDUXtGQRcG1A7gE538cM4Hy79ZzrR2v5EOoWvxK3XhhITdUPJsCme2k
 JClSTPMllTF1ar5Fu4jiV/maHhEARw9o8lC5Ahvr8kA0yokiuyZeN7H93YCw60foY6xX
 5QkWyGakpIUhjB7evmDvrEj9R84PzMLUidVgdQ5IOkvZgya+V3z3X36V/N65tPa2KjhU
 LLA73acueBoeSi+jl/QeSMqyyORBesEH/E3LqlVTWV/lK08wDMvHmwouTQZgw1mMqf5x
 Pi0xyAg//OoubOKBXD6oBn1uLValpdHeBH//8wooIev8B88/mHQJtMB3EdPmUcloOsPm
 Ie6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732306796; x=1732911596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2b5y+VTPX5auq7jQy0StOBUK9aR7UOrxifzjmeyCG4g=;
 b=igQqLiCaT8xV/RpokmRFVIgv1OpKztfBSGnkbaurLk6crE/8io4eRthkMSUXoYWQWZ
 Mn0AiaJj9+MYKp3DxmUgU7ikUiDREEvGBlhwtD9mdsyPc2gk/jgyDMqyVbbFBGWm2dZ+
 JWFC5/Lcl+pAjknCw4eV1f1HUwjUQf4GkiRHDA/7iuPi1uXFNbKF60D7W0rLOM0OeZmn
 tMrPeQpCrlApFAIHfHGGODWWPralwG0W5ShihWCdspFOQYY4311JQ9k8TERSHuzyQpDf
 STFg3vWdsGWmSvxHb/NtKvc7mTVjpxtQ832IrtmFFMNfGcy4zBhyJXt+bCH/mdWYoZjH
 NkRg==
X-Gm-Message-State: AOJu0YyazouzbPWVlrF1ZhXVAchu8pZoWlu6BnOSyjGimaMGA8rw9EGy
 8TzOyN/U7Ns70hGMNkNtNeCv4/400b5PXJJ85xpYWrh8k9XbSYCqOaYUZMEtlEEISdObXeZuMpe
 JIgy2ucvx6BS/e2ZlU36roZK4TQDJCWrK
X-Gm-Gg: ASbGncvVuESkZvuPYKH51W2F6xRXBvo3d86e+sgk0g8xWvClEJfeAUE2lMsJW9mrYwl
 a+Pizc3ihOGJMwCpiFPFCwMSqIHxvrw==
X-Google-Smtp-Source: AGHT+IGhoPPF0e7+j64VdaumPZBTnX9m2ZhdGQ+ubdz++0rwUQv7y7+XqKqpTAFn228zvYaa7WVVGSJPikEfO7syNYo=
X-Received: by 2002:a17:90b:1e06:b0:2ea:715b:72b0 with SMTP id
 98e67ed59e1d1-2eb0e841f7dmr4261841a91.23.1732306795609; Fri, 22 Nov 2024
 12:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
 <861e015e-48d9-4a91-8da3-efcae38e1d0a@igalia.com>
 <CAH9NwWeLHGMS8sXt47ctLczfXD1ggg9x2pc3tnKszqJZ=CPdvQ@mail.gmail.com>
 <693bcca3-3969-44a0-ba96-c26fe4bd70c7@igalia.com>
In-Reply-To: <693bcca3-3969-44a0-ba96-c26fe4bd70c7@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 22 Nov 2024 21:19:44 +0100
Message-ID: <CAH9NwWdb5k_2cWYCcQWdMLzKKn1R5ZadSeVoVHTZ30iymyhaHg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] gputop: Add memory only utilization type
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com, tursulin@igalia.com, 
 Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi

> > Hi Tvrtko
> >
> >>> From: Christian Gmeiner <cgmeiner@igalia.com>
> >>>
> >>> Add special handling for drivers that only provide memory utilization
> >>> fdinfo.
> >>
> >> To check I am following correctly - special in this context means avoi=
d
> >> displaying empty fields, or avoid a crash, or?
> >
> > - Avoid early return in print_client(..) -> no output show.
> > - Avoid a crash in strcmp(..).
> >
> >>
> >>> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> >>> ---
> >>>    tools/gputop.c | 20 ++++++++++++++++++++
> >>>    1 file changed, 20 insertions(+)
> >>>
> >>> diff --git a/tools/gputop.c b/tools/gputop.c
> >>> index 43b01f566..4135d84c1 100644
> >>> --- a/tools/gputop.c
> >>> +++ b/tools/gputop.c
> >>> @@ -35,6 +35,7 @@
> >>>    enum utilization_type {
> >>>        UTILIZATION_TYPE_ENGINE_TIME,
> >>>        UTILIZATION_TYPE_TOTAL_CYCLES,
> >>> +     UTILIZATION_TYPE_MEMORY_ONLY,
> >>>    };
> >>>
> >>>    static const char *bars[] =3D { " ", "=E2=96=8F", "=E2=96=8E", "=
=E2=96=8D", "=E2=96=8C", "=E2=96=8B", "=E2=96=8A", "=E2=96=89", "=E2=96=88"=
 };
> >>> @@ -141,6 +142,9 @@ engines_identical(const struct igt_drm_client *c,
> >>>            c->engines->max_engine_id !=3D pc->engines->max_engine_id)
> >>>                return false;
> >>>
> >>> +     if (!c->engines->num_engines && !pc->engines->num_engines)
> >>> +             return true;
> >>
> >> strcmp() below crashes?
> >>
> >
> > Correct.
> >
> >> I would move the check you added to be first in this function. I think
> >> that makes most sense from the flow wise - checking it before max_engi=
ne_id.
> >>
> >
> > Will do in v2.
> >
> >> With this fixed what remains broken?
> >>
> >
> > Show any output :)
>
> I totally missed it. Shows the value of commit messages. ;)
>
> Okay.. I wonder if we can get away without adding
> UTILIZATION_TYPE_MEMORY_ONLY and instead make the code skip unavailable
> data.
>
> Would something like this work:
>
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 43b01f566ac8..9639a7f5fde8 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -137,6 +137,9 @@ engines_identical(const struct igt_drm_client *c,
>   {
>         unsigned int i;
>
> +       if (!c->engines->num_engines && !pc->engines->num_engines)
> +               return true;
> +
>         if (c->engines->num_engines !=3D pc->engines->num_engines ||
>             c->engines->max_engine_id !=3D pc->engines->max_engine_id)
>                 return false;
> @@ -188,27 +191,20 @@ print_client(struct igt_drm_client *c, struct
> igt_drm_client **prevc,
>         uint64_t sz;
>         int len;
>
> +       if (c->samples < 2)
> +               return 0;
> +
>         if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES=
 &&
> -           c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES)
> +           c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES) {
>                 utilization_type =3D UTILIZATION_TYPE_TOTAL_CYCLES;
> -       else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_=
TIME)
> +               /* Filter out idle clients. */
> +               if (c->engines->num_engines && !c->total_total_cycles)
> +                       return 0;
> +       } else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGIN=
E_TIME) {
>                 utilization_type =3D UTILIZATION_TYPE_ENGINE_TIME;
> -       else
> -               return 0;
> -
> -       if (c->samples < 2)
> -               return 0;
> -
> -       /* Filter out idle clients. */
> -       switch (utilization_type) {
> -       case UTILIZATION_TYPE_ENGINE_TIME:
> -              if (!c->total_engine_time)
> -                      return 0;
> -              break;
> -       case UTILIZATION_TYPE_TOTAL_CYCLES:
> -              if (!c->total_total_cycles)
> -                      return 0;
> -              break;
> +               /* Filter out idle clients. */
> +               if (c->engines->num_engines && !c->total_engine_time)
> +                       return 0;
>         }
>
>         /* Print header when moving to a different DRM card. */
> @@ -234,7 +230,9 @@ print_client(struct igt_drm_client *c, struct
> igt_drm_client **prevc,
>
>         lines++;
>
> -       for (i =3D 0; c->samples > 1 && i <=3D c->engines->max_engine_id;=
 i++) {
> +       for (i =3D 0;
> +            c->engines->num_engines && i <=3D c->engines->max_engine_id;
> +            i++) {
>                 double pct;
>
>                 if (!c->engines->capacity[i])
>

With your patch I get:

DRM minor 128
PID      MEM      RSS  NAME
1308      16M      16M  kmscube
1308       0B       0B  kmscube


I think we should filter out the 0B MEM's one too - or?


diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..459cf213f 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -137,6 +137,9 @@ engines_identical(const struct igt_drm_client *c,
 {
     unsigned int i;

+    if (!c->engines->num_engines && !pc->engines->num_engines)
+        return true;
+
     if (c->engines->num_engines !=3D pc->engines->num_engines ||
         c->engines->max_engine_id !=3D pc->engines->max_engine_id)
         return false;
@@ -188,27 +191,28 @@ print_client(struct igt_drm_client *c, struct
igt_drm_client **prevc,
     uint64_t sz;
     int len;

+    if (c->samples < 2)
+        return 0;
+
     if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES &&
-        c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES)
+        c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES) {
         utilization_type =3D UTILIZATION_TYPE_TOTAL_CYCLES;
-    else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
+        /* Filter out idle clients. */
+        if (c->engines->num_engines && !c->total_total_cycles)
+            return 0;
+    } else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIM=
E) {
         utilization_type =3D UTILIZATION_TYPE_ENGINE_TIME;
-    else
-        return 0;
+        /* Filter out idle clients. */
+        if (c->engines->num_engines && !c->total_engine_time)
+            return 0;
+    }

-    if (c->samples < 2)
-        return 0;
+    if (c->regions->num_regions) {
+        for (sz =3D 0, i =3D 0; i <=3D c->regions->max_region_id; i++)
+            sz +=3D c->memory[i].total;

-    /* Filter out idle clients. */
-    switch (utilization_type) {
-    case UTILIZATION_TYPE_ENGINE_TIME:
-           if (!c->total_engine_time)
-               return 0;
-           break;
-    case UTILIZATION_TYPE_TOTAL_CYCLES:
-           if (!c->total_total_cycles)
-               return 0;
-           break;
+        if (sz =3D=3D 0)
+            return 0;
     }

     /* Print header when moving to a different DRM card. */
@@ -234,7 +238,9 @@ print_client(struct igt_drm_client *c, struct
igt_drm_client **prevc,

     lines++;

-    for (i =3D 0; c->samples > 1 && i <=3D c->engines->max_engine_id; i++)=
 {
+    for (i =3D 0;
+        c->engines->num_engines && i <=3D c->engines->max_engine_id;
+        i++) {
         double pct;

         if (!c->engines->capacity[i])


--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
