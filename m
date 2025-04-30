Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E57C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 20:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411DF10E124;
	Wed, 30 Apr 2025 20:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ooK19zLV";
	dkim-atps=neutral
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A4410E124
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 20:16:15 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-477296dce8dso3361891cf.3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746044174; x=1746648974;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0akSFUciOHVjWMbYysXJKJSZhy7N27L68txHtwsucw0=;
 b=ooK19zLVDKaHbKmlOiCLq+wjwM+aFJEnPaJPqRHQhZ+kKDw42zCdqruKb221E8BnF0
 amD5YlKlfiu9fHJmI5zo7kQkLdtbQHmqsYVkqlH2G+6h3jXLSUvrV/m/wmd/2pr0BKra
 w0KzkeLiIJFEm2rgXD9RW5LvYeon45+LEJYWgaWiPTOfXSFz32dKxjuAQ+esxrFK4S6w
 e4Goy5MTL7nf2fYK0n42yklZyKkfdVmpQT6hYST0qPtzBYaxmSTErEzj//mltslXbtQ3
 yU2MbQ4Uw7cOpdB60RMypEWbuEvmfJeKQ5g5T1sYOY4/Y9KvQlamzyzPdh3XgxAgbsh2
 MKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746044174; x=1746648974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0akSFUciOHVjWMbYysXJKJSZhy7N27L68txHtwsucw0=;
 b=RFDhJwo4/2FXa1uRW13q3u+jYoPuXzXs5HcnQ6OUhC0z31gi2Pr2vZtaVvch0GCAvH
 TZcDqWTTVxrbxWakJKcM5uM//91vvaqHXeoM3h7NKlo6jP7bnm4jE1PdqW9jYXOI2Sch
 /iMBW71T8mjq9dl8s42FlIaaF2mWfEQxzlIt8f6FR1RmQFD4pSJ8e+QLeFCTGkIS0d9K
 kqe1QOU8pSXZwIaE4unprKL7m9ZPDZrheFXBBHflovB0kPAFZraE5Bn0Dytd40vZzQgB
 zzll0Gtnri7rJjbTeHpZYfzW/LghdPJ4M4ZZDmoJ91vEanUpyZy2lXyEH+1/JDkL3HDH
 MN+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZcnV0GJtGfGCafRnm5iRsuW3Lbm+A8J/Ub9/xbOv7nQYUaP3cg+zLpvUOOmzeoXRPunlPiqX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKO6pAzFmeQHfS3oKqOZaPG6QmmsoOkh5QXZ3U8kkZGAsEte5F
 56djTqj9Z2PAYRcFHZ5cteHfdGv1T3v/mh4mdOtEnnV9qBIKlYd45cUD+Aitz8pSrrmcqC9GUKj
 PKkrM2ZBWmnUekx46ESuCfabx0qP3rjLiWBxI
X-Gm-Gg: ASbGncu15GA0gVzPTfFAC7kQiSww5InCTq3RFxvZ8aGkgxhHm0HmMP9cUlqirZQ2ws7
 0eTD4shfBouRLbM5b5hA+Ih+TKSmGVQBikpQRogj4PmxgtzfeNDpYgmrIYyEXDcwrk0H6tuTPT0
 /vKOOZapruNDQ1Fwq4nhoho4RsGfPHqDcfoht/ZT5u8pRxiyRjeSdBxottPs2l
X-Google-Smtp-Source: AGHT+IHFgYWJqlhJ4uUsmTkz05XoKA+b12Cg3MH/EIVQ8w/clX9XVaRPzMszwRuhYCGjxu0bwtNP5VZ5B4jVYNJ9Oc4=
X-Received: by 2002:a05:622a:5c86:b0:476:6d30:8aed with SMTP id
 d75a77b69052e-489c5506c3emr74777461cf.49.1746044174299; Wed, 30 Apr 2025
 13:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
 <28db0d07c99de4d76d9679084fdfb58060447b56.camel@dragonic.eu>
In-Reply-To: <28db0d07c99de4d76d9679084fdfb58060447b56.camel@dragonic.eu>
From: Mark Yacoub <markyacoub@google.com>
Date: Wed, 30 Apr 2025 16:16:03 -0400
X-Gm-Features: ATxdqUFUrI-J7AW7DF_bb2bhHFwBkVThzdrE9rhwF9iLMsXRTe0mOnFWQ7_5S0Y
Message-ID: <CAC0gqY4pdc+9eftNbnJgtuVAUNK=FJEKvV0sxHxXO7VU+oRCJQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Extend IGT to support Android
To: Ryszard Knop <rk@dragonic.eu>
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, 
 sapna1.singh@intel.com, seanpaul@google.com, carlos.santa@intel.com
Content-Type: multipart/alternative; boundary="000000000000c5ee5a063404966f"
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

--000000000000c5ee5a063404966f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 9:48=E2=80=AFAM Ryszard Knop <rk@dragonic.eu> wrote=
:

> Hey there,
>
> Are you planning to add Meson changes and docs on how to build this? Whil=
e
> for Linux itself it's
> pretty clear if you look at the Dockerfiles/CI, Android probably needs ND=
K
> installed and some magic
> in the build system to make it work. You likely have these changes done
> already, if you tested this.
>
Hello,
for Android, we're gonna have an Android.bp file that takes care of
building everything and of connecting the dependencies.
Like any other Android package, you'll build it as `m igt-gpu-tools` and we
will have cc_tests so you can do `atest kms_atomic`.
No other magic is required.
This is very related to Android so we're keeping the Android.bp in the
downstream branch as you'd need the Android tree anyway to run the tests in
the android way.
Thanks!

>
> Thanks, Ryszard
>
> On Tue, 2025-04-29 at 20:39 +0000, Jeevaka Prabu Badrappan wrote:
> > The primary objective of this proposal is to extend the functionality o=
f
> > IGT to Android environments.
> >
> > Enabling IGT on Android will allow developers to perform comprehensive
> > testing of graphics drivers, ensuring robustness and reliability across
> > different platforms.
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
>

--000000000000c5ee5a063404966f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 30,=
 2025 at 9:48=E2=80=AFAM Ryszard Knop &lt;<a href=3D"mailto:rk@dragonic.eu"=
>rk@dragonic.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hey there,<br>
<br>
Are you planning to add Meson changes and docs on how to build this? While =
for Linux itself it&#39;s<br>
pretty clear if you look at the Dockerfiles/CI, Android probably needs NDK =
installed and some magic<br>
in the build system to make it work. You likely have these changes done alr=
eady, if you tested this.<br></blockquote><div>Hello,=C2=A0</div><div>for A=
ndroid, we&#39;re gonna have an Android.bp file that takes care of building=
 everything and of connecting the dependencies.</div><div>Like any other An=
droid package, you&#39;ll build it as `m igt-gpu-tools` and we will have cc=
_tests so you can do `atest kms_atomic`.=C2=A0</div><div>No other magic is =
required.</div><div>This is very related to Android so we&#39;re keeping th=
e Android.bp in the downstream branch as you&#39;d need the Android tree an=
yway to run the tests in the android way.</div><div>Thanks!=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks, Ryszard<br>
<br>
On Tue, 2025-04-29 at 20:39 +0000, Jeevaka Prabu Badrappan wrote:<br>
&gt; The primary objective of this proposal is to extend the functionality =
of<br>
&gt; IGT to Android environments.<br>
&gt; <br>
&gt; Enabling IGT on Android will allow developers to perform comprehensive=
<br>
&gt; testing of graphics drivers, ensuring robustness and reliability acros=
s<br>
&gt; different platforms.<br>
&gt; <br>
&gt; By providing stub implementations for libraries that are not natively<=
br>
&gt; supported on Android, we will bridge the gap between Android and Linux=
<br>
&gt; environments, promoting code reuse and reducing development time.<br>
&gt; <br>
&gt; Changes done:<br>
&gt; - Create stub implementations of GLib, libunwind, libprocps, and<br>
&gt; other necessary libraries to satisfy IGT dependencies on Android.<br>
&gt; - Replace glib hash table with generic hash table implementation<br>
&gt; <br>
&gt; Note:<br>
&gt; - Incase of linux systems, system libraries will be used whereas for<b=
r>
&gt; Android stubs will be used with reduced test coverage.<br>
&gt; - Support will be provided to maintain Android support.<br>
&gt; <br>
&gt; Jeevaka Prabu Badrappan (4):<br>
&gt; =C2=A0 Replace program_invocation_short_name with prog_name from comma=
nd line<br>
&gt; =C2=A0 Avoid use of pthread_cancel by introducing an exit flag<br>
&gt; =C2=A0 Replace glib hash table with c specific implementation<br>
&gt; =C2=A0 igt-gpu-tools: Changes to compile for Android<br>
&gt; <br>
&gt; Sapna (1):<br>
&gt; =C2=A0 Add stub for libunwind, procps and glib<br>
&gt; <br>
&gt; =C2=A0include/stub/glib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 43 +++++++++++++<br>
&gt; =C2=A0include/stub/libproc2/pids.h |=C2=A0 41 ++++++++++++<br>
&gt; =C2=A0include/stub/libunwind.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++++=
++<br>
&gt; =C2=A0lib/igt_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 ++<br>
&gt; =C2=A0lib/igt_core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt; =C2=A0lib/igt_device_scan.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 118 ++++++++++++++++++++++++++---------<br>
&gt; =C2=A0lib/igt_dummyload.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-<br>
&gt; =C2=A0lib/igt_dummyload.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +<br>
&gt; =C2=A0lib/igt_kmod.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++<br>
&gt; =C2=A0lib/xe/xe_spin.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; =C2=A0tests/intel/xe_create.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +<br>
&gt; =C2=A0tools/gputop.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-<br>
&gt; =C2=A0tools/intel_gpu_top.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 +-<br>
&gt; =C2=A013 files changed, 220 insertions(+), 36 deletions(-)<br>
&gt; =C2=A0create mode 100644 include/stub/glib.h<br>
&gt; =C2=A0create mode 100644 include/stub/libproc2/pids.h<br>
&gt; =C2=A0create mode 100644 include/stub/libunwind.h<br>
</blockquote></div></div>

--000000000000c5ee5a063404966f--
