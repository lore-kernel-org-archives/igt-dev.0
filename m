Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C247610E461
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 16:19:51 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b3ec45d6e9so3576203b6e.0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 08:19:51 -0800 (PST)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com.
 [209.85.161.52]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05680803b500b003a78d196acasm1162694oie.32.2023.11.14.08.19.48
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 08:19:48 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-586753b0ab0so3210342eaf.0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 08:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20231023205910.3556533-1-sean@poorly.run>
In-Reply-To: <20231023205910.3556533-1-sean@poorly.run>
From: Sean Paul <seanpaul@chromium.org>
Date: Tue, 14 Nov 2023 11:19:10 -0500
Message-ID: <CAOw6vbKBCHreAuaW0d3qB5hk4FcJZAqLSU6yOL=o_DwHtU_1Qw@mail.gmail.com>
To: Sean Paul <sean@poorly.run>
Content-Type: multipart/alternative; boundary="000000000000cc445c060a1f27f0"
Subject: Re: [igt-dev] [PATCH v2 0/8] tests/kms_vrr: Modify kms_vrr to allow
 flicker profiling
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

--000000000000cc445c060a1f27f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Friendly review ping.

On Mon, Oct 23, 2023 at 4:59=E2=80=AFPM Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>
> Second revision of the set. New version addresses the review comments
> from Bhanu and adds a new maxmin subtest which alternates the rate
> between max and min every frame.
>
> Sean Paul (8):
>   tests/kms_vrr: Move fb0 and fb1 to an array
>   tests/kms_vrr: Move vtest_ns into data_t
>   tests/kms_vrr: Allow test rate to be altered from the command line
>   tests/kms_vrr: Allow test duration to be specified from the command
>     line
>   tests/kms_vrr: Change the pattern displayed in the test
>   tests/kms_vrr: Add ability to flip static image for flicker profiling
>   tests/kms_vrr: Allow for multiple rates in a test
>   tests/kms_vrr: Add a max/min test to oscillate between rates
>
>  tests/kms_vrr.c | 213 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 156 insertions(+), 57 deletions(-)
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
>

--000000000000cc445c060a1f27f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Friendly review ping.</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 23, 2023 at 4:59=E2=80=AF=
PM Sean Paul &lt;sean@poorly.run&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Sean Paul &lt;<a href=3D"mailto:seanpaul@=
chromium.org" target=3D"_blank">seanpaul@chromium.org</a>&gt;<br>
<br>
Second revision of the set. New version addresses the review comments<br>
from Bhanu and adds a new maxmin subtest which alternates the rate<br>
between max and min every frame.<br>
<br>
Sean Paul (8):<br>
=C2=A0 tests/kms_vrr: Move fb0 and fb1 to an array<br>
=C2=A0 tests/kms_vrr: Move vtest_ns into data_t<br>
=C2=A0 tests/kms_vrr: Allow test rate to be altered from the command line<b=
r>
=C2=A0 tests/kms_vrr: Allow test duration to be specified from the command<=
br>
=C2=A0 =C2=A0 line<br>
=C2=A0 tests/kms_vrr: Change the pattern displayed in the test<br>
=C2=A0 tests/kms_vrr: Add ability to flip static image for flicker profilin=
g<br>
=C2=A0 tests/kms_vrr: Allow for multiple rates in a test<br>
=C2=A0 tests/kms_vrr: Add a max/min test to oscillate between rates<br>
<br>
=C2=A0tests/kms_vrr.c | 213 +++++++++++++++++++++++++++++++++++------------=
-<br>
=C2=A01 file changed, 156 insertions(+), 57 deletions(-)<br>
<br>
-- <br>
Sean Paul, Software Engineer, Google / Chromium OS<br>
<br>
</blockquote></div>

--000000000000cc445c060a1f27f0--
