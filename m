Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F2C10E150
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 08:46:22 +0000 (UTC)
Date: Thu, 23 Nov 2023 09:46:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231123084617.hp47sjac2lc35aub@kamilkon-desk.igk.intel.com>
References: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel: Do not error on -ECANCELED
 in xe_vm tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: saurabhg.gupta@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jonathan,
On 2023-11-16 at 15:43:12 -0800, Jonathan Cavitt wrote:
> In the hammer class of unbind tests in xe_vm, a thread is created that
> submits jobs to an exec queue initialized on a VM page that is later
> unbound.  Because of the unbind, a job is timing out and marking the
> exec queue as "banned", which causes all subsequent job submissions to
> report as -ECANCELED (-125).
> 
> This is expected behavior.  The test should not fail when this is the
> case, so use __xe_exec instead of the error-sensitive xe_exec in
> hammer_thread, ignoring -ECANCELED and catching all other errors
> manually.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thank you for explanation,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_vm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index f1ccd6c21d..d16bb45892 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1118,6 +1118,7 @@ static void *hammer_thread(void *tdata)
>  	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
>  	int b;
>  	int i = 0;
> +	int err = 0;
----------- ^^^

You do not need setting it to zero here, as err get value
in both if-else paths. It is minor and I will merge it with this.

Regards,
Kamil

>  
>  	sync[0].handle = syncobj_create(t->fd, 0);
>  	pthread_barrier_wait(t->barrier);
> @@ -1140,14 +1141,15 @@ static void *hammer_thread(void *tdata)
>  		exec.address = batch_addr;
>  		if (i % 32) {
>  			exec.num_syncs = 0;
> -			xe_exec(t->fd, &exec);
> +			err = __xe_exec(t->fd, &exec);
>  		} else {
>  			exec.num_syncs = 1;
> -			xe_exec(t->fd, &exec);
> +			err = __xe_exec(t->fd, &exec);
>  			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
>  						INT64_MAX, 0, NULL));
>  			syncobj_reset(t->fd, &sync[0].handle, 1);
>  		}
> +		igt_assert(!err || err == -ECANCELED);
>  		++i;
>  	}
>  
> -- 
> 2.25.1
> 
