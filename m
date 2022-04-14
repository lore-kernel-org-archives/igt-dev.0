Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACF110FCA0
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 13:01:35 +0000 (UTC)
Date: Thu, 14 Apr 2022 15:01:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YlgbFo7V3xQ95Wxt@kamilkon-DESK1>
References: <20220414102304.1745-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220414102304.1745-1-krishnaiah.bommu@intel.com>
Subject: Re: [igt-dev] [PATCH] i915/gem_eio: increasing the timeout for
 forced reset completion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Krishnaiah Bommu <krishnaiah.bommu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-04-14 at 15:53:04 +0530, krishnaiah.bommu@intel.com napisał(a):
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> 
> GUC log capture is taking more time on few platforms, so increasing the timeout
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Konieczny Kamil <kamil.konieczny@intel.com>
-------------------------------------- ^
Please use my @linux.intel.com address.

> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>  tests/i915/gem_eio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index d9689534d5a..94c3bc04644 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -72,8 +72,11 @@ static void trigger_reset(int fd)
>  	igt_kmsg(KMSG_DEBUG "Forcing GPU reset\n");
>  	igt_force_gpu_reset(fd);
>  
> -	/* The forced reset should be immediate */
> -	igt_assert_lte(igt_seconds_elapsed(&ts), 2);
> +	/* The forced reset should be immediate, even though
> +	 * GUC log capture is taking more time on few platforms,
> +	 * so Increasing the timeout
> +	 */
> +	igt_assert_lte(igt_seconds_elapsed(&ts), 10);

Please use new timeout variable and make it 10 only for GuC
submissions, you can use:

bool gem_using_guc_submission(int fd);

from lib/i915/gem_submission.h

Later in the same function 10 is also used so imho we should
make this number lower, like 7 or increase that second one.

>  
>  	/* And just check the gpu is indeed running again */
>  	igt_kmsg(KMSG_DEBUG "Checking that the GPU recovered\n");
> -- 
> 2.25.1
>
Regards,
Kamil
 
