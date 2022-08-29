Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DBB10E567
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Aug 2022 07:43:42 +0000 (UTC)
Date: Mon, 29 Aug 2022 09:43:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YwxuKtGMDwSVfhIA@kamilkon-desk1>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-3-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220829000920.38185-3-isabbasso@riseup.net>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/igt_kmod.c: check if module
 is builtin before attempting to unload it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Isabella,

On 2022-08-28 at 21:09:18 -0300, Isabella Basso wrote:
> This change makes `igt_module_unload_r` safer as it checks whether the
> module can be unloaded before attempting it.

Nice catch.

> 
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> ---
>  lib/igt_kmod.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bb6cb7bb..97cac7f5 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -256,6 +256,9 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  	struct kmod_list *holders, *pos;
>  	int err = 0;
>  
> +	if (kmod_module_get_initstate(kmod) == KMOD_MODULE_BUILTIN)
> +		return err;
---------------------- ^

imho this should return non-zero error, like -ENOTSUP or just -errno.

Regards,
Kamil

> +
>  	holders = kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
>  		struct kmod_module *it = kmod_module_get_module(pos);
> -- 
> 2.37.2
> 
