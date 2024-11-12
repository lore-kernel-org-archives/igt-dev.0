Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEC2D32D7C
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 09:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC310E59D;
	Tue, 12 Nov 2024 09:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VaEvkkPX";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16B10E59D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731404503;
 bh=JPfpiPu5/3spKmbu1oTSpvafxrL9VXTuYyMvnvuxk3A=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VaEvkkPXpOSRvfgCPFRixuaODseNXM5PjxBmbbIZvCv9Xc5000TgxyYsbPBJCkMn0
 Xs+InqcWscMoq0pPM8iyIKYQPRi5Kk2tsFm5M80s0EblTEuI/0vbSlP/4wh+Xp5681
 ehxV1UdfLYfVat4wmdqcPfkRDFOkaqGLYXGH4fTVf+tSJBoEynaX94r6qve8XvftT9
 4VN+EvT09bXb3lZlsbMBjHOqu35foDkp6aKOJXnYLNphvJY02MOGlBZIWXMdwCZluq
 ayzD/bGM315IedvCV3z+Qx3U6aNBlx4cvM1nmCzXJJLBVGC+EwgZukhWtYoCi/UzYn
 FgyfWPxrtxecw==
Received: from [192.168.50.250] (unknown [171.76.85.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AAA0917E1541;
 Tue, 12 Nov 2024 10:41:41 +0100 (CET)
Message-ID: <88b97a99-0077-41cc-93c5-37c145647885@collabora.com>
Date: Tue, 12 Nov 2024 15:11:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 0/5] tests/chamelium: Integrate the chamelium v3
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org, 
 ihf@google.com, markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com,
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com,
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Louis,

On 22/10/24 22:01, Louis Chauvet wrote:
> Hi all,
> 
> This patch series introduces a new wrapper for the Chameleon v3 board, a
> testing tool used primarily for Chromebooks, but also by community members
> to increase test coverage of graphic devices. The Chameleon v3 is an
> upgrade from its predecessor, with the ability to emulate 2 HDMI and 2
> DisplayPort devices, including MST devices.
> 
> The board can read and analyze any stream on the DisplayPort and HDMI
> cables, and even take captures, making it an ideal tool for testing
> hardware, driver, and user space behavior in specific situations, such as
> screen hotplugging and multiple MST screens. However, the changes between
> the v2 and v3, such as the addition of MST support and the removal of CRC
> for screen captures, would require significant modifications to the
> existing tests and wrappers.
> 
> To avoid this complexity and ensure that the Chameleon v3 is fully
> supported and the v2 is not broken, I wrote a new wrapper with
> simplicity and ease of use in mind. The Chameleon v3 wrapper should only
> manage the Chameleon itself, without the need for DRM displays, EDID
> caching/modifications, or state machines. This approach will make it
> easier for developers to use the Chameleon v3 and contribute to its
> development.
> 
> This series depends on:
> -https://lore.kernel.org/igt-dev/20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
> -https://lore.kernel.org/igt-dev/20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
> -https://lore.kernel.org/igt-dev/20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com

I have tested this series and the dependent patches,
https://gitlab.freedesktop.org/vigneshraman/igt-gpu-tools/-/commits/test-chamelium-v3-fix/?ref_type=heads

kms_chamelium_v3_basic test passes in drm-ci,
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/66445667


Regards,
Vignesh


> 
> In addition, I will send more series to:
> - add more methods to the chamelium wrapper
> - add new options in the configuration file to configure the chamelium
> - add tests for the cv3
> 
> ---
> Changes in v3:
> - Rebased and splitted the series
> - Fixed few build issues
> - Link to v2: https://lore.kernel.org/r/20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com
> 
> Changes in v2:
> - Mainly splitting and cleaning work since the RFC,
> - Link to v1: https://lore.kernel.org/r/20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com
> 
> ---
> Louis Chauvet (5):
>        lib/chamelium/v3: Introduce the foundation for the Chamelium v3 wrapper
>        lib/chamelium/v3: Introduce initialization and cleanup of Chamelium-related structures
>        lib/chamelium/v3: Add method to discover Chamelium ports
>        lib/chamelium/v3: Implement method to retrieve Chamelium port names
>        tests/chamelium/v3: Implement a basic Chamelium v3 accessibility test
> 
>   lib/chamelium/v3/igt_chamelium.c            | 309 ++++++++++++++++++++++++++++
>   lib/chamelium/v3/igt_chamelium.h            |  52 +++++
>   lib/igt_kms.c                               |   8 +
>   lib/meson.build                             |  12 +-
>   lib/tests/meson.build                       |   4 +
>   meson.build                                 |  15 +-
>   meson_options.txt                           |   4 +
>   tests/chamelium/v3/kms_chamelium_v3_basic.c |  30 +++
>   tests/meson.build                           |  26 +++
>   9 files changed, 458 insertions(+), 2 deletions(-)
> ---
> base-commit: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4
> change-id: 20240522-dev-remove-static-ports-9382ffbbf146
> prerequisite-message-id: 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
> prerequisite-patch-id: 0562bbe57a0b489e7f46a51717c54ea26296cb8c
> prerequisite-patch-id: a16d6fdd238eab5a91630d0934c9186669406fc7
> prerequisite-patch-id: c7fcc64d709f283da748a0f9bbe3bd6143d76300
> prerequisite-patch-id: 09fc5e2f569fa8287e767ceb353bc0a0f94ae2e1
> prerequisite-patch-id: 63cf2f6323333bb8cbd0dbbd883b5c9fe373dea1
> prerequisite-message-id: 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
> prerequisite-patch-id: 90ffdddeda6dd4cd2ae64e60fb31b0bbfee0250f
> prerequisite-patch-id: d62e9d4981a68ac6e71544ab2a3dfec37dfa3299
> prerequisite-patch-id: 3d898f58702cc303e18d3afc487e46f68641989b
> prerequisite-patch-id: 57f5446073d42a01c29e6ff8a24f6609eedb49a1
> prerequisite-patch-id: e6d6ee4ecd0e738a60091b19449c8622bb8bb6ae
> prerequisite-message-id: 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
> prerequisite-patch-id: 4ac6bf11d25e80e99d5607d4864c3c7b4273dde3
> prerequisite-patch-id: 2246b4289eca0b8e8b02519051af7564b0875a2a
> prerequisite-patch-id: 394057bc39308265a03e026ac924f88d3d933d49
> prerequisite-patch-id: ad1f0838e81fa620013313316afd35a3d5c146fa
> 
> Best regards,
