Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Liu, Chuansheng" <chuansheng.liu@intel.com>
Date: Tue, 14 Jan 2020 00:05:09 +0000
Message-ID: <27240C0AC20F114CBF8149A2696CBE4A61602B82@SHSMSX101.ccr.corp.intel.com>
References: <20200107112913.2726371-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200107112913.2726371-1-chris@chris-wilson.co.uk>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_engine: Skip
 redundant clear of a fresh buffer
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Chris
> Wilson
> Sent: Tuesday, January 7, 2020 7:29 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: igt-dev@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_engine: Skip redundant clear of
> a fresh buffer
> 
> No need to memset(0) the mapping of a fresh buffer, as we expect it to
> be 0 already.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_ctx_engines.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index 55794a438..86c4bea5a 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -454,7 +454,6 @@ static void independent(int i915)
>  	map = gem_mmap__cpu(i915, results.handle, 0, 4096, PROT_READ);
>  	gem_set_domain(i915, results.handle,
>  		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> -	memset(map, 0, 4096);

Reviewed-by: Chuansheng Liu <chuansheng.liu@intel.com>

This patch can fix the problem of memsetting read-only map memory.
Just curious when it can get merged?
Thanks.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
