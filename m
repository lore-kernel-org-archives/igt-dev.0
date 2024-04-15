Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38841C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 09:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CE611240C;
	Mon, 15 Apr 2024 09:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAHBZc8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D33F11240C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713174597; x=1744710597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=R+vG12KNXTBWwvR1GaJuxVhvvn1A3UExOyjrMTWxo/k=;
 b=RAHBZc8xu7KhNnW9Iw+Rm0k5VJJd8q61JBd7+ohqccmaEcxjuXs+05cS
 WXLLFoE2T0SSzUyWj1+6rnM+N49zcRVFiIk6/3gNrFXPI/+UX6CTD/ic8
 l2pkVZ3dM6Q5faG42HqCKtOozQSYr7kjtD4+3+M43BCJUqO9qtNqF70oR
 27BVsRW3Yt90WJx7PITbcFsRVz5gWCRgfUzNJXf9B4i+GLpzZDb6VWsRB
 1I/bgfsLotb7drueYI1mMjYyRO/quepkGTyn4ilglnKVhfa09rGvsWzPe
 yJALXL+NI/XVq42bb7dXaAm1f+LeDzp+8gwXgmqDj/5CdnsZjnl4jjXdB Q==;
X-CSE-ConnectionGUID: yQQ/x1LaSDWR35W/DKN2EA==
X-CSE-MsgGUID: HjkX84nFQcSwFxL8ZDjVfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="11506174"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="11506174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 02:49:56 -0700
X-CSE-ConnectionGUID: KdbM0R7NSnq1NZLeDr+HAA==
X-CSE-MsgGUID: AhHQmNpzRWmY7sw07VjLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21859045"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 02:49:55 -0700
Date: Mon, 15 Apr 2024 11:49:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [i-g-t] lib/igt_kmod: Fix sigaction write to uninitialized memory
Message-ID: <Zhz4QQLg4IssUI/m@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
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

On 2024-04-12 at 14:20:14 +0200, Zbigniew Kempczyński wrote:
> I've noticed on running kunit subtest:
> 
> ./xe_live_ktest --r xe_bo
> 
> IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.8.0-xeint+ x86_64)
> Using IGT_SRANDOM=1712922311 for randomisation
> Starting subtest: xe_bo
> Received signal SIGSEGV.
> Stack trace:
>  #0 [fatal_sig_handler+0xda]
>  #1 [__sigaction+0x50]
>  #2 [__libc_sigaction+0x10f]
>  #3 [kunit_get_tests+0x417]
>  #4 [igt_kunit+0x35f]
>  #5 [__igt_unique____real_main41+0x44]
>  #6 [main+0x48]
>  #7 [__libc_init_first+0x90]
>  #8 [__libc_start_main+0x80]
>  #9 [_start+0x25]
> Subtest xe_bo: CRASH (0.005s)
> 
> Looks this is related to sigaction() write to memory referenced
> by uninitialized pointer located on the stack. Lets fix it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thx for reporting bug and fixing it.  +cc Janusz

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v2: missed cmdline (due to # character)
> ---
>  lib/igt_kmod.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 1ec9c8a602..6659c27eba 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -963,7 +963,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
>  				 int fd, struct igt_ktap_results *ktap)
>  {
>  	struct sigaction sigchld = { .sa_handler = kunit_sigchld_handler, },
> -			 *saved;
> +			 saved;
>  	char record[BUF_LEN + 1], *buf;
>  	unsigned long taints;
>  	int ret;
> @@ -975,7 +975,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
>  			return -ENOTRECOVERABLE;
>  
>  		if (modprobe) {
> -			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, saved));
> +			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, &saved));
>  			if (err == -1)
>  				return -errno;
>  			else if (unlikely(err))
> @@ -988,7 +988,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
>  				igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
>  				__attribute__ ((fallthrough));
>  			case ENOTRECOVERABLE:
> -				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> +				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
>  				if (igt_debug_on(modprobe->err))
>  					return modprobe->err;
>  				break;
> @@ -996,7 +996,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
>  				break;
>  			default:
>  				igt_debug("pthread_mutex_lock() error: %d\n", err);
> -				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> +				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
>  				return -err;
>  			}
>  		}
> @@ -1005,7 +1005,7 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
>  
>  		if (modprobe && !err) {	/* pthread_mutex_lock() succeeded */
>  			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
> -			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> +			igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
>  		}
>  
>  		if (igt_debug_on(!ret))
> @@ -1236,7 +1236,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
>  			    struct igt_ktap_results **ktap)
>  {
>  	struct sigaction sigalrm = { .sa_handler = kunit_get_tests_timeout, },
> -			 *saved;
> +			 saved;
>  	struct igt_ktap_result *r, *rn;
>  	unsigned long taints;
>  	int flags, err;
> @@ -1263,13 +1263,13 @@ static bool kunit_get_tests(struct igt_list_head *tests,
>  	igt_skip_on(modprobe(tst->kmod, opts));
>  	igt_skip_on(igt_kernel_tainted(&taints));
>  
> -	igt_skip_on(sigaction(SIGALRM, &sigalrm, saved));
> +	igt_skip_on(sigaction(SIGALRM, &sigalrm, &saved));
>  	alarm(10);
>  
>  	err = kunit_get_results(tests, tst->kmsg, ktap);
>  
>  	alarm(0);
> -	igt_debug_on(sigaction(SIGALRM, saved, NULL));
> +	igt_debug_on(sigaction(SIGALRM, &saved, NULL));
>  
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
