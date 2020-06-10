Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8006E529
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 11:33:54 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200610103356.11551-1-petri.latvala@intel.com>
References: <20200610103356.11551-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159178882880.19008.4557352360782624189@build.alporthouse.com>
Date: Wed, 10 Jun 2020 12:33:48 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest: Don't write ffffffff to a
 numeric param
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-06-10 11:33:56)
> __cancel_work_at_exit writes -1 to param "reset", with the intention
> that it's "any available method". Hex values to numeric params should
> be prefixed with 0x to be parsed as a number. Use the convention of %u
> with -1 as is used elsewhere with the "reset" param.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/drmtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index e4e710d4..c732d1dd 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -478,7 +478,7 @@ static void __cancel_work_at_exit(int fd)
>  {
>         igt_terminate_spins(); /* for older kernels */
>  
> -       igt_params_set(fd, "reset", "%x", -1u /* any method */);
> +       igt_params_set(fd, "reset", "%u", -1u /* any method */);
>         igt_drop_caches_set(fd,
>                             /* cancel everything */
>                             DROP_RESET_ACTIVE | DROP_RESET_SEQNO |

Might explain why it seems like we ended up with reset=0 so frequently.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
