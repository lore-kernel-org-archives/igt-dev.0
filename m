Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08531C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 04:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924C3113071;
	Tue, 23 Apr 2024 04:15:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA11113071
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 04:15:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A578640003
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 04:15:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a58772187d8so60323866b.3
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 21:15:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXG8CgIyMK+Mzr9sEMQi3gsHu3pGaWvonjBzFN7PnMKW0coYRrt+rfpa2ecvKrDhLZwkzLN0hl+4FFcrQAk8GoWZ4C7lzZh1PT0nLLgzg==
X-Gm-Message-State: AOJu0YwDiQrHFg46YnrXcksYibpAeyuEjfqIGnkLJ6jpqwKqON1InRYV
 3k1S/Nsr5RGHuycJ7TD4ahuQQOLNAtEakHkU1tU0tnbZlYgi5xwL8rAmcTu0MA20b/ZMVFF/DOJ
 iyHYb728U0Xo7fYqwDAO6+jADdXc=
X-Google-Smtp-Source: AGHT+IGSMCkyhmOYFgK/TLf1ymotrW8FAv9r3h1zvp2MnISAOdDkLgal4+n28MmNX571iHYXxPRLLULaDMhPHwZ4HZ4=
X-Received: by 2002:a17:906:d89:b0:a55:b272:e90b with SMTP id
 m9-20020a1709060d8900b00a55b272e90bmr5671363eji.35.1713845744815; Mon, 22 Apr
 2024 21:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240410174031.5840-1-me@petersenna.com>
 <20240411195348.10881-1-me@petersenna.com>
 <20240419150553.gpb33q7tw4absj3m@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240419150553.gpb33q7tw4absj3m@kamilkon-DESK.igk.intel.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Tue, 23 Apr 2024 06:15:32 +0200
X-Gmail-Original-Message-ID: <CA+MoWDqYeojpjv0FztZEfMnc6Yg-9Pjcb302-EaZT2CnDnmZAQ@mail.gmail.com>
Message-ID: <CA+MoWDqYeojpjv0FztZEfMnc6Yg-9Pjcb302-EaZT2CnDnmZAQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_capture: Fix many-* subtests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Content-Type: multipart/alternative; boundary="000000000000d1db300616bbcea9"
X-GND-Sasl: me@petersenna.com
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
Reply-To: peter.senna@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--000000000000d1db300616bbcea9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

On Fri, Apr 19, 2024 at 5:05=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Peter,
> On 2024-04-11 at 21:53:34 +0200, Peter Senna Tschudin wrote:
> > Currently trying to run `gem_exec_capture --run-subtest
> > many-4K-incremental` or `gem_exec_capture --run-subtest many-4K-zero`
> > will fail with:
> >
> >  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Test
> >  assertion failure function gem_engine_properties_configure, file
> >  ../lib/i915/gem_engine_topology.c:577:
> >  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Failed
> assertion: ret =3D=3D 1
> >  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Last errno=
:
> 9, Bad file descriptor
> >  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: error: -1
> !=3D 1
> >
> > This problem happens inside the macro find_first_available_engine()
> > when:
> >  1. for_each_ctx_engine() allocates an struct intel_engine_data 'ed'
> >     inside a for loop. The core of the issue is that ed only exists
> >     inside the for loop. As soon as the for loop ends, ed is out of sco=
pe
> >     and after it's lifetime.
> >  2. intel_get_current_engine() sets '*e' to an address of ed. This is o=
k
> >     while inside the for loop, and is undefined behavior after the for
> >     loop ends.
> >  3. configure_hangs() uses '*e' after the lifetime of 'ed' has ended
> >     leading to undefined behavior
> >  4. After the call to find_first_available_engine() __captureN() will
> >     fail as it expects '*e' to be valid. This is also undefined
> >     behavior.
> >
> > Additionally, this patch sets 'e' to NULL early on at the macro, and at
> > the end check if it is still NULL. If so it will skip the test to
> > prevent downstream code from crashing.
>
> Strictly speaking we are not preventing crash but catch a case
> when test cannot proceed (as it needs capable engine),
> so then we skip it. Btw I plan on re-testing it on Monday and
> merge it next week with that small description correction.
>

I guess that we need to reduce the test size to avoid the CI timeout we see
after my fix. I made a patch for it:

https://patchwork.freedesktop.org/series/131845/

Thank you,

Peter

[...]

--000000000000d1db300616bbcea9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kamil,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Apr 19, 2024 at 5:05=E2=80=AFPM Kami=
l Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.intel.com">kamil.ko=
nieczny@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Peter,<br>
On 2024-04-11 at 21:53:34 +0200, Peter Senna Tschudin wrote:<br>
&gt; Currently trying to run `gem_exec_capture --run-subtest<br>
&gt; many-4K-incremental` or `gem_exec_capture --run-subtest many-4K-zero`<=
br>
&gt; will fail with:<br>
&gt; <br>
&gt;=C2=A0 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Test=
<br>
&gt;=C2=A0 assertion failure function gem_engine_properties_configure, file=
<br>
&gt;=C2=A0 ../lib/i915/gem_engine_topology.c:577:<br>
&gt;=C2=A0 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Fail=
ed assertion: ret =3D=3D 1<br>
&gt;=C2=A0 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Last=
 errno: 9, Bad file descriptor<br>
&gt;=C2=A0 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: erro=
r: -1 !=3D 1<br>
&gt; <br>
&gt; This problem happens inside the macro find_first_available_engine()<br=
>
&gt; when:<br>
&gt;=C2=A0 1. for_each_ctx_engine() allocates an struct intel_engine_data &=
#39;ed&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0inside a for loop. The core of the issue is that ed=
 only exists<br>
&gt;=C2=A0 =C2=A0 =C2=A0inside the for loop. As soon as the for loop ends, =
ed is out of scope<br>
&gt;=C2=A0 =C2=A0 =C2=A0and after it&#39;s lifetime.<br>
&gt;=C2=A0 2. intel_get_current_engine() sets &#39;*e&#39; to an address of=
 ed. This is ok<br>
&gt;=C2=A0 =C2=A0 =C2=A0while inside the for loop, and is undefined behavio=
r after the for<br>
&gt;=C2=A0 =C2=A0 =C2=A0loop ends.<br>
&gt;=C2=A0 3. configure_hangs() uses &#39;*e&#39; after the lifetime of &#3=
9;ed&#39; has ended<br>
&gt;=C2=A0 =C2=A0 =C2=A0leading to undefined behavior<br>
&gt;=C2=A0 4. After the call to find_first_available_engine() __captureN() =
will<br>
&gt;=C2=A0 =C2=A0 =C2=A0fail as it expects &#39;*e&#39; to be valid. This i=
s also undefined<br>
&gt;=C2=A0 =C2=A0 =C2=A0behavior.<br>
&gt; <br>
&gt; Additionally, this patch sets &#39;e&#39; to NULL early on at the macr=
o, and at<br>
&gt; the end check if it is still NULL. If so it will skip the test to<br>
&gt; prevent downstream code from crashing.<br>
<br>
Strictly speaking we are not preventing crash but catch a case<br>
when test cannot proceed (as it needs capable engine),<br>
so then we skip it. Btw I plan on re-testing it on Monday and<br>
merge it next week with that small description correction.<br></blockquote>=
<div><br></div><div>I guess that we need to reduce the test size to avoid t=
he CI timeout we see after my fix. I made a patch for it:</div><div><br></d=
iv><div><a href=3D"https://patchwork.freedesktop.org/series/131845/">https:=
//patchwork.freedesktop.org/series/131845/</a><br></div><div><br></div><div=
>Thank you,</div><div><br></div><div>Peter</div><div><br></div><div>[...]</=
div><div><br></div></div></div>

--000000000000d1db300616bbcea9--
