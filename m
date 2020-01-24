Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200124121759.22308-2-tvrtko.ursulin@linux.intel.com>
References: <20200124121759.22308-1-tvrtko.ursulin@linux.intel.com>
 <20200124121759.22308-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <157986872522.2524.9769178618376317607@skylake-alporthouse-com>
Date: Fri, 24 Jan 2020 12:25:25 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_exec_parallel:Set
 engine map to default context
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

Quoting Tvrtko Ursulin (2020-01-24 12:17:59)
> From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
> 
> Set the potential engine map of the parent client's default
> context to the newly created DRM client's default context.
> Without doing so there is a mismatch between the intended
> and actual engine used by the *-fds subtests.
> 
> v2: Fix FDS flags check
> 
> Tvrtko:
> v3: Use new helper gem_context_copy_engines.
> 
> Signed-off-by: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  tests/i915/gem_exec_parallel.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index cfbe78070873..0d4d6c6283e0 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -83,10 +83,12 @@ static void *thread(void *data)
>                 pthread_cond_wait(t->cond, t->mutex);
>         pthread_mutex_unlock(t->mutex);
>  
> -       if (t->flags & FDS)
> +       if (t->flags & FDS) {
>                 fd = drm_open_driver(DRIVER_INTEL);
> -       else
> +               gem_context_copy_engines(t->fd, 0, fd, 0);

Makes sense,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
