Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733CC10E121
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 06:00:07 +0000 (UTC)
Date: Wed, 15 Jun 2022 08:58:07 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Yql071lV42jIAS6/@platvala-desk.ger.corp.intel.com>
References: <20220613030412.7076-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613030412.7076-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/sysfs_heartbeat_interval:
 Avoid signal delivery race
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 05:04:12AM +0200, Zbigniew Kempczyński wrote:
> As Petri noticed there's signal delivery race which might lead to
> situation when two children send SIGALRM to master process not in
> the same time. Signal from first child just awake master process
> which reinstalls previous signal handler. Second signal is then
> handled by default handler so we got process exit and failure.
> Lets move signal reinstall to moment when children will just exit.
> 
> Allocator warning which notices there's existing ipc queue is
> then an effect, not the reason. Unfortunately multiprocess start/stop
> were called in the test, not in the fixture, so test failure doesn't
> call multiprocess stop at all (and we see there's dangling queue).
> 
> Deeper look to client() implementation allows to remove multiprocess
> allocator dependency. Function runs in its own separated context
> so we don't need to arbitrate and just call intel_allocator_init()
> to become standalone allocator.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4055
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/i915/sysfs_heartbeat_interval.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
> index bc8d1b3c0a..8cebf6270f 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -364,8 +364,6 @@ static void __test_mixed(int i915, int engine,
>  	 * terminate the hog leaving the good client to run.
>  	 */
>  
> -	intel_allocator_multiprocess_start();
> -
>  	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
>  	igt_debug("Initial %s:%u\n", ATTR, saved);
>  	gem_quiescent_gpu(i915);
> @@ -375,22 +373,25 @@ static void __test_mixed(int i915, int engine,
>  
>  	set_heartbeat(engine, heartbeat);
>  
> -	igt_fork(child, 1) /* good client */
> +	igt_fork(child, 1) /* good client */ {
> +		intel_allocator_init();
>  		client(i915, engine, shared, good, 1);
> -	igt_fork(child, 1) /* bad client */
> +	}
> +	igt_fork(child, 1) /* bad client */ {
> +		intel_allocator_init();
>  		client(i915, engine, shared, bad, -EIO);
> +	}
>  
>  	old = signal(SIGALRM, sighandler);
>  	sleep(duration);
> -	signal(SIGALRM, old);
>  
>  	*shared = true;
>  	igt_waitchildren();
>  	munmap(shared, 4096);
> +	signal(SIGALRM, old);
>  
>  	gem_quiescent_gpu(i915);
>  	set_heartbeat(engine, saved);
> -	intel_allocator_multiprocess_stop();
>  }
>  
>  static void test_mixed(int i915, int engine)
> -- 
> 2.32.0
> 
