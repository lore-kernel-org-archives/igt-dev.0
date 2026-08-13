Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92592C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 11:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33110E051;
	Thu, 13 Aug 2026 11:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZLK/beO";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3A28902A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 11:07:28 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2cf452def93so7125965ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786619248; x=1787224048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=syv25zTXcLsOh9PR3GahytNYcXhfy+uUJQj+9jDI6NA=;
 b=BZLK/beOInUkFWs+RN6SfdMtYALA7f2wkw4CBEVMkQCU/HodKIXvtdqA6Crit7wLep
 Ba7AOovM/NbmTnGV2oGcJPl8YfIaAvDVsW3huCWFFjT5sXuVKBX8Sy5qDx2Cwro+Xcih
 vNLCcQiMedJFXOgU7InCAeMOcpf96XLAo2hR9YE33fXWtx2WzNneEawJer0vUTmZQ5hP
 caF4ohNHi06Nz4C/IDfOWgKkI28fNAG7yQBK48doeuv0O4kRZA+kOWFrv805ecE+c87P
 I5PsrG0DkkATomEqTrA1nsuL9aYbJVtAsj7XrsHv4cvKHinSzhV2beH3etRqQe3/x8zI
 +J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786619248; x=1787224048;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=syv25zTXcLsOh9PR3GahytNYcXhfy+uUJQj+9jDI6NA=;
 b=RNPhdAOnLtNwAjfo7pJkJwJqukjwtzl336ajTb7mtqrBtHSW/v6n1S/9f/EoRtKEx2
 8FJrDY3iLjiezEBaNWuSMzxRyJoER+hzqUk0YqGd/l1BEU2sqrN/wHF2gFPhrMjwWAP3
 r20ZFjW1jJW43F9dzKiYgjF05Dtr28Jm7U3uWWYDqGdj61eKs5fvMnsrS59cKkgsAYtV
 fvieUepkgUvHFmjkPNhtPmu8yxPgfVG+D68hFcPeqwWqeyH0Oy1qnvrxzagyW52jZech
 dJZ50IXF6josb0CWCyiHnkc0LNaKLngJ6TuYSzIeqiT1kVLUE1uYXjl7ZKWQIkC5ZS7r
 diQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoDnPRrIey1BxbM03Fwp5kMH2iJNis2jlcnK7JEBX/Y+It4Uu7oceleujoNrCiiAVH6b6iqCPym@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7OJa2WF6ZRkpiMvUAFn1HG6NfZQUfXGXnAE6N+rDakkBGMJvV
 iYu55L/6qjMWYk8bHHe6872ZWw0BrHmoIFCqS89vim+Au/KsdBAMAoRvm9GjzwK81aci7dEn
X-Gm-Gg: AR+sD13lgedKhOtbWdcVmUkbjo9v4ZVnU01Y3uoHB1X2b+zA61qZvA+zEsn6aKTDYaf
 0t4sRh+HJAKv7VL7JFgrwTNm/dke8rsGCNMHPcDYrLIzkDzlwuHmnA9teLACEUnkio+/SYhowqc
 KltRo/nkYtnSiFoCo1lZAyzZ8iqqoLIGVYbykKV1h9vGAa2MOsNvYwN847QX2PmTmDRL1r8cONy
 OikRp2oQtSvgxLjqrgD/QJphtbPK/xqUy29XxvbL6c6MVY+2XbkgUSfAYdAaxyPRj2DWT4fJCpU
 vuYAL84qNbnGjI7AT0H7xgjpHBwor7QjGxWvaTVw/p7Zb7rqlAfEhbw3/eURXUip497lMsmam1T
 PPzhMSNYFUH7+9X3LcnX1sdRHF0mONcKT5g58VFvjpj6vfQlAaCzZbn4HgzXgN6IYpCD7wo4All
 Z4vnRmgR8HyQ2AHipOf5G+g9M1NsSLkVaWumQ97ZRwd8kmeuT8o17uPko8AQhjSHNHMkzVOehPV
 5OAIR/JRrRlEuINqD7ytYgH3W3BNbPt0Khx
X-Received: by 2002:a17:902:d4c8:b0:2cf:b9f9:18bb with SMTP id
 d9443c01a7336-2d3804b012dmr26202705ad.4.1786619247517; 
 Thu, 13 Aug 2026 04:07:27 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d37c20001esm7885275ad.16.2026.08.13.04.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 04:07:26 -0700 (PDT)
Message-ID: <eeba8678-224a-4c9a-8e96-a0507faea016@gmail.com>
Date: Thu, 13 Aug 2026 14:07:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
To: Karthik B S <karthik.b.s@intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
Cc: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
 <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
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

Hi,

On 13/08/2026 06.37, Karthik B S wrote:
> Hi Jason-JH,
> 
> On 8/11/2026 9:44 PM, Jason-JH Lin wrote:
>> The capture_crc() function validated that the CRC frame sequence
>> returned by igt_pipe_crc_get_for_frame() matches the expected value.
>> However, igt_pipe_crc_get_for_frame() already guarantees
>> crc->frame >= expected via its internal loop:
>>
>>      do {
>>          read_one_crc(pipe_crc, crc);
>>      } while (igt_vblank_before(crc->frame, vblank));
> This isn't fully true IMHO. The capture CRC function actually ensured 
> the exact match of frame sequence and with this patch we're just 
> guaranteeing '>='.

as Karthik said; the claim it not true. What this change would do is 
relax the sequence check to be open ended .. while current check is 
making exact expectation. In other words, we _expect_ to see certain crc 
with correct vblank number, with the proposed change if expected crc 
never arrived in correct sequence we would be unaware of it.

Let's not do this.

> So we need more context here from: https://patchwork.freedesktop.org/ 
> series/168037/
>>
>> The additional check in capture_crc() is therefore redundant.
>> Remove it and rely on the library's existing guarantee.
>>
>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> ---
>>   tests/kms_plane.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 12dfbfe1d82b..fe8ee2ab26ab 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -765,11 +765,6 @@ static int num_unique_crcs(const igt_crc_t crc[], 
>> int num_crc)
>>   static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t 
>> *crc)
>>   {
>>       igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, 
>> crc);
> 
> Also if this is only igt_pipe_crc_get_for_frame now, ideally we can just 
> remove this function itself and call the helper directly. But before 
> doing that, as the existing assert was added by a patch from Ville and 
> rb'ed by JP, I'll request an ack from them or if they have any inputs on 
> this.
> 
> Regards,
> Karthik.B.S
>> -
>> -    igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
>> -              crc->has_valid_frame && crc->frame != vblank,
>> -              "Got CRC for the wrong frame (got %u, expected %u). CRC 
>> buffer overflow?\n",
>> -              crc->frame, vblank);
>>   }
>>   static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,

