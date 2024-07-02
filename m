Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5501AC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 16:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107C210E052;
	Tue,  2 Jul 2024 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfebiLzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2957810E052
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719938104; x=1751474104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=on2NTY0FLw00bs2zAg2oBlqfU7FnLINOfNEKKOxFzn4=;
 b=WfebiLzs+TxQHYb2WnO4YyqHiCNnB/gD3AAp+g7MK7OzrW7aZD2U3bgm
 Ooidxy65wEOFOe5bU6gNN0+Z09uPj8nKhi1FS/M3wFjQC90i9NngbtA9G
 thQOccTWNQUo6jClJBy9CDnhZxk2emLwpiL5uT0osR/7cmBP2AcntpwvZ
 VDC/ohcz1Af+ci+c/eoVZmHL/ePnJEKcga6hSdp5Q0f0a2aYl7siPhqNF
 beWV/D7dg3WisSTh+xUuBVRInNdLZPBC68Vr+SQAXzhDK/4DdO2pU3OG5
 sPLJKh8hFgWLDI9E39U3J0jCtfGTYeE04Y7AI1Fm0LjCCycDCD6y+qG8+ g==;
X-CSE-ConnectionGUID: brCfS48bRXKfv7D4OktyGw==
X-CSE-MsgGUID: SmYFQUrKT5aNvJyepWld2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20027147"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="20027147"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:35:04 -0700
X-CSE-ConnectionGUID: 4bCEeHaWQ9aENyC0bWvNwQ==
X-CSE-MsgGUID: YTKD84LlSya31Ps+v4T+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="77120735"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:35:02 -0700
Date: Tue, 2 Jul 2024 18:34:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH i-g-t v1] docs/chamelium: update broken links
Message-ID: <20240702163459.n4rni4mua2ql6j45@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>
References: <20240701083756.417697-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240701083756.417697-1-vignesh.raman@collabora.com>
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

Hi Vignesh,
On 2024-07-01 at 14:07:56 +0530, Vignesh Raman wrote:
> The previous links to the chamelium documentation
> and setup instructions were no longer working.
> Update with new valid links.
> 
+cc
Cc: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Helen Koike <helen.koike@collabora.com>

> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/chamelium.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/chamelium.txt b/docs/chamelium.txt
> index f82c8b0c3..35a7a75ac 100644
> --- a/docs/chamelium.txt
> +++ b/docs/chamelium.txt
> @@ -47,13 +47,14 @@ Chamelium V2 Documentation
>  --------------------------
>  
>  Documentation about the Chamelium is made available by Google through the
> -ChromiumOS projet wiki: https://www.chromium.org/chromium-os/testing/chamelium
> +ChromiumOS projet wiki:
> +https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/
>  
>  Setting up Chamelium V2
>  -----------------------
>  
>  Instructions from the ChromiumOS wiki detail how to setup the Chamelium:
> -https://www.chromium.org/chromium-os/testing/chamelium#TOC-Setting-up-Chamelium
> +https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/#setting-up-chamelium
>  
>  The should be followed up until the "Setup your Linux host, DUT and the FPGA"
-- ^^^
s/The/It/

Regards,
Kamil

>  section. At this point, IGT has to be configured to connect to the Chamelium.
> -- 
> 2.40.1
> 
