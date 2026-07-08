Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F066C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 22:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C051410F315;
	Wed,  8 Jul 2026 22:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fxWWcH/i";
	dkim-atps=neutral
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5C10F315
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 22:35:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c8894387780so694516a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 15:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783550151; cv=none;
 d=google.com; s=arc-20260327;
 b=sOxjBaAO/hah1Zs/GHmf3aSh6mhkDXjexWWvkokJANWsE2/XcgbCbA/hSuuM3uZnTq
 Qvqv7TkUKqhidt426+dfROuRRTAvMHSVIoNphsaCnF/gW9Q/YqKS9FbVOen47u7iA5MR
 kajP698N80mSzwE80213r/zV2rYwy7HGHS8RDaHP6rZbcv4yhfY8lFDAWxehxwISntp0
 FzvqaxuqlQZ4zkn0aAmdcgG7tkLuI4Jn2IKg/VwLgL/Kv02cJzOB7p4ZaKMX+E9Xqx6D
 cvrsSRn45dRgT8MM6FFelV381+/Z3fF3mPwJLWh9upsAtr73AUowOjKkXRNaW5hJmsq9
 yYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eTzWrTE6/3ONfrMAk2pGXkrzAgCw9+b+IUnC/IoWgbA=;
 fh=NxzZrFImrbc8UIJMbijvN4Il6WdzYshcTVl2oLqC2gs=;
 b=bYyi1b8mVXlfgOK371ploZV518wwoNyWpUuUui0XN2Nk7OjdJRauw0LS55AxbdrLhw
 Ly2kuFfwnXbZs3a068bdP5lPspqq0XH2wkHuE8qGc/S7rt249J8vFjxxjbxTNcaqeI/3
 L+eSHpZ81wtAPYot8TE2OxkcXdFm2SWBwOzhNjhd3KXh4e+Y9aT9A6gN6G3oWu6Eq2TG
 3PdeI9OunAH3HA1WeWOpOV+FrueoggGN1p2GLsfgGWkvzc0UyLetSr5xDn35EWWuOM0O
 O/ZnYw/1pamNWMfw6d9S2lHSD2y/KM3MHl72l/wjSKxr8CTZIrcn4OUtQBkcMlcwFfoA
 /LgQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783550151; x=1784154951;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eTzWrTE6/3ONfrMAk2pGXkrzAgCw9+b+IUnC/IoWgbA=;
 b=fxWWcH/i5NEi+CPyEDM2s0cd5WwbFyiB5r7UmCScS/uiCwOc7pkZwVgNSNBYMr6621
 LC2ia7CL7ZUlWAPlVSCMlBZohpUoknW7FAPfMIaM7/wVFnEinWbWMrWMfGo0XwqochsK
 YmYX0pBQfPnBOo0AMGrXnp17JKF8Mj0CNNeh5pOMu4WsWcnr/7cTsUlq0V8spFtdLJXr
 wivi2Hz6fnAuC/gxasTzPaO7j4lhV8n+K6sHkbCoA8bIxZKFhfOKHhbv3yEKSkxHr1rA
 3vmdsXLn+kOSBUEJKKv26s2tQwoAWU9DROvHfuNWuBI0yyerWZMAapaYmgwSlgYagF1+
 5iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783550151; x=1784154951;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eTzWrTE6/3ONfrMAk2pGXkrzAgCw9+b+IUnC/IoWgbA=;
 b=tSO2IbyyFHJ3qoj4xqAUDGkSxM5+blDcprG+raMvcqZPdg3PGbfay7BSXcON2JxVww
 R9G4bGUtWBrDPND4+yo6dOXgMZKLoMLnKgXk/jnEXnIARlv6WHbZGW0rKZGEYPv/p/DQ
 Qw9ko0KV0K92OtpeaXzGqbQSPWN1oF8kYtmQyBtYVaUpQBiYYQa5XPJC1rvgXgeG0P0L
 KOyq0n3BKteRy3/JWjPa3jaekH5uEdc6uGFQ659dBaa6UVlXTvCpDCXOxyKcr5J2qO81
 w5Xo4o9tWri31T+VkWX8kIe62fJxSBTx9Qj8L+J6qg0nLRgXV40SxyEubgBvAsyIBRpN
 38Ew==
X-Gm-Message-State: AOJu0YznY/2MOutSe3p+prkkYx+VObo7VtvAJo4CUPTHn/ypMSA9mcUr
 QdHTAyMWpcB/sb2EckqZHQlx0NOMLq+kQq3xEuYrtQXuwxZ90IG1Stmo+xvLSvE2MyfiqnUzFc5
 uwx4a7niz5KYyjtckJ0q3NLrGhBjINBtOfXhBKQw7
X-Gm-Gg: AfdE7ck500mq5aBzdbuM3MQNH4Yl0ubewnpDutkewjse0dOXH5XXLneqK8xY65nS9Rj
 37+Zs6iegUUzGIsol2Vjg8/RUboDT4qurRKsfrjd/TTwS14MrLZNy0bNh7v0ca0tfRHQkHlHIqa
 bl12fN9dOF13+bzmlgOPCeP7QH++Egx8NmQZOeHjk6DT6qTml7+3zUAVpHzSW9BZ/c05mRr5zZJ
 c91ySV/cnsJ4/UZwq6eO3oWFZKE5BSrd3fXquDqup7r6jUtG7j5Ik7AVH90jFt71yexW6SP5KYZ
 YnCY0Ey9aqNy9gnc/+uiK3tAPUTiXGeWFB2EW/W2bUw9LIxJ3ALqOdVlw5EUDXnzsYg/CbQ=
X-Received: by 2002:a05:6a20:9595:b0:3c0:9c1a:894b with SMTP id
 adf61e73a8af0-3c0bd2953efmr5485469637.67.1783550150700; Wed, 08 Jul 2026
 15:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
 <20260621084445.614024-3-jason-jh.lin@mediatek.com>
 <CAMNLLoSVfnrn0TknRWx3pJ82-WwQm07qP7vGhrY9pnd+omvHNA@mail.gmail.com>
In-Reply-To: <CAMNLLoSVfnrn0TknRWx3pJ82-WwQm07qP7vGhrY9pnd+omvHNA@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 8 Jul 2026 15:35:39 -0700
X-Gm-Features: AVVi8CdeRoZgQihu60QpVNgLxPJno1o0U4CEA1ZXdp3YNearJKMsMBwE5QCqyUo
Message-ID: <CAMNLLoRyu0M8iFE+v1hoZm31KfOdLm=M+8OjG=kxuz+k0oJyMQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="0000000000002d85d6065621213d"
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

--0000000000002d85d6065621213d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Karthik B S <karthik.b.s@intel.com>  @Swati Sharma
<swati2.sharma@intel.com>  @Kurmi, Suresh Kumar
<suresh.kumar.kurmi@intel.com> :

Gentle ping on providing some feedback here on these tests please if you
could take a look?
This will help unblock Google side testing

Regards
Manasi

On Wed, Jun 24, 2026 at 12:35=E2=80=AFPM Manasi Navare <navaremanasi@google=
.com>
wrote:

> Thanks Jason for the patch.
> @Karthik B S  @Swati Sharma : Could we please get some reviews here ,
> this is just a separate subtest that is added for any platform that
> does not have support for VCounter and hence we need to disable the
> deep sleep.
>
> Regards
> Manasi
>
> On Sun, Jun 21, 2026 at 1:44=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediat=
ek.com>
> wrote:
> >
> > Add a new subtest that disables CPU deep sleep to eliminate wakeup
> > latency interference during vblank timestamp verification.
> >
> > This allows platforms without get_scanout_position() to verify their
> > timestamp accuracy is correct, separate from CPU idle interference.
> >
> > The original "basic" test remains unchanged to detect any timestamp
> > issues including CPU idle interference, while "basic-no-cpu-idle"
> > specifically tests timestamp accuracy without external interference.
> >
> > Once get_scanout_position() is implemented, the vblank timestamp
> > will be accurately compensated regardless of CPU idle states.
> >
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > ---
> >  tests/kms_setmode.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> > index 3adc4534ce88..e5f2c4fee141 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -42,6 +42,7 @@
> >  #include <math.h>
> >
> >  #include "i915/intel_drrs.h"
> > +#include "igt_pm.h"
> >  #include "xe/xe_query.h"
> >
> >  /**
> > @@ -49,6 +50,13 @@
> >   * Description: Tests the vblank timing by iterating through all valid
> crtc/connector
> >   *              combinations
> >   *
> > + * SUBTEST: basic-no-cpu-idle
> > + * Description: Tests vblank timing with CPU deep sleep disabled to
> verify
> > + *              timestamp accuracy without CPU idle interference. This
> test
> > + *              is for platforms lacking HW/SW get_scanout_position()
> support,
> > + *              allowing them to verify vblank timestamp correctness
> without
> > + *              external CPU wakeup latency interference.
> > + *
> >   * SUBTEST: basic-clone-single-crtc
> >   * Description: Test allows the use of a single CRTC for two
> connectors, such as VGA/HDMI,
> >   *             VGA/DP, and HDMI/HDMI
> > @@ -1106,6 +1114,30 @@ int igt_main_args("det:", NULL, help_str,
> opt_handler, NULL)
> >                 }
> >         }
> >
> > +       /*
> > +        * This subtest disables CPU deep sleep to eliminate wakeup
> latency
> > +        * interference during vblank timestamp verification.
> > +        *
> > +        * NOTE: This is for platforms that have not yet implemented
> > +        * get_scanout_position(). Once get_scanout_position() is
> properly
> > +        * implemented, the vblank timestamp will be accurately
> compensated
> > +        * regardless of CPU idle states, and this test becomes redunda=
nt
> > +        * with the standard "basic" test.
> > +        */
> > +       igt_describe("Tests vblank timing with CPU deep sleep disabled"=
);
> > +       igt_subtest_with_dynamic("basic-no-cpu-idle") {
> > +               struct test_config tconf =3D {
> > +                       .flags          =3D TEST_TIMINGS,
> > +                       .name           =3D "basic-no-cpu-idle",
> > +                       .resources      =3D drm_resources,
> > +               };
> > +
> > +               igt_require_f(igt_pm_disable_cpu_deep_sleep(),
> > +                             "Platform does not support CPU idle
> control\n");
> > +               run_test(&tconf);
> > +               igt_pm_enable_cpu_deep_sleep();
> > +       }
> > +
> >         igt_fixture() {
> >                 drmModeFreeResources(drm_resources);
> >                 drm_close_driver(drm_fd);
> > --
> > 2.43.0
> >
>

--0000000000002d85d6065621213d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-1=
0" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik B S</a>=
=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-11" href=3D"ma=
ilto:swati2.sharma@intel.com" tabindex=3D"-1">@Swati Sharma</a>=C2=A0=C2=A0=
<a class=3D"gmail_plusreply" id=3D"plusReplyChip-12" href=3D"mailto:suresh.=
kumar.kurmi@intel.com" tabindex=3D"-1">@Kurmi, Suresh Kumar</a>=C2=A0:<div>=
<br></div><div>Gentle ping on providing some feedback here on these tests p=
lease if you could take a look?</div><div>This will help unblock Google sid=
e testing</div><div><br></div><div>Regards</div><div>Manasi</div></div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Jun 24, 2026 at 12:35=E2=80=AFPM Manasi Navare &lt;<a h=
ref=3D"mailto:navaremanasi@google.com">navaremanasi@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks Jason =
for the patch.<br>
@Karthik B S=C2=A0 @Swati Sharma : Could we please get some reviews here ,<=
br>
this is just a separate subtest that is added for any platform that<br>
does not have support for VCounter and hence we need to disable the<br>
deep sleep.<br>
<br>
Regards<br>
Manasi<br>
<br>
On Sun, Jun 21, 2026 at 1:44=E2=80=AFAM Jason-JH Lin &lt;<a href=3D"mailto:=
jason-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Add a new subtest that disables CPU deep sleep to eliminate wakeup<br>
&gt; latency interference during vblank timestamp verification.<br>
&gt;<br>
&gt; This allows platforms without get_scanout_position() to verify their<b=
r>
&gt; timestamp accuracy is correct, separate from CPU idle interference.<br=
>
&gt;<br>
&gt; The original &quot;basic&quot; test remains unchanged to detect any ti=
mestamp<br>
&gt; issues including CPU idle interference, while &quot;basic-no-cpu-idle&=
quot;<br>
&gt; specifically tests timestamp accuracy without external interference.<b=
r>
&gt;<br>
&gt; Once get_scanout_position() is implemented, the vblank timestamp<br>
&gt; will be accurately compensated regardless of CPU idle states.<br>
&gt;<br>
&gt; Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediate=
k.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/kms_setmode.c | 32 ++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 32 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c<br>
&gt; index 3adc4534ce88..e5f2c4fee141 100644<br>
&gt; --- a/tests/kms_setmode.c<br>
&gt; +++ b/tests/kms_setmode.c<br>
&gt; @@ -42,6 +42,7 @@<br>
&gt;=C2=A0 #include &lt;math.h&gt;<br>
&gt;<br>
&gt;=C2=A0 #include &quot;i915/intel_drrs.h&quot;<br>
&gt; +#include &quot;igt_pm.h&quot;<br>
&gt;=C2=A0 #include &quot;xe/xe_query.h&quot;<br>
&gt;<br>
&gt;=C2=A0 /**<br>
&gt; @@ -49,6 +50,13 @@<br>
&gt;=C2=A0 =C2=A0* Description: Tests the vblank timing by iterating throug=
h all valid crtc/connector<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 combinat=
ions<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; + * SUBTEST: basic-no-cpu-idle<br>
&gt; + * Description: Tests vblank timing with CPU deep sleep disabled to v=
erify<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timestamp accuracy=
 without CPU idle interference. This test<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is for platforms l=
acking HW/SW get_scanout_position() support,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allowing them to v=
erify vblank timestamp correctness without<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 external CPU wakeu=
p latency interference.<br>
&gt; + *<br>
&gt;=C2=A0 =C2=A0* SUBTEST: basic-clone-single-crtc<br>
&gt;=C2=A0 =C2=A0* Description: Test allows the use of a single CRTC for tw=
o connectors, such as VGA/HDMI,<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VGA/DP, a=
nd HDMI/HDMI<br>
&gt; @@ -1106,6 +1114,30 @@ int igt_main_args(&quot;det:&quot;, NULL, help_=
str, opt_handler, NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This subtest disables CPU deep sleep to=
 eliminate wakeup latency<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * interference during vblank timestamp ve=
rification.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * NOTE: This is for platforms that have n=
ot yet implemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * get_scanout_position(). Once get_scanou=
t_position() is properly<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * implemented, the vblank timestamp will =
be accurately compensated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * regardless of CPU idle states, and this=
 test becomes redundant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with the standard &quot;basic&quot; tes=
t.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_describe(&quot;Tests vblank timing wit=
h CPU deep sleep disabled&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_subtest_with_dynamic(&quot;basic-no-cp=
u-idle&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_co=
nfig tconf =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TEST_TIMINGS,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;basic=
-no-cpu-idle&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.resources=C2=A0 =C2=A0 =C2=A0 =3D drm_resources,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require_f(=
igt_pm_disable_cpu_deep_sleep(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Platform does not support CPU idle=
 control\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_test(&amp;=
tconf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_pm_enable_=
cpu_deep_sleep();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fixture() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drmModeFr=
eeResources(drm_resources);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_close=
_driver(drm_fd);<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div>

--0000000000002d85d6065621213d--
