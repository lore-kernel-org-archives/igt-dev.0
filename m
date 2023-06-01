Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADBB10E23E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 17:13:37 +0000 (UTC)
Date: Thu, 1 Jun 2023 19:13:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230601171322.d3zqhshbfdttre5c@kamilkon-desk1>
References: <20230601100250.747088-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230601100250.747088-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] gem_exec_balancer: move no-GuC
 requirement to test functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andrzej,

On 2023-06-01 at 12:02:50 +0200, Andrzej Hajda wrote:
> Requirements put into igt_subtest_group/igt_fixture are checked for
> all tests in the file. Even if they do not influence test execution
> they print misleading infos.

Could you provide example ? You can use something like:

./gem_exec_balancer --r nop
...test output...
Subtest nop: SUCCESS (36,896s)
Test requirement not met in [...]gem_exec_balancer.c:3608:
Test requirement: !gem_using_guc_submission(i915)

Please also mension that such output may happen before or after
subtest and may additionally confuse when some error happens.

Regards,
Kamil

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/i915/gem_exec_balancer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 004ba9a14fe..9190fc2383f 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -1525,6 +1525,7 @@ bonded_runner(int i915,
>  	 * submission across multiple engines.
>  	 */
>  	igt_require(gem_scheduler_has_preemption(i915));
> +	igt_require(!gem_using_guc_submission(i915));
>  
>  	cycles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  
> @@ -1996,6 +1997,7 @@ static void sliced(int i915)
>  
>  	igt_require(gem_scheduler_has_preemption(i915));
>  	igt_require(gem_scheduler_has_semaphores(i915));
> +	igt_require(!gem_using_guc_submission(i915));
>  
>  	for (int class = 0; class < 32; class++) {
>  		struct i915_engine_class_instance *ci;
> @@ -3605,7 +3607,6 @@ igt_main
>  
>  	igt_subtest_group {
>  		igt_fixture {
> -			igt_require(!gem_using_guc_submission(i915));
>  			intel_allocator_multiprocess_start();
>  		}
>  
> -- 
> 2.34.1
> 
