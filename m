Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03B0C83F34
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4D810E0B7;
	Thu, 17 Jul 2025 18:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FINCSP0W";
	dkim-atps=neutral
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4330F10E0B7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:55:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 820CE444BC;
 Thu, 17 Jul 2025 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQU8C27MrgCgl/Jmu50Jj/g3ivsXjvksgM+vslTmqv4=;
 b=FINCSP0WxOAhQAp1+bbPmTFZh3/IjEt790py0C0ppi+Fprph5kjdHgP1mGIdzYIzDQlaVk
 3NZSUZrZjgQLScGneii/Ze3FQvdUw0cYA0/81qFRCl7ptEGfO7meza4Yk7fNEmATBwtp3T
 eJib6qzquy2DU5ia4c71p1N9uiN8cFzLKZznskbeaFWR5HqP1m/h3dlv7KFa+zVs8fEMY1
 jRfU3QFxxrEnREVfAkjNJ1Nb1TVTG+qycFv4NrdTMqf6XGD/nQLg5N8M5qe2MzKfWxYnXJ
 Jf+gOUE7dKAhSKpL8llwwGvqYjFTux5+76kWsFvwGTIKoFaEfT8/LtjWCHKX7g==
Message-ID: <3cc4fb67-dc57-41fe-8ed9-1321e8bf9d1d@bootlin.com>
Date: Thu, 17 Jul 2025 20:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 00/26] Unigraf integration
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, Mark Yacoub <markyacoub@google.com>,
 "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeegjeeguddtkefhfffggeduuedttefgueevgeetfedttdefveeufffgvefgveeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehighhtqdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkhigrtghouhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopehkhhgrlhgvu
 gdrrghlmhgrhhgrlhhlrgifhiesihhnthgvlhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

+CC Mark, Khaled

Sorry, I forgot to add you both in copy...

Le 17/07/2025 à 20:46, Louis Chauvet a écrit :
> Hi everyone,
> 
> I am excited to share I currently have access to a Unigraf device,
> which I believe could significantly enhance the capabilities within IGT.
> This device has the potential to enable testing of low-level hardware
> features that are currently not covered. Specifically, Unigraf devices can
> assist in testing link training, signal integrity, HDCP, DSC, and more.
> 
> It's important to note that the Unigraf SDK is not open-source, and the
> communication protocol with the device is proprietary. As a result, I have
> utilized the libTSI.so library, which can be downloaded from [1]. In this
> RFC, I have not used the official TSI_types.h header because it was
> incompatible with C, so I hardcoded some necessary values. The next
> iteration will use the official TSI_types.h (they plan to fix it for the
> next release).
> 
> This RFC is intentionally concise to gather initial feedback from the
> community regarding the integration of a proprietary device into the test
> suite. I plan to expand on this work by adding more features and pushing
> the developments upstream.
> 
> I have also started to work on MST testing (hotplug, link training,
> bandwith limitation), but I have a big issue: connector detection is very
> strange when changing MST configurat (MST->SST, sink count...).
> 
> If I use the Unigraf GUI or my own C script outside IGT, everything seems
> fine: `watch -n0 modetest -c` update connector status almost immediatly
> after a HDP pulse, never hang and always have the correct result.
> 
> But if I do the same in IGT (same script in igt_main), igt have too
> much/not all connectors, and some of them are broken (no EDID property
> for example). I tried to run `watch -n0 modetest -c` in parallel, but
> modetest can:
> - hang
> - only update once igt test is finished.
> 
> Do you have any hint about something I missed in IGT to properly enumerate
> connectors? I tried close/open the DRM device, added a lot of delay
> everywhere, emulate plug/unplug... I used kms_wait_for_new_connectors (in
> this series) and for_each_connected_output to get list the connectors.
> 
> Looking forward to your thoughts and suggestions!
> 
> Thanks,
> Louis Chauvet
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Changes in v2:
> - Splitted in many commits
> - Add CRC support
> - Link to v1: https://lore.kernel.org/r/20250517-unigraf-integration-v1-1-044acd2133dd@bootlin.com
> 
> ---
> Louis Chauvet (26):
>        lib/igt_kms: Add a detect timeout value
>        lib/igt_kms: Add helper to wait for a specific status on a connector
>        lib/igt_kms: Add function to list connected connectors
>        lib/igt_kms: Add helper to obtain a connector by its name or MST path
>        lib/igt_kms: Add helper to wait for new connectors
>        lib/monitor_edids: Add helper functions for using monitor_edid objects
>        lib/monitor_edids: Add helper to get an EDID by its name
>        lib/monitor_edids: Add helper to print all available EDID names
>        [DO NOT MERGE] lib/unigraf: Add used defines for TSI_Types
>        lib/unigraf: Add TSI.h
>        lib/unigraf: Initial Unigraf support
>        lib/igt_kms: Automatically connect unigraf on display require
>        lib/unigraf: Introduce device configuration
>        lib/unigraf: Introduce role configuration
>        lib/unigraf: Introduce input configuration
>        lib/unigraf: Add unigraf assert and deassert helpers
>        lib/unigraf: Add plug/unplug helpers
>        lib/unigraf: Allows sst/mst configuration
>        lib/unigraf: Add helpers to read and write edid
>        lib/unigraf: Add connector configuration
>        lib/unigraf: Add connector autodetection
>        lib/unigraf: Add edid configuration
>        tests/unigraf: Add basic unigraf tests
>        lib/unigraf: Add unigraf CRC grab
>        lib/unigraf: Add configuration for CRC usage
>        lib/igt_pipe_crc: Add ungiraf crc calculation
> 
>   lib/igt_core.c                           |   4 +
>   lib/igt_kms.c                            | 346 ++++++++++++++++++++
>   lib/igt_kms.h                            |  23 ++
>   lib/igt_pipe_crc.c                       |  22 ++
>   lib/meson.build                          |  10 +
>   lib/monitor_edids/dp_edids.h             |   3 +
>   lib/monitor_edids/hdmi_edids.h           |   3 +
>   lib/monitor_edids/monitor_edids_helper.c | 127 ++++++++
>   lib/monitor_edids/monitor_edids_helper.h |  10 +-
>   lib/unigraf/TSI.h                        | 227 +++++++++++++
>   lib/unigraf/TSI_types.h                  |  44 +++
>   lib/unigraf/unigraf.c                    | 530 +++++++++++++++++++++++++++++++
>   lib/unigraf/unigraf.h                    | 168 ++++++++++
>   meson.build                              |  14 +
>   tests/meson.build                        |   4 +
>   tests/unigraf/meson.build                |  12 +
>   tests/unigraf/unigraf_connectivity.c     | 126 ++++++++
>   17 files changed, 1672 insertions(+), 1 deletion(-)
> ---
> base-commit: b4e1ccd32037008012d5c41ac6bb04da22082302
> change-id: 20250425-unigraf-integration-11ed330755d5
> 
> Best regards,

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

