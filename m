Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C818410E447
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 14:46:55 +0000 (UTC)
Message-ID: <2f0acb4f-1462-c7e6-fb4f-0032a6a0c71c@intel.com>
Date: Mon, 26 Sep 2022 16:46:05 +0200
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@intel.com>
To: <igt-dev@lists.freedesktop.org>
References: <20220926133233.32592-1-nirmoy.das@intel.com>
In-Reply-To: <20220926133233.32592-1-nirmoy.das@intel.com>
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

Chris pointed out that this is incorrect as dynamic subtest will 
serialize it.

Please ignore this patch.

On 9/26/2022 3:32 PM, Nirmoy Das wrote:
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
