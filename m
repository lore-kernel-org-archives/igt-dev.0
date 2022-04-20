Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A610E757
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 09:52:13 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:52:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yl/XyNjQrB1XpUXk@kamilkon-DESK1>
References: <20220418050417.30641-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220418050417.30641-1-krishnaiah.bommu@intel.com>
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

Hi Krishnaiah,

Dnia 2022-04-18 at 10:34:17 +0530, krishnaiah.bommu@intel.com napisał(a):
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> 
> GUC log capture is taking more time on few platforms, so increasing the timeout
--------------------------------------------------------- ^

Fold commit message under 65 chars and end it with dot.

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---------------- ^     ^
Please change this into
Signed-off-by: Krishnaiah Bommu <krishnaiah.bommu@intel.com>

You can put it into git config to make it simple.

> Cc: Konieczny Kamil <kamil.konieczny@intel.com>
-------------------------------------- ^

Please use my second address
Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>  tests/i915/gem_eio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index d9689534d5a..d7fa9e02e92 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -72,8 +72,14 @@ static void trigger_reset(int fd)
>  	igt_kmsg(KMSG_DEBUG "Forcing GPU reset\n");
>  	igt_force_gpu_reset(fd);
>  
> -	/* The forced reset should be immediate */
> -	igt_assert_lte(igt_seconds_elapsed(&ts), 2);
> +	/* The forced reset should be immediate, even though
> +	 * GUC log capture is taking more time on few platforms,
-------------------------------------------------------------- ^
s/,//
> +	 * so Increasing the timeout

Drop this line, it is part of commit message.

> +	 */
> +	if (gem_using_guc_submission(fd))
> +		igt_assert_lte(igt_seconds_elapsed(&ts), 10);
> +	else
> +		igt_assert_lte(igt_seconds_elapsed(&ts), 2);

Looks redundand because you have later at the end of this
function:

	igt_assert_lte(igt_seconds_elapsed(&ts), 10);

So I propose either change 10 into 7, or drop this entirely from
here, so it will be:

	if (!gem_using_guc_submission(fd))
		igt_assert_lte(igt_seconds_elapsed(&ts), 2);

If you choose to drop, change a comment that the timeout
is still checked at the end of function.

>  
>  	/* And just check the gpu is indeed running again */
>  	igt_kmsg(KMSG_DEBUG "Checking that the GPU recovered\n");
> -- 
> 2.25.1
> 
Regards,
Kamil
