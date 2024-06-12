Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBD5C27C75
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A840610E17C;
	Wed, 12 Jun 2024 07:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DppBtP/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA35110E17C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718176629; x=1749712629;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=biKtbO/5jrO7AAd7uiN9EHsxsmBbKzB6B3x24W0ioGs=;
 b=DppBtP/YY+Gyu630H76VCPirGxLsvkox3xQEu77sPL3NAhIa/Ri5bB/+
 B4OXEWpTASgywSDOaUCRS/BAzNkn9Fjgoh7s5PB3F8Wo5UNjXWFxOmfVW
 YomK4VJajrAdrOr/BVLzWdY45gOBHz/MP9zJLTRe0I9SWJ+9ECHh1N2nR
 29R4McwvSKCq8oT2ZRN0dfBPa3g/CmJ5KIOltQZd/8kZzoi651hPvWOEw
 pGMyoqUjPNtXe74owDZbAXIulRyQQ07mpPsce1KPw7iUuiR+pTuoKa0+3
 UZ2VbR4mYyKoWHOtKQcRU6lFvXq5aEOHqR/5dlIY9MRuIu9a6OOQ3Wjpe A==;
X-CSE-ConnectionGUID: eOYp951HSrK9QJFhhL0R3Q==
X-CSE-MsgGUID: QUvzHyEWSfe5B/P2h3i5Kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32410426"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="32410426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:17:09 -0700
X-CSE-ConnectionGUID: RWf/ly71TLKe2iL3rSXZUQ==
X-CSE-MsgGUID: 2qPWJ0kHSdCL0KWkHQPCBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="40402077"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:17:07 -0700
Message-ID: <7a34f347-04ae-400e-82f4-3701a7e78c47@intel.com>
Date: Wed, 12 Jun 2024 09:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 6/7] tests/core_hotunplug: Fix device close
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-7-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-7-kamil.konieczny@linux.intel.com>
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



On 07.06.2024 17:36, Kamil Konieczny wrote:
> Use __drm_device_close for closing a drm device, as for Xe driver
> it needs to call additional function.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/core_hotunplug.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index ddf11bb00..3b0135fc8 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -146,7 +146,11 @@ static int close_device(int fd_drm, const char *when, const char *which)
>   		return fd_drm;
>   
>   	local_debug("%sclosing %sdevice instance\n", when, which);
> -	return local_close(fd_drm, "Device close failed");
> +	errno = 0;
> +	if (igt_warn_on_f(__drm_close_driver(fd_drm), "Device close failed\n"))
> +		return -errno;	/* (never -1) */
> +
> +	return -1;	/* success */

We have:
local_close
close_device
__drm_close_driver
drm_close_driver

Why do not put the code above into some of these and call here just:
         return proper_close_variant()

Up to you, could be separate patch.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   }
>   
>   static int close_sysfs(int fd_sysfs_dev)

