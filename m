Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923CE10EACA
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 16:36:28 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:36:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <YzXJiBFQoxAWjJxK@zkempczy-mobl2>
References: <20220929111223.11925-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929111223.11925-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ringfill: Create dynamic
 subtest
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

On Thu, Sep 29, 2022 at 01:12:23PM +0200, Nirmoy Das wrote:
> This will print engine name for each subtest which
> might be useful for debugging a failure.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/i915/gem_ringfill.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index b68c5ae615..1e98ac8bb7 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -383,19 +383,20 @@ igt_main
>  	}
>  
>  	igt_describe("Basic check to fill the ring upto maximum on all engines simultaneously.");
> -	igt_subtest("basic-all") {
> +	igt_subtest_with_dynamic("basic-all") {
>  		const struct intel_execution_engine2 *e;
>  		intel_allocator_multiprocess_start();
>  
>  		for_each_ctx_engine(fd, ctx, e) {
>  			if (!gem_class_can_store_dword(fd, e->class))
>  				continue;
> -
> -			igt_fork(child, 1)
> -				run_test(fd, ctx, e->flags, 0, 1);
> +			igt_dynamic_f("%s", e->name) {
> +				igt_fork(child, 1)
> +					run_test(fd, ctx, e->flags, 0, 1);
> +				igt_waitchildren();
> +			}
>  		}
>  
> -		igt_waitchildren();
>  		intel_allocator_multiprocess_stop();
>  	}
>  
> -- 
> 2.37.3
>

As you've already started changing code here please also add additional
patch in which migrate intel_allocator_multiprocess_start() to first
fixture and intel_allocator_multiprocess_stop() to the last one.

With above change added:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
