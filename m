Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F5010E19D
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 14:00:04 +0000 (UTC)
Date: Mon, 7 Nov 2022 14:59:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2kPW0La0l2AP6NG@kamilkon-desk1>
References: <20221107120151.2365523-1-petri.latvala@intel.com>
 <20221107120151.2365523-5-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221107120151.2365523-5-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] lib/runnercomms: Report empty comms
 dump as empty
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

On 2022-11-07 at 14:01:50 +0200, Petri Latvala wrote:
> A mistake that went unnoticed because it's only hit if igt_runner is
> killed immediately after initializing the execution but before
> executing the test binary.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/runnercomms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/runnercomms.c b/lib/runnercomms.c
> index 344312bd..034ba0a2 100644
> --- a/lib/runnercomms.c
> +++ b/lib/runnercomms.c
> @@ -515,7 +515,7 @@ int comms_read_dump(int fd, struct comms_visitor *visitor)
>  		return COMMSPARSE_ERROR;
>  
>  	if (statbuf.st_size == 0)
> -		return COMMSPARSE_ERROR;
> +		return COMMSPARSE_EMPTY;
>  
>  	buf = mmap(NULL, statbuf.st_size, PROT_READ, MAP_SHARED, fd, 0);
>  	if (buf == MAP_FAILED)
> -- 
> 2.30.2
> 
