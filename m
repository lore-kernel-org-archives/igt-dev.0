Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D006C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 20:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3DC10E124;
	Wed, 30 Apr 2025 20:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Xc11olMT";
	dkim-atps=neutral
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523E10E124
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 20:13:33 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4775ccf3e56so17417841cf.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746044012; x=1746648812;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y0FraLpBpIeadVc29H5ZeyeOfzHMqKWJFZx5uh+Uy+4=;
 b=Xc11olMTBIQA704g7Bq4P5BYZsn/2COQHMvVNK/UhvTPDbcj0YbJ6Vbl3I9NQD1iFz
 54gJGt2HXg2TskZTYGDEIaB3SmeRapbw2z+AycbKamRgEmLL9cLCO8/onkcDnYfzASO8
 rR1cX4un4nc2GtF4tmtrkY9vmztmK9m340+XkVz+1gmw42520AGNQjdl9E57ajR+lO5n
 rU25iiltBWqXgNtQF96wQhZ74AaYl8N2d38nNpTxIqih13Ur8DX3LKnbM49Y/jh6u63Q
 1dkPN11x3zaksPPaixzYAK/voFY87YxNOxvZdhiqh9HnHWjTrGCjl1avbWTG7F4FXlBK
 ps3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746044012; x=1746648812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0FraLpBpIeadVc29H5ZeyeOfzHMqKWJFZx5uh+Uy+4=;
 b=Msk6neMPpSh1Xk9WNnnHvfLezDenSx341JBY+wRK+h2EwRQxZKlOSpI3XVaTdjdEsB
 9yvhdI0NFv4W3BIN6WJSc3VVWGuqZuGxFqQmDDMmEH3K1VMcHRY5JUatj/93MKovdHPY
 QIiF4zrM9MBVU7IiEX5600sTa9+xY8/OJLdebrtCY3lqPw7626PQrj8Ct7+fVmYCDevY
 5L2OLauXJfL+HNE1oq9CTFMUSXraYh7DbOmjlzOvorf7UeKDyjtmBLDlH+9BuMD1EnBP
 2hlhb9/+PUidofpOYOLm56nN4cE14NC6TGyRd9MWZDJ7voB04yQ+Ds/Sh/2SmvbhAUnX
 DFWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlrblG6lsFO1xJHPfWS2xSPR1is/jJmcchbF79dtbMhooXhoNRNIKZYmi0qdMtjk0zKSLtOJJk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJeyjJKpeE0J9DJZW7RlE95q3LU9CUgB8kR7U9jbsoDhcTb6z1
 XAwF/tmZud4PtrGvZfbwe0lAxEf8ZMPpMWU7at8sqLdGpthRPfdtVG3+O5ilTy0UOak9+lkW9I6
 vJEfcmNcuJ60gLkBP6CSEjgnNOr2RjN6Py1AJ
X-Gm-Gg: ASbGncsTQ1cVuJUIqKoHqvFPDPlRKkXVsW2x0UExjWsXmxiiqcIZv2U8BcDJ8Rj7aVj
 gadJstEQcDY3/IadravbAGApyF8QqxA7IOQ3eohg477od/i/Xdi5RqszJutlgrpDQCLJ0Q1V/jR
 uL/7G2DSpADcHe/XP/P4XW1/mJTBCrj9i6AsBtvJUtOZCAksSvCg==
X-Google-Smtp-Source: AGHT+IGsDc7Bvqb9T9A2rkEKZdzPaX1hVTVYvSqV4dqV1EmXqPajKzSgSNpdU4b0/y/JJryY3einN12ySXiU4MVMTdY=
X-Received: by 2002:a05:622a:2608:b0:47a:fb28:8ee4 with SMTP id
 d75a77b69052e-48ad8eaec82mr15184701cf.22.1746044011787; Wed, 30 Apr 2025
 13:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
 <85tt66r7q4.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85tt66r7q4.wl-ashutosh.dixit@intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Wed, 30 Apr 2025 16:13:21 -0400
X-Gm-Features: ATxdqUGoZE7fRNE45Z5RBxFmxVo0YDuebA08_CxOENf8Tnc-4hS2qPz-YK-Elro
Message-ID: <CAC0gqY7uE-sFOYvph0u7j-ufcYDZ9eSrzBjPtAfgvcWSOCtQ=w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Extend IGT to support Android
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, 
 sapna1.singh@intel.com, seanpaul@google.com, carlos.santa@intel.com
Content-Type: multipart/alternative; boundary="00000000000016538f0634048d77"
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

--00000000000016538f0634048d77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:14=E2=80=AFPM Dixit, Ashutosh <ashutosh.dixit@int=
el.com>
wrote:

> On Tue, 29 Apr 2025 13:39:55 -0700, Jeevaka Prabu Badrappan wrote:
> >
> > The primary objective of this proposal is to extend the functionality o=
f
> > IGT to Android environments.
> >
> > Enabling IGT on Android will allow developers to perform comprehensive
> > testing of graphics drivers, ensuring robustness and reliability across
> > different platforms.
>
> Could you give some more context here about why this is needed? Is it
> because Google is moving Chromebooks to Android?


> We also need to think about if this needs addition of an Android build to
> CI and who will support that.
>
> Also, it seems Android was added previously but removed in 2017 in
> 430946d0b881 ("igt: Remove Android support"). So this seems to be a new
> attempt to add Android to IGT.
>

Hello,

Yes - IGT is already in Android but was running off a snapshot from 5 years
ago.
To run it on Android, all required dependencies such as Android.bp were
kept downstream.

On Android, we're trying to move back to upstream and stay close to
upstream and constantly update our downstream repo.
The plan is to keep the Android specific build system such as Android.bp in
the downstream branch as it's not the most relevant to the upstream repo.

Thanks,
-Mark

>
> Thanks.
>
> >
> > By providing stub implementations for libraries that are not natively
> > supported on Android, we will bridge the gap between Android and Linux
> > environments, promoting code reuse and reducing development time.
> >
> > Changes done:
> > - Create stub implementations of GLib, libunwind, libprocps, and
> > other necessary libraries to satisfy IGT dependencies on Android.
> > - Replace glib hash table with generic hash table implementation
> >
> > Note:
> > - Incase of linux systems, system libraries will be used whereas for
> > Android stubs will be used with reduced test coverage.
> > - Support will be provided to maintain Android support.
> >
> > Jeevaka Prabu Badrappan (4):
> >   Replace program_invocation_short_name with prog_name from command lin=
e
> >   Avoid use of pthread_cancel by introducing an exit flag
> >   Replace glib hash table with c specific implementation
> >   igt-gpu-tools: Changes to compile for Android
> >
> > Sapna (1):
> >   Add stub for libunwind, procps and glib
> >
> >  include/stub/glib.h          |  43 +++++++++++++
> >  include/stub/libproc2/pids.h |  41 ++++++++++++
> >  include/stub/libunwind.h     |  20 ++++++
> >  lib/igt_core.c               |   4 ++
> >  lib/igt_core.h               |   1 +
> >  lib/igt_device_scan.c        | 118 ++++++++++++++++++++++++++---------
> >  lib/igt_dummyload.c          |   6 +-
> >  lib/igt_dummyload.h          |   2 +
> >  lib/igt_kmod.c               |  10 +++
> >  lib/xe/xe_spin.c             |   2 +-
> >  tests/intel/xe_create.c      |   1 +
> >  tools/gputop.c               |   6 +-
> >  tools/intel_gpu_top.c        |   2 +-
> >  13 files changed, 220 insertions(+), 36 deletions(-)
> >  create mode 100644 include/stub/glib.h
> >  create mode 100644 include/stub/libproc2/pids.h
> >  create mode 100644 include/stub/libunwind.h
> >
> > --
> > 2.49.0
> >
>

--00000000000016538f0634048d77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 29,=
 2025 at 5:14=E2=80=AFPM Dixit, Ashutosh &lt;<a href=3D"mailto:ashutosh.dix=
it@intel.com">ashutosh.dixit@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 29 Apr 2025 13:39:55 -0700, J=
eevaka Prabu Badrappan wrote:<br>
&gt;<br>
&gt; The primary objective of this proposal is to extend the functionality =
of<br>
&gt; IGT to Android environments.<br>
&gt;<br>
&gt; Enabling IGT on Android will allow developers to perform comprehensive=
<br>
&gt; testing of graphics drivers, ensuring robustness and reliability acros=
s<br>
&gt; different platforms.<br>
<br>
Could you give some more context here about why this is needed? Is it<br>
because Google is moving Chromebooks to Android?=C2=A0</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
We also need to think about if this needs addition of an Android build to<b=
r>
CI and who will support that.<br>
<br>
Also, it seems Android was added previously but removed in 2017 in<br>
430946d0b881 (&quot;igt: Remove Android support&quot;). So this seems to be=
 a new<br>
attempt to add Android to IGT.<br></blockquote><div><br></div><div>Hello,=
=C2=A0</div><div><br></div><div>Yes - IGT is already in Android but was run=
ning off a snapshot from 5 years ago.</div><div>To run it on Android, all r=
equired dependencies such as Android.bp were kept downstream.</div><div><br=
></div><div>On Android, we&#39;re trying to move back to upstream and stay =
close to upstream and constantly update our downstream repo.</div><div>The =
plan is to keep the Android specific build system such as Android.bp in the=
 downstream branch as it&#39;s not the most relevant to the upstream repo.<=
/div><div><br></div><div>Thanks,</div><div>-Mark</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Thanks.<br>
<br>
&gt;<br>
&gt; By providing stub implementations for libraries that are not natively<=
br>
&gt; supported on Android, we will bridge the gap between Android and Linux=
<br>
&gt; environments, promoting code reuse and reducing development time.<br>
&gt;<br>
&gt; Changes done:<br>
&gt; - Create stub implementations of GLib, libunwind, libprocps, and<br>
&gt; other necessary libraries to satisfy IGT dependencies on Android.<br>
&gt; - Replace glib hash table with generic hash table implementation<br>
&gt;<br>
&gt; Note:<br>
&gt; - Incase of linux systems, system libraries will be used whereas for<b=
r>
&gt; Android stubs will be used with reduced test coverage.<br>
&gt; - Support will be provided to maintain Android support.<br>
&gt;<br>
&gt; Jeevaka Prabu Badrappan (4):<br>
&gt;=C2=A0 =C2=A0Replace program_invocation_short_name with prog_name from =
command line<br>
&gt;=C2=A0 =C2=A0Avoid use of pthread_cancel by introducing an exit flag<br=
>
&gt;=C2=A0 =C2=A0Replace glib hash table with c specific implementation<br>
&gt;=C2=A0 =C2=A0igt-gpu-tools: Changes to compile for Android<br>
&gt;<br>
&gt; Sapna (1):<br>
&gt;=C2=A0 =C2=A0Add stub for libunwind, procps and glib<br>
&gt;<br>
&gt;=C2=A0 include/stub/glib.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 43=
 +++++++++++++<br>
&gt;=C2=A0 include/stub/libproc2/pids.h |=C2=A0 41 ++++++++++++<br>
&gt;=C2=A0 include/stub/libunwind.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 20 ++++++<br=
>
&gt;=C2=A0 lib/igt_core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 ++<br>
&gt;=C2=A0 lib/igt_core.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 lib/igt_device_scan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 118 +++++++++=
+++++++++++++++++---------<br>
&gt;=C2=A0 lib/igt_dummyload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +-<br>
&gt;=C2=A0 lib/igt_dummyload.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
&gt;=C2=A0 lib/igt_kmod.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 10 +++<br>
&gt;=C2=A0 lib/xe/xe_spin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tests/intel/xe_create.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br=
>
&gt;=C2=A0 tools/gputop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 tools/intel_gpu_top.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02=
 +-<br>
&gt;=C2=A0 13 files changed, 220 insertions(+), 36 deletions(-)<br>
&gt;=C2=A0 create mode 100644 include/stub/glib.h<br>
&gt;=C2=A0 create mode 100644 include/stub/libproc2/pids.h<br>
&gt;=C2=A0 create mode 100644 include/stub/libunwind.h<br>
&gt;<br>
&gt; --<br>
&gt; 2.49.0<br>
&gt;<br>
</blockquote></div></div>

--00000000000016538f0634048d77--
