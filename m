Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0C10E769
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 21:06:48 +0000 (UTC)
Date: Thu, 25 May 2023 23:06:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525210644.7nnhrabq6buc4cu6@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-11-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-11-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 10/11] i915_test_config.json: exclude
 gem_concurrent_blit.c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-05-25 at 11:05:34 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> This is actually a subset of gem_concurrent_all.c, which can't
> be described, as it containd 400k+ tests on it. It also has an
> insane number of tests:
> 
> 	$ ./build/tests/gem_concurrent_all --list |wc -l
> 	428400
> 	$ ./build/tests/gem_concurrent_blit --list |wc -l
> 	57120
> 
> It makes no sense to document all of them. So, exclude it as
> well, as otherwise adding a logic to check for missing documentation
> on i915 will complain with:
> 
> 	...
> 	Warning: Missing documentation for igt@gem_concurrent_blit@4KiB-tiny-wc-blt-read-read-bcs-forked
> 	Warning: Missing documentation for igt@gem_concurrent_blit@4KiB-tiny-wc-blt-read-read-bcs-interruptible
> 	Warning: Missing documentation for igt@gem_concurrent_blit@4KiB-tiny-wc-blt-read-read-rcs
> 	...
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/i915/i915_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
> index 812cb73b9f52..ae8317b6aefe 100644
> --- a/tests/i915/i915_test_config.json
> +++ b/tests/i915/i915_test_config.json
> @@ -11,7 +11,7 @@
>                 "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
>                 "../syncobj_timeline.c", "../syncobj_wait.c",
>                 "../vgem_basic.c", "../vgem_slow.c" ],
> -    "exclude_files": [ "kms_*", "gem_concurrent_all.c" ],
> +    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c" ],

Looks good,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

>      "fields": {
>  	"Mega feature": {
>                  "_properties_": {
> -- 
> 2.40.1
> 

