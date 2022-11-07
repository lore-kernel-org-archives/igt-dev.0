Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAD010E19D
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 13:58:47 +0000 (UTC)
Date: Mon, 7 Nov 2022 14:57:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2kOyiOM1wQupQuv@kamilkon-desk1>
References: <20221107120151.2365523-1-petri.latvala@intel.com>
 <20221107120151.2365523-4-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221107120151.2365523-4-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] igt_core: Make sure test result
 gets to runner when test has no subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-07 at 14:01:49 +0200, Petri Latvala wrote:
> One more raw printf, converted to the wrapper that sends to runner if
> connected.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index d4bef161..30b43715 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2260,8 +2260,8 @@ void igt_exit(void)
>  				result = "FAIL";
>  		}
>  
> -		printf("%s (%.3fs)\n",
> -		       result, igt_time_elapsed(&subtest_time, &now));
> +		_log_line_fprintf(stdout, "%s (%.3fs)\n",
> +				  result, igt_time_elapsed(&subtest_time, &now));
>  	}
>  
>  	exit(igt_exitcode);
> -- 
> 2.30.2
> 
