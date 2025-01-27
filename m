Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6D5C0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 09:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944410E4F2;
	Mon, 27 Jan 2025 09:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3xWAhbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4B10E4F9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737968809; x=1769504809;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iKd6ZCX/lmGPG8SizK5OCB3Nm2JlyxOiz/uTfHrD7l0=;
 b=I3xWAhbOu2DPeXb7RXHpwDQ3ornUr+hXFTvn8qQ0olNGHu1Pe5OGjjxg
 va5qegHpQKBYIXpQv7RYBre0aTvhCd84dHA7ppj9lIPFNufGi1wDA9OuL
 dTNVysmVFwux/5MuywbkRMpoK/RoZxct913KKa3XspKZuf+j06unOvvt/
 yvPPSn3k/Vj7uwBo2aXojdX5MmqPWi8fDjRwpAPcGebpuMmCy6jkPijof
 nMy5q9b7Idut29k1HGE5hbO27tzxAlM4NlcHnA5NJAmLFKVpVSzTl1nWh
 O2Hu5LGMGPIbf6/6FBBUTpD7tXKZKTjndjJR7L0CBtsv6Xqk8DykuqrOh w==;
X-CSE-ConnectionGUID: C1i9/VcIR+qE4uRVZczs7g==
X-CSE-MsgGUID: aB2Q6nZERQq14BtdIKKdPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="41261632"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="41261632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 01:06:49 -0800
X-CSE-ConnectionGUID: 4jqj4hQ8QoaIcsCPwMraWQ==
X-CSE-MsgGUID: v5dvQUrbTjK2tZXi2CI1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112403409"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2025 01:06:47 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 06C5828779;
 Mon, 27 Jan 2025 09:06:45 +0000 (GMT)
Message-ID: <aa0f8738-1db3-4880-95c7-ec4638a49a29@intel.com>
Date: Mon, 27 Jan 2025 10:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/4] lib/igt_sriov_device: Add helper to iterate
 over VFs from starting number
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, satyanarayana.k.v.p@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
 <20250124081039.31201-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250124081039.31201-4-lukasz.laguna@intel.com>
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



On 24.01.2025 09:10, Lukasz Laguna wrote:
> Helper allows to iterate over VFs associated with given PF, starting
> from a specified VF number.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/igt_sriov_device.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index de25a7d98..741b1bcec 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -86,6 +86,21 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
>  	     ++__vf_num)
>  #define for_each_sriov_num_vfs for_each_sriov_vf
>  
> +/**
> + * for_each_sriov_vf_starting_from - Iterate over VFs starting from a specified VF
> + * @__pf_fd: PF device file descriptor
> + * @__start: Starting VF number
> + * @__vf_num: VFs iterator
> + *
> + * For loop that iterates over VFs associated with given PF @__pf_fd,
> + * starting from a specified VF number @__start.
> + */
> +#define for_each_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \

nit: there is no need to use underscore for the macro params as all will
be expanded/replaced as-is

> +	for (unsigned int __vf_num = __start, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \

macro param "start" shall be wrapped in ( )

> +	     __vf_num <= __total_vfs; \
> +	     ++__vf_num)

macro param "vf_num" shall be wrapped in ( )

and there is a risk of param re-evaluation due to param reuse
maybe just add new local temp var for it?

> +#define for_each_sriov_num_vfs_starting_from for_each_sriov_vf_starting_from

why do we need another alias for this new macro?
if the original name is wrong then just use a better one ;)

> +
>  /**
>   * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
>   * @__pf_fd: PF device file descriptor

