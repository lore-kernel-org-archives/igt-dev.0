Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <209839f0-10d9-75a0-abba-2c64e57407c0@linux.intel.com>
References: <20201013094612.83843-1-tvrtko.ursulin@linux.intel.com>
 <160258345334.2946.10818279953482792145@build.alporthouse.com>
 <209839f0-10d9-75a0-abba-2c64e57407c0@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 13 Oct 2020 11:40:23 +0100
Message-ID: <160258562363.2946.637752798246613490@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Fix perf fd leak
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-10-13 11:34:11)
> 
> On 13/10/2020 11:04, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-10-13 10:46:12)
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> As it turns out opening the perf fd in group mode still produces separate
> >> file descriptors for all members of the group, which in turn need to be
> >> closed manually to avoid leaking them.
> > 
> > Hmm. That caught me by surprise, but yes while close(group) does call
> > free_event() on all its children [aiui], it will not remove the fd and
> > each event does receive its own fd. And since close(child) will call
> > into perf_event_release, we do have to keep the fd alive until the end.
> >   
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> ---
> >>   tests/i915/perf_pmu.c | 130 +++++++++++++++++++++++++-----------------
> >>   1 file changed, 78 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> >> index 873b275dca6b..6f8bec28d274 100644
> >> --- a/tests/i915/perf_pmu.c
> >> +++ b/tests/i915/perf_pmu.c
> >> @@ -475,7 +475,8 @@ busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
> >>   
> >>          end_spin(gem_fd, spin, FLAG_SYNC);
> >>          igt_spin_free(gem_fd, spin);
> >> -       close(fd[0]);
> >> +       for (i = 0; i < num_engines; i++)
> >> +               close(fd[i]);
> > 
> > close_group(fd, num_engines) ?
> 
> I am not too keen on that since there is local open_group which does not 
> operate on the fd array. Making open_group manage the array and count 
> crossed my mind but it felt a bit too much.

Ok, I was thinking I could live with the implementation asymmetry for
the semantic symmetry :)

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
[trusting in CI to do a better job validating all the extra loops]

I did ponder whether using a dup2() to prove the group was closed (and
not closed before the fixes), but that seems pointless. However maybe
something like count("/proc/self/fd") at the end to see if we've caught
all the leaks?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
