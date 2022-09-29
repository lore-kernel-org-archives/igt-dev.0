Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73010EB1D
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 17:02:30 +0000 (UTC)
Message-ID: <da3e15f8-cdb5-5857-4572-110f80cdc155@intel.com>
Date: Thu, 29 Sep 2022 19:02:16 +0200
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@intel.com>
To: <igt-dev@lists.freedesktop.org>
References: <20220929111223.11925-1-nirmoy.das@intel.com>
In-Reply-To: <20220929111223.11925-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ringfill: Create dynamic
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Looks like I accidentally resent my older patch instead of " 
i915/gem_ringfill: Add 48b address flag in store-dword"


Sorry about that,

Nirmoy

On 9/29/2022 1:12 PM, Nirmoy Das wrote:
> This will print engine name for each subtest which
> might be useful for debugging a failure.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/i915/gem_ringfill.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index b68c5ae615..1e98ac8bb7 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -383,19 +383,20 @@ igt_main
>   	}
>   
>   	igt_describe("Basic check to fill the ring upto maximum on all engines simultaneously.");
> -	igt_subtest("basic-all") {
> +	igt_subtest_with_dynamic("basic-all") {
>   		const struct intel_execution_engine2 *e;
>   		intel_allocator_multiprocess_start();
>   
>   		for_each_ctx_engine(fd, ctx, e) {
>   			if (!gem_class_can_store_dword(fd, e->class))
>   				continue;
> -
> -			igt_fork(child, 1)
> -				run_test(fd, ctx, e->flags, 0, 1);
> +			igt_dynamic_f("%s", e->name) {
> +				igt_fork(child, 1)
> +					run_test(fd, ctx, e->flags, 0, 1);
> +				igt_waitchildren();
> +			}
>   		}
>   
> -		igt_waitchildren();
>   		intel_allocator_multiprocess_stop();
>   	}
>   
