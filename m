Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFDA10E275
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Mar 2023 11:03:00 +0000 (UTC)
Date: Thu, 2 Mar 2023 12:02:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vikas Srivastava <vikas.srivastava@intel.com>
Message-ID: <20230302110239.pwdbx5tzbb3stj25@kamilkon-desk1>
References: <20230302063334.81563-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230302063334.81563-1-vikas.srivastava@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_userptr_blits: skip
 set-cache-level subtest on MTL platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vikas,

On 2023-03-02 at 12:03:34 +0530, Vikas Srivastava wrote:
> SET_CACHE ioctl is not supported on latest platform like MTL
> so instead of failing in set-cache-level subtest just skip it.

You already have patchset: tests/i915: skip gem_set_caching call for mtl
Why not place it there ?

> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> ---
>  tests/i915/gem_userptr_blits.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index 483570d0a..402d8810b 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -2417,8 +2417,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
>  			test_sd_probe(fd);
>  		}
>  
> -		igt_subtest("set-cache-level")
> +		igt_subtest("set-cache-level") {
> +			igt_require_f(__gem_set_caching(fd, 0, 0) != -EOPNOTSUPP,

Maybe better to check for MTL here and skip with message ?

Regards,
Kamil

> +				      "set_caching not supported on this platform");
>  			test_set_caching(fd);
> +		}
>  
>  		igt_subtest("userfault")
>  			test_userfault(fd);
> -- 
> 2.25.1
> 
