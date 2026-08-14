Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CA7C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 10:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8810E0F4;
	Fri, 14 Aug 2026 10:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="msXuOYz+";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719310E0F4
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 10:57:33 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso9586505ad.2
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786705053; x=1787309853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cc2q3Ptepkmx7a80/4zuP4vRRm5QPOtdxQlyXuHv+bw=;
 b=msXuOYz+WHZw8jr1BVnwwSBcbxHz7gIRJqqufTqWMUD2hNRQeYuVYmue/AzvVJHbpz
 twpR4nxY1+DiBBdJdG4GZnOr7G0W7z3Az6yJp4lxxzIwiyzJeohiiUutHwFXo+LrbePP
 pqRvEvJgXWpgGAS3iVvIkVr3E5OJrvo8GTMFVVVVwULD2wkSXEhDrqvAOQ33sQE1EXzN
 97c2UDpOcK90h3vlM2EQu2+aZ+N9o707o7d06uaf/lapVCICJKA5aSGxR4F4Cgnf/Ezj
 ooj9I6oD6rVe0bFnkC/Pn14DRSfuoua7PzKYYyoUtniz1vq/I5isNwqDin8MZfr5S2z9
 Zz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786705053; x=1787309853;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cc2q3Ptepkmx7a80/4zuP4vRRm5QPOtdxQlyXuHv+bw=;
 b=lvN+C3ul7vNhSBmb3Dj0p0bNZsl8Kx4k+NGP4HUlWo/Chi7wd+HwIavSefuSesaHvv
 9s5qUJ+lwewvZNJ8LlqQ/9f3mBoGy+efxLhzWwvPO5sWm06FObFXPw7kwYWTZtvTy9s8
 ps4JxW6IimesJyVeB6LLJKnYovvgacfbJ144Dp4/XlTTE30unQHINzmaMw4N8A076HQ1
 GlsH0bhDO8b7+UV1galKSkty64eOoxWGt4j2xC+TIylEXUM04eBmiXM8jg4Tzoy/uePV
 /bBHViCUz/b4fPd5FCnUpwdBTm9Sd4MtDd6Qiy5AZU1hd/9jV+vYBI09CN0mhtS9Da22
 FsYg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrASxHMt+G0sgQAK8ffm+6osfqgW2NZmUdlmowxBj7CZvUOaByrwL7GC0vCzzHZPl3WbFcpjVwy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDGqVJxmrsJ42AVvsw4qZCXtsBGbfOGkjAKBeHybkBqocVYtlk
 QVVMwq66NWWTNKL1U9VLJRFnzu3DfVwqVWty27+HWgDNVATFMdc0etgu
X-Gm-Gg: AR+sD121bPZMD0jQOFUTpFU2+wqrq/QejR5lDx+9p89O/X016c4iZoXP4NVAd1NN3nD
 jbYQ/KJaN37cSiGLPyepRYHeK7un7PCk2juJpLmeDGumzAgk66/pjlYbK8GvLXNXNucUwq+MEV5
 G009VPHsLzvfDQGPcNl/kDlID+dOIpuUmqobeYBzzPKUkY2HLtaC2M6dPgCOqeobuDEt3ZcEDNT
 uoNLYx0yRTwGEpkt61u8hluHSjq+3aGvKe3pISIm11dHqWM18Y3rgSe2FM8Ct5H59urdafVoE1q
 fOm1nBaNVqlajyLqzKDptznSAzcbm2JysIrYcErD2KNCxNNtkhJN+PgphGiBoxMA7tgNypAvnVz
 ozvhbYzMc+HM8sWnVZg4gBwVpt5vyhXxERxH9iRDmqwcTQY1f+WSABphd0BJtB9hq3AVZtcEfWO
 282KN0KrEqzigutEchtwqhc/5aluetUhu8yinFivWnUrG+V8yqAr1bFwbmiaQWf00dRCkjdACF/
 LxQVPC0ZsB2vkGoasvuah8SnRe6lSO+DTIr
X-Received: by 2002:a17:903:360c:b0:2ca:b8fd:f31 with SMTP id
 d9443c01a7336-2d3b0d5e37amr53516785ad.15.1786705052761; 
 Fri, 14 Aug 2026 03:57:32 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3aeb2a085sm7828865ad.42.2026.08.14.03.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 03:57:32 -0700 (PDT)
Message-ID: <015adb96-fafd-4736-8d82-63a9f4aff579@gmail.com>
Date: Fri, 14 Aug 2026 13:57:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "fshao@chromium.org" <fshao@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
 <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
 <eeba8678-224a-4c9a-8e96-a0507faea016@gmail.com>
 <6ee0490b924a3e4ac37298069092fd955b8be58f.camel@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <6ee0490b924a3e4ac37298069092fd955b8be58f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Jason-JH,

On 14/08/2026 05.46, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2026-08-13 at 14:07 +0300, Juha-Pekka Heikkilä wrote:
>> 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>> 
>> 
>> Hi,
>> 
>> On 13/08/2026 06.37, Karthik B S wrote:
>> > Hi Jason-JH,
>> > 
>> > On 8/11/2026 9:44 PM, Jason-JH Lin wrote:
>> > > The capture_crc() function validated that the CRC frame sequence
>> > > returned by igt_pipe_crc_get_for_frame() matches the expected
>> > > value.
>> > > However, igt_pipe_crc_get_for_frame() already guarantees
>> > > crc->frame >= expected via its internal loop:
>> > > 
>> > >      do {
>> > >          read_one_crc(pipe_crc, crc);
>> > >      } while (igt_vblank_before(crc->frame, vblank));
>> > This isn't fully true IMHO. The capture CRC function actually
>> > ensured
>> > the exact match of frame sequence and with this patch we're just
>> > guaranteeing '>='.
>> 
>> as Karthik said; the claim it not true. What this change would do is
>> relax the sequence check to be open ended .. while current check is
>> making exact expectation. In other words, we _expect_ to see certain
>> crc
>> with correct vblank number, with the proposed change if expected crc
>> never arrived in correct sequence we would be unaware of it.
>> 
>> Let's not do this.
> 
> Hi JP,
> 
> Thanks for the review. Let me explain the background of this issue.
> 
> MediaTek CRC Internal Queue Mechanism:
> MediaTek's DRM driver uses a per-commit CRC queue rather than
> continuous frame-by-frame reporting. CRC entries are reported only
> after the hardware pipeline has stabilized (3 vblanks after commit),
> and the frame number reflects the vblank count at the time of CRC
> readout, not the original commit latch time.
> 
> For example, consider 4 consecutive flips:
> 
> Timeline:
>    Frame 100: Flip 0 latches → ev.sequence=100
>    Frame 101: Flip 1 latches → ev.sequence=101
>    Frame 102: Flip 2 latches → ev.sequence=102
>    Frame 103: Flip 3 latches → ev.sequence=103 (last flip)
> 
> Queue reports CRCs with 3-vblank delay:
>    Frame 103: Reports flip 0 CRC → frame=103
>    Frame 104: Reports flip 1 CRC → frame=104
>    Frame 105: Reports flip 2 CRC → frame=105
>    Frame 106: Reports flip 3 CRC → frame=106
> 
> PlaneTest expected vblanks:
>    vblank[0] = 101  (flip 1's ev.sequence, for flip 0's CRC)
>    vblank[1] = 102  (flip 2's ev.sequence, for flip 1's CRC)
>    vblank[2] = 103  (flip 3's ev.sequence, for flip 2's CRC)
>    vblank[3] = 103 + 1 = 104  (last frame)
> 
> capture_crc checks (== exact match):
>    flip 0: expected=101, got=103 → 103 != 101 → FAIL
>    flip 1: expected=102, got=104 → 104 != 102 → FAIL
>    flip 2: expected=103, got=105 → 105 != 103 → FAIL
>    flip 3: expected=104, got=106 → 106 != 104 → FAIL
> 
> Library behavior:
>    igt_pipe_crc_get_for_frame(expected=104) → returns CRC with frame=106
>    Since 106 >= 104, the library considers this valid and returns it.
> 
> The CRC value is correct (it corresponds to the right framebuffer
> content), but the frame number is larger than expected due to the
> queue processing delay. This is an inherent characteristic of hardware
> that batches CRC reporting, and does not indicate data corruption or
> buffer overflow.
> 

that's all MediaTek specific behavior. It doesn't change the fact that 
this check you are trying to remove is what catches wrong-frame crcs for 
every other driver too.

> 
> Consistency with other IGT tests and library contract
> 
> Looking at how other tests handle igt_pipe_crc_get_for_frame():
> 1. kms_rotation_crc also calls igt_pipe_crc_get_for_frame() but does
> NOT validate that crc.frame == expected. It only compares CRC values
> between software and hardware rotated frames (igt_assert_crc_equal).
> 2. kms_pipe_crc_basic (read-crc-frame-sequence subtest) validates that
> consecutive CRCs have frame + 1 == next_frame (relative increment),
> but does NOT validate absolute match against an expected vblank count.
> 3. The library API igt_pipe_crc_get_for_frame() is explicitly designed
> with >= semantics:
> do {
>      read_one_crc(pipe_crc, crc);
> } while (igt_vblank_before(crc->frame, vblank));
> Its contract is "return the first CRC at or after the requested frame."
> No other caller in IGT adds a stricter == check on top of this.
> 
> The capture_crc() exact-match check in kms_plane is the only place in
> the entire IGT codebase that imposes a stricter requirement than the
> library's own API contract. This makes it incompatible with drivers
> that use queued CRC reporting, while the actual CRC validation
> (comparing pixel content) remains correct.
> 
> Given that the library's API contract is >=, and no other caller
> enforces ==, what would be the preferred approach here?

The "no other test does ==" argument doesn't apply here either. Other 
tests don't reconstruct per-frame crc/vblank mapping the way this test 
does, so they don't need it. This one does.

Disable the check for MediaTek specifically if you don't want to care 
about this check (e.g. is_mtk_device() like other mtk workarounds 
already in this file), don't remove a correctness check that other 
drivers rely on.

/Juha-Pekka
