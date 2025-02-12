Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1D4C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 08:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6F710E7ED;
	Wed, 12 Feb 2025 08:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHZJFQYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5C010E7ED
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739347794; x=1770883794;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t+vZ+v4s45NBCRxz3FKPcrDpCNHNevPO4gprObPqt10=;
 b=GHZJFQYdeZUxzKZJZs0teLUBJqb4+r0vxqus7kkZY1oceYFZnCzcUuTO
 YOVChy990ixKFT9PVxV+hROMvAbiqv2LnuTXhvxuhmehg111E5LiiYZxt
 uT5iykvDNMwsBCNviCiXlPnXFhwa1SjhmVauVYVzZHzllcgbF85kP8UWW
 iQdUkNoPiCwZmGljUESMm5kykMIzDIwg/UlDJpnaLe+yX1vNoR9G5xqF0
 KuIAzr6tnPIXluaYBnwAyXISEDzXkuY/VFNYIMv5CH8U+sDKZdcXtzpQy
 bnDCem9wF6VceH/aQ8dsPI6YJKZKxe4SOUXQi3CyiknvWYXalKlKnIWv8 A==;
X-CSE-ConnectionGUID: 48y55zebR/2sHLAEjCJbQw==
X-CSE-MsgGUID: mEqR047WRnevi4uNXWJJjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62458411"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="62458411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 00:09:54 -0800
X-CSE-ConnectionGUID: /Wdz6e5KRTGjjRcVGK49dw==
X-CSE-MsgGUID: +pvoJV+0SPW4S+UE1BrHuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="113407297"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.17.221])
 ([10.246.17.221])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 00:09:52 -0800
Message-ID: <0f9251f6-1e7e-4edc-b508-00906a8a84d0@linux.intel.com>
Date: Wed, 12 Feb 2025 09:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/4] lib/igt_sriov_device: Add helper to iterate
 over VFs in specified range
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250211162919.15076-1-lukasz.laguna@intel.com>
 <20250211162919.15076-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250211162919.15076-4-lukasz.laguna@intel.com>
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



On 2/11/2025 5:29 PM, Lukasz Laguna wrote:
> Helper allows to iterate over VFs within the specified range.
> 
> v2:
>   - fix macro (Marcin)
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/igt_sriov_device.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index de25a7d98..2b6acb6d7 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -86,6 +86,25 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
>   	     ++__vf_num)
>   #define for_each_sriov_num_vfs for_each_sriov_vf
>   
> +/**
> + * for_each_sriov_vf_in_range - Iterate over VFs in a specified range
> + * @__pf_fd: PF device file descriptor
> + * @__start: Starting VF number in the range
> + * @__end: Ending VF number in the range
> + * @__vf_num: Variable to store the random VF number
> + *
> + * For loop that iterates over VFs associated with given PF @__pf_fd,
> + * within the specified range [__start, __end]. The loop runs only if
> + * the range is valid.
> + */
> +#define for_each_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
> +	for (unsigned int __vf_num = __is_valid_range((__start), (__end), \
> +						      igt_sriov_get_total_vfs(__pf_fd)) ? \
> +						      (__start) : 0; \
> +	     __vf_num && __vf_num <= (__end); \
> +	     ++__vf_num)
> +#define for_each_sriov_num_vfs_in_range for_each_sriov_vf_in_range
> +

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   /**
>    * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
>    * @__pf_fd: PF device file descriptor

