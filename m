Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3816EDA0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 10:45:47 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200127161439.2941023-1-chris@chris-wilson.co.uk>
References: <20200127161439.2941023-1-chris@chris-wilson.co.uk>
Date: Tue, 28 Jan 2020 12:44:59 +0200
Message-ID: <87imkvn9lg.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Report wait() failures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Check the error status from a wait() failure and propagate if not SIGINT
> -- to avoid falling into a trap of an infinite error loop.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  lib/igt_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 0a0068946..72d55d5c2 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2174,8 +2174,14 @@ int __igt_waitchildren(void)
>  		int c;
>  
>  		pid = wait(&status);
> -		if (pid == -1)
> -			continue;
> +		if (pid == -1) {
> +			if (errno == EINTR)
> +				continue;
> +
> +			printf("wait(num_children:%d) failed with %m\n",
> +			       num_test_children - count);
> +			return IGT_EXIT_FAILURE;
> +		}
>  
>  		for (c = 0; c < num_test_children; c++)
>  			if (pid == test_children[c])
> -- 
> 2.25.0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
