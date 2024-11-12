Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEAAD32D8D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4BC10E1E9;
	Tue, 12 Nov 2024 13:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hu3TgGNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C122410E1E9
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731417259; x=1762953259;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4LGm/OFHhrMuguf+rdtUMwsJvjbELUANDxvWW31suf4=;
 b=hu3TgGNdwnXQ44JFr2HODd6VJrKS6RLIS4A9RJnga/C96MLj0atkKMce
 7dHsTjDFOyxclKsOGau1LUuwL+DxhvcMhgXJaqbaKs9zowo/+NNDYqGML
 zmlKVekdd8iUSQRQX4E82BfgbPVKxwsVJHi4ThQfoixy2+9T1Qrncho6e
 bBMJzHiU9K1wVa38upxjRVVlWS9cOdbWY5H2nQGF6hR00ElAkwxzpwSQo
 a/AwT+rlRUS64KTwXcVEQdjLVg5s1mdC+sHNm8irSZwDMYtJv8nmadWUG
 OKtmAD89rdw91daOV7Sq4v9AY0vYx8gDqo7gQ0vhQRCjF0htdzQjO7z3u A==;
X-CSE-ConnectionGUID: 0ekhQ//gRvC7gILnh6tlGg==
X-CSE-MsgGUID: WQIjzy8LTQKCSTccxoowoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="30650073"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="30650073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:14:18 -0800
X-CSE-ConnectionGUID: 4OMskqVaSOCu+Z9lKnKY0Q==
X-CSE-MsgGUID: m14Op9UTT7CBHBt/vUGcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87221082"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.134.205])
 ([10.245.134.205])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:14:17 -0800
Message-ID: <57539d98-0d64-423c-b2fc-00e731cc6814@linux.intel.com>
Date: Tue, 12 Nov 2024 14:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 3/4] tests/intel/xe_exec_threads: wait for all
 submissions to complete
To: fei.yang@intel.com, igt-dev@lists.freedesktop.org
References: <20241108011041.2257553-1-fei.yang@intel.com>
 <20241108011041.2257553-4-fei.yang@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241108011041.2257553-4-fei.yang@intel.com>
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


On 11/8/2024 2:10 AM, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> In test_compute_mode, there is an one second sleep waiting for all the
> submissions to complete, but a hardcode wait is not reliable for test
> that could have thousands of xe_execs submissions. Instead we should
> wait for the ufence to make sure the GPU is inactive before unbinding
> the BO.
>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Tested it locally
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>  tests/intel/xe_exec_threads.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 962957cd7..433f2620a 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -404,16 +404,32 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	}
>  
> -	j = flags & INVALIDATE ?
> -		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
> +	j = 0; /* wait for all submissions to complete */
> +	if (flags & INVALIDATE)
> +		/*
> +		 * For !RACE cases xe_wait_ufence has been called in above for-loop
> +		 * except the last batch of submissions. For RACE cases we will need
> +		 * to wait for the second half of the submissions to complete. There
> +		 * is a potential race here because the first half submissions might
> +		 * have updated the fence in the old physical location while the test
> +		 * is remapping the buffer from a different physical location, but the
> +		 * wait_ufence only checks the fence from the new location which would
> +		 * never be updated. We have to assume the first half of the submissions
> +		 * complete before the second half. Will have a follow up patch to fix
> +		 * this completely.
> +		 */
> +		j = (flags & RACE) ? (n_execs / 2 + 1) : (((n_execs - 1) & ~0x1f) + 1);
> +	else if (flags & REBIND)
> +		/*
> +		 * For REBIND cases xe_wait_ufence has been called in above for-loop
> +		 * except the last batch of submissions.
> +		 */
> +		j = ((n_execs - 1) & ~0x1f) + 1;
> +
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>  			       exec_queues[i % n_exec_queues], fence_timeout);
>  
> -	/* Wait for all execs to complete */
> -	if (flags & INVALIDATE)
> -		sleep(1);
> -
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
