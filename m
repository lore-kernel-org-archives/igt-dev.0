Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B407010E51B
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 12:55:25 +0000 (UTC)
Date: Wed, 12 Jul 2023 14:55:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230712125512.irjzjd6rg3ejmv4g@kamilkon-desk1>
References: <20230712123313.27999-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712123313.27999-1-lukasz.laguna@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_aux: use proper directory
 for "pm_debug_messages" read
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lukasz,

On 2023-07-12 at 14:33:12 +0200, Lukasz Laguna wrote:
> Wrong variable containing directory fd was passed to
> igt_sysfs_get_boolean() function. Fix that.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/igt_aux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index fd5103043..c5fb10185 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -962,7 +962,7 @@ static void igt_aux_enable_pm_suspend_dbg(int power_dir)
>  
>  	/* pm_debug_messages depends on  CONFIG_PM_SLEEP_DEBUG */
>  	if (!faccessat(power_dir, "pm_debug_messages", R_OK |  W_OK, 0)) {
> -		__pm_debug_messages_state = igt_sysfs_get_boolean(sysfs_fd, "pm_debug_messages");
> +		__pm_debug_messages_state = igt_sysfs_get_boolean(power_dir, "pm_debug_messages");

Thank you for a fix,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		igt_sysfs_set_boolean(power_dir, "pm_debug_messages", true);
>  	}
>  
> -- 
> 2.40.0
> 
