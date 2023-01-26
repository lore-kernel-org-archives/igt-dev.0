Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D4E10E04C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 18:17:44 +0000 (UTC)
Date: Thu, 26 Jan 2023 19:17:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230126181733.5lgq2rq43gqy5qd2@kamilkon-desk1>
References: <20221129172718.151773-1-zack@kde.org>
 <20221129172718.151773-4-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129172718.151773-4-zack@kde.org>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] igt: Switch warning to an info when
 not using i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zack,

On 2022-11-29 at 12:27:18 -0500, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Because igt always tries to load i915 driver first for DRIVER_ANY every
> test using DRIVER_ANY on anything but i915 starts by printing a warning
> that i915 couldn't be loaded.
> Lets switch it to a general info line because it makes it hard to spot
> actual warnings when every subtest starts by warning about not being
> able to load i915.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  lib/igt_kmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bcf7dfeb..74924b5f 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -389,7 +389,7 @@ igt_i915_driver_load(const char *opts)

This is i915 driver load so maybe we should find a way to not
call this function ?

Regards,
Kamil

>  
>  	ret = igt_kmod_load("i915", opts);
>  	if (ret) {
> -		igt_warn("Could not load i915\n");
> +		igt_debug("Could not load i915\n");
>  		return ret;
>  	}
>  
> -- 
> 2.37.2
> 
