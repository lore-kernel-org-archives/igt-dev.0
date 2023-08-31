Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B68810E0EE
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 17:16:33 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d7bae413275so2563203276.0
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 10:16:33 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 g9-20020a056902134900b00d712798a09bsm407795ybu.64.2023.08.31.10.16.30
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 10:16:30 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d7766072ba4so3006755276.1
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 10:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230825183934.1271156-1-sean@poorly.run>
In-Reply-To: <20230825183934.1271156-1-sean@poorly.run>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 31 Aug 2023 13:15:48 -0400
Message-ID: <CAOw6vb+vhjda3crDnO17ev=gGt3S5tQAZAsXr7u56AARudo9GQ@mail.gmail.com>
To: Sean Paul <sean@poorly.run>
Content-Type: multipart/alternative; boundary="00000000000079842e06043b3468"
Subject: Re: [igt-dev] [PATCH 0/6] tests/kms_vrr: Modify kms_vrr to allow
 flicker
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--00000000000079842e06043b3468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any thoughts on this series?

Sean

On Fri, Aug 25, 2023 at 2:39=E2=80=AFPM Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>
> Do some cleanup in the kms_vrr test and add some optional command line
> arguments to alter the target refresh rate for the test. This allows us
> to profile VRR flicker on panels at the low end of the refresh range.
>
> Sean Paul (6):
>   tests/kms_vrr: Move fb0 and fb1 to an array
>   tests/kms_vrr: Move vtest_ns into data_t
>   tests/kms_vrr: Allow test rate to be altered from the command line
>   tests/kms_vrr: Allow test duration to be specified from the command
>     line
>   tests/kms_vrr: Change the pattern displayed in the test
>   test/kms_vrr: Add ability to flip static image for flicker profiling
>
>  tests/kms_vrr.c | 138 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 92 insertions(+), 46 deletions(-)
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
>

--00000000000079842e06043b3468
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any thoughts on this series?<div><br></div><div>Sean</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Aug 25, 2023 at 2:39=E2=80=AFPM Sean Paul &lt;sean@poorly.run&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Sean=
 Paul &lt;<a href=3D"mailto:seanpaul@chromium.org" target=3D"_blank">seanpa=
ul@chromium.org</a>&gt;<br>
<br>
Do some cleanup in the kms_vrr test and add some optional command line<br>
arguments to alter the target refresh rate for the test. This allows us<br>
to profile VRR flicker on panels at the low end of the refresh range.<br>
<br>
Sean Paul (6):<br>
=C2=A0 tests/kms_vrr: Move fb0 and fb1 to an array<br>
=C2=A0 tests/kms_vrr: Move vtest_ns into data_t<br>
=C2=A0 tests/kms_vrr: Allow test rate to be altered from the command line<b=
r>
=C2=A0 tests/kms_vrr: Allow test duration to be specified from the command<=
br>
=C2=A0 =C2=A0 line<br>
=C2=A0 tests/kms_vrr: Change the pattern displayed in the test<br>
=C2=A0 test/kms_vrr: Add ability to flip static image for flicker profiling=
<br>
<br>
=C2=A0tests/kms_vrr.c | 138 ++++++++++++++++++++++++++++++++---------------=
-<br>
=C2=A01 file changed, 92 insertions(+), 46 deletions(-)<br>
<br>
-- <br>
Sean Paul, Software Engineer, Google / Chromium OS<br>
<br>
</blockquote></div>

--00000000000079842e06043b3468--
