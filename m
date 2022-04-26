Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC15E10E86E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 16:39:37 +0000 (UTC)
Date: Tue, 26 Apr 2022 18:34:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmgfLYBoepqPMgST@kamilkon-DESK1>
References: <20220426113106.10071-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426113106.10071-1-krishnaiah.bommu@intel.com>
Subject: Re: [igt-dev] [PATCH] i915/gem_eio: Removed early timeout check for
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

On 2022-04-26 at 17:01:06 +0530, krishnaiah.bommu@intel.com wrote:
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> 
> GUC log capture is taking more time on few platforms, so removing
> early timeout check for forced reset completion.
> Test is having same check in later.

s/Test is having same check in later./Test still checks timeout later, before function exit./

> 
> Signed-off-by: Krishnaiah Bommu <krishnaiah.bommu@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>  tests/i915/gem_eio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index d9689534d5a..30eaceb1b3d 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -72,8 +72,9 @@ static void trigger_reset(int fd)
>  	igt_kmsg(KMSG_DEBUG "Forcing GPU reset\n");
>  	igt_force_gpu_reset(fd);
>  
> -	/* The forced reset should be immediate */
> -	igt_assert_lte(igt_seconds_elapsed(&ts), 2);
> +	/* The forced reset should be immediate non GUC platforms */
---------------------------------------------- ^
Add "for" here and add explanation why we are not checking it
in GUC case.

	/*
	 * The forced reset should be immediate for non GUC platforms.
	 * GUC log capture can take some time so skip check here.
	 */

One thing to consider is to remember this condition in bool,
before resetting gpu and before taking reference time, as this
can eat up a little time. But maybe I overcomplicate this, so
with above fixed you can add my r-b tag.

Regards,
Kamil

> +	if (!gem_using_guc_submission(fd))
> +		igt_assert_lte(igt_seconds_elapsed(&ts), 2);
>  
>  	/* And just check the gpu is indeed running again */
>  	igt_kmsg(KMSG_DEBUG "Checking that the GPU recovered\n");
> -- 
> 2.25.1
> 
