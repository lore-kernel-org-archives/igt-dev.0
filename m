Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1215A10E758
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 06:25:25 +0000 (UTC)
Date: Fri, 22 Dec 2023 07:25:21 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_create: Use separate VMs per process
Message-ID: <20231222062521.3mlfyxtn7b2bpnn6@zkempczy-mobl2>
References: <20231220153756.2171550-1-jonathan.cavitt@intel.com>
 <CH0PR11MB54447EF699999A12D73F1EDFE595A@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB54447EF699999A12D73F1EDFE595A@CH0PR11MB5444.namprd11.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 08:44:08PM +0000, Cavitt, Jonathan wrote:
> We currently exercise cross-user impact in xe_create by attempting to
> concurrently create a large number of exec queues on a single vm using
> forked child processes.  This is unrealistic, as multiple users are more
> likely to be using separate file descriptors for creating exec queues.
> 
> Update the test to reflect this use case.
> 
> v2:
> - Keep the original test path (which uses a single shared vm across
> multiple forked processes) intact, using a flag to denote which path to
> take.
> - Increase the MAXTIME in the shared vm case.
> 
> Suggested-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_create.c | 50 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 0aa32c788a..6d06708492 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -150,6 +150,11 @@ enum exec_queue_destroy {
>  	LEAK
>  };
>  
> +enum vm_count {
> +	MULTI,
> +	SHARED
> +};
> +
>  #define MAXEXECQUEUES 2048
>  #define MAXTIME 5
>  
> @@ -163,16 +168,22 @@ enum exec_queue_destroy {
>   *
>   * @noleak:				destroy exec_queues in the code
>   * @leak:				destroy exec_queues in close() path
> + * @noleak-shared:			same as noleak, but with a shared vm
> + * @leak-shared:			same as leak, but with a shared vm
>   */
> -static void create_execqueues(int fd, enum exec_queue_destroy ed)
> +static void create_execqueues(int fd, enum exec_queue_destroy ed,
> +			      enum vm_count vc)
>  {
>  	struct timespec tv = { };
>  	uint32_t num_engines, exec_queues_per_process, vm;
>  	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> +	int real_timeout = MAXTIME * (vc == SHARED ? 4 : 1);
>  
> -	fd = drm_reopen_driver(fd);
> -	num_engines = xe_number_engines(fd);
> -	vm = xe_vm_create(fd, 0, 0);
> +	if (vc == SHARED) {
> +		fd = drm_reopen_driver(fd);
> +		num_engines = xe_number_engines(fd);
> +		vm = xe_vm_create(fd, 0, 0);
> +	}
>  
>  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
>  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
> @@ -184,6 +195,12 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
>  		uint32_t exec_queue, exec_queues[exec_queues_per_process];
>  		int idx, err, i;
>  
> +		if (vc == MULTI) {
> +			fd = drm_reopen_driver(fd);
> +			num_engines = xe_number_engines(fd);
> +			vm = xe_vm_create(fd, 0, 0);
> +		}
> +
>  		srandom(n);
>  
>  		for (i = 0; i < exec_queues_per_process; i++) {
> @@ -206,16 +223,23 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  			}
>  		}
> +
> +		if (vc == MULTI) {
> +			xe_vm_destroy(fd, vm);
> +			drm_close_driver(fd);
> +		}
>  	}
>  	igt_waitchildren();
>  
> -	xe_vm_destroy(fd, vm);
> -	drm_close_driver(fd);
> +	if (vc == SHARED) {
> +		xe_vm_destroy(fd, vm);
> +		drm_close_driver(fd);
> +	}
>  
>  	seconds = igt_seconds_elapsed(&tv);
> -	igt_assert_f(seconds < MAXTIME,
> +	igt_assert_f(seconds < real_timeout,
>  		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
> -		     MAXEXECQUEUES, seconds, MAXTIME);
> +		     MAXEXECQUEUES, seconds, real_timeout);
>  }
>  
>  /**
> @@ -384,10 +408,16 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_subtest("create-execqueues-noleak")
> -		create_execqueues(xe, NOLEAK);
> +		create_execqueues(xe, NOLEAK, MULTI);
>  
>  	igt_subtest("create-execqueues-leak")
> -		create_execqueues(xe, LEAK);
> +		create_execqueues(xe, LEAK, MULTI);
> +
> +	igt_subtest("create-execqueues-noleak-shared")
> +		create_execqueues(xe, NOLEAK, SHARED);
> +
> +	igt_subtest("create-execqueues-leak-shared")
> +		create_execqueues(xe, LEAK, SHARED);
>  
>  	igt_subtest("create-massive-size") {
>  		create_massive_size(xe);
> -- 
> 2.25.1
> 

Looks good to me right now:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
