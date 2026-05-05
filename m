Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352C8CD343B
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 22:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDCF10EC37;
	Tue,  5 May 2026 22:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="arZFnsWY";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A0A10E483
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 22:27:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ba545100a13so1039011066b.2
 for <igt-dev@lists.freedesktop.org>; Tue, 05 May 2026 15:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778020071; cv=none;
 d=google.com; s=arc-20240605;
 b=Sg+0mlIMreo5kxg/jqQZyX0FpttDfAXkxPtR9eI1o4++SkeZk9CrwOoyNxNLvj1d1g
 VJVEFbkI9ChnMTZFPcNyVcWoqYvPX7xUuxTiOBWhoa2inUGJbRjGtXuvZ9JKge/dMzuG
 HZpAqhLcQcmXb7YUBs+rmMQTUCpSBo0bqn576Ij/sEQbRBPzdMjVRyQ1OAFf743tYplJ
 EXImUpSJjmgThy/fCPfg6gHtpZmNqJx/QUlbYzBvEE/zzq5fHw/n/859sLJ4VbUz++l2
 yUOyCF6yj8Xvlkb0pwt7f6MEvwCm8t4eGxjEmvW1SaUUTFMqrTxraxX50oeHKZCT2P/5
 Y3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RyPoUxs8j89mXPKWGGEzoxAk/XKRgMwSbQ94y3+EEiE=;
 fh=/10SjZI6sG6Ab9z9zF0erjLxrsnOX0UnhpHSkUM6xyc=;
 b=XwNtzFfslTJTYCXQuxGlA6z9kfLiGJ62KmJz+dz2Oae+sArxHpDrU5oGV2z9umLP2s
 vYJDUyGXFiII1T5l1aEEVoyGGIombMQBH54bWg3eJlEINJ4utMl4cvUVJexbcXAP9wjc
 rq6+7WCMz9WJI0/Bvc5xk3rMgYH14+WSNWCL1yGPsZzfJlm0R56r6FhZgDp/+suG8dlz
 OFpc/m6rrnZbD3yEB602kKK690Kbwd8KgTVfv3Cz7to8U0ugq2L37c/OwLGe/yaTULci
 wPeuFlgqPeDf+moMrvuOcyZRzKtTsenfhqb2j+q2gIx77UM+kn/PzGj/O8pP4sP52MZv
 kbdg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1778020071; x=1778624871;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RyPoUxs8j89mXPKWGGEzoxAk/XKRgMwSbQ94y3+EEiE=;
 b=arZFnsWYFxASYFJrJBHnHc55vZXIseuuLcM/7YPkgTSRzgQWDv8QRAbyTWFi+PrBOF
 UQsHdfcI9DMLqOhX2DFULDBE9FNEie4RTEGSv8wZ06eILLfow8yxjjjEoPsj8l1vR6o4
 DXqznSpvUqfbqxbB7XfcOhsr2ysDlWbjoIxKqh9HNzWnhpRdTyeq3bxjmuQAMx6I8qHl
 f4lrf2DHxBO6uymBjeajXhdskE7cAQBxM/O80vsbCP87nKusyhz8J7JamyLAAkFPPGLD
 3NCM8AabwnQidd24WW0/Xt5ztzNmVzLduX7S+aN4UzZbgGKeGJFhu1TWJDZPgbQyN+rX
 39jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778020071; x=1778624871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyPoUxs8j89mXPKWGGEzoxAk/XKRgMwSbQ94y3+EEiE=;
 b=YD4eG7j+nqEFYabED5o+7WAV0/xz0f76QdrxUO0KOXl7IN/egrEYu7SQMrW/xxcBKo
 58k2rHPmU2SlP8sJ7TQUMItmbpkwdCoj2Dn5omoVumaJFl4UQamqQA5k5Pb0b8hGajsl
 VX9h6ZoJpO1EtoHlNGZsdji9fViA4yP4F48M6WzUh3so66IyStqzHfrI2M68b5EvWL4N
 +E5nXGgvcRmpn3/+75/weuZ4A7AqFgrVARcjRcLE/Lm71x3YLDjjh/LS6KbSE8QVRwyD
 4g7WP0iKoYN01BLhmP9tdWbxs9lN6wkt+cb9/biDnxUYhA01I3DZfcqNvRq0nDydxcqJ
 2Qhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eEcpKUU98qe/6gLgZdqQUeSXOKtBBxbs2oQLa5N33PpWOe/nrJ1Dafo14igjCkFf0+Cj/o4cf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbg41Cv66HpkFJix7KF7Lq2frxbfWcClWFcslF9fZlYsVDTjFS
 1/y5w3+FGjxXoMxfPR3L3sQFVLm6UJJWXuHw1KR7xdZYnwrLR/I99EoDtK0AFrBOKNc0Ti4xFHn
 fNq+Fc1OT/VR1DBwcOmCYpHjHn3Pet7ndo2dlFGNJ
X-Gm-Gg: AeBDietZlHnxW15C81kyW0teepzjkR0pIKJxDsN2sZC6Gr0QxtNYWkvCg0fxDE6kUHT
 HCOAh8sET73vp2pDuVCbe2aWmAnZ91oAfaNT5iUkvelwVhfZgiRf6uCK45UNvZfclzuX6y0zGRe
 fVUDyJCUpzP+3mYWxM+zHViW5I08WJ+KUJW6ptSZBdS/fyLy0W1qPEJekFLomqntQViugFVCphp
 DZzgQ/4j5MFR9GwltYIKOV2Kjw72iaa76FBqXBT9Ued9JR2BrF3HBAHzNHDkUN8Ud+9mFm9iusR
 VaOHv4S2Ci/WMMNc3y9HMIW92E3UhEeGQfbAlJkh1eoXH90+Au3WRFTQO8lRck8HjRXqJtDh/Hj
 qvcJgIWOhnpMEnA6ImQbtLS1URgU=
X-Received: by 2002:a17:907:848:b0:bc4:75be:62cf with SMTP id
 a640c23a62f3a-bc56d5197a2mr19403466b.33.1778020070183; Tue, 05 May 2026
 15:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
In-Reply-To: <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Tue, 5 May 2026 15:27:38 -0700
X-Gm-Features: AVHnY4Kb07wLUVNrXK6TqBHmlXGurAIRpTzD76gJZrpShjNZfcugHo2TJQKuSlw
Message-ID: <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000b0fc970651198ee0"
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

--000000000000b0fc970651198ee0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> ,

Quick ping here to provide your feedback on the two proposed options to fix
the MTK HW issue that requires an extra Vblank
before the CRC is available.

Could you please take a look at the proposed approach so we can move
forward and have this test pass on MTK platform as well?
Thank you Ville for your thoughts in advance.

Regards
Manasi

On Wed, Apr 29, 2026 at 4:31=E2=80=AFPM Manasi Navare <navaremanasi@google.=
com>
wrote:

> Thanks Jason-JH for this patch and for providing the details on why the
> additional Vblank wait was added based on the MTK HW architecture design.
>
> Also thanks a lot @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> for all
> your feedback and insight into how the fix can potentially be added in th=
e
> driver.
>
> Here are a few thoughts and comments on this:
> Jason, I see that MTK HW has a limitation where the correct CRC is only
> available in a frame Vblank N +2, which would be hard to change since it
> would need
> a HW level change
>
>  @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  are you referr=
ing to
> checking if MTK make use of the has_valid_frame flag for the CRC calculat=
ed
> in the driver so that
> only correct frame will be used for grabbing the CRC no matter the latenc=
y
> since IGT uses this function to grab the CRC:
>
> /**
>
>
>  * igt_pipe_crc_get_current:
>
>
>  * @drm_fd: drm device fd for vblank counter
>
>
>  * @pipe_crc: pipe CRC object
>
>
>  * @vblank: frame counter value we're looking for
>
>
>  * @crc: buffer pointer for the captured CRC value
>
>
>  *
>
>
>  * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been
> captured
>
>  * for frame @vblank.
>
>
>  */
>
>
> void
>
>
> igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
>
>
>                            unsigned int vblank, igt_crc_t *crc)
>
>
> {
>
>
>         do {
>
>
>                 read_one_crc(pipe_crc, crc);
>
>
>
>
>
>                 /* Only works with valid frame counter */
>
>
>                 if (!crc->has_valid_frame) {
>
>
>                         igt_pipe_crc_drain(pipe_crc);
>
>
>                         igt_pipe_crc_get_single(pipe_crc, crc);
>
>
>                         return;
>
>
>                 }
>
>
>         } while (igt_vblank_before(crc->frame, vblank));
>
>
>
>
>
>         crc_sanity_checks(pipe_crc, crc);
>
>
> }
>
> @Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>  Could you pleas=
e take a
> look at Jason's proposed two approaches and provide your feedback
> so that he can make the necessary changes if possible at the driver level=
?
>
> Regards
> Manasi
>
>
> On Tue, Apr 14, 2026 at 10:12=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) <
> Jason-JH.Lin@mediatek.com> wrote:
>
>> On Tue, 2026-04-14 at 16:40 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > On Tue, Apr 14, 2026 at 03:11:21AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
>> > > On Fri, 2026-04-10 at 13:25 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > > > On Fri, Apr 10, 2026 at 06:07:31PM +0800, Jason-JH Lin wrote:
>> > > > > Adapt rotation CRC tests for MTK devices by using Intel-like
>> > > > > pipe
>> > > > > CRC
>> > > > > approach with explicit vblank synchronization.
>> > > > > MTK devices require a vblank wait to ensure rotation completes
>> > > > > before
>> > > > > CRC capture.
>> > > >
>> > > > Instead of adding these checks all over igt I think you should
>> > > > try to fix you kernel CRC implementation to not hand out garbage
>> > > > CRCs.
>> > > >
>> > >
>> > > The issue is fundamental to MTK's HW design where all HW
>> > > configurations
>> > > are applied by GCE (Global Command Engine) triggered by EOF signal.
>> > >
>> > > MTK HW Configuration Flow:
>> > >
>> > > igt_display_commit2(display, COMMIT_ATOMIC)
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >        atomic_commit()
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >        CMDQ submit
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >     Wait for next EOF signal =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>> > >                                               =E2=94=82
>> > >                                               =E2=96=BC
>> > >                                   GCE applies HW config
>> > >                                   (Rotation parameters, etc.)
>> > >                                   during VBlanking period
>> > >                                 & GCE reads HW CRC from HW register
>> > >                                   into DRAM buffer
>> > >                                               =E2=94=82
>> > >                                               =E2=96=BC
>> > >                                   Next Active Display Period
>> > >                                   HW renders with new config
>> > >                                               =E2=94=82
>> > >                                               =E2=96=BC
>> > >                                   EOF =E2=86=92 GCE reads HW CRC fro=
m
>> > >                                     HW register into DRAM buffer
>> > >                                               =E2=94=82
>> > >                                               =E2=96=BC
>> > >                                   VBlank+1 =E2=86=92 read CRC from D=
RAM
>> > >                                            =E2=86=92
>> > > drm_crtc_add_crc_entry() =E2=9C=85
>> > >                                   (MTK always reports CRC at
>> > > VBlank+1
>> > >                                    after the EOF capture)
>> > >
>> > >
>> > > This design is intentional to ensure all HW settings are fully
>> > > applied
>> > > within the VBlanking period, guaranteeing tearing-free display
>> > > updates.
>> > > At the EOF signal, GCE reads the HW CRC from the HW register into a
>> > > DRAM buffer. Note that MTK always reports the CRC at VBlank+1 after
>> > > the
>> > > EOF capture, which means there is already an inherent one-frame
>> > > delay
>> > > before the CRC is reported to IGT via drm_crtc_add_crc_entry().
>> > >
>> > > IGT Expected Behavior (Intel/AMD):
>> > >
>> > >   igt_display_commit2(display, COMMIT_ATOMIC)
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >        atomic_commit()
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >         VBlank N =E2=94=80=E2=94=80=E2=96=BA HW config takes effect =
immediately =E2=9C=85
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA CRC captured with new conf=
ig =E2=9C=85
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=96=BA
>> > > igt_pipe_crc_get_current() =E2=9C=85
>> > >
>> > >
>> > >
>> > > MTK Actual Behavior:
>> > >
>> > >   igt_display_commit2(display, COMMIT_ATOMIC)
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >        atomic_commit()
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >        CMDQ submit
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >         EOF N =E2=94=80=E2=94=80=E2=96=BA GCE applies new config
>> > >                =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(old) from H=
W register into DRAM
>> > >             =E2=94=82
>> > >       VBlanking N =E2=94=80=E2=94=80=E2=96=BA HW updated with new co=
nfig (tearing-free =E2=9C=85)
>> > >             =E2=94=82
>> > >         VBlank N+1 =E2=94=80=E2=94=80=E2=96=BA CRC(old) reported via
>> > > drm_crtc_add_crc_entry()
>> > >             =E2=94=82
>> > >         EOF N+1 =E2=94=80=E2=94=80=E2=96=BA GCE reads CRC(new) from =
HW register into DRAM
>> > >             =E2=94=82
>> > >         VBlank N+2 =E2=94=80=E2=94=80=E2=96=BA CRC(new) reported via
>> > > drm_crtc_add_crc_entry()
>> > >             =E2=94=82
>> > >             =E2=96=BC
>> > >     igt_wait_for_vblank() is needed to ensure
>> > >     igt_pipe_crc_get_current() captures the correct CRC =E2=9C=85
>> > >
>> > > As shown above, due to MTK's GCE-based HW architecture, there is an
>> > > inherent multi-frame latency between igt_display_commit2() and the
>> > > correct CRC being available. Unlike Intel/AMD where the new
>> > > configuration takes effect immediately at the next VBlank, MTK
>> > > requires
>> > > at least 2 VBlanks after atomic_commit() before the correct CRC can
>> > > be
>> > > captured. Therefore, igt_wait_for_vblank() is necessary to ensure
>> > > igt_pipe_crc_get_current() captures the correct CRC reflecting the
>> > > new
>> > > rotation configuration.
>> > >
>> > > Since this timing behavior is inherent to MTK's GCE-based HW
>> > > architecture and cannot be eliminated at the kernel driver level,
>> > > adding igt_wait_for_vblank() in IGT is the appropriate solution.
>> >
>> > It doesn't matter how long the latency is. The kernel should
>> > accompany
>> > each CRC with the correct frame number for which the CRC was
>> > generated.
>> > igt should have to do nothing but wait for the CRC with the correct
>> > frame number to appear.
>> >
>>
>> Hi Ville,
>>
>> Thank you for the clarification. I want to make sure I understand your
>> expectation correctly.
>>
>> When you say "the kernel should accompany each CRC with the correct
>> frame number," do you mean:
>>
>> **Option A: Accurate frame number reporting**
>> - Kernel reports the exact frame number when CRC was captured
>> - IGT can compare frame numbers to determine if CRC reflects new
>> configuration
>> - Requires hardware frame counter support (which MTK lacks)
>>
>> **Option B: Internal synchronization**
>> - Kernel internally waits for configuration to take effect
>> - Only reports CRC to userspace after it's guaranteed to reflect
>> current config
>> - IGT doesn't need to know about internal delays
>>
>> Or perhaps a different approach?
>>
>> The challenge with Option A is MTK hardware doesn't provide a frame
>> counter register.
>> Option B is feasible, but the latency is variable (1-2 vblanks) due
>> to asynchronous CMDQ execution.
>>
>> Could you clarify which direction you'd prefer, or suggest an
>> alternative?
>>
>> Thanks,
>> Jason-JH Lin
>>
>

--000000000000b0fc970651198ee0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGnCoDxhIGNsYXNzPSJnbWFpbF9wbHVzcmVwbHkiIGlkPSJwbHVzUmVw
bHlDaGlwLTIiIGhyZWY9Im1haWx0bzp2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbSIgdGFi
aW5kZXg9Ii0xIj5AVmlsbGUgU3lyasOkbMOkPC9hPsKgLDxkaXY+PGJyPjwvZGl2PjxkaXY+UXVp
Y2sgcGluZyBoZXJlIHRvIHByb3ZpZGUgeW91ciBmZWVkYmFjayBvbiB0aGUgdHdvIHByb3Bvc2Vk
IG9wdGlvbnMgdG8gZml4IHRoZSBNVEsgSFcgaXNzdWUgdGhhdCByZXF1aXJlcyBhbiBleHRyYSBW
Ymxhbms8L2Rpdj48ZGl2PmJlZm9yZSB0aGUgQ1JDIGlzIGF2YWlsYWJsZS48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkNvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhlIHByb3Bvc2Vk
IGFwcHJvYWNoIHNvIHdlIGNhbiBtb3ZlIGZvcndhcmQgYW5kIGhhdmUgdGhpcyB0ZXN0IHBhc3Mg
b24gTVRLIHBsYXRmb3JtIGFzIHdlbGw/PC9kaXY+PGRpdj5UaGFuayB5b3UgVmlsbGUgZm9yIHlv
dXIgdGhvdWdodHMgaW4gYWR2YW5jZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHM8
L2Rpdj48ZGl2Pk1hbmFzaTwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBn
bWFpbF9xdW90ZV9jb250YWluZXIiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5P
biBXZWQsIEFwciAyOSwgMjAyNiBhdCA0OjMx4oCvUE0gTWFuYXNpIE5hdmFyZSAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOm5hdmFyZW1hbmFzaUBnb29nbGUuY29tIj5uYXZhcmVtYW5hc2lAZ29vZ2xlLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJn
YigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9
Imx0ciI+VGhhbmtzIEphc29uLUpIIGZvciB0aGlzIHBhdGNoIGFuZCBmb3IgcHJvdmlkaW5nIHRo
ZSBkZXRhaWxzIG9uIHdoeSB0aGUgYWRkaXRpb25hbCBWYmxhbmsgd2FpdCB3YXMgYWRkZWQgYmFz
ZWQgb24gdGhlIE1USyBIVyBhcmNoaXRlY3R1cmUgZGVzaWduLjxkaXY+PGJyPjwvZGl2PjxkaXY+
QWxzbyB0aGFua3MgYSBsb3TCoDxhIGNsYXNzPSJnbWFpbF9wbHVzcmVwbHkiIGlkPSJtXy0yMzU0
OTkzNjQzNjg5MTU5NjE3Z21haWwtcGx1c1JlcGx5Q2hpcC0wIiBocmVmPSJtYWlsdG86dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5AVmlsbGUgU3lyasOkbMOk
PC9hPsKgZm9yIGFsbCB5b3VyIGZlZWRiYWNrIGFuZCBpbnNpZ2h0IGludG8gaG93IHRoZSBmaXgg
Y2FuIHBvdGVudGlhbGx5IGJlIGFkZGVkIGluIHRoZSBkcml2ZXIuPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5IZXJlIGFyZSBhIGZldyB0aG91Z2h0cyBhbmQgY29tbWVudHMgb24gdGhpczo8L2Rp
dj48ZGl2Pkphc29uLCBJIHNlZSB0aGF0IE1USyBIVyBoYXMgYSBsaW1pdGF0aW9uIHdoZXJlIHRo
ZSBjb3JyZWN0IENSQyBpcyBvbmx5IGF2YWlsYWJsZSBpbiBhIGZyYW1lIFZibGFuayBOwqArMiwg
d2hpY2ggd291bGQgYmUgaGFyZCB0byBjaGFuZ2Ugc2luY2UgaXQgd291bGQgbmVlZDwvZGl2Pjxk
aXY+YSBIVyBsZXZlbCBjaGFuZ2U8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgPGEgY2xhc3M9
ImdtYWlsX3BsdXNyZXBseSIgaWQ9Im1fLTIzNTQ5OTM2NDM2ODkxNTk2MTdnbWFpbC1wbHVzUmVw
bHlDaGlwLTIiIGhyZWY9Im1haWx0bzp2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPkBWaWxsZSBTeXJqw6Rsw6Q8L2E+wqAgYXJlIHlvdSByZWZlcnJpbmcgdG8g
Y2hlY2tpbmcgaWYgTVRLIG1ha2UgdXNlIG9mIHRoZSBoYXNfdmFsaWRfZnJhbWUgZmxhZyBmb3Ig
dGhlIENSQyBjYWxjdWxhdGVkIGluIHRoZSBkcml2ZXIgc28gdGhhdDwvZGl2PjxkaXY+b25seSBj
b3JyZWN0IGZyYW1lIHdpbGwgYmUgdXNlZCBmb3IgZ3JhYmJpbmcgdGhlIENSQyBubyBtYXR0ZXIg
dGhlIGxhdGVuY3kgc2luY2UgSUdUIHVzZXMgdGhpcyBmdW5jdGlvbiB0byBncmFiIHRoZSBDUkM6
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4vKiogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAqIGlndF9waXBlX2NyY19nZXRfY3VycmVudDogwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
PGJyPsKgKiBAZHJtX2ZkOiBkcm0gZGV2aWNlIGZkIGZvciB2YmxhbmsgY291bnRlciDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAqIEBwaXBlX2NyYzogcGlwZSBD
UkMgb2JqZWN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgPGJyPsKgKiBAdmJsYW5rOiBmcmFtZSBjb3VudGVyIHZhbHVlIHdlJiMz
OTtyZSBsb29raW5nIGZvciDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCog
QGNyYzogYnVmZmVyIHBvaW50ZXIgZm9yIHRoZSBjYXB0dXJlZCBDUkMgdmFsdWUgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgKiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAqIFNhbWUgYXMgaWd0X3BpcGVfY3JjX2dldF9zaW5nbGUo
KSwgYnV0IHdpbGwgd2FpdCB1bnRpbCBhIENSQyBoYXMgYmVlbiBjYXB0dXJlZCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCogZm9yIGZyYW1lIEB2Ymxhbmsu
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgKi8gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+dm9pZCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCA8YnI+aWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoaW50IGRybV9mZCwgaWd0X3Bp
cGVfY3JjX3QgKnBpcGVfY3JjLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25lZCBpbnQgdmJsYW5rLCBpZ3RfY3JjX3QgKmNyYykgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8YnI+eyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDxicj7CoCDCoCDCoCDCoCBkbyB7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxi
cj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWFkX29uZV9jcmMocGlwZV9jcmMsIGNyYyk7IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAvKiBPbmx5IHdvcmtzIHdpdGggdmFsaWQgZnJhbWUgY291bnRlciAqLyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIWNyYy0mZ3Q7aGFzX3Zh
bGlkX2ZyYW1lKSB7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfcGlwZV9jcmNfZHJhaW4ocGlw
ZV9jcmMpOyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpZ3RfcGlwZV9jcmNfZ2V0X3NpbmdsZShwaXBlX2NyYywgY3JjKTsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJu
OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
PGJyPsKgIMKgIMKgIMKgIH0gd2hpbGUgKGlndF92YmxhbmtfYmVmb3JlKGNyYy0mZ3Q7ZnJhbWUs
IHZibGFuaykpOyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgY3JjX3Nhbml0eV9j
aGVja3MocGlwZV9jcmMsIGNyYyk7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPGJyPn3CoCDCoMKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBjbGFzcz0i
Z21haWxfcGx1c3JlcGx5IiBpZD0ibV8tMjM1NDk5MzY0MzY4OTE1OTYxN2dtYWlsLXBsdXNSZXBs
eUNoaXAtMyIgaHJlZj0ibWFpbHRvOnZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+QFZpbGxlIFN5cmrDpGzDpDwvYT7CoCBDb3VsZCB5b3UgcGxlYXNlIHRha2Ug
YSBsb29rIGF0IEphc29uJiMzOTtzIHByb3Bvc2VkIHR3byBhcHByb2FjaGVzIGFuZCBwcm92aWRl
IHlvdXIgZmVlZGJhY2s8L2Rpdj48ZGl2PnNvIHRoYXQgaGUgY2FuIG1ha2UgdGhlIG5lY2Vzc2Fy
eSBjaGFuZ2VzIGlmIHBvc3NpYmxlIGF0IHRoZSBkcml2ZXIgbGV2ZWw/PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5SZWdhcmRzPC9kaXY+PGRpdj5NYW5hc2nCoDwvZGl2PjxkaXY+PGJyPjwvZGl2
PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9
ImdtYWlsX2F0dHIiPk9uIFR1ZSwgQXByIDE0LCAyMDI2IGF0IDEwOjEy4oCvUE0gSmFzb24tSkgg
TGluICjmnpfnnb/npaUpICZsdDs8YSBocmVmPSJtYWlsdG86SmFzb24tSkguTGluQG1lZGlhdGVr
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPkphc29uLUpILkxpbkBtZWRpYXRlay5jb208L2E+Jmd0OyB3
cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIFR1ZSwgMjAyNi0wNC0xNCBhdCAxNjo0MCArMDMwMCwg
VmlsbGUgU3lyasOkbMOkIHdyb3RlOjxicj4NCiZndDsgT24gVHVlLCBBcHIgMTQsIDIwMjYgYXQg
MDM6MTE6MjFBTSArMDAwMCwgSmFzb24tSkggTGluICjmnpfnnb/npaUpIHdyb3RlOjxicj4NCiZn
dDsgJmd0OyBPbiBGcmksIDIwMjYtMDQtMTAgYXQgMTM6MjUgKzAzMDAsIFZpbGxlIFN5cmrDpGzD
pCB3cm90ZTo8YnI+DQomZ3Q7ICZndDsgJmd0OyBPbiBGcmksIEFwciAxMCwgMjAyNiBhdCAwNjow
NzozMVBNICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6PGJyPg0KJmd0OyAmZ3Q7ICZndDsgJmd0
OyBBZGFwdCByb3RhdGlvbiBDUkMgdGVzdHMgZm9yIE1USyBkZXZpY2VzIGJ5IHVzaW5nIEludGVs
LWxpa2U8YnI+DQomZ3Q7ICZndDsgJmd0OyAmZ3Q7IHBpcGU8YnI+DQomZ3Q7ICZndDsgJmd0OyAm
Z3Q7IENSQzxicj4NCiZndDsgJmd0OyAmZ3Q7ICZndDsgYXBwcm9hY2ggd2l0aCBleHBsaWNpdCB2
Ymxhbmsgc3luY2hyb25pemF0aW9uLjxicj4NCiZndDsgJmd0OyAmZ3Q7ICZndDsgTVRLIGRldmlj
ZXMgcmVxdWlyZSBhIHZibGFuayB3YWl0IHRvIGVuc3VyZSByb3RhdGlvbiBjb21wbGV0ZXM8YnI+
DQomZ3Q7ICZndDsgJmd0OyAmZ3Q7IGJlZm9yZTxicj4NCiZndDsgJmd0OyAmZ3Q7ICZndDsgQ1JD
IGNhcHR1cmUuPGJyPg0KJmd0OyAmZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7ICZndDsgSW5zdGVh
ZCBvZiBhZGRpbmcgdGhlc2UgY2hlY2tzIGFsbCBvdmVyIGlndCBJIHRoaW5rIHlvdSBzaG91bGQ8
YnI+DQomZ3Q7ICZndDsgJmd0OyB0cnkgdG8gZml4IHlvdSBrZXJuZWwgQ1JDIGltcGxlbWVudGF0
aW9uIHRvIG5vdCBoYW5kIG91dCBnYXJiYWdlPGJyPg0KJmd0OyAmZ3Q7ICZndDsgQ1JDcy48YnI+
DQomZ3Q7ICZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IFRoZSBpc3N1
ZSBpcyBmdW5kYW1lbnRhbCB0byBNVEsmIzM5O3MgSFcgZGVzaWduIHdoZXJlIGFsbCBIVzxicj4N
CiZndDsgJmd0OyBjb25maWd1cmF0aW9uczxicj4NCiZndDsgJmd0OyBhcmUgYXBwbGllZCBieSBH
Q0UgKEdsb2JhbCBDb21tYW5kIEVuZ2luZSkgdHJpZ2dlcmVkIGJ5IEVPRiBzaWduYWwuPGJyPg0K
Jmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyBNVEsgSFcgQ29uZmlndXJhdGlvbiBGbG93Ojxicj4N
CiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBD
T01NSVRfQVRPTUlDKTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxi
cj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDC
oMKgwqDCoMKgwqAgYXRvbWljX2NvbW1pdCgpPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJy
Pg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoCBDTURRIHN1Ym1pdDxicj4NCiZndDsgJmd0OyDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqAgV2FpdCBmb3IgbmV4dCBFT0Ygc2lnbmFsIOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkDxicj4N
CiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0
OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZn
dDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEdDRSBhcHBsaWVzIEhXIGNvbmZpZzxicj4NCiZndDsgJmd0OyDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKFJvdGF0aW9uIHBhcmFtZXRlcnMsIGV0Yy4pPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
dXJpbmcgVkJsYW5raW5nIHBlcmlvZDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYW1wOyBHQ0UgcmVh
ZHMgSFcgQ1JDIGZyb20gSFcgcmVnaXN0ZXI8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludG8g
RFJBTSBidWZmZXI8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOZXh0IEFjdGl2ZSBEaXNwbGF5IFBlcmlvZDxi
cj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSFcgcmVuZGVycyB3aXRoIG5ldyBjb25maWc8YnI+DQom
Z3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsg
Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBFT0Yg4oaSIEdDRSByZWFkcyBIVyBDUkMgZnJvbTxicj4NCiZndDsgJmd0OyDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEhXIHJlZ2lzdGVyIGludG8gRFJBTSBidWZmZXI8YnI+DQomZ3Q7ICZndDsg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBWQmxhbmsrMSDihpIgcmVhZCBDUkMgZnJvbSBEUkFNPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDihpI8YnI+DQomZ3Q7ICZndDsgZHJtX2NydGNfYWRkX2NyY19l
bnRyeSgpIOKchTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKE1USyBhbHdheXMgcmVwb3J0cyBD
UkMgYXQ8YnI+DQomZ3Q7ICZndDsgVkJsYW5rKzE8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YWZ0ZXIgdGhlIEVPRiBjYXB0dXJlKTxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgPGJy
Pg0KJmd0OyAmZ3Q7IFRoaXMgZGVzaWduIGlzIGludGVudGlvbmFsIHRvIGVuc3VyZSBhbGwgSFcg
c2V0dGluZ3MgYXJlIGZ1bGx5PGJyPg0KJmd0OyAmZ3Q7IGFwcGxpZWQ8YnI+DQomZ3Q7ICZndDsg
d2l0aGluIHRoZSBWQmxhbmtpbmcgcGVyaW9kLCBndWFyYW50ZWVpbmcgdGVhcmluZy1mcmVlIGRp
c3BsYXk8YnI+DQomZ3Q7ICZndDsgdXBkYXRlcy48YnI+DQomZ3Q7ICZndDsgQXQgdGhlIEVPRiBz
aWduYWwsIEdDRSByZWFkcyB0aGUgSFcgQ1JDIGZyb20gdGhlIEhXIHJlZ2lzdGVyIGludG8gYTxi
cj4NCiZndDsgJmd0OyBEUkFNIGJ1ZmZlci4gTm90ZSB0aGF0IE1USyBhbHdheXMgcmVwb3J0cyB0
aGUgQ1JDIGF0IFZCbGFuaysxIGFmdGVyPGJyPg0KJmd0OyAmZ3Q7IHRoZTxicj4NCiZndDsgJmd0
OyBFT0YgY2FwdHVyZSwgd2hpY2ggbWVhbnMgdGhlcmUgaXMgYWxyZWFkeSBhbiBpbmhlcmVudCBv
bmUtZnJhbWU8YnI+DQomZ3Q7ICZndDsgZGVsYXk8YnI+DQomZ3Q7ICZndDsgYmVmb3JlIHRoZSBD
UkMgaXMgcmVwb3J0ZWQgdG8gSUdUIHZpYSBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkuPGJyPg0K
Jmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyBJR1QgRXhwZWN0ZWQgQmVoYXZpb3IgKEludGVsL0FN
RCk6PGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyDCoCBpZ3RfZGlzcGxheV9jb21taXQy
KGRpc3BsYXksIENPTU1JVF9BVE9NSUMpPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8PGJyPg0K
Jmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoCBhdG9taWNfY29tbWl0KCk8YnI+DQomZ3Q7ICZndDsgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqAgVkJsYW5rIE4g4pSA4pSA4pa6
IEhXIGNvbmZpZyB0YWtlcyBlZmZlY3QgaW1tZWRpYXRlbHkg4pyFPGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgIEVPRiBOIOKUgOKUgOKWuiBD
UkMgY2FwdHVyZWQgd2l0aCBuZXcgY29uZmlnIOKchTxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKW
vDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoCBWQmxhbmsgTisxIOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKWujxi
cj4NCiZndDsgJmd0OyBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQoKSDinIU8YnI+DQomZ3Q7ICZn
dDsgPGJyPg0KJmd0OyAmZ3Q7IDxicj4NCiZndDsgJmd0OyA8YnI+DQomZ3Q7ICZndDsgTVRLIEFj
dHVhbCBCZWhhdmlvcjo8YnI+DQomZ3Q7ICZndDsgPGJyPg0KJmd0OyAmZ3Q7IMKgIGlndF9kaXNw
bGF5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk8YnI+DQomZ3Q7ICZndDsgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgIGF0b21pY19jb21taXQoKTxicj4NCiZn
dDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIOKWvDxicj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqAgQ01EUSBzdWJt
aXQ8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilII8YnI+DQomZ3Q7ICZn
dDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrw8YnI+DQomZ3Q7ICZndDsgwqDCoMKgwqDCoMKg
wqAgRU9GIE4g4pSA4pSA4pa6IEdDRSBhcHBsaWVzIG5ldyBjb25maWc8YnI+DQomZ3Q7ICZndDsg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIDilIDilrogR0NFIHJlYWRzIENSQyhvbGQp
IGZyb20gSFcgcmVnaXN0ZXIgaW50byBEUkFNPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqAgVkJsYW5raW5nIE4g4pSA4pSA
4pa6IEhXIHVwZGF0ZWQgd2l0aCBuZXcgY29uZmlnICh0ZWFyaW5nLWZyZWUg4pyFKTxicj4NCiZn
dDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDCoMKgwqDC
oMKgwqDCoCBWQmxhbmsgTisxIOKUgOKUgOKWuiBDUkMob2xkKSByZXBvcnRlZCB2aWE8YnI+DQom
Z3Q7ICZndDsgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgIEVPRiBOKzEg
4pSA4pSA4pa6IEdDRSByZWFkcyBDUkMobmV3KSBmcm9tIEhXIHJlZ2lzdGVyIGludG8gRFJBTTxi
cj4NCiZndDsgJmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgjxicj4NCiZndDsgJmd0OyDC
oMKgwqDCoMKgwqDCoCBWQmxhbmsgTisyIOKUgOKUgOKWuiBDUkMobmV3KSByZXBvcnRlZCB2aWE8
YnI+DQomZ3Q7ICZndDsgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpPGJyPg0KJmd0OyAmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCPGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAg4pa8PGJyPg0KJmd0OyAmZ3Q7IMKgwqDCoCBpZ3Rfd2FpdF9mb3JfdmJsYW5rKCkgaXMg
bmVlZGVkIHRvIGVuc3VyZTxicj4NCiZndDsgJmd0OyDCoMKgwqAgaWd0X3BpcGVfY3JjX2dldF9j
dXJyZW50KCkgY2FwdHVyZXMgdGhlIGNvcnJlY3QgQ1JDIOKchTxicj4NCiZndDsgJmd0OyA8YnI+
DQomZ3Q7ICZndDsgQXMgc2hvd24gYWJvdmUsIGR1ZSB0byBNVEsmIzM5O3MgR0NFLWJhc2VkIEhX
IGFyY2hpdGVjdHVyZSwgdGhlcmUgaXMgYW48YnI+DQomZ3Q7ICZndDsgaW5oZXJlbnQgbXVsdGkt
ZnJhbWUgbGF0ZW5jeSBiZXR3ZWVuIGlndF9kaXNwbGF5X2NvbW1pdDIoKSBhbmQgdGhlPGJyPg0K
Jmd0OyAmZ3Q7IGNvcnJlY3QgQ1JDIGJlaW5nIGF2YWlsYWJsZS4gVW5saWtlIEludGVsL0FNRCB3
aGVyZSB0aGUgbmV3PGJyPg0KJmd0OyAmZ3Q7IGNvbmZpZ3VyYXRpb24gdGFrZXMgZWZmZWN0IGlt
bWVkaWF0ZWx5IGF0IHRoZSBuZXh0IFZCbGFuaywgTVRLPGJyPg0KJmd0OyAmZ3Q7IHJlcXVpcmVz
PGJyPg0KJmd0OyAmZ3Q7IGF0IGxlYXN0IDIgVkJsYW5rcyBhZnRlciBhdG9taWNfY29tbWl0KCkg
YmVmb3JlIHRoZSBjb3JyZWN0IENSQyBjYW48YnI+DQomZ3Q7ICZndDsgYmU8YnI+DQomZ3Q7ICZn
dDsgY2FwdHVyZWQuIFRoZXJlZm9yZSwgaWd0X3dhaXRfZm9yX3ZibGFuaygpIGlzIG5lY2Vzc2Fy
eSB0byBlbnN1cmU8YnI+DQomZ3Q7ICZndDsgaWd0X3BpcGVfY3JjX2dldF9jdXJyZW50KCkgY2Fw
dHVyZXMgdGhlIGNvcnJlY3QgQ1JDIHJlZmxlY3RpbmcgdGhlPGJyPg0KJmd0OyAmZ3Q7IG5ldzxi
cj4NCiZndDsgJmd0OyByb3RhdGlvbiBjb25maWd1cmF0aW9uLjxicj4NCiZndDsgJmd0OyA8YnI+
DQomZ3Q7ICZndDsgU2luY2UgdGhpcyB0aW1pbmcgYmVoYXZpb3IgaXMgaW5oZXJlbnQgdG8gTVRL
JiMzOTtzIEdDRS1iYXNlZCBIVzxicj4NCiZndDsgJmd0OyBhcmNoaXRlY3R1cmUgYW5kIGNhbm5v
dCBiZSBlbGltaW5hdGVkIGF0IHRoZSBrZXJuZWwgZHJpdmVyIGxldmVsLDxicj4NCiZndDsgJmd0
OyBhZGRpbmcgaWd0X3dhaXRfZm9yX3ZibGFuaygpIGluIElHVCBpcyB0aGUgYXBwcm9wcmlhdGUg
c29sdXRpb24uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IEl0IGRvZXNuJiMzOTt0IG1hdHRlciBob3cg
bG9uZyB0aGUgbGF0ZW5jeSBpcy4gVGhlIGtlcm5lbCBzaG91bGQ8YnI+DQomZ3Q7IGFjY29tcGFu
eTxicj4NCiZndDsgZWFjaCBDUkMgd2l0aCB0aGUgY29ycmVjdCBmcmFtZSBudW1iZXIgZm9yIHdo
aWNoIHRoZSBDUkMgd2FzPGJyPg0KJmd0OyBnZW5lcmF0ZWQuPGJyPg0KJmd0OyBpZ3Qgc2hvdWxk
IGhhdmUgdG8gZG8gbm90aGluZyBidXQgd2FpdCBmb3IgdGhlIENSQyB3aXRoIHRoZSBjb3JyZWN0
PGJyPg0KJmd0OyBmcmFtZSBudW1iZXIgdG8gYXBwZWFyLjxicj4NCiZndDsgPGJyPg0KPGJyPg0K
SGkgVmlsbGUsPGJyPg0KPGJyPg0KVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gSSB3
YW50IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgeW91cjxicj4NCmV4cGVjdGF0aW9uIGNvcnJl
Y3RseS48YnI+DQo8YnI+DQpXaGVuIHlvdSBzYXkgJnF1b3Q7dGhlIGtlcm5lbCBzaG91bGQgYWNj
b21wYW55IGVhY2ggQ1JDIHdpdGggdGhlIGNvcnJlY3Q8YnI+DQpmcmFtZSBudW1iZXIsJnF1b3Q7
IGRvIHlvdSBtZWFuOjxicj4NCjxicj4NCioqT3B0aW9uIEE6IEFjY3VyYXRlIGZyYW1lIG51bWJl
ciByZXBvcnRpbmcqKjxicj4NCi0gS2VybmVsIHJlcG9ydHMgdGhlIGV4YWN0IGZyYW1lIG51bWJl
ciB3aGVuIENSQyB3YXMgY2FwdHVyZWQ8YnI+DQotIElHVCBjYW4gY29tcGFyZSBmcmFtZSBudW1i
ZXJzIHRvIGRldGVybWluZSBpZiBDUkMgcmVmbGVjdHMgbmV3PGJyPg0KY29uZmlndXJhdGlvbjxi
cj4NCi0gUmVxdWlyZXMgaGFyZHdhcmUgZnJhbWUgY291bnRlciBzdXBwb3J0ICh3aGljaCBNVEsg
bGFja3MpPGJyPg0KPGJyPg0KKipPcHRpb24gQjogSW50ZXJuYWwgc3luY2hyb25pemF0aW9uKio8
YnI+DQotIEtlcm5lbCBpbnRlcm5hbGx5IHdhaXRzIGZvciBjb25maWd1cmF0aW9uIHRvIHRha2Ug
ZWZmZWN0PGJyPg0KLSBPbmx5IHJlcG9ydHMgQ1JDIHRvIHVzZXJzcGFjZSBhZnRlciBpdCYjMzk7
cyBndWFyYW50ZWVkIHRvIHJlZmxlY3Q8YnI+DQpjdXJyZW50IGNvbmZpZzxicj4NCi0gSUdUIGRv
ZXNuJiMzOTt0IG5lZWQgdG8ga25vdyBhYm91dCBpbnRlcm5hbCBkZWxheXM8YnI+DQo8YnI+DQpP
ciBwZXJoYXBzIGEgZGlmZmVyZW50IGFwcHJvYWNoPzxicj4NCjxicj4NClRoZSBjaGFsbGVuZ2Ug
d2l0aCBPcHRpb24gQSBpcyBNVEsgaGFyZHdhcmUgZG9lc24mIzM5O3QgcHJvdmlkZSBhIGZyYW1l
wqA8YnI+DQpjb3VudGVyIHJlZ2lzdGVyLjxicj4NCk9wdGlvbiBCIGlzIGZlYXNpYmxlLCBidXQg
dGhlIGxhdGVuY3kgaXMgdmFyaWFibGUgKDEtMiB2YmxhbmtzKSBkdWU8YnI+DQp0byBhc3luY2hy
b25vdXMgQ01EUSBleGVjdXRpb24uPGJyPg0KPGJyPg0KQ291bGQgeW91IGNsYXJpZnkgd2hpY2gg
ZGlyZWN0aW9uIHlvdSYjMzk7ZCBwcmVmZXIsIG9yIHN1Z2dlc3QgYW48YnI+DQphbHRlcm5hdGl2
ZT88YnI+DQo8YnI+DQpUaGFua3MsPGJyPg0KSmFzb24tSkggTGluPGJyPg0KPC9ibG9ja3F1b3Rl
PjwvZGl2PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000b0fc970651198ee0--
