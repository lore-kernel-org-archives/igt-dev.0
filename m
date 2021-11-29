Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEC66F428
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 10:30:55 +0000 (UTC)
Message-ID: <b4f66160-c947-1c47-5788-8a0d69f9bc48@linux.intel.com>
Date: Mon, 29 Nov 2021 10:30:51 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211126015735.908681-1-mastanx.katragadda@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211126015735.908681-1-mastanx.katragadda@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mastan Katragadda <mastanx.katragadda@intel.com>, igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


On 26/11/2021 01:57, Mastan Katragadda wrote:
> This a known failure when running igt@gem_exec_balancer@bonded-(dual|pair|sync)
> tests with GuC submission.The hang is expected with GuC submission since the
> test was written to expect execlist scheduling hence added skip if Guc
> submission enabled.

Looking at the test I don't see anything backend specific. Can you 
provide an explanation of how and why it hangs?

Regards,

Tvrtko

> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> ---
>   tests/i915/gem_exec_balancer.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index cc07a5a9..d58734ab 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -3320,6 +3320,7 @@ igt_main
>   
>   	igt_subtest_group {
>   		igt_fixture {
> +			igt_require(!gem_using_guc_submission(i915));
>   			intel_allocator_multiprocess_start();
>   		}
>   
> 
