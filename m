Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A8410E224
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 10:46:16 +0000 (UTC)
Message-ID: <2d4293bf-58f4-c289-5f4f-357d3674c471@intel.com>
Date: Thu, 1 Jun 2023 12:46:07 +0200
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230601100250.747088-1-andrzej.hajda@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230601100250.747088-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] gem_exec_balancer: move no-GuC
 requirement to test functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 6/1/2023 12:02 PM, Andrzej Hajda wrote:
> Requirements put into igt_subtest_group/igt_fixture are checked for
> all tests in the file. Even if they do not influence test execution
> they print misleading infos.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/i915/gem_exec_balancer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 004ba9a14fe..9190fc2383f 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -1525,6 +1525,7 @@ bonded_runner(int i915,
>   	 * submission across multiple engines.
>   	 */
>   	igt_require(gem_scheduler_has_preemption(i915));
> +	igt_require(!gem_using_guc_submission(i915));
>   
>   	cycles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   
> @@ -1996,6 +1997,7 @@ static void sliced(int i915)
>   
>   	igt_require(gem_scheduler_has_preemption(i915));
>   	igt_require(gem_scheduler_has_semaphores(i915));
> +	igt_require(!gem_using_guc_submission(i915));
>   
>   	for (int class = 0; class < 32; class++) {
>   		struct i915_engine_class_instance *ci;
> @@ -3605,7 +3607,6 @@ igt_main
>   
>   	igt_subtest_group {
>   		igt_fixture {
> -			igt_require(!gem_using_guc_submission(i915));
>   			intel_allocator_multiprocess_start();
>   		}
>   
