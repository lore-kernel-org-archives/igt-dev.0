Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AE010E5B1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 11:52:45 +0000 (UTC)
Date: Fri, 20 Oct 2023 13:52:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231020115241.juassl4vfwsvtkzk@kamilkon-desk.igk.intel.com>
References: <20231019185019.4146391-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231019185019.4146391-1-lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Remove wrong note
 regarding dependencies
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lucas,
On 2023-10-19 at 11:50:19 -0700, Lucas De Marchi wrote:
> igt_kmod_load() uses libkmod's kmod_module_probe_insert_module() which
> handles hard and soft dependencies. There's no need load them before
> calling this function.
> 
> While at it, move the "Returns:" to the end of documentation as usual
> for kernel-doc.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index d98e6c5f9..74017ddc2 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -211,14 +211,10 @@ out:
>   * @opts: Parameters for the module. NULL in case no parameters
>   * are to be passed, or a '\0' terminated string otherwise.
>   *
> - * Returns: 0 in case of success or -errno in case the module could not
> - * be loaded.
> - *
>   * This function loads a kernel module using the name specified in @mod_name.
>   *
> - * @Note: This functions doesn't automatically resolve other module
> - * dependencies so make make sure you load the dependencies module(s) before
> - * this one.
> + * Returns: 0 in case of success or -errno in case the module could not
> + * be loaded.
>   */
>  int
>  igt_kmod_load(const char *mod_name, const char *opts)
> -- 
> 2.40.1
> 
