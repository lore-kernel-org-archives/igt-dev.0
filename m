Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08281EDEC13
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 06:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942CC10E5A1;
	Wed,  4 Mar 2026 06:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGXR5nMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C5E10E5A1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772604848; x=1804140848;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hgPTONMTlGF8EsGnzMzrRi66Q5tCX4443CbnLIvunoM=;
 b=oGXR5nMj6PTOqIYu7ZA9MwG/R63e9e48xHJ0MrUJY1eYnqNyKO6WTxeO
 oIHqmAoqi+ssAT1qDhH8eg/zn4UKtUH6VEvK+8LbYATSOvO8GeJiAQVYh
 TX0rpzeAUp5pvzziF+jN5u7l4DK5VykoJ56KZv2tT834FBnGBtvPzfDNf
 VjA+sGvaXmfBoyddcrPW8UqZpImL6BxIyNUgWwFyjcxp685zoD3WvRoG3
 jWazK3Xa14n3auuwkdFnsnLATq75Jl8rCJPWCP/f2fjWBq7sidGGNGpmI
 apTs9IFQbPqv/3i3/j8aIOROa9CNejdzJr62lMhb+108CgZ5kBDLq4rDG w==;
X-CSE-ConnectionGUID: ZfHvFueMRWOLDL5smEKjvA==
X-CSE-MsgGUID: 6M4FWWYYRuGRJPC4bJWpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72684879"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="72684879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 22:14:08 -0800
X-CSE-ConnectionGUID: gR1YGQcMSXWFWtG7Y9fS3w==
X-CSE-MsgGUID: te3Bd3z1Q8OOkrpX38MepQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241250151"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.21.252])
 ([10.246.21.252])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 22:14:07 -0800
Message-ID: <f0488559-9333-42f2-8b17-98f208994e77@linux.intel.com>
Date: Wed, 4 Mar 2026 07:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
 exec_threads array
To: nakshtra.goyal@intel.com, igt-dev@lists.freedesktop.org
Cc: adam.miszczak@intel.com, matthew.brost@intel.com
References: <20260303063154.489637-1-nakshtra.goyal@intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20260303063154.489637-1-nakshtra.goyal@intel.com>
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

On 3/3/2026 7:31 AM, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>
> Initialising exec_threads array to zero as threads-many-queues test
> fails on initial check to non_zero condition , it takes garbage
> value(non-zero) on first iteration , which call synobj_wait on a
> synobj that was never signalled.
>
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>   tests/intel/xe_exec_threads.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 27d5a8928..f082a0eda 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -502,7 +502,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   		.num_syncs = 2,
>   		.syncs = to_user_pointer(sync),
>   	};
> -	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
>   	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>   	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>   	size_t bo_size;

Acked-by: Adam Miszczak <adam.miszczak@linux.intel.com>

