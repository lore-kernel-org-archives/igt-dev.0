Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796AF10E7F1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 07:39:38 +0000 (UTC)
Date: Thu, 7 Dec 2023 08:39:32 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Message-ID: <20231207073932.m2ownivz33dfny5t@zkempczy-mobl2>
References: <20231205211020.226517-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231205211020.226517-1-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_create: Unthread
 create-execqueues tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 01:10:20PM -0800, Jonathan Cavitt wrote:
> The inclusion of igt_fork in the test is designed to improve performance
> by multithreading the process of execqueue creation.  However, after
> each execqueue is created on a thread, a context switch appears to occur,
> causing all the execqueues created for that thread to be stored in memory
> and all the execqueues for the other thread to be loaded.  At scale, the
> delays caused by repeated memory loads and unloads actually cause a
> reduction in performance, and as such it's actually more performant to
> create the execqueues serially rather than rely on forking.

Test is hostile and tries to mimic process concurrency on creation/deletion
of execqueues. I've observed two bad behaviors - first kernel lockup for two
minutes on 'LEAK' version (destroying execqueues is triggered by closing drm
fd). In this case system was totally unresponding but not crashed. After ~2
minutes it became responsive again. Increasing number of execqueues makes
this unresponsive time longer). Second thing is timely non-linear behavior.

So your change can't be accepted as it hides the problem described above.

Question is - what are limits we agree - MAXTIME/MAXEXECQUEUES?

--
Zbigniew

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Lucas de Marchi <lucas.demarchi@intel.com>
> CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_create.c | 51 +++++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index bbdddc7c9b..f4a80aa155 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -136,47 +136,38 @@ static uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
>  static void create_execqueues(int fd, enum exec_queue_destroy ed)
>  {
>  	struct timespec tv = { };
> -	uint32_t num_engines, exec_queues_per_process, vm;
> -	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> +	struct drm_xe_engine *engine;
> +	uint32_t num_engines, vm;
> +	int idx, err, i, seconds;
> +	uint32_t exec_queue, exec_queues[MAXEXECQUEUES];
>  
>  	fd = drm_reopen_driver(fd);
>  	num_engines = xe_number_engines(fd);
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>  
> -	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
> -	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
>  
>  	igt_nsec_elapsed(&tv);
>  
> -	igt_fork(n, nproc) {
> -		struct drm_xe_engine *engine;
> -		uint32_t exec_queue, exec_queues[exec_queues_per_process];
> -		int idx, err, i;
> -
> -		srandom(n);
> -
> -		for (i = 0; i < exec_queues_per_process; i++) {
> -			idx = rand() % num_engines;
> -			engine = xe_engine(fd, idx);
> -			err = __xe_exec_queue_create(fd, vm, &engine->instance,
> -						     0, &exec_queue);
> -			igt_debug("[%2d] Create exec_queue: err=%d, exec_queue=%u [idx = %d]\n",
> -				  n, err, exec_queue, i);
> -			if (err)
> -				break;
> -
> -			if (ed == NOLEAK)
> -				exec_queues[i] = exec_queue;
> -		}
> +	for (i = 0; i < MAXEXECQUEUES; i++) {
> +		idx = rand() % num_engines;
> +		engine = xe_engine(fd, idx);
> +		err = __xe_exec_queue_create(fd, vm, &engine->instance,
> +					     0, &exec_queue);
> +		igt_debug("Create exec_queue: err=%d, exec_queue=%u [idx = %d]\n",
> +			  err, exec_queue, i);
> +		if (err)
> +			break;
> +
> +		if (ed == NOLEAK)
> +			exec_queues[i] = exec_queue;
> +	}
>  
> -		if (ed == NOLEAK) {
> -			while (--i >= 0) {
> -				igt_debug("[%2d] Destroy exec_queue: %u\n", n, exec_queues[i]);
> -				xe_exec_queue_destroy(fd, exec_queues[i]);
> -			}
> +	if (ed == NOLEAK) {
> +		while (--i >= 0) {
> +			igt_debug("Destroy exec_queue: %u\n", exec_queues[i]);
> +			xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
>  	}
> -	igt_waitchildren();
>  
>  	xe_vm_destroy(fd, vm);
>  	drm_close_driver(fd);
> -- 
> 2.25.1
> 
