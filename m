Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24F76E506
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2020 08:32:21 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
References: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159065473787.10651.11945936826512697957@build.alporthouse.com>
Date: Thu, 28 May 2020 09:32:17 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_fence: Reduce
 non-preemptible workload
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dominik Grzegorzek (2020-05-28 09:27:37)
> Non-preemptible spinners should be avoided as often as possible.
> gem_exec_fence@[basic-await, nb-await] has no reason to use non-preemptible
> workload, only hanging subtests need it.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/i915/gem_exec_fence.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index ad22f9f5..d70e73a2 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -344,9 +344,10 @@ static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
>  
>         spin = igt_spin_new(fd,
>                             .engine = e->flags,
> -                           .flags = (IGT_SPIN_FENCE_OUT |
> +                           .flags = IGT_SPIN_FENCE_OUT |
> +                                    (flags & HANG ?
>                                       IGT_SPIN_NO_PREEMPTION |
> -                                     (flags & HANG ? IGT_SPIN_INVALID_CS : 0)));
> +                                     IGT_SPIN_INVALID_CS : 0));

So this would now allow a request on the same engine to be timesliced
ahead of the signaler, if the fencing was broken. Ok. (Not that it makes
much difference, any timeslicing engine has other engines on which the
waiters may bypass the signaler.)

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
