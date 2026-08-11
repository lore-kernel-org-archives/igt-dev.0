Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE8C5CFC1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 22:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5F10EDC0;
	Tue, 11 Aug 2026 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="trrMbuk1";
	dkim-atps=neutral
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4397810EDC0
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 21:59:44 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso217379a12.1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786485584; cv=none;
 d=google.com; s=arc-20260327;
 b=HdaHj3v6u7S+yu136aoN3iBf1KGTuLvS4HmOeM1DT6VtrhcFQeh3934irV2i8ZTkB1
 9tFmAG9pKSAl4KGonKntXMJkRffiCvoJzXTE1RCJdSx6RSqqgDr3HjaCbySM6p+0NrA4
 QR3Zjo5uKIO0BQNsx5wnbUe7tV37V1F7yTeXEd5wLc+Tr0UCAOXwlCViWfHUIr7ejAG5
 jHhpuJY2eCvHzQIYOBl2kohICi7uTwavKqmqDLG4M7HBJnB4zp43VuHhAbJRa2ZkoDjV
 jYO8lqWKcsgrvsdnatI7Cxb+vtD4ne/OlsrqUMzyZ07WKy+9ycb9TIyuLJDC1+ttf14L
 Glsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=kd47AQBHyKok0Zio+zP5LVQBYXL1DRi8DCTTrs3ysHM=;
 fh=HNOulGHVxqMiNs7y/G9lQmy0bnxjCPrrtq9mQguOSBo=;
 b=s9Ryl9bClF8n+IXEz10zLKpESQ6NiraqcV4cf3ldGT8gGcWDeAyCmLU1IVUj6bSrDg
 YCK2zf2ECbhenReZ4r9jJMcvMcOjfGS0M8bWSaXVLn62ul54Z6iDONtxsJHazboQnxAV
 ysR+l2rHGBOSDnjOxjOT2nqzHPbRisUkWNmAyPLwrTIYfzQHcYjGDQ2CdMhaLS8i2bfD
 Wx45+KrwTbzWtWkPtquDYydGjL2hADfl20XWw5X1nJJgoBVhX1mGbb2rWKaVyh0JaMro
 LdUhG1yU+np8mRVEiId+Aqkyz4rMrvI4CrGOj0TMyGxOtBRI+VNncMj73+x9CDwRZjHM
 Y1lQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786485584; x=1787090384;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=kd47AQBHyKok0Zio+zP5LVQBYXL1DRi8DCTTrs3ysHM=;
 b=trrMbuk1ivFNGDjjdyz0ZXypl0Uo20zmLdKzQ0jzvSIMhcJEd53eEU1Kt98y1/NtcE
 MOPN9pdaErNZ8vYjQbqcGY1+irqGvbW9PAN3jmhHL/fvH0KGwBAJ5VEAkOWKxmTtbCGB
 jpSHY+4BLiXr7IOPLHAIHQ4ouzI1PYP7cMMTi/Cv036C8f0MhWMH1VqesP9GI7U6EUcZ
 ONLfk7fAVvC2huPIVfvik/vYdq7PyEf94Al3xl2CIsbBx+6yBOataU/wK23doNhXvLFB
 9OoWaD2/wHykLQgVgdZbOVrBl010cfl1FvygbHwMIWcsD10vtS8jVDhnuivVRGyTG+Q3
 B2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786485584; x=1787090384;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kd47AQBHyKok0Zio+zP5LVQBYXL1DRi8DCTTrs3ysHM=;
 b=RXs5n84fHwP0r4clV+H7ZwZgrBPGnLZCvyZ7LhGFXF4EC0maep3Bl7ZPNUpIBZ+Rxt
 jURgdSV+gTiMdzjMWqhxerbpvUAdGTqBmegCBTsy5GirOMQY/i6P1PhYPILis87QjIFC
 m3f73a/skk7TBYPnb9XFxO8UCyWuHFGnYNhbzypNhXAta2XOAJKmPGfvZI88OLuZKwR9
 O3RxyCNcwLvFaaBGUiWErUbB0AXl8UIw5TNW3o3R6AThQEu2/eewSlKwGpWJnXltr/+5
 ULihE5HZcywyZC+IFMk3cAqj0udtVM4TXS7qu1odGAABAVCNKcggXTKgQk1dA/grGAr1
 Y/9g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1Hd3fk+B6H4KA9+US6ek7lyz0hj5iEc1lSxWzTDax5IinwhQkXXaWESoPDbf4H+HZ/qYnMGvJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP+a0dsi5yDS6uyPQvn/yRi0jaB3eSaoRwT2TAne5rqrj68tkA
 zHBH1W7CWahAx1LbW7QLc6GwVowxMEHkZ0fl8GYsHEUcHbX5PukiBgKd4F8Mzm4fQOIFiDVrwKd
 aupqzw9ppFVyunsDjgrr8XRHGhgcZ9rjOsAum+TkS
X-Gm-Gg: AR+sD10S6JRfGUJbdyoBnKuXQ22BRm/oliVSIuXMx9fhwMtOIwEluAdLeh4GiQEGJ0i
 kchPL/0GoIJrHNmp9W8W+q+Wl5hsP5+D0SR1ujpXINew4zDJU92YG/x8Opyu6RXO7j9J4m5a7Pp
 8tegVuOce54HJism/7pY2yn8XbZLYtIqIOpuM8KiFwSYL1HamORqq0Ful1ij2PxDf1jAGWfkpz6
 2bdWcEr4UPfhAKi/I76ZDoPFSRwWAMFWEniiZ4NjEbNZN5Jhqx5THFE+Xs+5rCAuAzrjqpXXdzv
 TcAbCVjHVVuZoFU9PIGfZuVKiVUBsNDnzVbSD73ZtZACchFqktCQrtahET3E1aGBecTv6mUr1AB
 q3bt81xnZZp5LfuC3TMJHkdou2yurb7n0ODLkYsyylFY=
X-Received: by 2002:a05:6a20:bea6:b0:3c3:66c5:68cc with SMTP id
 adf61e73a8af0-3cc2bafad57mr8449513637.21.1786485583041; Tue, 11 Aug 2026
 14:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
 <ee03b60f-4f8a-46aa-a6ae-04cc72bcf2a0@intel.com>
 <6d22bbf472104a0af3ba0d2cf4471e8ccf2e6c6b.camel@mediatek.com>
In-Reply-To: <6d22bbf472104a0af3ba0d2cf4471e8ccf2e6c6b.camel@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Tue, 11 Aug 2026 14:59:31 -0700
X-Gm-Features: AUfX_mww9-bRkMEW4mUqAc6Q-eq32Rc-Ijva9V67X6CpAx8tvA7hd64IkyupaX8
Message-ID: <CAMNLLoSwTMLUahuSsu9JsNUeKW_1pd+T45c458wgKAnf0=cUfw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>
Content-Type: multipart/alternative; boundary="0000000000009491cb0658cc9606"
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

--0000000000009491cb0658cc9606
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks @Karthik B S <karthik.b.s@intel.com>  for your review , @Jason-JH Li=
n
<jason-jh.lin@mediatek.com>  please update the patch to address the review
so we can get this landed while we have traction on this from Intel

Regards
Manasi

On Mon, Aug 10, 2026 at 2:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> On Mon, 2026-08-10 at 10:20 +0530, Karthik B S wrote:
> > Hi Jason-JH,
> >
> > On 6/8/2026 7:57 AM, Jason-JH Lin wrote:
> > > The capture_crc() function validates that the CRC frame sequence
> > > returned by igt_pipe_crc_get_for_frame() matches the expected
> > > value.
> > > The current check uses exact equality (!=3D), however the library
> > > function igt_pipe_crc_get_for_frame() uses >=3D comparison
> > > internally:
> > >
> > >      do {
> > >          read_one_crc(pipe_crc, crc);
> > >          ...
> > >      } while (igt_vblank_before(crc->frame, vblank));
> > >
> > > The function loops while crc->frame < vblank, returning the first
> > > CRC where crc->frame >=3D expected, not necessarily an exact match.
> > >
> > > This strict validation can cause test failures on drivers that
> > > report CRC entries with frame sequences larger than expected. This
> > > happens when drivers use internal queuing mechanisms to ensure CRC
> > > values are correctly correlated with their corresponding frames.
> > >
> > > Example without internal queue (continuous CRC reporting):
> > >    - Driver generates CRC entries continuously every frame
> > >    - Frame sequence increments sequentially
> > >    - Test finds exact matches for all expected frames =E2=86=92 PASS
> > >
> > > Example with internal queue (per-commit CRC reporting):
> > >    - Driver queues CRC and reports with current frame sequence
> > >    - Due to queue processing delay, reported sequence > expected
> > >    - For the last CRC, test adds +1 to expected (per IGT logic)
> > >    - Library's >=3D comparison returns valid CRC
> > >    - capture_crc's !=3D check fails on last frame =E2=86=92 FAIL
> > >
> > > Relax the validation to use < comparison instead of !=3D, which:
> > > 1. Aligns with igt_pipe_crc_get_for_frame() internal behavior
> > > 2. Accepts CRC entries with frame >=3D expected (valid cases)
> > > 3. Still catches real errors where frame < expected, indicating
> > >     CRC buffer overflow or stale data
> > >
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >   tests/kms_plane.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > > index f21006784bfc..548506290c9b 100644
> > > --- a/tests/kms_plane.c
> > > +++ b/tests/kms_plane.c
> > > @@ -766,9 +766,13 @@ static void capture_crc(data_t *data, unsigned
> > > int vblank, igt_crc_t *crc)
> > >   {
> > >     igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> > > vblank, crc);
> > >
> > > +   /*
> > > +    * igt_pipe_crc_get_for_frame uses >=3D comparison, so we
> > > check the same.
> > > +    * Getting a frame < expected indicates CRC buffer
> > > overflow or timing issue.
> > > +    */
> > >     igt_fail_on_f(!igt_skip_crc_compare &&
> > > !igt_run_in_simulation() &&
> > > -                 crc->has_valid_frame && crc->frame !=3D
> > > vblank,
> > > -                 "Got CRC for the wrong frame (got %u,
> > > expected %u). CRC buffer overflow?\n",
> > > +                 crc->has_valid_frame && crc->frame < vblank,
> >
> > Agree on the concept, but with that then isn't this check itself
> > redundant as this has been taken care of already in the
> > 'igt_pipe_crc_get_for_frame'?
> >
> > static inline bool igt_vblank_before(uint32_t a, uint32_t b)
> > {
> >          return igt_vblank_after(b, a);
> > }
> >
>
> Hi Karthik,
>
> You're right. Since igt_pipe_crc_get_for_frame() internally loops
> with igt_vblank_before(crc->frame, vblank), it already guarantees
> crc->frame >=3D vblank upon return. The < vblank check in capture_crc()
> would never trigger under normal conditions, making it redundant.
>
> I've removed the entire frame sequence validation in capture_crc()
> and will rely on the library's existing guarantee. Will update the
> patch accordingly.
>
> Thanks for catching this.
>
> Regards,
> Jason-JH Lin
>
>
> > Regards,
> > Karthik.B.S
> > > +                 "Got CRC for the wrong frame (got %u,
> > > expected >=3D %u). CRC buffer overflow?\n",
> > >                   crc->frame, vblank);
> > >   }
> > >
>
>

--0000000000009491cb0658cc9606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyCh=
ip-0" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik B S</a=
>=C2=A0 for your review ,=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReply=
Chip-1" href=3D"mailto:jason-jh.lin@mediatek.com" tabindex=3D"-1">@Jason-JH=
 Lin</a>=C2=A0 please update the patch to address the review so we can get =
this landed while we have traction on this from Intel<div><br></div><div>Re=
gards</div><div>Manasi</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 10, 2026 at 2=
:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) &lt;<a href=3D"ma=
ilto:Jason-JH.Lin@mediatek.com">Jason-JH.Lin@mediatek.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2026-08-10=
 at 10:20 +0530, Karthik B S wrote:<br>
&gt; Hi Jason-JH,<br>
&gt; <br>
&gt; On 6/8/2026 7:57 AM, Jason-JH Lin wrote:<br>
&gt; &gt; The capture_crc() function validates that the CRC frame sequence<=
br>
&gt; &gt; returned by igt_pipe_crc_get_for_frame() matches the expected<br>
&gt; &gt; value.<br>
&gt; &gt; The current check uses exact equality (!=3D), however the library=
<br>
&gt; &gt; function igt_pipe_crc_get_for_frame() uses &gt;=3D comparison<br>
&gt; &gt; internally:<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read_one_crc(pip=
e_crc, crc);<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 } while (igt_vblank_before(crc-&gt;frame=
, vblank));<br>
&gt; &gt; <br>
&gt; &gt; The function loops while crc-&gt;frame &lt; vblank, returning the=
 first<br>
&gt; &gt; CRC where crc-&gt;frame &gt;=3D expected, not necessarily an exac=
t match.<br>
&gt; &gt; <br>
&gt; &gt; This strict validation can cause test failures on drivers that<br=
>
&gt; &gt; report CRC entries with frame sequences larger than expected. Thi=
s<br>
&gt; &gt; happens when drivers use internal queuing mechanisms to ensure CR=
C<br>
&gt; &gt; values are correctly correlated with their corresponding frames.<=
br>
&gt; &gt; <br>
&gt; &gt; Example without internal queue (continuous CRC reporting):<br>
&gt; &gt; =C2=A0=C2=A0 - Driver generates CRC entries continuously every fr=
ame<br>
&gt; &gt; =C2=A0=C2=A0 - Frame sequence increments sequentially<br>
&gt; &gt; =C2=A0=C2=A0 - Test finds exact matches for all expected frames =
=E2=86=92 PASS<br>
&gt; &gt; <br>
&gt; &gt; Example with internal queue (per-commit CRC reporting):<br>
&gt; &gt; =C2=A0=C2=A0 - Driver queues CRC and reports with current frame s=
equence<br>
&gt; &gt; =C2=A0=C2=A0 - Due to queue processing delay, reported sequence &=
gt; expected<br>
&gt; &gt; =C2=A0=C2=A0 - For the last CRC, test adds +1 to expected (per IG=
T logic)<br>
&gt; &gt; =C2=A0=C2=A0 - Library&#39;s &gt;=3D comparison returns valid CRC=
<br>
&gt; &gt; =C2=A0=C2=A0 - capture_crc&#39;s !=3D check fails on last frame =
=E2=86=92 FAIL<br>
&gt; &gt; <br>
&gt; &gt; Relax the validation to use &lt; comparison instead of !=3D, whic=
h:<br>
&gt; &gt; 1. Aligns with igt_pipe_crc_get_for_frame() internal behavior<br>
&gt; &gt; 2. Accepts CRC entries with frame &gt;=3D expected (valid cases)<=
br>
&gt; &gt; 3. Still catches real errors where frame &lt; expected, indicatin=
g<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 CRC buffer overflow or stale data<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@me=
diatek.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0 tests/kms_plane.c | 8 ++++++--<br>
&gt; &gt; =C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/tests/kms_plane.c b/tests/kms_plane.c<br>
&gt; &gt; index f21006784bfc..548506290c9b 100644<br>
&gt; &gt; --- a/tests/kms_plane.c<br>
&gt; &gt; +++ b/tests/kms_plane.c<br>
&gt; &gt; @@ -766,9 +766,13 @@ static void capture_crc(data_t *data, unsign=
ed<br>
&gt; &gt; int vblank, igt_crc_t *crc)<br>
&gt; &gt; =C2=A0 {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 igt_pipe_crc_get_for_frame(data-&gt;drm_fd, da=
ta-&gt;pipe_crc,<br>
&gt; &gt; vblank, crc);<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0/*<br>
&gt; &gt; +=C2=A0 =C2=A0 * igt_pipe_crc_get_for_frame uses &gt;=3D comparis=
on, so we<br>
&gt; &gt; check the same.<br>
&gt; &gt; +=C2=A0 =C2=A0 * Getting a frame &lt; expected indicates CRC buff=
er<br>
&gt; &gt; overflow or timing issue.<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 igt_fail_on_f(!igt_skip_crc_compare &amp;&amp;=
<br>
&gt; &gt; !igt_run_in_simulation() &amp;&amp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 crc-&gt;has_valid_frame &amp;&amp; crc-&gt;frame !=3D<br>
&gt; &gt; vblank,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &quot;Got CRC for the wrong frame (got %u,<br>
&gt; &gt; expected %u). CRC buffer overflow?\n&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 crc-&gt;has_valid_frame &amp;&amp; crc-&gt;frame &lt; vblank,<br>
&gt; <br>
&gt; Agree on the concept, but with that then isn&#39;t this check itself <=
br>
&gt; redundant as this has been taken care of already in the <br>
&gt; &#39;igt_pipe_crc_get_for_frame&#39;?<br>
&gt; <br>
&gt; static inline bool igt_vblank_before(uint32_t a, uint32_t b)<br>
&gt; {<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 return igt_vblank_after(b, a);<br>
&gt; }<br>
&gt; <br>
<br>
Hi Karthik,<br>
<br>
You&#39;re right. Since igt_pipe_crc_get_for_frame() internally loops<br>
with igt_vblank_before(crc-&gt;frame, vblank), it already guarantees<br>
crc-&gt;frame &gt;=3D vblank upon return. The &lt; vblank check in capture_=
crc()<br>
would never trigger under normal conditions, making it redundant.<br>
<br>
I&#39;ve removed the entire frame sequence validation in capture_crc()<br>
and will rely on the library&#39;s existing guarantee. Will update the<br>
patch accordingly.<br>
<br>
Thanks for catching this.<br>
<br>
Regards,<br>
Jason-JH Lin<br>
<br>
<br>
&gt; Regards,<br>
&gt; Karthik.B.S<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &quot;Got CRC for the wrong frame (got %u,<br>
&gt; &gt; expected &gt;=3D %u). CRC buffer overflow?\n&quot;,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 crc-&gt;frame, vblank);<br>
&gt; &gt; =C2=A0 }<br>
&gt; &gt; =C2=A0 <br>
<br>
</blockquote></div>

--0000000000009491cb0658cc9606--
