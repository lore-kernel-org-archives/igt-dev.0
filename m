Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A3C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 18:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1610E14E;
	Wed, 15 Jul 2026 18:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iN1bZHX9";
	dkim-atps=neutral
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2323510E14E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 18:57:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-38dfe7eb825so2405074a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 11:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784141846; cv=none;
 d=google.com; s=arc-20260327;
 b=H0J0cr3wQY50Ixwuo9YDgeyy9QAQ6xQLAh2e9eBhzIZ+PM+xrgbUrAAjg6KluFQFPl
 noeRAtsElzhUV8fFooSW8VjByZIgaiCFMISrQWzlklYp0CuAyTddHGoKJi6n7hnRKWJ5
 IuN+2DKm5arD2N4L5NOOnxmVBgo+2o9XQdyx0qGErJWvULOMGdal+Ac6vPm9Kvcjag81
 6JAmHiVqG3Tf1XeT5RvK0elWGwzH9VJIEolEiKw/KMzPO98Q03OOCDDeUGo5quTC1ag1
 UX5ly4Ng2+za1xBE32iQjf5XbY/OuJ2zPcO8WxRxRnZIP3SKCHgGoLNUo6hc5FhU4JtR
 rGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dI9zYs4XPx7tcsdyMJqF/E8TIqk90uM2dl5yRHd2BJU=;
 fh=jpHQ/pUyhHEYYhjtjVmKZsWvxwn5RoWyDL8TXETZyyk=;
 b=J/QVmxUwhhY2b7g/ZvhRbxUzMG4/CY148Ho9jrNcxHB2aBAzDoTjtBkdtr+zA6eGmN
 DFFsoCl/ghjgV7iC7SQnp8hTASUtJjsqjPmuJeGmdVzp9/eizAqKvDXzi7WNzlpQfj1p
 W3oHZtLqv17ljdFf23qMDJTADlvqAxQzUXgjeOI5fwFz95zkgH/iBxrv2hHVym7UhXd4
 IiZ4mOwlG/cmgAoOaAYhhVo3vH0c7VKK4KeHpY5bvtxt7rNyQrJTWvECAkhDFGmuxef7
 KUgITEXixtxCOnjekFat1G9i7ng1Rpa7yjVaYzebmw+wa9jJ9SJ1yS113+DdGlsYdnMe
 T04g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784141846; x=1784746646;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dI9zYs4XPx7tcsdyMJqF/E8TIqk90uM2dl5yRHd2BJU=;
 b=iN1bZHX91oZAezcI/SkRfrYQuBkLJ/LGomCOE4EwN+stToBeNNmX6/Yea67Z+mdFcs
 AQ1lTI/xFzNI1SXkhertmQnqtyRnhwvIcdTdPGOelutxqpzEtSOMEY+2aMBQ1KdQ7+wi
 FQd9FdlVNr+r3TyDjJmIfdUstXcZKNJ3puaRXcirP1QBEv3axg0vpqI8Pf6H6x+/qcii
 yF6zvn6uHr5eqRkzfzjC+BTdIkQb4MXLWRTbX5LsAzxghfldDs6AvJCx7nFOnpMbgII4
 Blzwx0vSXyus3xEgRlSM1y7Ewe27maaQbgPyNrZb6eg2fyMzEGQyuj4e9VRkEnbvsuY7
 w9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784141846; x=1784746646;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dI9zYs4XPx7tcsdyMJqF/E8TIqk90uM2dl5yRHd2BJU=;
 b=SUJZ9U02d3hQ+KT5+khsFEWVrVtRMPlTifIhtCxeHH7vTxv2DQ9zRFCQc0AjL6RZi7
 GuZC0cI+tlibzmxvGkw5cO5lug8q8m7OU6zHLQOJOcN3mskPCbA/NpTVdaRr25Ez5ujV
 uUwkacDgw5u+wCUcY2twC7pLr4rfthqq5DtD+jGrmQmPe4farqpKMvoKmccKCuhP9uzW
 HPpyt1dkwVV7nvOErWTjzkp3RYWE+vsDgyQdoqVBHoBFeMfFe6xu4dAtTQvoiqtsab88
 46URvzQxVl+4al61lJh4x+pLn7g8t2zAc5+spFmx6Wu5f+Vhp6CoXvQVnmWvN/L9/VeT
 rumQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpjhI5aWBR8S+jZpqzPYwa3IWZcfkJgrCg9vgC3AYVOo9lKylfyg1/Kwc165j8QWWrHuhhhSiK+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMx3ylNXQAHPJPfXtcUJSFGytjDvkU2/FoG5TLP8Vyjr7ID1O2
 hb9e1pr1zTKD2z+z5HZQ33G2/d7Gi7ozZh+7jjUJcOFcsqWq21LJiyYikj6mAWVDU8mjPPFzCgY
 ce/hjeipJCAVnm8HT0Nfk2Fi9YQxB0lmV9uUVjAZyTYTBUZs7zWm6g1QfYqA=
X-Gm-Gg: AfdE7cngDk8IoBkp86An/w6tKdWakVc1Tcbx5LK+77OASWIA/lYsKpyK/2uGSXiCYVR
 odKHWHf15qo61oC/7xUFjxDZLAB2wOZ4EnRYJppAWIEBthowezBK2Fc5io/CbSwA/NfauStpSQg
 h9IsNWbtNjficWexhnc8atHlPD9tB9pnft+lPQnAIZ1BE7wQ/JVWcD/hj+Qy/gQykw6zahN2k+4
 jiKAm3V84SEkvaEmKc2TgTOszvs6y7GI/tFhxzSYU6DJDqqml2CnRkd+v9JLP8AULYlvRGhVJTU
 n/JSGJDdJ20bExKCynSP6XXW4FA9XqpGcSEEJ9lYatlVEISiQ3Dxmi37iEwVAf8iNozjNeU=
X-Received: by 2002:a05:6a21:398e:b0:39f:59c8:f302 with SMTP id
 adf61e73a8af0-3c110b15bd6mr18794151637.37.1784141845991; Wed, 15 Jul 2026
 11:57:25 -0700 (PDT)
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
 <CAMNLLoS5KdeXN-DAMnCJ2E2PSe=W+6Oh+UPT04oVzL+=BqN-XQ@mail.gmail.com>
In-Reply-To: <CAMNLLoS5KdeXN-DAMnCJ2E2PSe=W+6Oh+UPT04oVzL+=BqN-XQ@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 15 Jul 2026 11:57:14 -0700
X-Gm-Features: AUfX_mxeJ2hh6TQfNUA0gwT40M9Y5h0mbYYm0mnzOYCJ78aRc9mZwgXS59_aDeM
Message-ID: <CAMNLLoRPiHqdvxtkX8YR=G-Dt1W2i8Ks89amcx1qDccPSjrNOw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000f6da8c0656aae492"
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

--000000000000f6da8c0656aae492
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Swati Sharma <swati2.sharma@intel.com>  @Karthik B S
<karthik.b.s@intel.com> @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel=
.com> @Jani
Nikula <jani.nikula@intel.com> :

Could we get some response here from Intel to move this forward?

Regards
Manasi

On Wed, Jul 8, 2026 at 3:31=E2=80=AFPM Manasi Navare <navaremanasi@google.c=
om>
wrote:

> @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> @Kurmi, Suresh K=
umar
> <suresh.kumar.kurmi@intel.com> ;
>
> Gentle Ping here to provide feedback on these IGT changes that would help
> us unblock our testing with MTK platforms.
>
> Regards
> Manasi
>
> On Sun, Jun 7, 2026 at 8:07=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) <
> Jason-JH.Lin@mediatek.com> wrote:
>
>> [snip]
>>
>> > >
>> > > AFAICS the test either does a blocking commit or explicitly waits
>> > > for the page flip event before calling igt_pipe_crc_get_current().
>> > > If the CRC returned by that doesn't match the commit then the CRCs
>> > > clearly have bogus frame numbers.
>> > >
>> > > I guess if you can't fix the CRC frame numbers to be accurate then
>> > > maybe just stop telling drm_crtc_add_crc_entry() that you even have
>> > > any frame numbers. That should make igt_pipe_crc_get_current()
>> > > throw
>> > > out all captured CRCs and wait for the next one to come in. Perhaps
>> > > that is enough to get you through this.
>> > >
>> > >
>> >
>> > Regarding the frame number, I confirmed that our downstream driver
>> > currently always calls drm_crtc_add_crc_entry() with has_frame=3Dtrue,
>> > passing the vblank counter as the frame number. However, since the
>> > CRC content is inherently offset from the vblank it is reported on
>> > due to the HW pipeline latency, the frame number we are passing is
>> > effectively inaccurate.
>> >
>> > Based on your suggestion of setting has_frame=3Dfalse, I understand
>> > that igt_pipe_crc_get_current() would then:
>> >
>> > 1. Drain all previously captured CRCs in the buffer
>> > 2. Wait for the next incoming CRC
>> > 3. Return it directly without frame number comparison
>> >
>> > This would naturally ensure the most recent CRC is returned,
>> > reflecting the new HW configuration after atomic_commit().
>> > I will try this approach in our downstream driver and verify if it
>> > resolves the issue without requiring any IGT changes.
>> >
>>
>> Hi Ville,
>>
>> I have implemented the CRC commit queue mechanism in the downstream
>> kernel driver combined with the has_frame flag as you suggested.
>> Here is a summary of the implementation:
>> Commit Flow:
>>   mtk_crtc_update_config()
>>     =E2=94=94=E2=94=80=E2=94=80 Enqueue {vblank, has_frame=3Dfalse}
>>     =E2=94=94=E2=94=80=E2=94=80 Send CMDQ command
>>
>>   CRC Work Flow (every vblank):
>>     mtk_crtc_crc_work()
>>       =E2=94=9C=E2=94=80=E2=94=80 If queue empty -> report current CRC w=
ith has_frame=3Dfalse
>>       =E2=94=94=E2=94=80=E2=94=80 If queue not empty:
>>           =E2=94=9C=E2=94=80=E2=94=80 Set has_frame=3Dflase (when plane =
FB is set to NULL)
>>           =E2=94=9C=E2=94=80=E2=94=80 Wait for diff >=3D 3 (CRC valid) s=
et has_fame=3Dtrue
>>           =E2=94=94=E2=94=80=E2=94=80 Report CRC and dequeue
>>
>> With this change, the rotation CRC test now passes.
>> So we can drop this patch for kms_rotainon_crc test now.
>>
>> SubTests/PixelFormatModifier
>>
>> However, we found that kms_plane tests fail at PixelFormatModifier
>> due to an inconsistency in IGT's capture_crc() function.
>> The issue is that capture_crc() uses a strict equality check on the
>> frame number, while igt_pipe_crc_get_for_frame() internally uses a
>> >=3D comparison.
>> Due to the queue processing delay in MTK's driver, the reported
>> frame number may be slightly ahead of the expected flip latch frame,
>> causing the strict !=3D check to fail for the last frame even though
>> the CRC itself is correct.
>>
>> I have proposed a IGT patch to align capture_crc() with the library's
>> existing >=3D behavior, please refer to the patch here:
>> https://patchwork.freedesktop.org/patch/731122/
>>
>> Test results summary:
>> - Without kernel CRC queue, without IGT patch -> PASS
>> - With kernel CRC queue, without IGT patch -> FAIL (last frame)
>> - With kernel CRC queue, with IGT patch -> PASS
>>
>> ---
>>
>> Example Timeline in KmsPlaneTests#RunSubTests/PixelFormatModifier:
>>   Flip 0 latches at frame 100
>>   Flip 1 latches at frame 101
>>   Flip 2 latches at frame 102
>>   Flip 3 latches at frame 103
>>
>>
>> Driver behavior without Internal Queue (Continuous CRC Reporting):
>> - CRC work runs continuously every frame
>> - Generates CRC entries with sequential frame numbers: 100, 101, 102,
>>   103, 104...
>> - Buffer contains entries for many consecutive frames
>> Driver behavior with Internal Queue (Per-Commit CRC Reporting):
>> - CRC is queued and processed with delay
>> - Reports CRC with current frame sequence (when CRC is read)
>> - Due to queue processing delay, reported frame > flip latch frame
>> - Example: reports frames 102, 103, 104, 106 for flips 0-3
>>
>>
>> Test behavior:
>> - Expected frames(Continuous CRC Reporting):
>>   100, 101, 102, 104 (last =3D 103 + 1)
>> - Driver reports(Per-Commit CRC Reporting):
>>   102, 103, 104, 106
>> For earlier frames (0, 1, 2):
>>   - Library's >=3D comparison finds valid CRC
>>   - Example: expected=3D100, got=3D102, library accepts (102 >=3D 100)
>>   - capture_crc's !=3D check: 102 !=3D 100... but test passes?
>> For last frame (3):
>>   - Expected =3D 103 + 1 =3D 104
>>   - Driver reports =3D 106
>>   - Library's >=3D comparison: 106 >=3D 104 =E2=9C=93 (returns CRC)
>>   - capture_crc's !=3D check: 106 !=3D 104 =E2=86=92 FAIL
>>
>> ---
>>
>> Could you please let us know if this approach is acceptable, or if
>> you have any concerns with relaxing the equality check in
>> capture_crc()?
>>
>> Thanks again for your guidance.
>>
>> Best regards,
>> Jason-JH Lin
>>
>>

--000000000000f6da8c0656aae492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-0=
" href=3D"mailto:swati2.sharma@intel.com" tabindex=3D"-1">@Swati Sharma</a>=
=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-1" href=3D"mai=
lto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik B S</a>=C2=A0<a class=
=3D"gmail_plusreply" id=3D"plusReplyChip-2" href=3D"mailto:ville.syrjala@li=
nux.intel.com" tabindex=3D"-1">@Ville Syrj=C3=A4l=C3=A4</a>=C2=A0<a class=
=3D"gmail_plusreply" id=3D"plusReplyChip-3" href=3D"mailto:jani.nikula@inte=
l.com" tabindex=3D"-1">@Jani Nikula</a>=C2=A0:<div><br></div><div>Could we =
get some response here from Intel to move this forward?</div><div><br></div=
><div>Regards</div><div>Manasi</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 8, 20=
26 at 3:31=E2=80=AFPM Manasi Navare &lt;<a href=3D"mailto:navaremanasi@goog=
le.com">navaremanasi@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><a class=3D"gmail_plusrep=
ly" id=3D"m_6532357796384112429plusReplyChip-5" href=3D"mailto:ville.syrjal=
a@linux.intel.com" target=3D"_blank">@Ville Syrj=C3=A4l=C3=A4</a>=C2=A0<a c=
lass=3D"gmail_plusreply" id=3D"m_6532357796384112429plusReplyChip-6" href=
=3D"mailto:suresh.kumar.kurmi@intel.com" target=3D"_blank">@Kurmi, Suresh K=
umar</a>=C2=A0;<br><div><br></div><div>Gentle Ping here to provide feedback=
 on these IGT changes that would help us unblock our testing with MTK platf=
orms.</div><div><br></div><div>Regards</div><div>Manasi</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 7,=
 2026 at 8:07=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) &lt;<a =
href=3D"mailto:Jason-JH.Lin@mediatek.com" target=3D"_blank">Jason-JH.Lin@me=
diatek.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">[snip]<br>
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
</blockquote></div>

--000000000000f6da8c0656aae492--
