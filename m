Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756A7C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1371F10E17C;
	Wed, 12 Jun 2024 07:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVpe9G8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AE010E7AB
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718176690; x=1749712690;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=m5d/zglb0hOG25EiA8fZkR1w67kbMeGUDI8WLpCJhIc=;
 b=JVpe9G8TtS3T+oGJ0UzEc+f4h2ZhwDseff+dQmab56Tx+o/njLDJKSoj
 gvzo4yP6iSPLKlx0gSBybR/GFl3x2MP1T5sc9H1WRw5AQ1AW4VO65KL85
 XoiTmUA9/8kt+4aSWJH0hNB9HgyzWUBjoYXQRsIgpY7DRhNTCIu4eFzJj
 2SAHeiXC0w/YMPFYzFAiHhBM1VjgnhKJ7nooi/M8LaBlKdHCtnwBtquem
 EDDLPd9BB7hMfUIimWVCnvp6Px69jSxSVy/KBhAbgT3VKLvVPDMif8ebi
 ZnwKMfbOIXH9anNQm2pTUuM+4DTpqgMsWEcRyvH0pvAAkFqw6mQM0LRNb A==;
X-CSE-ConnectionGUID: hErxMSlMS6WOkmtLS1lHNw==
X-CSE-MsgGUID: g+UM7aEQQnyvOpG/yg2ixQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15154350"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15154350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:18:10 -0700
X-CSE-ConnectionGUID: 2GpJeHvcTyO0+mCSyjAvvA==
X-CSE-MsgGUID: x4/QT9L9SGymYvEJsCabVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="44259806"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:18:09 -0700
Message-ID: <0ee668ad-5a7d-4418-af8a-7371f0922096@intel.com>
Date: Wed, 12 Jun 2024 09:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 7/7] tests/core_hotunplug: Skip if no render
 available
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-8-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-8-kamil.konieczny@linux.intel.com>
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



On 07.06.2024 17:36, Kamil Konieczny wrote:
> All subtests uses render device for health checks so skip
> early if it is not present.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   tests/core_hotunplug.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 3b0135fc8..da3374123 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -737,6 +737,10 @@ igt_main
>   
>   		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
>   
> +		fd_drm = __drm_open_driver_render(priv.chipset);
> +		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
> +		igt_assert_eq(close_device(fd_drm, "", "selected render "), -1);
> +
>   		prepare(&priv);
>   	}
>   

