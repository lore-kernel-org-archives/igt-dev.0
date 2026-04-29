Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4101FF887E
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 23:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8510C10E052;
	Wed, 29 Apr 2026 23:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WkO+JskO";
	dkim-atps=neutral
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A438710E083
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 23:32:05 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-67790429f71so669031a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 16:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777505524; cv=none;
 d=google.com; s=arc-20240605;
 b=NZ4EWqXil7lxZF5uJgeOX739slmgSehTF8S4Lvqecm9LT7FamG3HvcUG3cjxmcCEPS
 MgrEZNuv5CDsHfUbIj1k0Wuc2xdsqcQyABM+ZZuORsfhzVZzeHw1lyNonjb0kLt6b5gN
 FxopsxEROubIaBRtu+quJylfIelGCEoR1ysoFnbtc2Q6Dk1eJPXeBTeu9BnQeXap/wPA
 XDxmK0NCJG9SRBw/AFNKVxIDMQQiAOx6edxKhSWoVTpAeOzbpLPtxG+YMhFqFB2dAXjT
 gIjGomViFCz5SKb902vVs7D1ZDFLK3KljLPnY520m6+304abbHnn4eUoKXfpRUMjt1mB
 kxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YaSi73MpCgmcbaQfU1MUiSyrSFieBvDERVpczgnl0mo=;
 fh=fiscxmmViSvEB8axmid/Hw+2OOiJ7LNcj80E0shVp2w=;
 b=bepsdutNSlYFkTzmr1E+q2sbq6P9HnOJAQl39gEDMNN8A66Ic8l6InyF4rnxLgAXO6
 qTmv5E85Od1ZoF0hUgNijeX/8r9bpnWFjFlZvKhH8b6kUigJge6nwuQBf0ndHTyB9qCA
 KjayTuV6UlnVLOx1NgE3e9/Q/vObAzzknaSKJV/RCztx39QR4CVALUbHjoUR0IVmSNs9
 gjRBSx5gfwOBp8ZI3Ejviz0nY7fDspLKiXhXmJJVvseAJjBoaEx1nF0AbYbLNfflvLbX
 VaxYjp28Pitwe/Jt0pCiYQM14GEF69ITQDLuKI/pVAQu5Dhcva83GhVAI7f5/F/hJ7Ku
 LcFw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777505524; x=1778110324;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YaSi73MpCgmcbaQfU1MUiSyrSFieBvDERVpczgnl0mo=;
 b=WkO+JskOb4vvrfGvoat8co8KIWRrAoLkvXf/TdLCbKXC/RSDymmczWZRtaToLvqRB9
 NsLZcAITcARiBP/ZaBf13Qu4k4XKuFQLzqfXU7QuPVH+CLd2p7UqHr7UcuYk6nZZAXul
 R0Wanfa42glQbkCagMdtt/6bsdMKrFaJsIfHBD8KpqZw0AtRmsr/Okjbyos5MxfcSVmS
 jaXwIyG3LLlagRhBorSlQohpD6REr28ExNdavQ7ZV7LeiOAcP8NKmKS7GnXYkHdNCcE5
 7Rpww7zb6eFcTSNgksOnL6K3clLfME+mW/DGLqG6/tlZWAYAnKeFBznYAQjujm4+6K8s
 VXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777505524; x=1778110324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YaSi73MpCgmcbaQfU1MUiSyrSFieBvDERVpczgnl0mo=;
 b=n/SBhXi38DwIoHDLRThabJTet4dSNi3MhKnyKBnmMDyRAYEo2oV8XOEJUQTDUmcqIy
 y3aUQjnSqIAy3BpZ1cj9EbE51TpdF2Hda7j12v4sUJ31eWWX8jn3sEGuJWZnO/21XOri
 U6+Tg3E97Lfnowc13ABXu6BdziZnRGH8oXLczKdAA/I2IUeRiyYcLIn/xCuiX7NBURcs
 X+QbKQzCJ7tpPxv42qQnrlVj32b8chon06fNcnw+PPOlgVQjbSEo5St4L/njauBjWvib
 QZKGzNnZg1awpBXmhu4BqyidgP7vQo2QBYD4R2p3NG/NsbeGjvdRrhJ6iXp/CQPCikZ9
 sj/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8a4uoh2nacZ33dAitQodz6ZjOjPrEyXoyavmBCYHyMkGorYmEjPqeYRpBkRuaspHRft4GPyRsN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsIyau4doqxTMW1BbjqRCe3Tqx3LijB0FS/EOiA0NniWDQPeVw
 Oxxb9hFh581eKann9MP+ImqliJhTKzGyrWGDwdvBsw0X78Km7FhvrLMLVL9vpHjEkYCn4UmTmRq
 Cw+Dop11NNllXW0RkEEVQheDlPVVXgWCsvy2RcUS0
X-Gm-Gg: AeBDiesvg8rjnmCPqze46+pz3DpF+7LqukpSQwywZe9DxwhVezBxem+cagPDC/NCc+k
 P1HipTw9QwczQgbC41cSQDQ8y7tXJLeMmuKxZ0UeQ9zTJ6s+TfhUSBP1O7SELgG7eLa7oomXfAK
 lHt+PB3+gEECFBwX8aeYAeIbXw9gI51ELJWInZyEfqNjWD1M4QOQf3+E0Nhlje3y3gm/Xh/0PkL
 RRCK+dMOwavWf7JNd/5/KZJzGMAJANTLi7e7a2pJv4ykI809+jA9D8BseFpSNliUYTa5EHhN2GH
 WMDbmrsbFJofCQe6t9RoWemXOSpNWNBh29HzAKQw0V9Jc+4Sp+ODJG4if5msnGMrgF19s5jHC+K
 xHp1oiMg2+Q4eyaRIV+C31Ck4Xb8=
X-Received: by 2002:a17:907:a316:b0:bae:72e6:fef7 with SMTP id
 a640c23a62f3a-bbac729bce6mr39339966b.42.1777505523874; Wed, 29 Apr 2026
 16:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
In-Reply-To: <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 29 Apr 2026 16:31:51 -0700
X-Gm-Features: AVHnY4KEnuoS0DyW_hHRadEVrELZydM3I2kZoUhneBo4jfNeCfi0VugMCBclTus
Message-ID: <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
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
Content-Type: multipart/alternative; boundary="00000000000057001e0650a1c193"
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

--00000000000057001e0650a1c193
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jason-JH for this patch and for providing the details on why the
additional Vblank wait was added based on the MTK HW architecture design.

Also thanks a lot @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> =
for all
your feedback and insight into how the fix can potentially be added in the
driver.

Here are a few thoughts and comments on this:
Jason, I see that MTK HW has a limitation where the correct CRC is only
available in a frame Vblank N +2, which would be hard to change since it
would need
a HW level change

 @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  are you referrin=
g to
checking if MTK make use of the has_valid_frame flag for the CRC calculated
in the driver so that
only correct frame will be used for grabbing the CRC no matter the latency
since IGT uses this function to grab the CRC:

/**


 * igt_pipe_crc_get_current:


 * @drm_fd: drm device fd for vblank counter


 * @pipe_crc: pipe CRC object


 * @vblank: frame counter value we're looking for


 * @crc: buffer pointer for the captured CRC value


 *


 * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been
captured

 * for frame @vblank.


 */


void


igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,


                           unsigned int vblank, igt_crc_t *crc)


{


        do {


                read_one_crc(pipe_crc, crc);





                /* Only works with valid frame counter */


                if (!crc->has_valid_frame) {


                        igt_pipe_crc_drain(pipe_crc);


                        igt_pipe_crc_get_single(pipe_crc, crc);


                        return;


                }


        } while (igt_vblank_before(crc->frame, vblank));





        crc_sanity_checks(pipe_crc, crc);


}

@Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  Could you please =
take a
look at Jason's proposed two approaches and provide your feedback
so that he can make the necessary changes if possible at the driver level?

Regards
Manasi


On Tue, Apr 14, 2026 at 10:12=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> On Tue, 2026-04-14 at 16:40 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Tue, Apr 14, 2026 at 03:11:21AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > > On Fri, 2026-04-10 at 13:25 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > > On Fri, Apr 10, 2026 at 06:07:31PM +0800, Jason-JH Lin wrote:
> > > > > Adapt rotation CRC tests for MTK devices by using Intel-like
> > > > > pipe
> > > > > CRC
> > > > > approach with explicit vblank synchronization.
> > > > > MTK devices require a vblank wait to ensure rotation completes
> > > > > before
> > > > > CRC capture.
> > > >
> > > > Instead of adding these checks all over igt I think you should
> > > > try to fix you kernel CRC implementation to not hand out garbage
> > > > CRCs.
> > > >
> > >
> > > The issue is fundamental to MTK's HW design where all HW
> > > configurations
> > > are applied by GCE (Global Command Engine) triggered by EOF signal.
> > >
> > > MTK HW Configuration Flow:
> > >
> > > igt_display_commit2(display, COMMIT_ATOMIC)
> > >             =E2=94=82
> > >             =E2=96=BC
> > >        atomic_commit()
> > >             =E2=94=82
> > >             =E2=96=BC
> > >        CMDQ submit
> > >             =E2=94=82
> > >             =E2=96=BC
> > >     Wait for next EOF signal =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> > >                                               =E2=94=82
> > >                                               =E2=96=BC
> > >                                   GCE applies HW config
> > >                                   (Rotation parameters, etc.)
> > >                                   during VBlanking period
> > >                                 & GCE reads HW CRC from HW register
> > >                                   into DRAM buffer
> > >                                               =E2=94=82
> > >                                               =E2=96=BC
> > >                                   Next Active Display Period
> > >                                   HW renders with new config
> > >                                               =E2=94=82
> > >                                               =E2=96=BC
> > >                                   EOF =E2=86=92 GCE reads HW CRC from
> > >                                     HW register into DRAM buffer
> > >                                               =E2=94=82
> > >                                               =E2=96=BC
> > >                                   VBlank+1 =E2=86=92 read CRC from DR=
AM
> > >                                            =E2=86=92
> > > drm_crtc_add_crc_entry() =E2=9C=85
> > >                                   (MTK always reports CRC at
> > > VBlank+1
> > >                                    after the EOF capture)
> > >
> > >
> > > This design is intentional to ensure all HW settings are fully
> > > applied
> > > within the VBlanking period, guaranteeing tearing-free display
> > > updates.
> > > At the EOF signal, GCE reads the HW CRC from the HW register into a
> > > DRAM buffer. Note that MTK always reports the CRC at VBlank+1 after
> > > the
> > > EOF capture, which means there is already an inherent one-frame
> > > delay
> > > before the CRC is reported to IGT via drm_crtc_add_crc_entry().
> > >
> > > IGT Expected Behavior (Intel/AMD):
> > >
> > >   igt_display_commit2(display, COMMIT_ATOMIC)
> > >             =E2=94=82
> > >             =E2=96=BC
> > >        atomic_commit()
> > >             =E2=94=82
> > >             =E2=96=BC
> > >         VBlank N =E2=94=80=E2=94=80=E2=96=BA HW config takes effect i=
mmediately =E2=9C=85
> > >             =E2=94=82
> > >             =E2=96=BC
> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA CRC captured with new confi=
g =E2=9C=85
> > >             =E2=94=82
> > >             =E2=96=BC
> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=96=BA
> > > igt_pipe_crc_get_current() =E2=9C=85
> > >
> > >
> > >
> > > MTK Actual Behavior:
> > >
> > >   igt_display_commit2(display, COMMIT_ATOMIC)
> > >             =E2=94=82
> > >             =E2=96=BC
> > >        atomic_commit()
> > >             =E2=94=82
> > >             =E2=96=BC
> > >        CMDQ submit
> > >             =E2=94=82
> > >             =E2=96=BC
> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA GCE applies new config
> > >                =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(old) from HW=
 register into DRAM
> > >             =E2=94=82
> > >       VBlanking N =E2=94=80=E2=94=80=E2=96=BA HW updated with new con=
fig (tearing-free =E2=9C=85)
> > >             =E2=94=82
> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=96=BA CRC(old) reported via
> > > drm_crtc_add_crc_entry()
> > >             =E2=94=82
> > >         EOF N+1 =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(new) from H=
W register into DRAM
> > >             =E2=94=82
> > >         VBlank N+2 =E2=94=80=E2=94=80=E2=96=BA CRC(new) reported via
> > > drm_crtc_add_crc_entry()
> > >             =E2=94=82
> > >             =E2=96=BC
> > >     igt_wait_for_vblank() is needed to ensure
> > >     igt_pipe_crc_get_current() captures the correct CRC =E2=9C=85
> > >
> > > As shown above, due to MTK's GCE-based HW architecture, there is an
> > > inherent multi-frame latency between igt_display_commit2() and the
> > > correct CRC being available. Unlike Intel/AMD where the new
> > > configuration takes effect immediately at the next VBlank, MTK
> > > requires
> > > at least 2 VBlanks after atomic_commit() before the correct CRC can
> > > be
> > > captured. Therefore, igt_wait_for_vblank() is necessary to ensure
> > > igt_pipe_crc_get_current() captures the correct CRC reflecting the
> > > new
> > > rotation configuration.
> > >
> > > Since this timing behavior is inherent to MTK's GCE-based HW
> > > architecture and cannot be eliminated at the kernel driver level,
> > > adding igt_wait_for_vblank() in IGT is the appropriate solution.
> >
> > It doesn't matter how long the latency is. The kernel should
> > accompany
> > each CRC with the correct frame number for which the CRC was
> > generated.
> > igt should have to do nothing but wait for the CRC with the correct
> > frame number to appear.
> >
>
> Hi Ville,
>
> Thank you for the clarification. I want to make sure I understand your
> expectation correctly.
>
> When you say "the kernel should accompany each CRC with the correct
> frame number," do you mean:
>
> **Option A: Accurate frame number reporting**
> - Kernel reports the exact frame number when CRC was captured
> - IGT can compare frame numbers to determine if CRC reflects new
> configuration
> - Requires hardware frame counter support (which MTK lacks)
>
> **Option B: Internal synchronization**
> - Kernel internally waits for configuration to take effect
> - Only reports CRC to userspace after it's guaranteed to reflect
> current config
> - IGT doesn't need to know about internal delays
>
> Or perhaps a different approach?
>
> The challenge with Option A is MTK hardware doesn't provide a frame
> counter register.
> Option B is feasible, but the latency is variable (1-2 vblanks) due
> to asynchronous CMDQ execution.
>
> Could you clarify which direction you'd prefer, or suggest an
> alternative?
>
> Thanks,
> Jason-JH Lin
>

--00000000000057001e0650a1c193
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhhbmtzIEphc29uLUpIIGZvciB0aGlzIHBh
dGNoIGFuZCBmb3IgcHJvdmlkaW5nIHRoZSBkZXRhaWxzIG9uIHdoeSB0aGUgYWRkaXRpb25hbCBW
Ymxhbmsgd2FpdCB3YXMgYWRkZWQgYmFzZWQgb24gdGhlIE1USyBIVyBhcmNoaXRlY3R1cmUgZGVz
aWduLjxkaXY+PGJyPjwvZGl2PjxkaXY+QWxzbyB0aGFua3MgYSBsb3TCoDxhIGNsYXNzPSJnbWFp
bF9wbHVzcmVwbHkiIGlkPSJnbWFpbC1wbHVzUmVwbHlDaGlwLTAiIGhyZWY9Im1haWx0bzp2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbSIgdGFiaW5kZXg9Ii0xIj5AVmlsbGUgU3lyasOkbMOk
PC9hPsKgZm9yIGFsbCB5b3VyIGZlZWRiYWNrIGFuZCBpbnNpZ2h0IGludG8gaG93IHRoZSBmaXgg
Y2FuIHBvdGVudGlhbGx5IGJlIGFkZGVkIGluIHRoZSBkcml2ZXIuPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5IZXJlIGFyZSBhIGZldyB0aG91Z2h0cyBhbmQgY29tbWVudHMgb24gdGhpczo8L2Rp
dj48ZGl2Pkphc29uLCBJIHNlZSB0aGF0IE1USyBIVyBoYXMgYSBsaW1pdGF0aW9uIHdoZXJlIHRo
ZSBjb3JyZWN0IENSQyBpcyBvbmx5IGF2YWlsYWJsZSBpbiBhIGZyYW1lIFZibGFuayBOwqArMiwg
d2hpY2ggd291bGQgYmUgaGFyZCB0byBjaGFuZ2Ugc2luY2UgaXQgd291bGQgbmVlZDwvZGl2Pjxk
aXY+YSBIVyBsZXZlbCBjaGFuZ2U8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgPGEgY2xhc3M9
ImdtYWlsX3BsdXNyZXBseSIgaWQ9ImdtYWlsLXBsdXNSZXBseUNoaXAtMiIgaHJlZj0ibWFpbHRv
OnZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tIiB0YWJpbmRleD0iLTEiPkBWaWxsZSBTeXJq
w6Rsw6Q8L2E+wqAgYXJlIHlvdSByZWZlcnJpbmcgdG8gY2hlY2tpbmcgaWYgTVRLIG1ha2UgdXNl
IG9mIHRoZSBoYXNfdmFsaWRfZnJhbWUgZmxhZyBmb3IgdGhlIENSQyBjYWxjdWxhdGVkIGluIHRo
ZSBkcml2ZXIgc28gdGhhdDwvZGl2PjxkaXY+b25seSBjb3JyZWN0IGZyYW1lIHdpbGwgYmUgdXNl
ZCBmb3IgZ3JhYmJpbmcgdGhlIENSQyBubyBtYXR0ZXIgdGhlIGxhdGVuY3kgc2luY2UgSUdUIHVz
ZXMgdGhpcyBmdW5jdGlvbiB0byBncmFiIHRoZSBDUkM6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj4vKiogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAq
IGlndF9waXBlX2NyY19nZXRfY3VycmVudDogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgKiBAZHJtX2ZkOiBkcm0gZGV2
aWNlIGZkIGZvciB2YmxhbmsgY291bnRlciDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCA8YnI+wqAqIEBwaXBlX2NyYzogcGlwZSBDUkMgb2JqZWN0IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgKiBA
dmJsYW5rOiBmcmFtZSBjb3VudGVyIHZhbHVlIHdlJiMzOTtyZSBsb29raW5nIGZvciDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCogQGNyYzogYnVmZmVyIHBvaW50ZXIgZm9y
IHRoZSBjYXB0dXJlZCBDUkMgdmFsdWUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJy
PsKgKiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAq
IFNhbWUgYXMgaWd0X3BpcGVfY3JjX2dldF9zaW5nbGUoKSwgYnV0IHdpbGwgd2FpdCB1bnRpbCBh
IENSQyBoYXMgYmVlbiBjYXB0dXJlZCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDxicj7CoCogZm9yIGZyYW1lIEB2YmxhbmsuIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKg
Ki8gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+dm9pZCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+aWd0X3BpcGVfY3Jj
X2dldF9mb3JfZnJhbWUoaW50IGRybV9mZCwgaWd0X3BpcGVfY3JjX3QgKnBpcGVfY3JjLCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25l
ZCBpbnQgdmJsYW5rLCBpZ3RfY3JjX3QgKmNyYykgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+eyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCBkbyB7
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCByZWFkX29uZV9jcmMocGlwZV9jcmMsIGNyYyk7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBPbmx5IHdvcmtzIHdpdGgg
dmFsaWQgZnJhbWUgY291bnRlciAqLyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZiAoIWNyYy0mZ3Q7aGFzX3ZhbGlkX2ZyYW1lKSB7IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBpZ3RfcGlwZV9jcmNfZHJhaW4ocGlwZV9jcmMpOyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfcGlw
ZV9jcmNfZ2V0X3NpbmdsZShwaXBlX2NyYywgY3JjKTsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuOyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgIH0gd2hpbGUg
KGlndF92YmxhbmtfYmVmb3JlKGNyYy0mZ3Q7ZnJhbWUsIHZibGFuaykpOyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqA8YnI+wqAgwqAgwqAgwqAgY3JjX3Nhbml0eV9jaGVja3MocGlwZV9jcmMsIGNyYyk7IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPn3CoCDCoMKgPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBjbGFzcz0iZ21haWxfcGx1c3JlcGx5IiBpZD0iZ21h
aWwtcGx1c1JlcGx5Q2hpcC0zIiBocmVmPSJtYWlsdG86dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20iIHRhYmluZGV4PSItMSI+QFZpbGxlIFN5cmrDpGzDpDwvYT7CoCBDb3VsZCB5b3UgcGxl
YXNlIHRha2UgYSBsb29rIGF0IEphc29uJiMzOTtzIHByb3Bvc2VkIHR3byBhcHByb2FjaGVzIGFu
ZCBwcm92aWRlIHlvdXIgZmVlZGJhY2s8L2Rpdj48ZGl2PnNvIHRoYXQgaGUgY2FuIG1ha2UgdGhl
IG5lY2Vzc2FyeSBjaGFuZ2VzIGlmIHBvc3NpYmxlIGF0IHRoZSBkcml2ZXIgbGV2ZWw/PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5SZWdhcmRzPC9kaXY+PGRpdj5NYW5hc2nCoDwvZGl2PjxkaXY+
PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9j
b250YWluZXIiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIEFwciAx
NCwgMjAyNiBhdCAxMDoxMuKAr1BNIEphc29uLUpIIExpbiAo5p6X552/56WlKSAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOkphc29uLUpILkxpbkBtZWRpYXRlay5jb20iPkphc29uLUpILkxpbkBtZWRpYXRl
ay5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIFR1ZSwgMjAyNi0wNC0xNCBh
dCAxNjo0MCArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOjxicj4NCiZndDsgT24gVHVlLCBB
cHIgMTQsIDIwMjYgYXQgMDM6MTE6MjFBTSArMDAwMCwgSmFzb24tSkggTGluICjmnpfnnb/npaUp
IHdyb3RlOjxicj4NCiZndDsgJmd0OyBPbiBGcmksIDIwMjYtMDQtMTAgYXQgMTM6MjUgKzAzMDAs
IFZpbGxlIFN5cmrDpGzDpCB3cm90ZTo8YnI+DQomZ3Q7ICZndDsgJmd0OyBPbiBGcmksIEFwciAx
MCwgMjAyNiBhdCAwNjowNzozMVBNICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6PGJyPg0KJmd0
OyAmZ3Q7ICZndDsgJmd0OyBBZGFwdCByb3RhdGlvbiBDUkMgdGVzdHMgZm9yIE1USyBkZXZpY2Vz
IGJ5IHVzaW5nIEludGVsLWxpa2U8YnI+DQomZ3Q7ICZndDsgJmd0OyAmZ3Q7IHBpcGU8YnI+DQom
Z3Q7ICZndDsgJmd0OyAmZ3Q7IENSQzxicj4NCiZndDsgJmd0OyAmZ3Q7ICZndDsgYXBwcm9hY2gg
d2l0aCBleHBsaWNpdCB2Ymxhbmsgc3luY2hyb25pemF0aW9uLjxicj4NCiZndDsgJmd0OyAmZ3Q7
ICZndDsgTVRLIGRldmljZXMgcmVxdWlyZSBhIHZibGFuayB3YWl0IHRvIGVuc3VyZSByb3RhdGlv
biBjb21wbGV0ZXM8YnI+DQomZ3Q7ICZndDsgJmd0OyAmZ3Q7IGJlZm9yZTxicj4NCiZndDsgJmd0
OyAmZ3Q7ICZndDsgQ1JDIGNhcHR1cmUuPGJyPg0KJmd0OyAmZ3Q7ICZndDsgPGJyPg0KJmd0OyAm
Z3Q7ICZndDsgSW5zdGVhZCBvZiBhZGRpbmcgdGhlc2UgY2hlY2tzIGFsbCBvdmVyIGlndCBJIHRo
aW5rIHlvdSBzaG91bGQ8YnI+DQomZ3Q7ICZndDsgJmd0OyB0cnkgdG8gZml4IHlvdSBrZXJuZWwg
Q1JDIGltcGxlbWVudGF0aW9uIHRvIG5vdCBoYW5kIG91dCBnYXJiYWdlPGJyPg0KJmd0OyAmZ3Q7
ICZndDsgQ1JDcy48YnI+DQomZ3Q7ICZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0
OyAmZ3Q7IFRoZSBpc3N1ZSBpcyBmdW5kYW1lbnRhbCB0byBNVEsmIzM5O3MgSFcgZGVzaWduIHdo
ZXJlIGFsbCBIVzxicj4NCiZndDsgJmd0OyBjb25maWd1cmF0aW9uczxicj4NCiZndDsgJmd0OyBh
cmUgYXBwbGllZCBieSBHQ0UgKEdsb2JhbCBDb21tYW5kIEVuZ2luZSkgdHJpZ2dlcmVkIGJ5IEVP
RiBzaWduYWwuPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyBNVEsgSFcgQ29uZmlndXJh
dGlvbiBGbG93Ojxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgaWd0X2Rpc3BsYXlfY29t
bWl0MihkaXNwbGF5LCBDT01NSVRfQVRPTUlDKTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvDxi
cj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqAgYXRvbWljX2NvbW1pdCgpPGJyPg0KJmd0OyAmZ3Q7
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoCBDTURRIHN1Ym1pdDxicj4N
CiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqAgV2FpdCBmb3IgbmV4
dCBFT0Ygc2lnbmFsIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUkDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDi
lrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdDRSBhcHBsaWVzIEhXIGNvbmZpZzxicj4NCiZn
dDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKFJvdGF0aW9uIHBhcmFtZXRlcnMsIGV0Yy4pPGJyPg0KJmd0OyAm
Z3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkdXJpbmcgVkJsYW5raW5nIHBlcmlvZDxicj4NCiZndDsgJmd0OyDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAmYW1wOyBHQ0UgcmVhZHMgSFcgQ1JDIGZyb20gSFcgcmVnaXN0ZXI8YnI+DQomZ3Q7ICZndDsg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGludG8gRFJBTSBidWZmZXI8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOZXh0IEFjdGl2ZSBE
aXNwbGF5IFBlcmlvZDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSFcgcmVuZGVycyB3aXRoIG5l
dyBjb25maWc8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8
PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFT0Yg4oaSIEdDRSByZWFkcyBIVyBDUkMgZnJvbTxi
cj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhXIHJlZ2lzdGVyIGludG8gRFJBTSBidWZmZXI8
YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4N
CiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0
OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBWQmxhbmsrMSDihpIgcmVhZCBDUkMgZnJvbSBEUkFNPGJyPg0KJmd0
OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDihpI8YnI+DQomZ3Q7ICZndDsgZHJt
X2NydGNfYWRkX2NyY19lbnRyeSgpIOKchTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKE1USyBh
bHdheXMgcmVwb3J0cyBDUkMgYXQ8YnI+DQomZ3Q7ICZndDsgVkJsYW5rKzE8YnI+DQomZ3Q7ICZn
dDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYWZ0ZXIgdGhlIEVPRiBjYXB0dXJlKTxicj4NCiZndDsgJmd0OyA8YnI+
DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IFRoaXMgZGVzaWduIGlzIGludGVudGlvbmFsIHRv
IGVuc3VyZSBhbGwgSFcgc2V0dGluZ3MgYXJlIGZ1bGx5PGJyPg0KJmd0OyAmZ3Q7IGFwcGxpZWQ8
YnI+DQomZ3Q7ICZndDsgd2l0aGluIHRoZSBWQmxhbmtpbmcgcGVyaW9kLCBndWFyYW50ZWVpbmcg
dGVhcmluZy1mcmVlIGRpc3BsYXk8YnI+DQomZ3Q7ICZndDsgdXBkYXRlcy48YnI+DQomZ3Q7ICZn
dDsgQXQgdGhlIEVPRiBzaWduYWwsIEdDRSByZWFkcyB0aGUgSFcgQ1JDIGZyb20gdGhlIEhXIHJl
Z2lzdGVyIGludG8gYTxicj4NCiZndDsgJmd0OyBEUkFNIGJ1ZmZlci4gTm90ZSB0aGF0IE1USyBh
bHdheXMgcmVwb3J0cyB0aGUgQ1JDIGF0IFZCbGFuaysxIGFmdGVyPGJyPg0KJmd0OyAmZ3Q7IHRo
ZTxicj4NCiZndDsgJmd0OyBFT0YgY2FwdHVyZSwgd2hpY2ggbWVhbnMgdGhlcmUgaXMgYWxyZWFk
eSBhbiBpbmhlcmVudCBvbmUtZnJhbWU8YnI+DQomZ3Q7ICZndDsgZGVsYXk8YnI+DQomZ3Q7ICZn
dDsgYmVmb3JlIHRoZSBDUkMgaXMgcmVwb3J0ZWQgdG8gSUdUIHZpYSBkcm1fY3J0Y19hZGRfY3Jj
X2VudHJ5KCkuPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyBJR1QgRXhwZWN0ZWQgQmVo
YXZpb3IgKEludGVsL0FNRCk6PGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyDCoCBpZ3Rf
ZGlzcGxheV9jb21taXQyKGRpc3BsYXksIENPTU1JVF9BVE9NSUMpPGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoCBhdG9taWNfY29tbWl0KCk8YnI+
DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqAgVkJs
YW5rIE4g4pSA4pSA4pa6IEhXIGNvbmZpZyB0YWtlcyBlZmZlY3QgaW1tZWRpYXRlbHkg4pyFPGJy
Pg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgIEVP
RiBOIOKUgOKUgOKWuiBDUkMgY2FwdHVyZWQgd2l0aCBuZXcgY29uZmlnIOKchTxicj4NCiZndDsg
Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoCBWQmxhbmsgTisx
IOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKWujxicj4NCiZndDsgJmd0OyBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQoKSDi
nIU8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyA8YnI+DQom
Z3Q7ICZndDsgTVRLIEFjdHVhbCBCZWhhdmlvcjo8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAm
Z3Q7IMKgIGlndF9kaXNwbGF5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk8YnI+DQom
Z3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgIGF0b21pY19j
b21taXQoKTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZn
dDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqDC
oMKgwqAgQ01EUSBzdWJtaXQ8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDi
lII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZn
dDsgwqDCoMKgwqDCoMKgwqAgRU9GIE4g4pSA4pSA4pa6IEdDRSBhcHBsaWVzIG5ldyBjb25maWc8
YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIDilIDilrogR0NF
IHJlYWRzIENSQyhvbGQpIGZyb20gSFcgcmVnaXN0ZXIgaW50byBEUkFNPGJyPg0KJmd0OyAmZ3Q7
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqAgVkJs
YW5raW5nIE4g4pSA4pSA4pa6IEhXIHVwZGF0ZWQgd2l0aCBuZXcgY29uZmlnICh0ZWFyaW5nLWZy
ZWUg4pyFKTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZn
dDsgJmd0OyDCoMKgwqDCoMKgwqDCoCBWQmxhbmsgTisxIOKUgOKUgOKWuiBDUkMob2xkKSByZXBv
cnRlZCB2aWE8YnI+DQomZ3Q7ICZndDsgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpPGJyPg0KJmd0
OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKg
wqDCoMKgIEVPRiBOKzEg4pSA4pSA4pa6IEdDRSByZWFkcyBDUkMobmV3KSBmcm9tIEhXIHJlZ2lz
dGVyIGludG8gRFJBTTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxi
cj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoCBWQmxhbmsgTisyIOKUgOKUgOKWuiBDUkMobmV3
KSByZXBvcnRlZCB2aWE8YnI+DQomZ3Q7ICZndDsgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpPGJy
Pg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoCBpZ3Rfd2FpdF9m
b3JfdmJsYW5rKCkgaXMgbmVlZGVkIHRvIGVuc3VyZTxicj4NCiZndDsgJmd0OyDCoMKgwqAgaWd0
X3BpcGVfY3JjX2dldF9jdXJyZW50KCkgY2FwdHVyZXMgdGhlIGNvcnJlY3QgQ1JDIOKchTxicj4N
CiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgQXMgc2hvd24gYWJvdmUsIGR1ZSB0byBNVEsmIzM5
O3MgR0NFLWJhc2VkIEhXIGFyY2hpdGVjdHVyZSwgdGhlcmUgaXMgYW48YnI+DQomZ3Q7ICZndDsg
aW5oZXJlbnQgbXVsdGktZnJhbWUgbGF0ZW5jeSBiZXR3ZWVuIGlndF9kaXNwbGF5X2NvbW1pdDIo
KSBhbmQgdGhlPGJyPg0KJmd0OyAmZ3Q7IGNvcnJlY3QgQ1JDIGJlaW5nIGF2YWlsYWJsZS4gVW5s
aWtlIEludGVsL0FNRCB3aGVyZSB0aGUgbmV3PGJyPg0KJmd0OyAmZ3Q7IGNvbmZpZ3VyYXRpb24g
dGFrZXMgZWZmZWN0IGltbWVkaWF0ZWx5IGF0IHRoZSBuZXh0IFZCbGFuaywgTVRLPGJyPg0KJmd0
OyAmZ3Q7IHJlcXVpcmVzPGJyPg0KJmd0OyAmZ3Q7IGF0IGxlYXN0IDIgVkJsYW5rcyBhZnRlciBh
dG9taWNfY29tbWl0KCkgYmVmb3JlIHRoZSBjb3JyZWN0IENSQyBjYW48YnI+DQomZ3Q7ICZndDsg
YmU8YnI+DQomZ3Q7ICZndDsgY2FwdHVyZWQuIFRoZXJlZm9yZSwgaWd0X3dhaXRfZm9yX3ZibGFu
aygpIGlzIG5lY2Vzc2FyeSB0byBlbnN1cmU8YnI+DQomZ3Q7ICZndDsgaWd0X3BpcGVfY3JjX2dl
dF9jdXJyZW50KCkgY2FwdHVyZXMgdGhlIGNvcnJlY3QgQ1JDIHJlZmxlY3RpbmcgdGhlPGJyPg0K
Jmd0OyAmZ3Q7IG5ldzxicj4NCiZndDsgJmd0OyByb3RhdGlvbiBjb25maWd1cmF0aW9uLjxicj4N
CiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgU2luY2UgdGhpcyB0aW1pbmcgYmVoYXZpb3IgaXMg
aW5oZXJlbnQgdG8gTVRLJiMzOTtzIEdDRS1iYXNlZCBIVzxicj4NCiZndDsgJmd0OyBhcmNoaXRl
Y3R1cmUgYW5kIGNhbm5vdCBiZSBlbGltaW5hdGVkIGF0IHRoZSBrZXJuZWwgZHJpdmVyIGxldmVs
LDxicj4NCiZndDsgJmd0OyBhZGRpbmcgaWd0X3dhaXRfZm9yX3ZibGFuaygpIGluIElHVCBpcyB0
aGUgYXBwcm9wcmlhdGUgc29sdXRpb24uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IEl0IGRvZXNuJiMz
OTt0IG1hdHRlciBob3cgbG9uZyB0aGUgbGF0ZW5jeSBpcy4gVGhlIGtlcm5lbCBzaG91bGQ8YnI+
DQomZ3Q7IGFjY29tcGFueTxicj4NCiZndDsgZWFjaCBDUkMgd2l0aCB0aGUgY29ycmVjdCBmcmFt
ZSBudW1iZXIgZm9yIHdoaWNoIHRoZSBDUkMgd2FzPGJyPg0KJmd0OyBnZW5lcmF0ZWQuPGJyPg0K
Jmd0OyBpZ3Qgc2hvdWxkIGhhdmUgdG8gZG8gbm90aGluZyBidXQgd2FpdCBmb3IgdGhlIENSQyB3
aXRoIHRoZSBjb3JyZWN0PGJyPg0KJmd0OyBmcmFtZSBudW1iZXIgdG8gYXBwZWFyLjxicj4NCiZn
dDsgPGJyPg0KPGJyPg0KSGkgVmlsbGUsPGJyPg0KPGJyPg0KVGhhbmsgeW91IGZvciB0aGUgY2xh
cmlmaWNhdGlvbi4gSSB3YW50IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgeW91cjxicj4NCmV4
cGVjdGF0aW9uIGNvcnJlY3RseS48YnI+DQo8YnI+DQpXaGVuIHlvdSBzYXkgJnF1b3Q7dGhlIGtl
cm5lbCBzaG91bGQgYWNjb21wYW55IGVhY2ggQ1JDIHdpdGggdGhlIGNvcnJlY3Q8YnI+DQpmcmFt
ZSBudW1iZXIsJnF1b3Q7IGRvIHlvdSBtZWFuOjxicj4NCjxicj4NCioqT3B0aW9uIEE6IEFjY3Vy
YXRlIGZyYW1lIG51bWJlciByZXBvcnRpbmcqKjxicj4NCi0gS2VybmVsIHJlcG9ydHMgdGhlIGV4
YWN0IGZyYW1lIG51bWJlciB3aGVuIENSQyB3YXMgY2FwdHVyZWQ8YnI+DQotIElHVCBjYW4gY29t
cGFyZSBmcmFtZSBudW1iZXJzIHRvIGRldGVybWluZSBpZiBDUkMgcmVmbGVjdHMgbmV3PGJyPg0K
Y29uZmlndXJhdGlvbjxicj4NCi0gUmVxdWlyZXMgaGFyZHdhcmUgZnJhbWUgY291bnRlciBzdXBw
b3J0ICh3aGljaCBNVEsgbGFja3MpPGJyPg0KPGJyPg0KKipPcHRpb24gQjogSW50ZXJuYWwgc3lu
Y2hyb25pemF0aW9uKio8YnI+DQotIEtlcm5lbCBpbnRlcm5hbGx5IHdhaXRzIGZvciBjb25maWd1
cmF0aW9uIHRvIHRha2UgZWZmZWN0PGJyPg0KLSBPbmx5IHJlcG9ydHMgQ1JDIHRvIHVzZXJzcGFj
ZSBhZnRlciBpdCYjMzk7cyBndWFyYW50ZWVkIHRvIHJlZmxlY3Q8YnI+DQpjdXJyZW50IGNvbmZp
Zzxicj4NCi0gSUdUIGRvZXNuJiMzOTt0IG5lZWQgdG8ga25vdyBhYm91dCBpbnRlcm5hbCBkZWxh
eXM8YnI+DQo8YnI+DQpPciBwZXJoYXBzIGEgZGlmZmVyZW50IGFwcHJvYWNoPzxicj4NCjxicj4N
ClRoZSBjaGFsbGVuZ2Ugd2l0aCBPcHRpb24gQSBpcyBNVEsgaGFyZHdhcmUgZG9lc24mIzM5O3Qg
cHJvdmlkZSBhIGZyYW1lwqA8YnI+DQpjb3VudGVyIHJlZ2lzdGVyLjxicj4NCk9wdGlvbiBCIGlz
IGZlYXNpYmxlLCBidXQgdGhlIGxhdGVuY3kgaXMgdmFyaWFibGUgKDEtMiB2YmxhbmtzKSBkdWU8
YnI+DQp0byBhc3luY2hyb25vdXMgQ01EUSBleGVjdXRpb24uPGJyPg0KPGJyPg0KQ291bGQgeW91
IGNsYXJpZnkgd2hpY2ggZGlyZWN0aW9uIHlvdSYjMzk7ZCBwcmVmZXIsIG9yIHN1Z2dlc3QgYW48
YnI+DQphbHRlcm5hdGl2ZT88YnI+DQo8YnI+DQpUaGFua3MsPGJyPg0KSmFzb24tSkggTGluPGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0K
--00000000000057001e0650a1c193--
