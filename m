Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72C6E978
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:57:09 +0000 (UTC)
Date: Tue, 3 Mar 2020 14:57:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20200303225708.GA13041@orsosgc001.amr.corp.intel.com>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
 <20200303223813.3866-2-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303223813.3866-2-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] test/perf: Drop caches when closing
 perf stream
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 02:38:08PM -0800, Umesh Nerlige Ramappa wrote:
>Running ./build/tests/perf will run all the perf subtests in a sequence.
>When running tests in a sequence, subsequent tests may not run with a
>clean slate. For resources that are lazily released, drop caches in
>__perf_close.

Hi Lionel, Chris,

I notice an issue on TGL when running the entire suite of perf tests.  
In my setup, the polling test was failing with invalid reports being 
seen in the beginning of the OA buffer. This issue is seen more 
prominently with the newly added subtests which call perf_open and 
perf_close a couple of times (say blocking-with-interrupt).

What I see in some runs is that the second test would result in a bunch 
of unlanded reports in the beginning of the OA buffer. Assuming that we 
are already waiting for the NOA config with a noa_wait bo, I tried to 
look into this further.

free_oa_buffer is called to free the oa_buffer bo and this work is 
deferred by the driver. If a test is called before this free completes, 
we see the issue. Just to test out this theory, if I comment out the 
free_oa_buffer entirely, I see that the tests pass without any issues 
since new gtt memory is being allocated each time.

I guess the deferred free and the new allocation of the OA buffer for 
subsequent test has something missing. Maybe TLBs not being dropped? I 
imagine the OA unit might write valid reports somewhere based on what it 
sees in the TLBs and cpu is looking for them elsewhere (until the free 
completes). Just a theory though. Let me know what you think.

For now igt_drop_caches_set(DROP_FREED) is what is helping and hence 
this patch.

Thanks,
Umesh

>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/perf.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/tests/perf.c b/tests/perf.c
>index 5e818030..189c6aa1 100644
>--- a/tests/perf.c
>+++ b/tests/perf.c
>@@ -244,6 +244,12 @@ __perf_close(int fd)
> 		close(pm_fd);
> 		pm_fd = -1;
> 	}
>+
>+	/* When running tests in a sequence, subsequent tests may not run with a
>+	 * clean slate. For resources that are lazily released, cleanup here.
>+	 */
>+	if (drm_fd >= 0 && !getgid() && !getuid())
>+		gem_quiescent_gpu(drm_fd);
> }
>
> static int
>@@ -3993,7 +3999,6 @@ test_rc6_disable(void)
> 	igt_assert_eq(n_events_end - n_events_start, 0);
>
> 	__perf_close(stream_fd);
>-	gem_quiescent_gpu(drm_fd);
>
> 	n_events_start = rc6_residency_ms();
> 	nanosleep(&(struct timespec){ .tv_sec = 1, .tv_nsec = 0 }, NULL);
>-- 
>2.20.1
>
>_______________________________________________
>igt-dev mailing list
>igt-dev@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
