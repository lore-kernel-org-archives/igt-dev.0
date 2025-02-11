Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F284CC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 11:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E49489264;
	Tue, 11 Feb 2025 11:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLLk+bcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A837489264
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739272997; x=1770808997;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZhD9UsGj89FJ7eGQkwJpJ2r5GhwV02/zJTzXoop48UE=;
 b=TLLk+bcTqNt5cc84F1mS1FfnYCJ+ZuwGQRM7ntfWLxqlTNGEktj958gB
 hAJvkIHTbUIGiCe4byYPesGF1BaPPP8pVwtV4LLiJFGlQ3VKgzq1DHjSl
 hHkS2qTNzOkVq00RqqwVQ4uH50w61hLq0heTCtHtbcAH1G95i1EbgKfPQ
 CG0lBqdI+nS9Qgr1ulS5ydY7ZtLaGRS8LLMelAftCOo45BNzVwskIwE6Z
 NwFfhpnkMYE3JJ/x6GxmBQNLLR6+0dbOt4+P6cZppOA9xLSZqmbFC+9qt
 K4D6M/w7WwU7vR0CcXCzv+HLH42y8fQ8TKPnQv73jUppYHtitAyOOPolg g==;
X-CSE-ConnectionGUID: QQY8whAERGO0q7UDeZXU4Q==
X-CSE-MsgGUID: xyujQ6urSmanJcXgLhShDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50112628"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50112628"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 03:23:08 -0800
X-CSE-ConnectionGUID: /KQYj/cmTFKrVoA0hGpq5A==
X-CSE-MsgGUID: /UCGRffdS3+xohFkmp9hZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="117567879"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.116.103])
 ([10.245.116.103])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 03:23:06 -0800
Message-ID: <2ca94e20-a777-414e-bb62-b511588ad7af@linux.intel.com>
Date: Tue, 11 Feb 2025 12:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/4] lib/igt_sriov_device: Add helper to iterate
 over VFs in specified range
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
 <20250207094031.15942-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250207094031.15942-4-lukasz.laguna@intel.com>
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



On 2/7/2025 10:40 AM, Lukasz Laguna wrote:
> Helper allows to iterate over VFs within the specified range.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/igt_sriov_device.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index de25a7d98..c12a8cf6c 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -86,6 +86,24 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
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
> +	for (unsigned int __vf_num = __start & \
> +		__is_valid_range(__start, __end, igt_sriov_get_total_vfs(__pf_fd)); \
> +	     __vf_num && __vf_num <= __end; \
> +	     ++__vf_num)
> +#define for_each_sriov_num_vfs_in_range for_each_sriov_vf_in_range
> +

Something is wrong, is the bitwise operator expected ?
Is this going to work:
  for_each_sriov_vf_in_range(pf_fd, 2, 7, vf) ?

Maybe

#define for_each_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
     for (unsigned int __vf_num = ((__is_valid_range((__start), (__end),
                                    igt_sriov_get_total_vfs(__pf_fd))) ?
                                      (__start) : 0); \
          __vf_num && __vf_num <= (__end); ++__vf_num)

--
marcin

>   /**
>    * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
>    * @__pf_fd: PF device file descriptor

