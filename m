Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F0CD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 12:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698B410E09D;
	Wed, 27 May 2026 12:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFNrAlzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1C210E09D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779886376; x=1811422376;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vYLMntF7ojRle21uDvmmuTcl5j0MXjpBTdTIe6ikQbQ=;
 b=GFNrAlzOy3JI+4duPsOje6uU5TAPoI9u2UglZt6aSK+8IEPkFVGTw4Br
 iutOC+0VE4Qzwv99K/6SRP2aN0KelZp6XK1SL26r32dnk+4uBH5HJgiDG
 MPz7VU02ByM7N7cqqC2UdctD3j36pImeZx+HunV1e47ZJ/w1A7UOKSQq9
 B90gfoke0BUqnv65C/2UD5JSgydCqQf0GgBZ7zG2AHjP70934xxPHdXMB
 5cNDY6HwFGuEvv8rrSH7HV0fj8jQAcdIyQjVt0umixgS7OLWOT85BwN77
 OHi5b73QTxcLN3iuMHq+3doWvI7ChrjHhrH2jr1NQIvARFzMHcQnIrcnu Q==;
X-CSE-ConnectionGUID: oFcFb3pZRIyGr17nkczovw==
X-CSE-MsgGUID: E3QF11S5SQmRfJGTql3yNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79748724"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="79748724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:52:55 -0700
X-CSE-ConnectionGUID: DAMM0n2LQZK3dxTL+a+RBw==
X-CSE-MsgGUID: Qj3lxwIgShWUzWobYECICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="235854496"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.38])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 05:52:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Manasi Navare <navaremanasi@google.com>, =?utf-8?B?SmFzb24tSkggTGlu?=
 =?utf-8?B?ICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, =?utf-8?B?U2luZ28gQ2hh?=
 =?utf-8?B?bmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn48=?=
 =?utf-8?B?6ZyWKQ==?=
 <Paul-pl.Chen@mediatek.com>, "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
In-Reply-To: <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
 <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
Date: Wed, 27 May 2026 15:52:48 +0300
Message-ID: <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 26 May 2026, Manasi Navare <navaremanasi@google.com> wrote:
> Hi @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> @Karthik B S
> <karthik.b.s@intel.com>  @Kurmi, Suresh Kumar <suresh.kumar.kurmi@intel.c=
om>
>  ,
>
> Could we get some feedback on this upstream discussion, Ville has suggest=
ed
> to use the frame counter instead of adding an extra Vblank wait.
> However since MTK hardware does not have a support for the frame counter,
> this patch adds an extra vblank wait before grabbing CRC only for MTK hw.
> We need this change to get the test passing on MTK HW and would
> appreciate your feedback and Intel's help
> in getting this landed.
>
> @Jason-JH Lin <jason-jh.lin@mediatek.com>  has provided the justification
> on why Ville's approach will not work for MTK HW.

Not sure why the driver couldn't do the vblank waits itself before
exposing the CRCs to the userspace. Maybe I'm missing something.

And that really makes it a non-upstream discussion, because the upstream
Mediatek driver doesn't have a CRC implementation.


BR,
Jani.


>
> Regards
> Manasi
>
> On Tue, May 5, 2026 at 3:27=E2=80=AFPM Manasi Navare <navaremanasi@google=
.com>
> wrote:
>
>> Hi @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> ,
>>
>> Quick ping here to provide your feedback on the two proposed options to
>> fix the MTK HW issue that requires an extra Vblank
>> before the CRC is available.
>>
>> Could you please take a look at the proposed approach so we can move
>> forward and have this test pass on MTK platform as well?
>> Thank you Ville for your thoughts in advance.
>>
>> Regards
>> Manasi
>>
>> On Wed, Apr 29, 2026 at 4:31=E2=80=AFPM Manasi Navare <navaremanasi@goog=
le.com>
>> wrote:
>>
>>> Thanks Jason-JH for this patch and for providing the details on why the
>>> additional Vblank wait was added based on the MTK HW architecture desig=
n.
>>>
>>> Also thanks a lot @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om> for all
>>> your feedback and insight into how the fix can potentially be added in =
the
>>> driver.
>>>
>>> Here are a few thoughts and comments on this:
>>> Jason, I see that MTK HW has a limitation where the correct CRC is only
>>> available in a frame Vblank N +2, which would be hard to change since it
>>> would need
>>> a HW level change
>>>
>>>  @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  are you refe=
rring to
>>> checking if MTK make use of the has_valid_frame flag for the CRC calcul=
ated
>>> in the driver so that
>>> only correct frame will be used for grabbing the CRC no matter the
>>> latency since IGT uses this function to grab the CRC:
>>>
>>> /**
>>>
>>>
>>>  * igt_pipe_crc_get_current:
>>>
>>>
>>>  * @drm_fd: drm device fd for vblank counter
>>>
>>>
>>>  * @pipe_crc: pipe CRC object
>>>
>>>
>>>  * @vblank: frame counter value we're looking for
>>>
>>>
>>>  * @crc: buffer pointer for the captured CRC value
>>>
>>>
>>>  *
>>>
>>>
>>>  * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been
>>> captured
>>>
>>>  * for frame @vblank.
>>>
>>>
>>>  */
>>>
>>>
>>> void
>>>
>>>
>>> igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
>>>
>>>
>>>                            unsigned int vblank, igt_crc_t *crc)
>>>
>>>
>>> {
>>>
>>>
>>>         do {
>>>
>>>
>>>                 read_one_crc(pipe_crc, crc);
>>>
>>>
>>>
>>>
>>>
>>>                 /* Only works with valid frame counter */
>>>
>>>
>>>                 if (!crc->has_valid_frame) {
>>>
>>>
>>>                         igt_pipe_crc_drain(pipe_crc);
>>>
>>>
>>>                         igt_pipe_crc_get_single(pipe_crc, crc);
>>>
>>>
>>>                         return;
>>>
>>>
>>>                 }
>>>
>>>
>>>         } while (igt_vblank_before(crc->frame, vblank));
>>>
>>>
>>>
>>>
>>>
>>>         crc_sanity_checks(pipe_crc, crc);
>>>
>>>
>>> }
>>>
>>> @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  Could you ple=
ase take a
>>> look at Jason's proposed two approaches and provide your feedback
>>> so that he can make the necessary changes if possible at the driver lev=
el?
>>>
>>> Regards
>>> Manasi
>>>
>>>
>>> On Tue, Apr 14, 2026 at 10:12=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) <
>>> Jason-JH.Lin@mediatek.com> wrote:
>>>
>>>> On Tue, 2026-04-14 at 16:40 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>>>> > On Tue, Apr 14, 2026 at 03:11:21AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
>>>> > > On Fri, 2026-04-10 at 13:25 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>>>> > > > On Fri, Apr 10, 2026 at 06:07:31PM +0800, Jason-JH Lin wrote:
>>>> > > > > Adapt rotation CRC tests for MTK devices by using Intel-like
>>>> > > > > pipe
>>>> > > > > CRC
>>>> > > > > approach with explicit vblank synchronization.
>>>> > > > > MTK devices require a vblank wait to ensure rotation completes
>>>> > > > > before
>>>> > > > > CRC capture.
>>>> > > >
>>>> > > > Instead of adding these checks all over igt I think you should
>>>> > > > try to fix you kernel CRC implementation to not hand out garbage
>>>> > > > CRCs.
>>>> > > >
>>>> > >
>>>> > > The issue is fundamental to MTK's HW design where all HW
>>>> > > configurations
>>>> > > are applied by GCE (Global Command Engine) triggered by EOF signal.
>>>> > >
>>>> > > MTK HW Configuration Flow:
>>>> > >
>>>> > > igt_display_commit2(display, COMMIT_ATOMIC)
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >        atomic_commit()
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >        CMDQ submit
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >     Wait for next EOF signal =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>>>> > >                                               =E2=94=82
>>>> > >                                               =E2=96=BC
>>>> > >                                   GCE applies HW config
>>>> > >                                   (Rotation parameters, etc.)
>>>> > >                                   during VBlanking period
>>>> > >                                 & GCE reads HW CRC from HW register
>>>> > >                                   into DRAM buffer
>>>> > >                                               =E2=94=82
>>>> > >                                               =E2=96=BC
>>>> > >                                   Next Active Display Period
>>>> > >                                   HW renders with new config
>>>> > >                                               =E2=94=82
>>>> > >                                               =E2=96=BC
>>>> > >                                   EOF =E2=86=92 GCE reads HW CRC f=
rom
>>>> > >                                     HW register into DRAM buffer
>>>> > >                                               =E2=94=82
>>>> > >                                               =E2=96=BC
>>>> > >                                   VBlank+1 =E2=86=92 read CRC from=
 DRAM
>>>> > >                                            =E2=86=92
>>>> > > drm_crtc_add_crc_entry() =E2=9C=85
>>>> > >                                   (MTK always reports CRC at
>>>> > > VBlank+1
>>>> > >                                    after the EOF capture)
>>>> > >
>>>> > >
>>>> > > This design is intentional to ensure all HW settings are fully
>>>> > > applied
>>>> > > within the VBlanking period, guaranteeing tearing-free display
>>>> > > updates.
>>>> > > At the EOF signal, GCE reads the HW CRC from the HW register into a
>>>> > > DRAM buffer. Note that MTK always reports the CRC at VBlank+1 after
>>>> > > the
>>>> > > EOF capture, which means there is already an inherent one-frame
>>>> > > delay
>>>> > > before the CRC is reported to IGT via drm_crtc_add_crc_entry().
>>>> > >
>>>> > > IGT Expected Behavior (Intel/AMD):
>>>> > >
>>>> > >   igt_display_commit2(display, COMMIT_ATOMIC)
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >        atomic_commit()
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >         VBlank N =E2=94=80=E2=94=80=E2=96=BA HW config takes effec=
t immediately =E2=9C=85
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA CRC captured with new co=
nfig =E2=9C=85
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=96=BA
>>>> > > igt_pipe_crc_get_current() =E2=9C=85
>>>> > >
>>>> > >
>>>> > >
>>>> > > MTK Actual Behavior:
>>>> > >
>>>> > >   igt_display_commit2(display, COMMIT_ATOMIC)
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >        atomic_commit()
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >        CMDQ submit
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA GCE applies new config
>>>> > >                =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(old) from=
 HW register into DRAM
>>>> > >             =E2=94=82
>>>> > >       VBlanking N =E2=94=80=E2=94=80=E2=96=BA HW updated with new =
config (tearing-free =E2=9C=85)
>>>> > >             =E2=94=82
>>>> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=96=BA CRC(old) reported v=
ia
>>>> > > drm_crtc_add_crc_entry()
>>>> > >             =E2=94=82
>>>> > >         EOF N+1 =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(new) fro=
m HW register into DRAM
>>>> > >             =E2=94=82
>>>> > >         VBlank N+2 =E2=94=80=E2=94=80=E2=96=BA CRC(new) reported v=
ia
>>>> > > drm_crtc_add_crc_entry()
>>>> > >             =E2=94=82
>>>> > >             =E2=96=BC
>>>> > >     igt_wait_for_vblank() is needed to ensure
>>>> > >     igt_pipe_crc_get_current() captures the correct CRC =E2=9C=85
>>>> > >
>>>> > > As shown above, due to MTK's GCE-based HW architecture, there is an
>>>> > > inherent multi-frame latency between igt_display_commit2() and the
>>>> > > correct CRC being available. Unlike Intel/AMD where the new
>>>> > > configuration takes effect immediately at the next VBlank, MTK
>>>> > > requires
>>>> > > at least 2 VBlanks after atomic_commit() before the correct CRC can
>>>> > > be
>>>> > > captured. Therefore, igt_wait_for_vblank() is necessary to ensure
>>>> > > igt_pipe_crc_get_current() captures the correct CRC reflecting the
>>>> > > new
>>>> > > rotation configuration.
>>>> > >
>>>> > > Since this timing behavior is inherent to MTK's GCE-based HW
>>>> > > architecture and cannot be eliminated at the kernel driver level,
>>>> > > adding igt_wait_for_vblank() in IGT is the appropriate solution.
>>>> >
>>>> > It doesn't matter how long the latency is. The kernel should
>>>> > accompany
>>>> > each CRC with the correct frame number for which the CRC was
>>>> > generated.
>>>> > igt should have to do nothing but wait for the CRC with the correct
>>>> > frame number to appear.
>>>> >
>>>>
>>>> Hi Ville,
>>>>
>>>> Thank you for the clarification. I want to make sure I understand your
>>>> expectation correctly.
>>>>
>>>> When you say "the kernel should accompany each CRC with the correct
>>>> frame number," do you mean:
>>>>
>>>> **Option A: Accurate frame number reporting**
>>>> - Kernel reports the exact frame number when CRC was captured
>>>> - IGT can compare frame numbers to determine if CRC reflects new
>>>> configuration
>>>> - Requires hardware frame counter support (which MTK lacks)
>>>>
>>>> **Option B: Internal synchronization**
>>>> - Kernel internally waits for configuration to take effect
>>>> - Only reports CRC to userspace after it's guaranteed to reflect
>>>> current config
>>>> - IGT doesn't need to know about internal delays
>>>>
>>>> Or perhaps a different approach?
>>>>
>>>> The challenge with Option A is MTK hardware doesn't provide a frame
>>>> counter register.
>>>> Option B is feasible, but the latency is variable (1-2 vblanks) due
>>>> to asynchronous CMDQ execution.
>>>>
>>>> Could you clarify which direction you'd prefer, or suggest an
>>>> alternative?
>>>>
>>>> Thanks,
>>>> Jason-JH Lin
>>>>
>>>

--=20
Jani Nikula, Intel
