Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC9F6E51B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2020 19:34:32 +0000 (UTC)
Date: Fri, 28 Aug 2020 12:34:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20200828193431.GA65737@orsosgc001.ra.intel.com>
References: <20200827150920.12940-1-sowmyax.kaparthi@intel.com>
 <7a020f08-db91-81a8-29ab-940046fe46ba@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a020f08-db91-81a8-29ab-940046fe46ba@intel.com>
Subject: Re: [igt-dev] [i-g-t] Fixing the latency of hrtimer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 06:22:40PM +0300, Lionel Landwerlin wrote:
>On 27/08/2020 18:09, Sowmya Kaparthi wrote:
>>This test undergoes sanity check that we are not spending more than
>>1/100th of the time awake in the kernel. The right thing would be to
>>adjust that value by the number of expected wakeups. We expect the
>>kernel time not to exceed 1/100th of the total test duration at the
>>default hrtimer of 200Hz/every5ms. Scale that by the provided hrtimer if
>>applicable.
>>
>>Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
>>Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
>>---
>>  tests/i915/perf.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>>index a894fd38..0caa9fe0 100644
>>--- a/tests/i915/perf.c
>>+++ b/tests/i915/perf.c
>>@@ -1993,6 +1993,7 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
>>  	int64_t start, end;
>>  	int n = 0;
>>+	uint64_t max_expected_kernel_ns;
>>  	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>@@ -2098,7 +2099,12 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
>>  	 */
>>  	igt_assert(n > (min_iterations + n_extra_iterations));
>>-	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>>+	if (set_kernel_hrtimer)
>>+		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
>>+					 /(5 * 1000 * 1000);
>>+	else
>>+		max_expected_kernel_ns = test_duration_ns / 100;
>>+	igt_assert(kernel_ns <= max_expected_kernel_ns);
>

Sorry, a little late to comment on this, but here it is anyways:

I agree that we should ideally scale the check so that different values 
of hrtimer can be accounted for. One of the values that should factor 
into this calculation is the average time taken by a read on a 
particular platform. For example, we saw an average 30 us on TGL and 
this was counting up to around 150 ms in kernel_ns, so test failed. That 
said, this is time taken by the cpu and I am not sure we can guarantee 
this time. If the cpu frequency is scaled, we have different values.  
Also different platforms would have different results. Unless we can 
enforce a cpu frequency from IGT and calibrate the kernel_ns for each 
platform, this check is going to be buggy.

For the *-parameterized tests alone, I would recommend not checking 
kernel_ns at all because the intent of the test is to make sure we are 
woken up a predetermined number of times for different values of 
hrtimer.

Thoughts?

Thanks,
Umesh

>
>Thanks, looks good. Just a small coding style issue.
>
>Multiline blocks in if/for/while() needs to be surrounded by {}.
>
>
>With that fixed:
>
>
>Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>
>Cheers,
>
>
>-Lionel
>
>
>>  	__perf_close(stream_fd);
>>  }
>>@@ -2152,6 +2158,7 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
>>  	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
>>  	int64_t start, end;
>>  	int n = 0;
>>+	uint64_t max_expected_kernel_ns;
>>  	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>@@ -2286,7 +2293,12 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
>>  	 */
>>  	igt_assert(n > (min_iterations + n_extra_iterations));
>>-	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>>+	if (set_kernel_hrtimer)
>>+		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
>>+					 / (5 * 1000 * 1000);
>>+	else
>>+		max_expected_kernel_ns = test_duration_ns / 100;
>>+	igt_assert(kernel_ns <= max_expected_kernel_ns);
>>  	__perf_close(stream_fd);
>>  }
>
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
