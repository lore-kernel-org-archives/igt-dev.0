Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <159059525586.30979.1718850848806311032@build.alporthouse.com>
References: <20200527131409.699882-1-chris@chris-wilson.co.uk>
 <e3ceb72a-156b-a4cf-96c7-c339ea67ffb1@linux.intel.com>
 <159059525586.30979.1718850848806311032@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159059779215.30979.18083026844038777418@build.alporthouse.com>
Date: Wed, 27 May 2020 17:43:12 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_balancer:
 Randomise bonded submission
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-05-27 17:00:55)
> Quoting Tvrtko Ursulin (2020-05-27 16:51:50)
> > 
> > On 27/05/2020 14:14, Chris Wilson wrote:
> > > +
> > > +             if (rand() % 1)
> > > +                     igt_swap(a, b);
> > > +
> > > +             batch.handle = create_semaphore_to_spinner(i915, a);
> > 
> > These will be preemptible right? More so they schedule out on semaphore 
> > interrupt straight away? So I don't see how slaves can be prevented from 
> > running because they always are on a different physical engine.
> 
> Right, as I understood your description the masters could only be on one
> engine with the bonded requests on the other.
> 
> And I don't know how to wait from the GPU other than with the
> preemptible semaphore spin. A non preemptible wait would be another
> spinner, but that would not coordinate across the bond. To reproduce the
> non-preemptible HW might require the actual instruction flow.

The most obvious way is the same igt_spin_t submitted to both engines
with a submit fence. But that still requires the CPU to terminate the
spinner. And has similarities to the existing tests.

Now we could have one spinner that counted or watched the timestamp,
looping back on itself with a predicated jump, and on completion
terminated the bonded spinner. That way we could have two
non-preemptible spinner of finite duration. But the coupling via memory
is still very loose and doesn't require both requests to be running
concurrently. Slightly better than would be to rewrite the jump target
from A and then go in another spin on A waiting for a similar update
from B. It still does not explode if either is preempted out, but more
likely to be caught spinning forever.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
