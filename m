Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EB9CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 15:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652A410E243;
	Wed,  1 Oct 2025 15:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMnC5q6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEE210E243
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759331205; x=1790867205;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Q1bRJTsiY3SPSaANeCungiUb7eOQ5tB7fZ9Sk1rX8Qw=;
 b=IMnC5q6++S/QgKUuVCbdiYWyxfTo0J7AFzgsKEwHUiDRjXcZ8igC6mW0
 9RJm/K7Ca/ItQqczD80qE15OF7rs/bCeTK3eA7jiE3ODXSFGfWq9raXHU
 DAtkFaWpPUHpj+C97J2DW/D4bSOtdLC5jUtwqH6NNWw1FUPznL4wHeP6J
 +ZqNlY4TNKBLfOghBEuA9gBdwvK8f4y08BqVFWQhtb41RUU/psTknrOwA
 Jcp3Idoav2nhmNddLEMzf49ngWXdSJfQATnzZS5/Ts8mrIhUDppo37taG
 7hjBs0R08MPmgKvzGL2pZPi0R4C1IhH5jOdgmsZJCik4Icde/8x/PUbTz g==;
X-CSE-ConnectionGUID: CaHzviEUSm6CJIFjEGm0KQ==
X-CSE-MsgGUID: XYBlOSjkTrqf7zPkFiIXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61771543"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61771543"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:06:45 -0700
X-CSE-ConnectionGUID: sOf7IF0MSTuQbd+QPLag8w==
X-CSE-MsgGUID: CNyRHcBXTpKKVRN4AprbmQ==
X-ExtLoop1: 1
Received: from unknown (HELO [172.28.180.163]) ([172.28.180.163])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:06:44 -0700
Message-ID: <91b8a7a5-6123-4092-ac70-cd1891ddd7ca@linux.intel.com>
Date: Wed, 1 Oct 2025 17:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_threads: Add many queues section
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20250923234439.813972-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250923234439.813972-1-matthew.brost@intel.com>
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



On 9/24/2025 1:44 AM, Matthew Brost wrote:
> Add many queues section which creates an exec queue for each submission.
> Helpful to test VF migration which is rapidly creating / destroying
> queues.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_exec_threads.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index be5549c84f..bb39eecbe3 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -40,6 +40,7 @@
>   #define HANG		(0x1 << 11)
>   #define REBIND_ERROR	(0x1 << 12)
>   #define BIND_EXEC_QUEUE	(0x1 << 13)
> +#define MANY_QUEUES	(0x1 << 14)
>   
>   pthread_barrier_t barrier;
>   
> @@ -539,7 +540,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   
>   	memset(sync_all, 0, sizeof(sync_all));
>   	for (i = 0; i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		if (!(flags & MANY_QUEUES))
> +			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>   		if (flags & BIND_EXEC_QUEUE)
>   			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
>   									0);
> @@ -570,6 +572,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   		uint64_t exec_addr;
>   		int e = i % n_exec_queues;
>   
> +		if (flags & MANY_QUEUES) {
> +			if (exec_queues[e]) {
> +				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
> +							INT64_MAX, 0, NULL));
> +				xe_exec_queue_destroy(fd, exec_queues[e]);
> +			}
> +			exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
> +		}
> +
>   		if (flags & HANG && e == hang_exec_queue && i == e) {
>   			spin_opts.addr = addr + spin_offset;
>   			xe_spin_init(&data[i].spin, &spin_opts);
> @@ -762,6 +773,8 @@ static void *thread(void *data)
>    * arg[1]:
>    * @basic:
>    *	basic
> + * @many-queues:
> + *	many queues
>    * @userptr:
>    *	userptr
>    * @rebind:
> @@ -1103,6 +1116,7 @@ igt_main
>   		unsigned int flags;
>   	} sections[] = {
>   		{ "basic", 0 },
> +		{ "many-queues", MANY_QUEUES },

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   		{ "userptr", USERPTR },
>   		{ "rebind", REBIND },
>   		{ "rebind-bindexecqueue", REBIND | BIND_EXEC_QUEUE },

