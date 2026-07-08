Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AB0C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 22:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC60F10F315;
	Wed,  8 Jul 2026 22:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZKOSndGY";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBCC10F315
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 22:31:19 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2cabc0a1ab6so17249305ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 15:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783549879; cv=none;
 d=google.com; s=arc-20260327;
 b=GKdmXFgyXQM+R+OkeuK94Q4wl1tWHpeOJh6niWmiPRacnMaIMmXIn4jlMxFZhikYG4
 Svlz/R6wISZdJNqBejMHWdrU4bKf46J0iHK6fO/nkvcqA+BTiU2DxQx5r6Z2jtIx9CDd
 UmQ93iQ87Az2JGGVpSgHgmwe5xaz/5UkPN1L3E/oekxMIIKBYMI70YvB1difsDKcIa4x
 2G8wmF8tlMZKqsPJWVL+5npuLsIPOCSd0wlk+cIQ4WR+FMam7z4a1D3WszM28kfozoKk
 6sHWX2ZqeH+nGcXYXBag5MOAHvdkTf+ak08wbTH0Z1WrGJij8vGvcZUdnx+/7CqdUlcP
 MaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OJcP0evMU2RVFBAuxQxJKMFKnv3cXaFZWOHKwNDbv9A=;
 fh=+XFVF02AGRLeRvGeeEW1qYQCb614drHBUQomPriWs2k=;
 b=KIpoOQIcoHGLMliZ0IcwYKjhG30+50fOVX2tbm7t5JEoUV6/3H4Yd5zA8/P8ZI8a/s
 ywf6Xz1tKozemJ+jmAE3OiIOia2AGdwXSU7HNrWI+DVqfuRpeMr29MARkVh93Iq6z9RT
 uWzYfDpkb8m2Q2pdkC8IdA6e1+K1WqZTi85MqmLc3gm5QXHZAWbfSxmk2/odVWPiGReM
 QlRalcAUxWHDiranESzjihDp8pGwSeaxES/lDsVEs5AHtV3Vryvny+PYnkeFH2eB1cID
 us0D32SQnogHLvw3jpIv09bGPCTsUUB+TekNnmuyH9caPYF0FjGaUDcvczYatv++NUju
 u+6A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783549879; x=1784154679;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OJcP0evMU2RVFBAuxQxJKMFKnv3cXaFZWOHKwNDbv9A=;
 b=ZKOSndGYTmEksYhKgDvPPibzcXf/vPKF2+D1WlOy1sCT81kBr/VhLijstaD/1tjLfJ
 ChUgRe6du82Z8UbwtVI17rSv1Or4mWNiYPT6koEP/Xup5w7GX2PSKWBBLlT5OKXbkAmi
 J0xCELAcQb+/b81lH0vu/wSiwA7PVGYYpa6qWi29RtK8OhroVLMT1okvQjf10kQ+4BZv
 BrjfeqBjblKnldZEdE8cVJkAKw1Y2orlA5YvwitcYpnFs6mFyoYYBAHn5rafldwhIw/q
 EI5VFM8S7ZGCysvgBirEtBlm18xbLNuJ/CuuafGsnZ3HTVizxIAOB1sAZQyC8BcHy9KS
 jHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783549879; x=1784154679;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OJcP0evMU2RVFBAuxQxJKMFKnv3cXaFZWOHKwNDbv9A=;
 b=D6vOxZUSZ+1+TGwmrbXdpYYFYJxcHNC8FrhI6ipoE7kmZU9KrgshYAoWqDsT9MRFCu
 e1S/Q4LvlocMHMxQitNHrmifwmaiUd/tQH7jd7mYr53Zmnz52uQJAaHCDs5DxRAAzUNf
 32ygWjKehjjB44vtrnfk5A8SIu2JrMEFG6IMmIzvGwTl2L+6trqWQ/5bKCSN91WbKciK
 3WcTz9YcoVyalRijKwoG1bwjeP7B3EXS6s47WbKZhcl7yGxXvqx/sEFLoRLxVAXfQZxB
 fgB5Tp7Jd1qASIczU0in5tuHdIfkLc4eKO5z1fzv/BOHQjbYP8PrV0K/6GsjkdCkqUzz
 e3vw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqW56PVaKUfccf9YjxOGomFOP9opCZeXzbB4KLCnYtBskLuSohX4fLkLBFyaVBp8Xz3BfJPKcBo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydjNxoz763tzz9HsLdJhdNrkhnsiNNr25EwbT8CBF1KKYtrKZu
 BxztKPbnTwyT2kR3K3mEGvUdFp9tMWz6eVUFV4RfblS4roEo2Kw/zlD4Z4oYyecuHPmGSheZdwX
 rEbzU+0mCKvFt0T86jxx18K0sb5HbeW0iJIE02+lK
X-Gm-Gg: AfdE7cnb8q5wes7w8wV1C1XIoFKD8i8XJTwIObyYs7rhzE2UtqStx+TA4kt7vIYPTtu
 B+k69GufXWD+jUvlMqDQMszYidl1r9hzOSdRt/NBpB/oHGkiQ2P08GZbEOnARqwLXnnGYVjdEMW
 6zajiyH4K1EA7HJFLWR0zfUW1DsQ+m++/hI1dRxjnjfx9dyw0+hTyyx1yiRQd/Le55mwfMlNTEz
 Qpu4VxaqOOGfBSnqWvOGt5Yb0AajtyghXUNtDe9T5pHSVua+T/0IiMTxsk4hi1pya6av/a0Kzvu
 /teHmjUtTbkCB0xVP4I/JwmUy0heKB17Jimxuv0U5/yElSdg45espBg3xktb+pJqbMd0DZ0=
X-Received: by 2002:a05:6a20:258d:b0:3c0:9c1a:893f with SMTP id
 adf61e73a8af0-3c0bcd143cdmr4881410637.71.1783549878728; Wed, 08 Jul 2026
 15:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
 <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
 <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
 <986ffe07650b69ac71c36b10bb6d5e18aa82106f.camel@mediatek.com>
 <ahc3rjW0MFg3LBAB@intel.com>
 <f9fac697509e8c4c543e393152fd5c9809f0932e.camel@mediatek.com>
 <4f0376dce37c5a5c8c6e849aacd6de30e7bc3eab.camel@mediatek.com>
In-Reply-To: <4f0376dce37c5a5c8c6e849aacd6de30e7bc3eab.camel@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 8 Jul 2026 15:31:07 -0700
X-Gm-Features: AVVi8CepAN09OjWNOVMjzKwTBaAzrj0Ee8q5fWrAAqAIf0oFVM8XBONuRnWHbK8
Message-ID: <CAMNLLoS5KdeXN-DAMnCJ2E2PSe=W+6Oh+UPT04oVzL+=BqN-XQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000f787d206562110ce"
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

--000000000000f787d206562110ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> @Kurmi, Suresh Kum=
ar
<suresh.kumar.kurmi@intel.com> ;

Gentle Ping here to provide feedback on these IGT changes that would help
us unblock our testing with MTK platforms.

Regards
Manasi

On Sun, Jun 7, 2026 at 8:07=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5) <Jason-JH.Lin@mediatek.com>
wrote:

> [snip]
>
> > >
> > > AFAICS the test either does a blocking commit or explicitly waits
> > > for the page flip event before calling igt_pipe_crc_get_current().
> > > If the CRC returned by that doesn't match the commit then the CRCs
> > > clearly have bogus frame numbers.
> > >
> > > I guess if you can't fix the CRC frame numbers to be accurate then
> > > maybe just stop telling drm_crtc_add_crc_entry() that you even have
> > > any frame numbers. That should make igt_pipe_crc_get_current()
> > > throw
> > > out all captured CRCs and wait for the next one to come in. Perhaps
> > > that is enough to get you through this.
> > >
> > >
> >
> > Regarding the frame number, I confirmed that our downstream driver
> > currently always calls drm_crtc_add_crc_entry() with has_frame=3Dtrue,
> > passing the vblank counter as the frame number. However, since the
> > CRC content is inherently offset from the vblank it is reported on
> > due to the HW pipeline latency, the frame number we are passing is
> > effectively inaccurate.
> >
> > Based on your suggestion of setting has_frame=3Dfalse, I understand
> > that igt_pipe_crc_get_current() would then:
> >
> > 1. Drain all previously captured CRCs in the buffer
> > 2. Wait for the next incoming CRC
> > 3. Return it directly without frame number comparison
> >
> > This would naturally ensure the most recent CRC is returned,
> > reflecting the new HW configuration after atomic_commit().
> > I will try this approach in our downstream driver and verify if it
> > resolves the issue without requiring any IGT changes.
> >
>
> Hi Ville,
>
> I have implemented the CRC commit queue mechanism in the downstream
> kernel driver combined with the has_frame flag as you suggested.
> Here is a summary of the implementation:
> Commit Flow:
>   mtk_crtc_update_config()
>     =E2=94=94=E2=94=80=E2=94=80 Enqueue {vblank, has_frame=3Dfalse}
>     =E2=94=94=E2=94=80=E2=94=80 Send CMDQ command
>
>   CRC Work Flow (every vblank):
>     mtk_crtc_crc_work()
>       =E2=94=9C=E2=94=80=E2=94=80 If queue empty -> report current CRC wi=
th has_frame=3Dfalse
>       =E2=94=94=E2=94=80=E2=94=80 If queue not empty:
>           =E2=94=9C=E2=94=80=E2=94=80 Set has_frame=3Dflase (when plane F=
B is set to NULL)
>           =E2=94=9C=E2=94=80=E2=94=80 Wait for diff >=3D 3 (CRC valid) se=
t has_fame=3Dtrue
>           =E2=94=94=E2=94=80=E2=94=80 Report CRC and dequeue
>
> With this change, the rotation CRC test now passes.
> So we can drop this patch for kms_rotainon_crc test now.
>
> SubTests/PixelFormatModifier
>
> However, we found that kms_plane tests fail at PixelFormatModifier
> due to an inconsistency in IGT's capture_crc() function.
> The issue is that capture_crc() uses a strict equality check on the
> frame number, while igt_pipe_crc_get_for_frame() internally uses a
> >=3D comparison.
> Due to the queue processing delay in MTK's driver, the reported
> frame number may be slightly ahead of the expected flip latch frame,
> causing the strict !=3D check to fail for the last frame even though
> the CRC itself is correct.
>
> I have proposed a IGT patch to align capture_crc() with the library's
> existing >=3D behavior, please refer to the patch here:
> https://patchwork.freedesktop.org/patch/731122/
>
> Test results summary:
> - Without kernel CRC queue, without IGT patch -> PASS
> - With kernel CRC queue, without IGT patch -> FAIL (last frame)
> - With kernel CRC queue, with IGT patch -> PASS
>
> ---
>
> Example Timeline in KmsPlaneTests#RunSubTests/PixelFormatModifier:
>   Flip 0 latches at frame 100
>   Flip 1 latches at frame 101
>   Flip 2 latches at frame 102
>   Flip 3 latches at frame 103
>
>
> Driver behavior without Internal Queue (Continuous CRC Reporting):
> - CRC work runs continuously every frame
> - Generates CRC entries with sequential frame numbers: 100, 101, 102,
>   103, 104...
> - Buffer contains entries for many consecutive frames
> Driver behavior with Internal Queue (Per-Commit CRC Reporting):
> - CRC is queued and processed with delay
> - Reports CRC with current frame sequence (when CRC is read)
> - Due to queue processing delay, reported frame > flip latch frame
> - Example: reports frames 102, 103, 104, 106 for flips 0-3
>
>
> Test behavior:
> - Expected frames(Continuous CRC Reporting):
>   100, 101, 102, 104 (last =3D 103 + 1)
> - Driver reports(Per-Commit CRC Reporting):
>   102, 103, 104, 106
> For earlier frames (0, 1, 2):
>   - Library's >=3D comparison finds valid CRC
>   - Example: expected=3D100, got=3D102, library accepts (102 >=3D 100)
>   - capture_crc's !=3D check: 102 !=3D 100... but test passes?
> For last frame (3):
>   - Expected =3D 103 + 1 =3D 104
>   - Driver reports =3D 106
>   - Library's >=3D comparison: 106 >=3D 104 =E2=9C=93 (returns CRC)
>   - capture_crc's !=3D check: 106 !=3D 104 =E2=86=92 FAIL
>
> ---
>
> Could you please let us know if this approach is acceptable, or if
> you have any concerns with relaxing the equality check in
> capture_crc()?
>
> Thanks again for your guidance.
>
> Best regards,
> Jason-JH Lin
>
>

--000000000000f787d206562110ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-5" href=
=3D"mailto:ville.syrjala@linux.intel.com" tabindex=3D"-1">@Ville Syrj=C3=A4=
l=C3=A4</a>=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-6" href=
=3D"mailto:suresh.kumar.kurmi@intel.com" tabindex=3D"-1">@Kurmi, Suresh Kum=
ar</a>=C2=A0;<br><div><br></div><div>Gentle Ping here to provide feedback o=
n these IGT changes that would help us unblock our testing with MTK platfor=
ms.</div><div><br></div><div>Regards</div><div>Manasi</div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sun, Jun 7, 2026 at 8:07=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) &lt;<a href=3D"mailto:Jason-JH.Lin@mediatek.com">Jason-JH.Lin=
@mediatek.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">[snip]<br>
<br>
&gt; &gt; <br>
&gt; &gt; AFAICS the test either does a blocking commit or explicitly waits=
<br>
&gt; &gt; for the page flip event before calling igt_pipe_crc_get_current()=
.<br>
&gt; &gt; If the CRC returned by that doesn&#39;t match the commit then the=
 CRCs<br>
&gt; &gt; clearly have bogus frame numbers.<br>
&gt; &gt; <br>
&gt; &gt; I guess if you can&#39;t fix the CRC frame numbers to be accurate=
 then<br>
&gt; &gt; maybe just stop telling drm_crtc_add_crc_entry() that you even ha=
ve<br>
&gt; &gt; any frame numbers. That should make igt_pipe_crc_get_current()<br=
>
&gt; &gt; throw<br>
&gt; &gt; out all captured CRCs and wait for the next one to come in. Perha=
ps<br>
&gt; &gt; that is enough to get you through this.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; Regarding the frame number, I confirmed that our downstream driver<br>
&gt; currently always calls drm_crtc_add_crc_entry() with has_frame=3Dtrue,=
<br>
&gt; passing the vblank counter as the frame number. However, since the<br>
&gt; CRC content is inherently offset from the vblank it is reported on<br>
&gt; due to the HW pipeline latency, the frame number we are passing is<br>
&gt; effectively inaccurate.<br>
&gt; <br>
&gt; Based on your suggestion of setting has_frame=3Dfalse, I understand<br=
>
&gt; that igt_pipe_crc_get_current() would then:<br>
&gt; <br>
&gt; 1. Drain all previously captured CRCs in the buffer<br>
&gt; 2. Wait for the next incoming CRC<br>
&gt; 3. Return it directly without frame number comparison<br>
&gt; <br>
&gt; This would naturally ensure the most recent CRC is returned,<br>
&gt; reflecting the new HW configuration after atomic_commit().<br>
&gt; I will try this approach in our downstream driver and verify if it<br>
&gt; resolves the issue without requiring any IGT changes.<br>
&gt; <br>
<br>
Hi Ville,<br>
<br>
I have implemented the CRC commit queue mechanism in the downstream<br>
kernel driver combined with the has_frame flag as you suggested.<br>
Here is a summary of the implementation:<br>
Commit Flow:<br>
=C2=A0 mtk_crtc_update_config()<br>
=C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 Enqueue {vblank, has_frame=3Dfals=
e}<br>
=C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 Send CMDQ command<br>
<br>
=C2=A0 CRC Work Flow (every vblank):<br>
=C2=A0 =C2=A0 mtk_crtc_crc_work()<br>
=C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 If queue empty -&gt; repor=
t current CRC with has_frame=3Dfalse<br>
=C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 If queue not empty:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Set has_fram=
e=3Dflase (when plane FB is set to NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Wait for dif=
f &gt;=3D 3 (CRC valid) set has_fame=3Dtrue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 Report CRC a=
nd dequeue<br>
<br>
With this change, the rotation CRC test now passes.<br>
So we can drop this patch for kms_rotainon_crc test now.<br>
<br>
SubTests/PixelFormatModifier<br>
<br>
However, we found that kms_plane tests fail at PixelFormatModifier<br>
due to an inconsistency in IGT&#39;s capture_crc() function.<br>
The issue is that capture_crc() uses a strict equality check on the<br>
frame number, while igt_pipe_crc_get_for_frame() internally uses a<br>
&gt;=3D comparison.<br>
Due to the queue processing delay in MTK&#39;s driver, the reported<br>
frame number may be slightly ahead of the expected flip latch frame,<br>
causing the strict !=3D check to fail for the last frame even though<br>
the CRC itself is correct.<br>
<br>
I have proposed a IGT patch to align capture_crc() with the library&#39;s<b=
r>
existing &gt;=3D behavior, please refer to the patch here:<br>
<a href=3D"https://patchwork.freedesktop.org/patch/731122/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.freedesktop.org/patch/731122/</a><b=
r>
<br>
Test results summary:<br>
- Without kernel CRC queue, without IGT patch -&gt; PASS<br>
- With kernel CRC queue, without IGT patch -&gt; FAIL (last frame)<br>
- With kernel CRC queue, with IGT patch -&gt; PASS<br>
<br>
---<br>
<br>
Example Timeline in KmsPlaneTests#RunSubTests/PixelFormatModifier:<br>
=C2=A0 Flip 0 latches at frame 100<br>
=C2=A0 Flip 1 latches at frame 101<br>
=C2=A0 Flip 2 latches at frame 102<br>
=C2=A0 Flip 3 latches at frame 103<br>
<br>
<br>
Driver behavior without Internal Queue (Continuous CRC Reporting):<br>
- CRC work runs continuously every frame<br>
- Generates CRC entries with sequential frame numbers: 100, 101, 102,<br>
=C2=A0 103, 104...<br>
- Buffer contains entries for many consecutive frames<br>
Driver behavior with Internal Queue (Per-Commit CRC Reporting):<br>
- CRC is queued and processed with delay<br>
- Reports CRC with current frame sequence (when CRC is read)<br>
- Due to queue processing delay, reported frame &gt; flip latch frame<br>
- Example: reports frames 102, 103, 104, 106 for flips 0-3<br>
<br>
<br>
Test behavior:<br>
- Expected frames(Continuous CRC Reporting):<br>
=C2=A0 100, 101, 102, 104 (last =3D 103 + 1)<br>
- Driver reports(Per-Commit CRC Reporting):<br>
=C2=A0 102, 103, 104, 106<br>
For earlier frames (0, 1, 2):<br>
=C2=A0 - Library&#39;s &gt;=3D comparison finds valid CRC<br>
=C2=A0 - Example: expected=3D100, got=3D102, library accepts (102 &gt;=3D 1=
00)<br>
=C2=A0 - capture_crc&#39;s !=3D check: 102 !=3D 100... but test passes?<br>
For last frame (3):<br>
=C2=A0 - Expected =3D 103 + 1 =3D 104<br>
=C2=A0 - Driver reports =3D 106<br>
=C2=A0 - Library&#39;s &gt;=3D comparison: 106 &gt;=3D 104 =E2=9C=93 (retur=
ns CRC)<br>
=C2=A0 - capture_crc&#39;s !=3D check: 106 !=3D 104 =E2=86=92 FAIL<br>
<br>
---<br>
<br>
Could you please let us know if this approach is acceptable, or if<br>
you have any concerns with relaxing the equality check in<br>
capture_crc()?<br>
<br>
Thanks again for your guidance.<br>
<br>
Best regards,<br>
Jason-JH Lin<br>
<br>
</blockquote></div>

--000000000000f787d206562110ce--
