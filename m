Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5DBE65D35
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2BB10EB00;
	Fri, 22 Nov 2024 08:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G48G1gJ1";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2118110E150
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 18:35:37 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2ea4c5b8fbcso946490a91.0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732214136; x=1732818936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p74w66bkC3nPxaIfTeUPdqi/MI+3iJl+nJneqNXJQjg=;
 b=G48G1gJ1ILU6//Q300H7JPs3sn1+Ia7R900PH1A27nZaKGx870SfzKImH2Cd880o1U
 KhFzLWrS1CO3xbEL0bgrIQeuFKPk0evcv5GqrtVHKmKG5TVW14spG9LE9TEM3gW5KuYb
 g4oaNIu7rJWNaFSbyVowOkfhJD+VoqLmh5dYDbXUDkDlYPUmstgq9Nowx855rly5JYrO
 m7gQgXbCNkmvDAXJvFbkPtHCoFJ5258frEtDO+DfTwgihBtilNDq494jMtRH5gBGWjYk
 3vrYLkF/uEPehFz1wMI7J6WODvxtnsykBMrlXlesKE0Q3OJYidwKAThY0dUVfzvrxT6m
 D4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732214136; x=1732818936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p74w66bkC3nPxaIfTeUPdqi/MI+3iJl+nJneqNXJQjg=;
 b=BpC9O+VFSv5nCqe+Nz0cJQIixXxbQ/1KZL94/SJBhiJ+kfZtJVSJ/ApvhQAKPOnh4S
 inkPbBiFX437FsXC7oiNi3WaBzqdJ8DdagY6IGV5yx3f6X7G3SxXNOa/WIgZOw0Azy3f
 H57WF/84FQssWpqry+VSE0hzqKQGcLw77TJAH3tUw0jFj1l9vYuJs0Mqg0mBRwsw5Kd1
 SYo1rFf/1koZvJ633CCRQk6fKMa0T9nXZkKeaIrLf4GYy6IGVpLw4MQaB2lFQhKbNCm9
 4aVhgB+UGCBXrlRo180AyF5iz7SCvOdwKksgxurvlZC43BEXO42vWqfAhtJXBZ3kBbfg
 KHnA==
X-Gm-Message-State: AOJu0YzZzOwVzCowhzSF0sdD+asVD9xysITjBSrx7Tsx75IToMxe84aD
 AACJwLiP71bnw1GT+JFonvdn/nYw5Rnu2/1azu5hjK72U97aEV0CQOKY8/tNUPGGSUTpI95QXEl
 FcBP/53Yhu0eRUHFldYQIg8EMebb8kIsuF+0=
X-Gm-Gg: ASbGncvkPufTk/6nC6qURTvM2IXuZlKGBl85vfnC3T/xQhw4ISdivWBdtiBJslYp1kn
 37eJABXgEepViG0QQAS1bK3p6+VQW0w==
X-Google-Smtp-Source: AGHT+IHaBt69WFMWvZY0xWAUjcMnT7qPV8cnnYIeBB6MwMEe/UDnTL7tnyytQOPaUeDWWQWFF9jl8zA19MoPCapAsTA=
X-Received: by 2002:a17:90a:f002:b0:2e9:20d8:414c with SMTP id
 98e67ed59e1d1-2eaebd40289mr6272047a91.5.1732214135255; Thu, 21 Nov 2024
 10:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
 <861e015e-48d9-4a91-8da3-efcae38e1d0a@igalia.com>
In-Reply-To: <861e015e-48d9-4a91-8da3-efcae38e1d0a@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 21 Nov 2024 19:35:23 +0100
Message-ID: <CAH9NwWeLHGMS8sXt47ctLczfXD1ggg9x2pc3tnKszqJZ=CPdvQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t] gputop: Add memory only utilization type
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com, tursulin@igalia.com, 
 Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 22 Nov 2024 08:52:06 +0000
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

Hi Tvrtko

> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > Add special handling for drivers that only provide memory utilization
> > fdinfo.
>
> To check I am following correctly - special in this context means avoid
> displaying empty fields, or avoid a crash, or?

- Avoid early return in print_client(..) -> no output show.
- Avoid a crash in strcmp(..).

>
> > Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> > ---
> >   tools/gputop.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >
> > diff --git a/tools/gputop.c b/tools/gputop.c
> > index 43b01f566..4135d84c1 100644
> > --- a/tools/gputop.c
> > +++ b/tools/gputop.c
> > @@ -35,6 +35,7 @@
> >   enum utilization_type {
> >       UTILIZATION_TYPE_ENGINE_TIME,
> >       UTILIZATION_TYPE_TOTAL_CYCLES,
> > +     UTILIZATION_TYPE_MEMORY_ONLY,
> >   };
> >
> >   static const char *bars[] =3D { " ", "=E2=96=8F", "=E2=96=8E", "=E2=
=96=8D", "=E2=96=8C", "=E2=96=8B", "=E2=96=8A", "=E2=96=89", "=E2=96=88" };
> > @@ -141,6 +142,9 @@ engines_identical(const struct igt_drm_client *c,
> >           c->engines->max_engine_id !=3D pc->engines->max_engine_id)
> >               return false;
> >
> > +     if (!c->engines->num_engines && !pc->engines->num_engines)
> > +             return true;
>
> strcmp() below crashes?
>

Correct.

> I would move the check you added to be first in this function. I think
> that makes most sense from the flow wise - checking it before max_engine_=
id.
>

Will do in v2.

> With this fixed what remains broken?
>

Show any output :)

> The loop in print_client() should ideally be skipped but even as is I
> think exits on the capacity check, no? At the moment it seems like this
> could be enough but maybe I am missing something.
>

You are correct - it works without the goto thing.

> Regards,
>
> Tvrtko
>
> > +
> >       for (i =3D 0; i <=3D c->engines->max_engine_id; i++)
> >               if (c->engines->capacity[i] !=3D pc->engines->capacity[i]=
 ||
> >                   !!c->engines->names[i] !=3D !!pc->engines->names[i] |=
|
> > @@ -193,6 +197,8 @@ print_client(struct igt_drm_client *c, struct igt_d=
rm_client **prevc,
> >               utilization_type =3D UTILIZATION_TYPE_TOTAL_CYCLES;
> >       else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_=
TIME)
> >               utilization_type =3D UTILIZATION_TYPE_ENGINE_TIME;
> > +     else if (c->regions->num_regions)
> > +             utilization_type =3D UTILIZATION_TYPE_MEMORY_ONLY;
> >       else
> >               return 0;
> >
> > @@ -209,6 +215,13 @@ print_client(struct igt_drm_client *c, struct igt_=
drm_client **prevc,
> >              if (!c->total_total_cycles)
> >                      return 0;
> >              break;
> > +     case UTILIZATION_TYPE_MEMORY_ONLY:
> > +             for (sz =3D 0, i =3D 0; i <=3D c->regions->max_region_id;=
 i++)
> > +                     sz +=3D c->memory[i].total;
> > +
> > +             if (sz =3D=3D 0)
> > +                     return 0;
> > +             break;
> >       }
> >
> >       /* Print header when moving to a different DRM card. */
> > @@ -234,6 +247,9 @@ print_client(struct igt_drm_client *c, struct igt_d=
rm_client **prevc,
> >
> >       lines++;
> >
> > +     if (utilization_type =3D=3D UTILIZATION_TYPE_MEMORY_ONLY)
> > +             goto print_name;
> > +
> >       for (i =3D 0; c->samples > 1 && i <=3D c->engines->max_engine_id;=
 i++) {
> >               double pct;
> >
> > @@ -249,6 +265,9 @@ print_client(struct igt_drm_client *c, struct igt_d=
rm_client **prevc,
> >                       pct =3D (double)c->utilization[i].delta_cycles / =
c->utilization[i].delta_total_cycles * 100 /
> >                               c->engines->capacity[i];
> >                       break;
> > +             case UTILIZATION_TYPE_MEMORY_ONLY:
> > +                     /* Nothing to do. */
> > +                     break;
> >               }
> >
> >               /*
> > @@ -262,6 +281,7 @@ print_client(struct igt_drm_client *c, struct igt_d=
rm_client **prevc,
> >               len +=3D *engine_w;
> >       }
> >
> > +print_name:
> >       printf(" %-*s\n", con_w - len - 1, c->print_name);
> >
> >       return lines;



--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
