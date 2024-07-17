Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79F7C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 10:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8934A10E0CD;
	Wed, 17 Jul 2024 10:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BxQ1EAr0";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EB310EA61
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721213933;
 bh=EdgVTC9mwn/uE7dO4pwg1gNZTdOh/OK4yKOhc1s2sok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BxQ1EAr0xrf6AzibLKy4aVpRo3G1BscNDFzxTRh4ObTxojbXhHwyt/hlemfpIOSm3
 eTic2F/wjPpV6e9t0g7ztbGmAY4AkWcIOeNhSof+3pPv6O44aEi2iXHF3LGmzubJ6P
 z7aGRS+Cjp80nVfMd1lJqULsmwJxh4aHe9ZrZkPT3n2wh0HufZfDeOL08txaXUoCbf
 Vegcnwjtc3ta7EQipDcJxJ0LahxCRQ8IzEjV6bQeOEyAjaMlE+Z+26ZmYlZlas8nf4
 fBtg1E7GXewy8FVfpK/Vp2mr+5ize79p1mtV0T+z3pbB2Fyw6AurTCEslbWVVxP5pv
 XFE4OMrjsL4NA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4FD9F3780BC9;
 Wed, 17 Jul 2024 10:58:51 +0000 (UTC)
Message-ID: <5a5b64bc-4aad-4f7a-a549-890a912ef03a@collabora.com>
Date: Wed, 17 Jul 2024 07:58:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] docs/chamelium: update broken links
To: Vignesh Raman <vignesh.raman@collabora.com>, igt-dev@lists.freedesktop.org
Cc: robdclark@gmail.com, robdclark@chromium.org, daniels@collabora.com,
 kamil.konieczny@linux.intel.com
References: <20240703015514.688088-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240703015514.688088-1-vignesh.raman@collabora.com>
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



On 02/07/2024 22:55, Vignesh Raman wrote:
> The previous links to the chamelium documentation
> and setup instructions were no longer working.
> Update with new valid links.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Daniel Stone <daniels@collabora.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

(in case this wans't applied already)

Reviewed-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>   docs/chamelium.txt | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/chamelium.txt b/docs/chamelium.txt
> index f82c8b0c3..64f851c28 100644
> --- a/docs/chamelium.txt
> +++ b/docs/chamelium.txt
> @@ -47,15 +47,16 @@ Chamelium V2 Documentation
>   --------------------------
>   
>   Documentation about the Chamelium is made available by Google through the
> -ChromiumOS projet wiki: https://www.chromium.org/chromium-os/testing/chamelium
> +ChromiumOS projet wiki:
> +https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/
>   
>   Setting up Chamelium V2
>   -----------------------
>   
>   Instructions from the ChromiumOS wiki detail how to setup the Chamelium:
> -https://www.chromium.org/chromium-os/testing/chamelium#TOC-Setting-up-Chamelium
> +https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/#setting-up-chamelium
>   
> -The should be followed up until the "Setup your Linux host, DUT and the FPGA"
> +It should be followed up until the "Setup your Linux host, DUT and the FPGA"
>   section. At this point, IGT has to be configured to connect to the Chamelium.
>   
>   It may be necessary to give the Chamelium a static IP address, depending on

