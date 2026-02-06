Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3C4EB28CB
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 05:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652C310E390;
	Fri,  6 Feb 2026 05:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUpY4XH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F35410E34E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770357570; x=1801893570;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8dkc36bjhyayHVurQGonWUJPFJU7vdPs2sK57rgsI+Y=;
 b=GUpY4XH5H2KOh7p5CzdpcuvYfVTeVmzBt//1cgdLapQVUOGORJEVz5r9
 T2HYrNYgpC64bNg1pGLl9VKyq2B0Y3I5IhWndfhVuKQBAFf5tgDia9n0p
 2u3mzF0VxpkIUdQzTItUL/J1DlP+8k5WEYBhjSMO2hYcixK/yAT3Mky8y
 A2sYb2Ag3utAk8tBHkk9lWWFT3Bz5sfGmYuwjxbXsUaenPukYPl2DS+Hv
 5ODsl6AMWKSojOmDi5MONOrjVdC7QN7q8IP/lD7VIV5CwzNwcau4R5POW
 m5KqSh3/K3vE2O512NuiRgxMP502SyKdKGg7wOshGSln15xF4Dbci8ia9 w==;
X-CSE-ConnectionGUID: Mz580yc1SEmgXRjNFEc8pQ==
X-CSE-MsgGUID: k8QX/O4PQb6zEhmN1uOXaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="88987537"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="88987537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 21:59:30 -0800
X-CSE-ConnectionGUID: Zr8/WhJbSI6FACSkxqQYuQ==
X-CSE-MsgGUID: Cai5UVEZTNemJBJ1M42c1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="214942258"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.113.248])
 ([10.66.113.248])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 21:59:29 -0800
Message-ID: <89144a93-6330-4323-8905-5a3d4abd572f@intel.com>
Date: Fri, 6 Feb 2026 11:28:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,2/3] tests/intel/kms_psr2_sf: Check pipe and output
 validity for Selective Fetch test
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260205070425.300934-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260205070425.300934-3-jouni.hogander@intel.com>
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


On 05-02-2026 12:34, Jouni Högander wrote:
> There are some restrictions in pipe usage for PSR2/PR Selective
> Fetch. Implement helper to checks these restrictions and use it to figure
> out if pipe/PSR/PR combo in data_t is valid. Also check if used output
> supports PSR/PR.
>
> v3:
>    - use data->devid instead of intel_get_drm_devi
>    - changed IS_ALDERLAKE_S to !IS_ALDERLAKE_P
> v2: rebase and commit message updated
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
