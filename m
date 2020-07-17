Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <d92eb09d-788f-784a-9784-f2500daf9964@linux.intel.com>
References: <20200716204448.737869-1-chris@chris-wilson.co.uk>
 <d92eb09d-788f-784a-9784-f2500daf9964@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 17 Jul 2020 11:19:16 +0100
Message-ID: <159498115632.13677.3761366228685182736@build.alporthouse.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_balancer:
 Race breadcrumb signaling against timeslicing
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-07-17 09:34:07)
> 
> On 16/07/2020 21:44, Chris Wilson wrote:
> I am not sure if the batch duration is not too short in practice, the 
> add loop will really rapidly end all, just needs 64 iterations on 
> average to end all 32 I think. So 64 WC writes from the CPU compared to 
> CSB processing and breadcrumb signaling latencies might be too short. 
> Maybe some small random udelays in the loop would be more realistic. 
> Maybe as a 2nd flavour of the test just in case.. more coverage the better.

GPU			kernel			IGT
semaphore wait
  -> raise interrupt
			handle interrupt
			  -> kick tasklet
			begin preempt-to-busy   semaphore signal
semaphore completes
request completes
			submit new ELSP[]
			  -> stale unwound request

Duration of the batch/semaphore itself doesn't really factor into it,
it's that we have to let batch complete after we begin the process of
scheduling it out for an expired timeslice. It's such a small window and
I don't see a good way of hitting it reliably from userspace.

With some printk, I was able to confirm that we were timeslicing virtual
requests and moving them between engines with active breadcrumbs. But I
never once saw any of the bugs with the stale requests, using this test.

Somehow we want to length the preempt-to-busy window and coincide the
request completion at the same time. So far all I have is yucky (too
single purpose, we would be better off writing unit tests for each of
the steps involved).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
