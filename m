Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD40CD5BD2
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 00:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C393610E044;
	Wed, 27 May 2026 00:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EcOvQ2/C";
	dkim-atps=neutral
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC8B10E044
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 00:50:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bd6460b0d11so1955273366b.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 17:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779843055; cv=none;
 d=google.com; s=arc-20240605;
 b=WA63W6aM+uRLkgpdBGPtbu18rNVHRfISRdR8uTRpsvEDv+9giAU8el2oNwgwJWGjDf
 a5/QaAwrFcEJLQH8vNqohUP4gxolNW/OqKU6KBoErSYFVviuJKa8emTW4wE1np8kkExt
 k8+U0aQrVLGXhv9n9+ZL7MiZOaybamQkTtLPo4PAWi0FUb8PHxC03VSKwXvTfHdySDxc
 JjouhAf8Ilj8hLf94P4HVMz9vDGO9rSXT0brW8SnxJHfzb+79iezagRc8diAXkWOsLz8
 NBYuvTN3QOj5A45JoTOCfUgrqayhSxbLvCJdQ6n9RadDVPyExbcHMZS64ZqguT8d6rbV
 tpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ft8md0hqNYevKN/j6eu1asp+rDZZxl4jmvRduAg3Klg=;
 fh=G3ed7gQ32ZkXItdRnq1NSmV6V3BaNqhiNMO+yQxMDu0=;
 b=i6JoOZ1rLwGV745vtvKoFG6xQ0prf71ZfKLOCfRBQ5Pbpde3trJHQYGvDnznR1idpO
 5qv8btJRAVOEW8/P+rq07+1L+KBmTa9VY2p/a33hjHUjJSJoUXH97lwXVVm1WbaqXfPO
 9LxVCOG2kePSCexCNV5C7rtEY4/3ty3IZN3JOTB3vAAd7jSbDaYKUd7Py93/zKyeAp+r
 QEkNkdttJ9xbXEVvGzvFy3BIiZ71+429rkd7ZrXz17l917oaMW52tkbLJJhNMQoeysx5
 HgeBC/18HlD+UqIvU4uzS542bKKUngiM5MK8MQG+6Rb046Q3UNSGn7qSIzuOzLDLseml
 LF0Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779843055; x=1780447855;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ft8md0hqNYevKN/j6eu1asp+rDZZxl4jmvRduAg3Klg=;
 b=EcOvQ2/CVWJIHctLTcCIofrW0X7W+7SkjvMHwTQBnIn+2tIqWTqXdFFSBLcxKOXyNg
 VcWSlRFbY0E2kiTUJu+ptz1z+/EOyrYhLrXMWom8IM84ua7pPI066VDZs+FVfVCOrhw9
 0nMLdnlhvBH9NrRoXJ3Yg9DO8ZJJHCWdZMEKx7EPsYmwdwSZwVH0NUkjTfrwxMt1ecX+
 oA2c+ivESP9R/73AKEnl3YHP/nJ6eThNXcw5B70AOkjLG4XedwEahW6zaOhoKbG1DycU
 d0WOWR66704gjdwQbfMYt5+y7rnASyBd4LqTz1dwBmB21B4Tlx9tgRUcthqED6ICrXzZ
 vhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779843055; x=1780447855;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ft8md0hqNYevKN/j6eu1asp+rDZZxl4jmvRduAg3Klg=;
 b=EpKaVNlI4UuHi6girnxboK+sJomez5qYAP85BVlLQuaSCbIbvT9mm9DB0powEkkvUg
 G/tol0gSQ9SgYehdAhO3m2ywAraWel8Et31DphzVEuPBy9ZUgXJD3xVEuXnD7OHvHTa5
 uygnk0mYYfJDj+e2aceRaqGo9obocz/wDP47tlTsqb9P+aByc2EMnWKXqMVhgo4412Xg
 LgYchTUqX1P39DLQntEqhEfoEgbrXIsFStmchrIjv4p/HytWzlpssEdNQt3U/M9pu+7s
 OYufoSzcKxLDf1vFvxI7aA8XIjX9Asvf2WVI4wK4UV57dnJXQfHuSg6YYogdj/7+TkHq
 kJug==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qDg85nKsuZBgRL1KsPhkDsdzJJjsk5ywY9BrwZRNaev+hW2rVme9fUjTbdHWeR8fwNOz4d+G+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynMWDMskHIc8e4rO7MOfsehBvKuhdiOdFfQ5OW7fIK+yTR3cwk
 xkvIl5JACz9P1ZxzUxYva8Y+WGF4mS7fhBkuesWaR1/11it2BSUz3B/LFK/Yfc9bKbuDWExbiaB
 enLXslUjQ9tuQFtgNul04bh8hpdUAcIBcw56M3kL9
X-Gm-Gg: Acq92OEWy2WG9s3NVT4zkBrrmACgFVswZJGPlu0Sk277dkda4IDpmPMGzVboIPaUFOw
 LMyOZW8uPZbjL04mKBCp+jii7mjV5gCw2+DxC3za73zGuXh8PzNX2uYQAlC4rvuTq01O2i1WAOe
 rI73gOIY+RKj+FyirS3QhAirFoSr0aJDcRX1jAPvvdqgW7Eka7wyQ3Efl4ysM7vfBfnXnnnf5Kz
 VTvyrLAnl7zb8u7RVwMygEvBrtx+0KnmvrcMwfGHU0S9du0uWKF6fh5L2ELWpjfKyhrFTMVrnGz
 tbQpGNPSAHGwUByqEiS9YotMysCY8iXK+ElVnLxPz+e2dwnpF7DnnzTQncKIFHAF+26MRK7hv5/
 JNPx5+Zb5mPuj8HKe
X-Received: by 2002:a17:907:ca84:b0:bd2:e940:db25 with SMTP id
 a640c23a62f3a-bdd22e30cc2mr1268123666b.13.1779843054556; Tue, 26 May 2026
 17:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
In-Reply-To: <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Tue, 26 May 2026 17:50:42 -0700
X-Gm-Features: AVHnY4IHOlsz3HvbxWxa41Jx22-iTKJEddFk91QXA63hQXrB2JCw5qh-jEFiHCM
Message-ID: <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, 
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000006f7db0652c20109"
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

--00000000000006f7db0652c20109
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> @Karthik B S
<karthik.b.s@intel.com>  @Kurmi, Suresh Kumar <suresh.kumar.kurmi@intel.com=
>
 ,

Could we get some feedback on this upstream discussion, Ville has suggested
to use the frame counter instead of adding an extra Vblank wait.
However since MTK hardware does not have a support for the frame counter,
this patch adds an extra vblank wait before grabbing CRC only for MTK hw.
We need this change to get the test passing on MTK HW and would
appreciate your feedback and Intel's help
in getting this landed.

@Jason-JH Lin <jason-jh.lin@mediatek.com>  has provided the justification
on why Ville's approach will not work for MTK HW.

Regards
Manasi

On Tue, May 5, 2026 at 3:27=E2=80=AFPM Manasi Navare <navaremanasi@google.c=
om>
wrote:

> Hi @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> ,
>
> Quick ping here to provide your feedback on the two proposed options to
> fix the MTK HW issue that requires an extra Vblank
> before the CRC is available.
>
> Could you please take a look at the proposed approach so we can move
> forward and have this test pass on MTK platform as well?
> Thank you Ville for your thoughts in advance.
>
> Regards
> Manasi
>
> On Wed, Apr 29, 2026 at 4:31=E2=80=AFPM Manasi Navare <navaremanasi@googl=
e.com>
> wrote:
>
>> Thanks Jason-JH for this patch and for providing the details on why the
>> additional Vblank wait was added based on the MTK HW architecture design=
.
>>
>> Also thanks a lot @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.co=
m> for all
>> your feedback and insight into how the fix can potentially be added in t=
he
>> driver.
>>
>> Here are a few thoughts and comments on this:
>> Jason, I see that MTK HW has a limitation where the correct CRC is only
>> available in a frame Vblank N +2, which would be hard to change since it
>> would need
>> a HW level change
>>
>>  @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  are you refer=
ring to
>> checking if MTK make use of the has_valid_frame flag for the CRC calcula=
ted
>> in the driver so that
>> only correct frame will be used for grabbing the CRC no matter the
>> latency since IGT uses this function to grab the CRC:
>>
>> /**
>>
>>
>>  * igt_pipe_crc_get_current:
>>
>>
>>  * @drm_fd: drm device fd for vblank counter
>>
>>
>>  * @pipe_crc: pipe CRC object
>>
>>
>>  * @vblank: frame counter value we're looking for
>>
>>
>>  * @crc: buffer pointer for the captured CRC value
>>
>>
>>  *
>>
>>
>>  * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been
>> captured
>>
>>  * for frame @vblank.
>>
>>
>>  */
>>
>>
>> void
>>
>>
>> igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
>>
>>
>>                            unsigned int vblank, igt_crc_t *crc)
>>
>>
>> {
>>
>>
>>         do {
>>
>>
>>                 read_one_crc(pipe_crc, crc);
>>
>>
>>
>>
>>
>>                 /* Only works with valid frame counter */
>>
>>
>>                 if (!crc->has_valid_frame) {
>>
>>
>>                         igt_pipe_crc_drain(pipe_crc);
>>
>>
>>                         igt_pipe_crc_get_single(pipe_crc, crc);
>>
>>
>>                         return;
>>
>>
>>                 }
>>
>>
>>         } while (igt_vblank_before(crc->frame, vblank));
>>
>>
>>
>>
>>
>>         crc_sanity_checks(pipe_crc, crc);
>>
>>
>> }
>>
>> @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  Could you plea=
se take a
>> look at Jason's proposed two approaches and provide your feedback
>> so that he can make the necessary changes if possible at the driver leve=
l?
>>
>> Regards
>> Manasi
>>
>>
>> On Tue, Apr 14, 2026 at 10:12=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) <
>> Jason-JH.Lin@mediatek.com> wrote:
>>
>>> On Tue, 2026-04-14 at 16:40 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>>> > On Tue, Apr 14, 2026 at 03:11:21AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
>>> > > On Fri, 2026-04-10 at 13:25 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>>> > > > On Fri, Apr 10, 2026 at 06:07:31PM +0800, Jason-JH Lin wrote:
>>> > > > > Adapt rotation CRC tests for MTK devices by using Intel-like
>>> > > > > pipe
>>> > > > > CRC
>>> > > > > approach with explicit vblank synchronization.
>>> > > > > MTK devices require a vblank wait to ensure rotation completes
>>> > > > > before
>>> > > > > CRC capture.
>>> > > >
>>> > > > Instead of adding these checks all over igt I think you should
>>> > > > try to fix you kernel CRC implementation to not hand out garbage
>>> > > > CRCs.
>>> > > >
>>> > >
>>> > > The issue is fundamental to MTK's HW design where all HW
>>> > > configurations
>>> > > are applied by GCE (Global Command Engine) triggered by EOF signal.
>>> > >
>>> > > MTK HW Configuration Flow:
>>> > >
>>> > > igt_display_commit2(display, COMMIT_ATOMIC)
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >        atomic_commit()
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >        CMDQ submit
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >     Wait for next EOF signal =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>>> > >                                               =E2=94=82
>>> > >                                               =E2=96=BC
>>> > >                                   GCE applies HW config
>>> > >                                   (Rotation parameters, etc.)
>>> > >                                   during VBlanking period
>>> > >                                 & GCE reads HW CRC from HW register
>>> > >                                   into DRAM buffer
>>> > >                                               =E2=94=82
>>> > >                                               =E2=96=BC
>>> > >                                   Next Active Display Period
>>> > >                                   HW renders with new config
>>> > >                                               =E2=94=82
>>> > >                                               =E2=96=BC
>>> > >                                   EOF =E2=86=92 GCE reads HW CRC fr=
om
>>> > >                                     HW register into DRAM buffer
>>> > >                                               =E2=94=82
>>> > >                                               =E2=96=BC
>>> > >                                   VBlank+1 =E2=86=92 read CRC from =
DRAM
>>> > >                                            =E2=86=92
>>> > > drm_crtc_add_crc_entry() =E2=9C=85
>>> > >                                   (MTK always reports CRC at
>>> > > VBlank+1
>>> > >                                    after the EOF capture)
>>> > >
>>> > >
>>> > > This design is intentional to ensure all HW settings are fully
>>> > > applied
>>> > > within the VBlanking period, guaranteeing tearing-free display
>>> > > updates.
>>> > > At the EOF signal, GCE reads the HW CRC from the HW register into a
>>> > > DRAM buffer. Note that MTK always reports the CRC at VBlank+1 after
>>> > > the
>>> > > EOF capture, which means there is already an inherent one-frame
>>> > > delay
>>> > > before the CRC is reported to IGT via drm_crtc_add_crc_entry().
>>> > >
>>> > > IGT Expected Behavior (Intel/AMD):
>>> > >
>>> > >   igt_display_commit2(display, COMMIT_ATOMIC)
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >        atomic_commit()
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >         VBlank N =E2=94=80=E2=94=80=E2=96=BA HW config takes effect=
 immediately =E2=9C=85
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA CRC captured with new con=
fig =E2=9C=85
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=96=BA
>>> > > igt_pipe_crc_get_current() =E2=9C=85
>>> > >
>>> > >
>>> > >
>>> > > MTK Actual Behavior:
>>> > >
>>> > >   igt_display_commit2(display, COMMIT_ATOMIC)
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >        atomic_commit()
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >        CMDQ submit
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA GCE applies new config
>>> > >                =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(old) from =
HW register into DRAM
>>> > >             =E2=94=82
>>> > >       VBlanking N =E2=94=80=E2=94=80=E2=96=BA HW updated with new c=
onfig (tearing-free =E2=9C=85)
>>> > >             =E2=94=82
>>> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=96=BA CRC(old) reported vi=
a
>>> > > drm_crtc_add_crc_entry()
>>> > >             =E2=94=82
>>> > >         EOF N+1 =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(new) from=
 HW register into DRAM
>>> > >             =E2=94=82
>>> > >         VBlank N+2 =E2=94=80=E2=94=80=E2=96=BA CRC(new) reported vi=
a
>>> > > drm_crtc_add_crc_entry()
>>> > >             =E2=94=82
>>> > >             =E2=96=BC
>>> > >     igt_wait_for_vblank() is needed to ensure
>>> > >     igt_pipe_crc_get_current() captures the correct CRC =E2=9C=85
>>> > >
>>> > > As shown above, due to MTK's GCE-based HW architecture, there is an
>>> > > inherent multi-frame latency between igt_display_commit2() and the
>>> > > correct CRC being available. Unlike Intel/AMD where the new
>>> > > configuration takes effect immediately at the next VBlank, MTK
>>> > > requires
>>> > > at least 2 VBlanks after atomic_commit() before the correct CRC can
>>> > > be
>>> > > captured. Therefore, igt_wait_for_vblank() is necessary to ensure
>>> > > igt_pipe_crc_get_current() captures the correct CRC reflecting the
>>> > > new
>>> > > rotation configuration.
>>> > >
>>> > > Since this timing behavior is inherent to MTK's GCE-based HW
>>> > > architecture and cannot be eliminated at the kernel driver level,
>>> > > adding igt_wait_for_vblank() in IGT is the appropriate solution.
>>> >
>>> > It doesn't matter how long the latency is. The kernel should
>>> > accompany
>>> > each CRC with the correct frame number for which the CRC was
>>> > generated.
>>> > igt should have to do nothing but wait for the CRC with the correct
>>> > frame number to appear.
>>> >
>>>
>>> Hi Ville,
>>>
>>> Thank you for the clarification. I want to make sure I understand your
>>> expectation correctly.
>>>
>>> When you say "the kernel should accompany each CRC with the correct
>>> frame number," do you mean:
>>>
>>> **Option A: Accurate frame number reporting**
>>> - Kernel reports the exact frame number when CRC was captured
>>> - IGT can compare frame numbers to determine if CRC reflects new
>>> configuration
>>> - Requires hardware frame counter support (which MTK lacks)
>>>
>>> **Option B: Internal synchronization**
>>> - Kernel internally waits for configuration to take effect
>>> - Only reports CRC to userspace after it's guaranteed to reflect
>>> current config
>>> - IGT doesn't need to know about internal delays
>>>
>>> Or perhaps a different approach?
>>>
>>> The challenge with Option A is MTK hardware doesn't provide a frame
>>> counter register.
>>> Option B is feasible, but the latency is variable (1-2 vblanks) due
>>> to asynchronous CMDQ execution.
>>>
>>> Could you clarify which direction you'd prefer, or suggest an
>>> alternative?
>>>
>>> Thanks,
>>> Jason-JH Lin
>>>
>>

--00000000000006f7db0652c20109
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGnCoDxhIGNsYXNzPSJnbWFpbF9wbHVzcmVwbHkiIGlkPSJwbHVzUmVw
bHlDaGlwLTAiIGhyZWY9Im1haWx0bzp2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbSIgdGFi
aW5kZXg9Ii0xIj5AVmlsbGUgU3lyasOkbMOkPC9hPsKgPGEgY2xhc3M9ImdtYWlsX3BsdXNyZXBs
eSIgaWQ9InBsdXNSZXBseUNoaXAtMiIgaHJlZj0ibWFpbHRvOmthcnRoaWsuYi5zQGludGVsLmNv
bSIgdGFiaW5kZXg9Ii0xIj5AS2FydGhpayBCIFM8L2E+wqDCoDxhIGNsYXNzPSJnbWFpbF9wbHVz
cmVwbHkiIGlkPSJwbHVzUmVwbHlDaGlwLTMiIGhyZWY9Im1haWx0bzpzdXJlc2gua3VtYXIua3Vy
bWlAaW50ZWwuY29tIiB0YWJpbmRleD0iLTEiPkBLdXJtaSwgU3VyZXNoIEt1bWFyPC9hPsKgLDxk
aXY+PGJyPjwvZGl2PjxkaXY+Q291bGQgd2UgZ2V0IHNvbWUgZmVlZGJhY2sgb24gdGhpcyB1cHN0
cmVhbSBkaXNjdXNzaW9uLCBWaWxsZSBoYXMgc3VnZ2VzdGVkIHRvIHVzZSB0aGUgZnJhbWUgY291
bnRlciBpbnN0ZWFkIG9mIGFkZGluZyBhbiBleHRyYSBWYmxhbmsgd2FpdC48L2Rpdj48ZGl2Pkhv
d2V2ZXIgc2luY2UgTVRLIGhhcmR3YXJlIGRvZXMgbm90IGhhdmUgYSBzdXBwb3J0IGZvciB0aGUg
ZnJhbWUgY291bnRlciwgdGhpcyBwYXRjaCBhZGRzIGFuIGV4dHJhIHZibGFuayB3YWl0IGJlZm9y
ZSBncmFiYmluZyBDUkMgb25seSBmb3IgTVRLIGh3LjwvZGl2PjxkaXY+V2UgbmVlZCB0aGlzIGNo
YW5nZSB0byBnZXQgdGhlIHRlc3QgcGFzc2luZyBvbiBNVEsgSFcgYW5kIHdvdWxkIGFwcHJlY2lh
dGXCoHlvdXIgZmVlZGJhY2sgYW5kIEludGVsJiMzOTtzIGhlbHA8L2Rpdj48ZGl2PmluIGdldHRp
bmcgdGhpcyBsYW5kZWQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBjbGFzcz0iZ21haWxf
cGx1c3JlcGx5IiBpZD0icGx1c1JlcGx5Q2hpcC00IiBocmVmPSJtYWlsdG86amFzb24tamgubGlu
QG1lZGlhdGVrLmNvbSIgdGFiaW5kZXg9Ii0xIj5ASmFzb24tSkggTGluPC9hPsKgIGhhcyBwcm92
aWRlZCB0aGUganVzdGlmaWNhdGlvbiBvbiB3aHkgVmlsbGUmIzM5O3MgYXBwcm9hY2ggd2lsbCBu
b3Qgd29yayBmb3IgTVRLIEhXLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHM8
L2Rpdj48ZGl2Pk1hbmFzaTwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBn
bWFpbF9xdW90ZV9jb250YWluZXIiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5P
biBUdWUsIE1heSA1LCAyMDI2IGF0IDM6MjfigK9QTSBNYW5hc2kgTmF2YXJlICZsdDs8YSBocmVm
PSJtYWlsdG86bmF2YXJlbWFuYXNpQGdvb2dsZS5jb20iPm5hdmFyZW1hbmFzaUBnb29nbGUuY29t
PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdi
KDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj5IacKgPGEgY2xh
c3M9ImdtYWlsX3BsdXNyZXBseSIgaWQ9Im1fLTIzMzUzNjM1NTE3MzAwOTEzMzNwbHVzUmVwbHlD
aGlwLTIiIGhyZWY9Im1haWx0bzp2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPkBWaWxsZSBTeXJqw6Rsw6Q8L2E+wqAsPGRpdj48YnI+PC9kaXY+PGRpdj5RdWlj
ayBwaW5nIGhlcmUgdG8gcHJvdmlkZSB5b3VyIGZlZWRiYWNrIG9uIHRoZSB0d28gcHJvcG9zZWQg
b3B0aW9ucyB0byBmaXggdGhlIE1USyBIVyBpc3N1ZSB0aGF0IHJlcXVpcmVzIGFuIGV4dHJhIFZi
bGFuazwvZGl2PjxkaXY+YmVmb3JlIHRoZSBDUkMgaXMgYXZhaWxhYmxlLjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+Q291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUgcHJvcG9zZWQg
YXBwcm9hY2ggc28gd2UgY2FuIG1vdmUgZm9yd2FyZCBhbmQgaGF2ZSB0aGlzIHRlc3QgcGFzcyBv
biBNVEsgcGxhdGZvcm0gYXMgd2VsbD88L2Rpdj48ZGl2PlRoYW5rIHlvdSBWaWxsZSBmb3IgeW91
ciB0aG91Z2h0cyBpbiBhZHZhbmNlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UmVnYXJkczwv
ZGl2PjxkaXY+TWFuYXNpPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48
ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBBcHIgMjksIDIwMjYgYXQg
NDozMeKAr1BNIE1hbmFzaSBOYXZhcmUgJmx0OzxhIGhyZWY9Im1haWx0bzpuYXZhcmVtYW5hc2lA
Z29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm5hdmFyZW1hbmFzaUBnb29nbGUuY29tPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj5U
aGFua3MgSmFzb24tSkggZm9yIHRoaXMgcGF0Y2ggYW5kIGZvciBwcm92aWRpbmcgdGhlIGRldGFp
bHMgb24gd2h5IHRoZSBhZGRpdGlvbmFsIFZibGFuayB3YWl0IHdhcyBhZGRlZCBiYXNlZCBvbiB0
aGUgTVRLIEhXIGFyY2hpdGVjdHVyZSBkZXNpZ24uPGRpdj48YnI+PC9kaXY+PGRpdj5BbHNvIHRo
YW5rcyBhIGxvdMKgPGEgY2xhc3M9ImdtYWlsX3BsdXNyZXBseSIgaWQ9Im1fLTIzMzUzNjM1NTE3
MzAwOTEzMzNtXy0yMzU0OTkzNjQzNjg5MTU5NjE3Z21haWwtcGx1c1JlcGx5Q2hpcC0wIiBocmVm
PSJtYWlsdG86dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5A
VmlsbGUgU3lyasOkbMOkPC9hPsKgZm9yIGFsbCB5b3VyIGZlZWRiYWNrIGFuZCBpbnNpZ2h0IGlu
dG8gaG93IHRoZSBmaXggY2FuIHBvdGVudGlhbGx5IGJlIGFkZGVkIGluIHRoZSBkcml2ZXIuPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5IZXJlIGFyZSBhIGZldyB0aG91Z2h0cyBhbmQgY29tbWVu
dHMgb24gdGhpczo8L2Rpdj48ZGl2Pkphc29uLCBJIHNlZSB0aGF0IE1USyBIVyBoYXMgYSBsaW1p
dGF0aW9uIHdoZXJlIHRoZSBjb3JyZWN0IENSQyBpcyBvbmx5IGF2YWlsYWJsZSBpbiBhIGZyYW1l
IFZibGFuayBOwqArMiwgd2hpY2ggd291bGQgYmUgaGFyZCB0byBjaGFuZ2Ugc2luY2UgaXQgd291
bGQgbmVlZDwvZGl2PjxkaXY+YSBIVyBsZXZlbCBjaGFuZ2U8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PsKgPGEgY2xhc3M9ImdtYWlsX3BsdXNyZXBseSIgaWQ9Im1fLTIzMzUzNjM1NTE3MzAwOTEz
MzNtXy0yMzU0OTkzNjQzNjg5MTU5NjE3Z21haWwtcGx1c1JlcGx5Q2hpcC0yIiBocmVmPSJtYWls
dG86dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5AVmlsbGUg
U3lyasOkbMOkPC9hPsKgIGFyZSB5b3UgcmVmZXJyaW5nIHRvIGNoZWNraW5nIGlmIE1USyBtYWtl
IHVzZSBvZiB0aGUgaGFzX3ZhbGlkX2ZyYW1lIGZsYWcgZm9yIHRoZSBDUkMgY2FsY3VsYXRlZCBp
biB0aGUgZHJpdmVyIHNvIHRoYXQ8L2Rpdj48ZGl2Pm9ubHkgY29ycmVjdCBmcmFtZSB3aWxsIGJl
IHVzZWQgZm9yIGdyYWJiaW5nIHRoZSBDUkMgbm8gbWF0dGVyIHRoZSBsYXRlbmN5IHNpbmNlIElH
VCB1c2VzIHRoaXMgZnVuY3Rpb24gdG8gZ3JhYiB0aGUgQ1JDOjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+LyoqIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJy
PsKgKiBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQ6IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCogQGRybV9mZDogZHJt
IGRldmljZSBmZCBmb3IgdmJsYW5rIGNvdW50ZXIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgPGJyPsKgKiBAcGlwZV9jcmM6IHBpcGUgQ1JDIG9iamVjdCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7C
oCogQHZibGFuazogZnJhbWUgY291bnRlciB2YWx1ZSB3ZSYjMzk7cmUgbG9va2luZyBmb3IgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAqIEBjcmM6IGJ1ZmZlciBwb2ludGVy
IGZvciB0aGUgY2FwdHVyZWQgQ1JDIHZhbHVlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IDxicj7CoCogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJy
PsKgKiBTYW1lIGFzIGlndF9waXBlX2NyY19nZXRfc2luZ2xlKCksIGJ1dCB3aWxsIHdhaXQgdW50
aWwgYSBDUkMgaGFzIGJlZW4gY2FwdHVyZWQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqA8YnI+wqAqIGZvciBmcmFtZSBAdmJsYW5rLiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxi
cj7CoCovIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPnZv
aWQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPmlndF9waXBl
X2NyY19nZXRfZm9yX2ZyYW1lKGludCBkcm1fZmQsIGlndF9waXBlX2NyY190ICpwaXBlX2NyYywg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5z
aWduZWQgaW50IHZibGFuaywgaWd0X2NyY190ICpjcmMpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPnsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAg
ZG8geyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmVhZF9vbmVfY3JjKHBpcGVfY3JjLCBjcmMpOyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogT25seSB3b3JrcyB3
aXRoIHZhbGlkIGZyYW1lIGNvdW50ZXIgKi8gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKCFjcmMtJmd0O2hhc192YWxpZF9mcmFtZSkgeyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaWd0X3BpcGVfY3JjX2RyYWluKHBpcGVfY3JjKTsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWd0
X3BpcGVfY3JjX2dldF9zaW5nbGUocGlwZV9jcmMsIGNyYyk7IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybjsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCB9IHdo
aWxlIChpZ3RfdmJsYW5rX2JlZm9yZShjcmMtJmd0O2ZyYW1lLCB2YmxhbmspKTsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgIGNyY19zYW5pdHlfY2hlY2tzKHBpcGVfY3JjLCBjcmMp
OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj59wqAgwqDC
oDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGEgY2xhc3M9ImdtYWlsX3BsdXNyZXBseSIgaWQ9
Im1fLTIzMzUzNjM1NTE3MzAwOTEzMzNtXy0yMzU0OTkzNjQzNjg5MTU5NjE3Z21haWwtcGx1c1Jl
cGx5Q2hpcC0zIiBocmVmPSJtYWlsdG86dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20iIHRh
cmdldD0iX2JsYW5rIj5AVmlsbGUgU3lyasOkbMOkPC9hPsKgIENvdWxkIHlvdSBwbGVhc2UgdGFr
ZSBhIGxvb2sgYXQgSmFzb24mIzM5O3MgcHJvcG9zZWQgdHdvIGFwcHJvYWNoZXMgYW5kIHByb3Zp
ZGUgeW91ciBmZWVkYmFjazwvZGl2PjxkaXY+c28gdGhhdCBoZSBjYW4gbWFrZSB0aGUgbmVjZXNz
YXJ5IGNoYW5nZXMgaWYgcG9zc2libGUgYXQgdGhlIGRyaXZlciBsZXZlbD88L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlJlZ2FyZHM8L2Rpdj48ZGl2Pk1hbmFzacKgPC9kaXY+PGRpdj48YnI+PC9k
aXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfYXR0ciI+T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgMTA6MTLigK9QTSBKYXNvbi1K
SCBMaW4gKOael+edv+elpSkgJmx0OzxhIGhyZWY9Im1haWx0bzpKYXNvbi1KSC5MaW5AbWVkaWF0
ZWsuY29tIiB0YXJnZXQ9Il9ibGFuayI+SmFzb24tSkguTGluQG1lZGlhdGVrLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+T24gVHVlLCAyMDI2LTA0LTE0IGF0IDE2OjQwICswMzAw
LCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6PGJyPg0KJmd0OyBPbiBUdWUsIEFwciAxNCwgMjAyNiBh
dCAwMzoxMToyMUFNICswMDAwLCBKYXNvbi1KSCBMaW4gKOael+edv+elpSkgd3JvdGU6PGJyPg0K
Jmd0OyAmZ3Q7IE9uIEZyaSwgMjAyNi0wNC0xMCBhdCAxMzoyNSArMDMwMCwgVmlsbGUgU3lyasOk
bMOkIHdyb3RlOjxicj4NCiZndDsgJmd0OyAmZ3Q7IE9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDA2
OjA3OjMxUE0gKzA4MDAsIEphc29uLUpIIExpbiB3cm90ZTo8YnI+DQomZ3Q7ICZndDsgJmd0OyAm
Z3Q7IEFkYXB0IHJvdGF0aW9uIENSQyB0ZXN0cyBmb3IgTVRLIGRldmljZXMgYnkgdXNpbmcgSW50
ZWwtbGlrZTxicj4NCiZndDsgJmd0OyAmZ3Q7ICZndDsgcGlwZTxicj4NCiZndDsgJmd0OyAmZ3Q7
ICZndDsgQ1JDPGJyPg0KJmd0OyAmZ3Q7ICZndDsgJmd0OyBhcHByb2FjaCB3aXRoIGV4cGxpY2l0
IHZibGFuayBzeW5jaHJvbml6YXRpb24uPGJyPg0KJmd0OyAmZ3Q7ICZndDsgJmd0OyBNVEsgZGV2
aWNlcyByZXF1aXJlIGEgdmJsYW5rIHdhaXQgdG8gZW5zdXJlIHJvdGF0aW9uIGNvbXBsZXRlczxi
cj4NCiZndDsgJmd0OyAmZ3Q7ICZndDsgYmVmb3JlPGJyPg0KJmd0OyAmZ3Q7ICZndDsgJmd0OyBD
UkMgY2FwdHVyZS48YnI+DQomZ3Q7ICZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgJmd0OyBJbnN0
ZWFkIG9mIGFkZGluZyB0aGVzZSBjaGVja3MgYWxsIG92ZXIgaWd0IEkgdGhpbmsgeW91IHNob3Vs
ZDxicj4NCiZndDsgJmd0OyAmZ3Q7IHRyeSB0byBmaXggeW91IGtlcm5lbCBDUkMgaW1wbGVtZW50
YXRpb24gdG8gbm90IGhhbmQgb3V0IGdhcmJhZ2U8YnI+DQomZ3Q7ICZndDsgJmd0OyBDUkNzLjxi
cj4NCiZndDsgJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgVGhlIGlz
c3VlIGlzIGZ1bmRhbWVudGFsIHRvIE1USyYjMzk7cyBIVyBkZXNpZ24gd2hlcmUgYWxsIEhXPGJy
Pg0KJmd0OyAmZ3Q7IGNvbmZpZ3VyYXRpb25zPGJyPg0KJmd0OyAmZ3Q7IGFyZSBhcHBsaWVkIGJ5
IEdDRSAoR2xvYmFsIENvbW1hbmQgRW5naW5lKSB0cmlnZ2VyZWQgYnkgRU9GIHNpZ25hbC48YnI+
DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IE1USyBIVyBDb25maWd1cmF0aW9uIEZsb3c6PGJy
Pg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyBpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXks
IENPTU1JVF9BVE9NSUMpPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSC
PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7
IMKgwqDCoMKgwqDCoCBhdG9taWNfY29tbWl0KCk8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8
YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgIENNRFEgc3VibWl0PGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoCBXYWl0IGZvciBuZXh0IEVPRiBzaWduYWwg
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQPGJy
Pg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQom
Z3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsg
Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgR0NFIGFwcGxpZXMgSFcgY29uZmlnPGJyPg0KJmd0OyAmZ3Q7IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoUm90YXRpb24gcGFyYW1ldGVycywgZXRjLik8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGR1cmluZyBWQmxhbmtpbmcgcGVyaW9kPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhbXA7IEdDRSBy
ZWFkcyBIVyBDUkMgZnJvbSBIVyByZWdpc3Rlcjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
byBEUkFNIGJ1ZmZlcjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5leHQgQWN0aXZlIERpc3BsYXkgUGVyaW9k
PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBIVyByZW5kZXJzIHdpdGggbmV3IGNvbmZpZzxicj4N
CiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0
OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZn
dDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEVPRiDihpIgR0NFIHJlYWRzIEhXIENSQyBmcm9tPGJyPg0KJmd0OyAmZ3Q7
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgSFcgcmVnaXN0ZXIgaW50byBEUkFNIGJ1ZmZlcjxicj4NCiZndDsgJmd0
OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFZCbGFuaysxIOKGkiByZWFkIENSQyBmcm9tIERSQU08YnI+DQomZ3Q7ICZndDsgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKGkjxicj4NCiZndDsgJmd0OyBkcm1fY3J0Y19hZGRfY3Jj
X2VudHJ5KCkg4pyFPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoTVRLIGFsd2F5cyByZXBvcnRz
IENSQyBhdDxicj4NCiZndDsgJmd0OyBWQmxhbmsrMTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhZnRlciB0aGUgRU9GIGNhcHR1cmUpPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyA8
YnI+DQomZ3Q7ICZndDsgVGhpcyBkZXNpZ24gaXMgaW50ZW50aW9uYWwgdG8gZW5zdXJlIGFsbCBI
VyBzZXR0aW5ncyBhcmUgZnVsbHk8YnI+DQomZ3Q7ICZndDsgYXBwbGllZDxicj4NCiZndDsgJmd0
OyB3aXRoaW4gdGhlIFZCbGFua2luZyBwZXJpb2QsIGd1YXJhbnRlZWluZyB0ZWFyaW5nLWZyZWUg
ZGlzcGxheTxicj4NCiZndDsgJmd0OyB1cGRhdGVzLjxicj4NCiZndDsgJmd0OyBBdCB0aGUgRU9G
IHNpZ25hbCwgR0NFIHJlYWRzIHRoZSBIVyBDUkMgZnJvbSB0aGUgSFcgcmVnaXN0ZXIgaW50byBh
PGJyPg0KJmd0OyAmZ3Q7IERSQU0gYnVmZmVyLiBOb3RlIHRoYXQgTVRLIGFsd2F5cyByZXBvcnRz
IHRoZSBDUkMgYXQgVkJsYW5rKzEgYWZ0ZXI8YnI+DQomZ3Q7ICZndDsgdGhlPGJyPg0KJmd0OyAm
Z3Q7IEVPRiBjYXB0dXJlLCB3aGljaCBtZWFucyB0aGVyZSBpcyBhbHJlYWR5IGFuIGluaGVyZW50
IG9uZS1mcmFtZTxicj4NCiZndDsgJmd0OyBkZWxheTxicj4NCiZndDsgJmd0OyBiZWZvcmUgdGhl
IENSQyBpcyByZXBvcnRlZCB0byBJR1QgdmlhIGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKS48YnI+
DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IElHVCBFeHBlY3RlZCBCZWhhdmlvciAoSW50ZWwv
QU1EKTo8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IMKgIGlndF9kaXNwbGF5X2NvbW1p
dDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+
DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgIGF0b21pY19jb21taXQoKTxicj4NCiZndDsgJmd0OyDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoCBWQmxhbmsgTiDilIDilIDi
lrogSFcgY29uZmlnIHRha2VzIGVmZmVjdCBpbW1lZGlhdGVseSDinIU8YnI+DQomZ3Q7ICZndDsg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqAgRU9GIE4g4pSA4pSA4pa6
IENSQyBjYXB0dXJlZCB3aXRoIG5ldyBjb25maWcg4pyFPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgIFZCbGFuayBOKzEg4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pa6
PGJyPg0KJmd0OyAmZ3Q7IGlndF9waXBlX2NyY19nZXRfY3VycmVudCgpIOKchTxicj4NCiZndDsg
Jmd0OyA8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyBNVEsg
QWN0dWFsIEJlaGF2aW9yOjxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgwqAgaWd0X2Rp
c3BsYXlfY29tbWl0MihkaXNwbGF5LCBDT01NSVRfQVRPTUlDKTxicj4NCiZndDsgJmd0OyDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqAgYXRvbWljX2NvbW1pdCgpPGJyPg0K
Jmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoCBDTURRIHN1
Ym1pdDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsg
Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKg
wqDCoCBFT0YgTiDilIDilIDilrogR0NFIGFwcGxpZXMgbmV3IGNvbmZpZzxicj4NCiZndDsgJmd0
OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgOKUgOKWuiBHQ0UgcmVhZHMgQ1JDKG9s
ZCkgZnJvbSBIVyByZWdpc3RlciBpbnRvIERSQU08YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoCBWQmxhbmtpbmcgTiDilIDi
lIDilrogSFcgdXBkYXRlZCB3aXRoIG5ldyBjb25maWcgKHRlYXJpbmctZnJlZSDinIUpPGJyPg0K
Jmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDC
oMKgwqDCoMKgIFZCbGFuayBOKzEg4pSA4pSA4pa6IENSQyhvbGQpIHJlcG9ydGVkIHZpYTxicj4N
CiZndDsgJmd0OyBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCk8YnI+DQomZ3Q7ICZndDsgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqAgRU9GIE4r
MSDilIDilIDilrogR0NFIHJlYWRzIENSQyhuZXcpIGZyb20gSFcgcmVnaXN0ZXIgaW50byBEUkFN
PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7
IMKgwqDCoMKgwqDCoMKgIFZCbGFuayBOKzIg4pSA4pSA4pa6IENSQyhuZXcpIHJlcG9ydGVkIHZp
YTxicj4NCiZndDsgJmd0OyBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCk8YnI+DQomZ3Q7ICZndDsg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgIGlndF93YWl0X2Zvcl92YmxhbmsoKSBp
cyBuZWVkZWQgdG8gZW5zdXJlPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoCBpZ3RfcGlwZV9jcmNfZ2V0
X2N1cnJlbnQoKSBjYXB0dXJlcyB0aGUgY29ycmVjdCBDUkMg4pyFPGJyPg0KJmd0OyAmZ3Q7IDxi
cj4NCiZndDsgJmd0OyBBcyBzaG93biBhYm92ZSwgZHVlIHRvIE1USyYjMzk7cyBHQ0UtYmFzZWQg
SFcgYXJjaGl0ZWN0dXJlLCB0aGVyZSBpcyBhbjxicj4NCiZndDsgJmd0OyBpbmhlcmVudCBtdWx0
aS1mcmFtZSBsYXRlbmN5IGJldHdlZW4gaWd0X2Rpc3BsYXlfY29tbWl0MigpIGFuZCB0aGU8YnI+
DQomZ3Q7ICZndDsgY29ycmVjdCBDUkMgYmVpbmcgYXZhaWxhYmxlLiBVbmxpa2UgSW50ZWwvQU1E
IHdoZXJlIHRoZSBuZXc8YnI+DQomZ3Q7ICZndDsgY29uZmlndXJhdGlvbiB0YWtlcyBlZmZlY3Qg
aW1tZWRpYXRlbHkgYXQgdGhlIG5leHQgVkJsYW5rLCBNVEs8YnI+DQomZ3Q7ICZndDsgcmVxdWly
ZXM8YnI+DQomZ3Q7ICZndDsgYXQgbGVhc3QgMiBWQmxhbmtzIGFmdGVyIGF0b21pY19jb21taXQo
KSBiZWZvcmUgdGhlIGNvcnJlY3QgQ1JDIGNhbjxicj4NCiZndDsgJmd0OyBiZTxicj4NCiZndDsg
Jmd0OyBjYXB0dXJlZC4gVGhlcmVmb3JlLCBpZ3Rfd2FpdF9mb3JfdmJsYW5rKCkgaXMgbmVjZXNz
YXJ5IHRvIGVuc3VyZTxicj4NCiZndDsgJmd0OyBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQoKSBj
YXB0dXJlcyB0aGUgY29ycmVjdCBDUkMgcmVmbGVjdGluZyB0aGU8YnI+DQomZ3Q7ICZndDsgbmV3
PGJyPg0KJmd0OyAmZ3Q7IHJvdGF0aW9uIGNvbmZpZ3VyYXRpb24uPGJyPg0KJmd0OyAmZ3Q7IDxi
cj4NCiZndDsgJmd0OyBTaW5jZSB0aGlzIHRpbWluZyBiZWhhdmlvciBpcyBpbmhlcmVudCB0byBN
VEsmIzM5O3MgR0NFLWJhc2VkIEhXPGJyPg0KJmd0OyAmZ3Q7IGFyY2hpdGVjdHVyZSBhbmQgY2Fu
bm90IGJlIGVsaW1pbmF0ZWQgYXQgdGhlIGtlcm5lbCBkcml2ZXIgbGV2ZWwsPGJyPg0KJmd0OyAm
Z3Q7IGFkZGluZyBpZ3Rfd2FpdF9mb3JfdmJsYW5rKCkgaW4gSUdUIGlzIHRoZSBhcHByb3ByaWF0
ZSBzb2x1dGlvbi48YnI+DQomZ3Q7IDxicj4NCiZndDsgSXQgZG9lc24mIzM5O3QgbWF0dGVyIGhv
dyBsb25nIHRoZSBsYXRlbmN5IGlzLiBUaGUga2VybmVsIHNob3VsZDxicj4NCiZndDsgYWNjb21w
YW55PGJyPg0KJmd0OyBlYWNoIENSQyB3aXRoIHRoZSBjb3JyZWN0IGZyYW1lIG51bWJlciBmb3Ig
d2hpY2ggdGhlIENSQyB3YXM8YnI+DQomZ3Q7IGdlbmVyYXRlZC48YnI+DQomZ3Q7IGlndCBzaG91
bGQgaGF2ZSB0byBkbyBub3RoaW5nIGJ1dCB3YWl0IGZvciB0aGUgQ1JDIHdpdGggdGhlIGNvcnJl
Y3Q8YnI+DQomZ3Q7IGZyYW1lIG51bWJlciB0byBhcHBlYXIuPGJyPg0KJmd0OyA8YnI+DQo8YnI+
DQpIaSBWaWxsZSw8YnI+DQo8YnI+DQpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBJ
IHdhbnQgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCB5b3VyPGJyPg0KZXhwZWN0YXRpb24gY29y
cmVjdGx5Ljxicj4NCjxicj4NCldoZW4geW91IHNheSAmcXVvdDt0aGUga2VybmVsIHNob3VsZCBh
Y2NvbXBhbnkgZWFjaCBDUkMgd2l0aCB0aGUgY29ycmVjdDxicj4NCmZyYW1lIG51bWJlciwmcXVv
dDsgZG8geW91IG1lYW46PGJyPg0KPGJyPg0KKipPcHRpb24gQTogQWNjdXJhdGUgZnJhbWUgbnVt
YmVyIHJlcG9ydGluZyoqPGJyPg0KLSBLZXJuZWwgcmVwb3J0cyB0aGUgZXhhY3QgZnJhbWUgbnVt
YmVyIHdoZW4gQ1JDIHdhcyBjYXB0dXJlZDxicj4NCi0gSUdUIGNhbiBjb21wYXJlIGZyYW1lIG51
bWJlcnMgdG8gZGV0ZXJtaW5lIGlmIENSQyByZWZsZWN0cyBuZXc8YnI+DQpjb25maWd1cmF0aW9u
PGJyPg0KLSBSZXF1aXJlcyBoYXJkd2FyZSBmcmFtZSBjb3VudGVyIHN1cHBvcnQgKHdoaWNoIE1U
SyBsYWNrcyk8YnI+DQo8YnI+DQoqKk9wdGlvbiBCOiBJbnRlcm5hbCBzeW5jaHJvbml6YXRpb24q
Kjxicj4NCi0gS2VybmVsIGludGVybmFsbHkgd2FpdHMgZm9yIGNvbmZpZ3VyYXRpb24gdG8gdGFr
ZSBlZmZlY3Q8YnI+DQotIE9ubHkgcmVwb3J0cyBDUkMgdG8gdXNlcnNwYWNlIGFmdGVyIGl0JiMz
OTtzIGd1YXJhbnRlZWQgdG8gcmVmbGVjdDxicj4NCmN1cnJlbnQgY29uZmlnPGJyPg0KLSBJR1Qg
ZG9lc24mIzM5O3QgbmVlZCB0byBrbm93IGFib3V0IGludGVybmFsIGRlbGF5czxicj4NCjxicj4N
Ck9yIHBlcmhhcHMgYSBkaWZmZXJlbnQgYXBwcm9hY2g/PGJyPg0KPGJyPg0KVGhlIGNoYWxsZW5n
ZSB3aXRoIE9wdGlvbiBBIGlzIE1USyBoYXJkd2FyZSBkb2VzbiYjMzk7dCBwcm92aWRlIGEgZnJh
bWXCoDxicj4NCmNvdW50ZXIgcmVnaXN0ZXIuPGJyPg0KT3B0aW9uIEIgaXMgZmVhc2libGUsIGJ1
dCB0aGUgbGF0ZW5jeSBpcyB2YXJpYWJsZSAoMS0yIHZibGFua3MpIGR1ZTxicj4NCnRvIGFzeW5j
aHJvbm91cyBDTURRIGV4ZWN1dGlvbi48YnI+DQo8YnI+DQpDb3VsZCB5b3UgY2xhcmlmeSB3aGlj
aCBkaXJlY3Rpb24geW91JiMzOTtkIHByZWZlciwgb3Igc3VnZ2VzdCBhbjxicj4NCmFsdGVybmF0
aXZlPzxicj4NCjxicj4NClRoYW5rcyw8YnI+DQpKYXNvbi1KSCBMaW48YnI+DQo8L2Jsb2NrcXVv
dGU+PC9kaXY+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+
DQo=
--00000000000006f7db0652c20109--
