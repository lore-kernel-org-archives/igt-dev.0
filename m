Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55490CD5BC0
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 07:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E593E10E02D;
	Mon, 25 May 2026 07:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="mqAG5VNV";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1D110E02D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779692998;
 bh=evWRlCNvN4iY5z6P+Paugdc+/B+BTwVRxDJe+xLjxH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mqAG5VNVq8/aW9mmacoWQv11IKFPZsos80rK1UkOKn0EQzfYbJ3wpPDI7nq0+QRAE
 Hb8EhDb0N9WPNvk954k04BZ9jUcEP5VlileS4Mpa+FEVIZ51dmdZVY2hSwQfGGzT2y
 1lA7qfKX9e0uUn77RAlZzPvFvfOx+gk050pv5jgWw+768gAhMN07V5/4gOEVOqepL+
 TcQwvWOUdzxmpsr1eWJvDwqQ5FD3C4p2VPTV2K1/7wrbKNizHugDvx7RtZkRznMIcS
 88WXV94FE1ZHCDLsUuhKzWNtNXEymeUoFE3UaOzarHLUSMkKrDoB7LHndWnqYQ6PSu
 XZU6ARmIxAR6A==
Message-ID: <762b131c-0ed1-400e-a63c-db4d1a8cbe41@lankhorst.se>
Date: Mon, 25 May 2026 09:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
To: Daniel Stone <daniel@fooishbar.org>
Cc: igt-dev@lists.freedesktop.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <CAPj87rNytB9RtK_k6xtm0tqz=+i_Yf-BEu9pA1ggPk-jLEh0=A@mail.gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <CAPj87rNytB9RtK_k6xtm0tqz=+i_Yf-BEu9pA1ggPk-jLEh0=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2026-05-22 kl. 21:54, skrev Daniel Stone:
> Hi Maarten,
> 
> On Tue, 5 May 2026 at 20:44, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> The background color is a 64-bits property that contains the ARGB values
>> of the background with 16 bits for each component.
>>
>> Add support for the BACKGROUND_COLOR property, and set to pitch black
>> as the default.
> 
> Did you see the previous attempt at
> https://lists.freedesktop.org/archives/igt-dev/2025-December/101222.html
> ? It unfortunately passed without review.
> 
> I think we should take whichever series is best, but it would be great
> if you could please look at the prior one to see if there's anything
> your series could gain from that, and equally Cristi if you could
> please check this one out on VOP2.

I checked, the test itself is similar in the big picture.
A few differences I noted:
- kms_crtc_background_color also checks a few more colors and creates a
  subtest for each color.
- kms_crtc_background_color should probably use igt_display_reset for cleanup.
- kms_crtc_background_color should use igt_crtc_has_prop() in the igt_require
- kms_color version sets the background color to something
  else while the plane is shown to ensure background is not
  visible.
- kms_color uses the definitions from drm_mode.h instead of
  defining them locally, so that's tested too.

So perhaps I can use the extra colors, perhaps we should test some values other
than 0xffff too, and perhaps use X2R10G10B10 if available. I intend not to
create a subtest as debug logs will be enough to determine the value of the
failing different color.

The changes I made here are a bit more generic as they will catch failures
when header definitions are updated incorrectly too.

I believe this version is slightly better, but both would work in theory.

Kind regards,
~Maarten Lankhorst
