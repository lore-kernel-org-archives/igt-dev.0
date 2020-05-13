Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE4A6E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2020 13:20:51 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200513131001.10566-1-petri.latvala@intel.com>
References: <20200513131001.10566-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158937604767.21674.3695264058855658956@build.alporthouse.com>
Date: Wed, 13 May 2020 14:20:47 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_gt: Add newline to IGT_HANG=0
 skips
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

Quoting Petri Latvala (2020-05-13 14:10:01)
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/igt_gt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index 2fd51985..70627a8f 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -120,7 +120,7 @@ static void eat_error_state(int dev)
>  void igt_require_hang_ring(int fd, int ring)
>  {
>         if (!igt_check_boolean_env_var("IGT_HANG", true))
> -               igt_skip("hang injection disabled by user");
> +               igt_skip("hang injection disabled by user\n");
>  
>         gem_require_ring(fd, ring);
>         gem_context_require_bannable(fd);
> @@ -175,7 +175,7 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
>         igt_require_gem(fd);
>  
>         if (!igt_check_boolean_env_var("IGT_HANG", true))
> -               igt_skip("hang injection disabled by user");
> +               igt_skip("hang injection disabled by user\n");

Might be worth adding "hang injection disabled by user [IGT_HANG=1]\n"
Environments variable are easy to go unnoticed.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
