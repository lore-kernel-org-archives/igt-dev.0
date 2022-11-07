Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DCD10E19D
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 14:00:45 +0000 (UTC)
Date: Mon, 7 Nov 2022 15:00:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2kPiEipf7oSKlx5@kamilkon-desk1>
References: <20221107120151.2365523-1-petri.latvala@intel.com>
 <20221107120151.2365523-6-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221107120151.2365523-6-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] Revert "runner: Disable socket
 communications for now"
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

On 2022-11-07 at 14:01:51 +0200, Petri Latvala wrote:
> With a couple of fixes, using socket comms is now suitably ready for
> prime time.
> 
> This reverts commit 372c56225e12578a7a4a6bcc5b79eb40b643fcde.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/executor.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index c6389e25..4881f71a 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1676,14 +1676,7 @@ static int execute_next_entry(struct execute_state *state,
>  
>  		sigprocmask(SIG_UNBLOCK, sigmask, NULL);
>  
> -		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION") &&
> -		    getenv("IGT_RUNNER_ENABLE_SOCKET_COMMUNICATION_FIXME")) {
> -			/*
> -			 * The variable for enabling socket comms is
> -			 * temporary. Do not use unless you really
> -			 * know what you're doing. Requiring it will
> -			 * go away later.
> -			 */
> +		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION")) {
>  			snprintf(envstring, sizeof(envstring), "%d", socketfd);
>  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>  		}
> -- 
> 2.30.2
> 
