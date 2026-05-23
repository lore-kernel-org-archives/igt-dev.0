Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9D4CD5BB1
	for <igt-dev@archiver.kernel.org>; Sat, 23 May 2026 10:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D32710E039;
	Sat, 23 May 2026 10:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="okfabYlD";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566210E039
 for <igt-dev@lists.freedesktop.org>; Sat, 23 May 2026 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1779533274;
 bh=JKdmavq9tZq5tCE3jHzvg374LyoBLypFBDqFUHKVbmc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=okfabYlDwin+JzOx/4ylJqZ4nn02R/BF1yMDM95riK0sS9eDPyKv1gPQZMWBIPOyW
 De05+QDcqLUl90S1zgqM9tHulMh+xLncMg9vc25jZ8k0smWFlEW8LA3Xf8j8J7mQ8a
 RNmHAiXh78F03s6BY6HfOQOx5KOho74OZwyrd6VnncrcR+OhEZnuGfDasfwT29M8jg
 ozpe7zZVZ90itjrBfF0bpNnvAwFSGgpGTmrZy+ktmWF/w1RX0+mpkOtkw4z72a2yV9
 C+noFts/AaGeH+g6s72igxrVWVr80q+O557n5tlr5lWfCkUO1pM+CHq9Gg9ELoeeIL
 TD/JznweSfJ/A==
Received: from [100.64.0.241] (unknown [100.64.0.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5686917E02C2;
 Sat, 23 May 2026 12:47:54 +0200 (CEST)
Message-ID: <8689226b-3971-43fc-a57a-4a2b6710267e@collabora.com>
Date: Sat, 23 May 2026 13:47:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
To: Daniel Stone <daniel@fooishbar.org>, Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
References: <20260505194419.500600-5-dev@lankhorst.se>
 <CAPj87rNytB9RtK_k6xtm0tqz=+i_Yf-BEu9pA1ggPk-jLEh0=A@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rNytB9RtK_k6xtm0tqz=+i_Yf-BEu9pA1ggPk-jLEh0=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 5/22/26 10:54 PM, Daniel Stone wrote:
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

I originally used the USB-C DP AltMode on my ROCK 5B for the initial CRC tests
over the DisplayPort AUX channel, but it was always very unstable — the board
would frequently fail to detect the display or randomly reset due to various
USB-PD/TCPM issues. That was actually one of the main reasons I moved to
VKMS-based validation.

Unfortunately, USB-C DP appears to be completely broken on my setup at the
moment. It's on my TODO list since I'd like to upstream the CRC support, but it
may be a while before I can get it sorted out.

Regards,
Cristian
