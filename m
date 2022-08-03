Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01E611AD4D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 17:13:03 +0000 (UTC)
Date: Wed, 3 Aug 2022 19:13:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YuqsnOvS0qsWvUol@kamilkon-desk1>
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
 <20220803052654.98827-2-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220803052654.98827-2-tales.aparecida@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_kmod: fix trivial typos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tales Aparecida <tales.aparecida@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-08-03 at 02:26:51 -0300, Tales Aparecida wrote:
> existance -> existence
> kmcdline -> kcmdline
> 
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>  lib/igt_kmod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index dfdcfcc5..bde0461a 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -114,7 +114,7 @@ out:
>   *
>   * Returns: True in case the module has been found or false otherwise.
>   *
> - * Function to check the existance of module @mod_name in list of loaded kernel
> + * Function to check the existence of module @mod_name in list of loaded kernel
>   * modules.
>   *
>   */
> @@ -813,7 +813,7 @@ static void kmsg_dump(int fd)
>  				continue;
>  
>  			if (errno == EPIPE) {
> -				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> +				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kcmdline\n");
>  				continue;

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  			}
>  
> -- 
> 2.37.0
> 
