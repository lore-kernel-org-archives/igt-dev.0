Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20201013094612.83843-1-tvrtko.ursulin@linux.intel.com>
References: <20201013094612.83843-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 13 Oct 2020 11:04:13 +0100
Message-ID: <160258345334.2946.10818279953482792145@build.alporthouse.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] i915/perf_pmu: Fix perf fd
 leak
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-10-13 10:46:12)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> As it turns out opening the perf fd in group mode still produces separate
> file descriptors for all members of the group, which in turn need to be
> closed manually to avoid leaking them.

Hmm. That caught me by surprise, but yes while close(group) does call
free_event() on all its children [aiui], it will not remove the fd and
each event does receive its own fd. And since close(child) will call
into perf_event_release, we do have to keep the fd alive until the end.
 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  tests/i915/perf_pmu.c | 130 +++++++++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 52 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 873b275dca6b..6f8bec28d274 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -475,7 +475,8 @@ busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
>  
>         end_spin(gem_fd, spin, FLAG_SYNC);
>         igt_spin_free(gem_fd, spin);
> -       close(fd[0]);
> +       for (i = 0; i < num_engines; i++)
> +               close(fd[i]);

close_group(fd, num_engines) ?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
