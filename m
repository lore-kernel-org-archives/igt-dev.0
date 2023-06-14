Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BAA891CC
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 08:45:33 +0000 (UTC)
Date: Wed, 14 Jun 2023 10:45:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614084528.yj2mbvdpnmbgpdli@kamilkon-desk1>
References: <20230612055502.473370-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612055502.473370-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/xe_create: Add multiple
 engines create/destroy subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,
On 2023-06-12 at 07:55:02 +0200, Zbigniew Kempczyński wrote:
> Exercise basic engine concurrency create/destroy functionality.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Lgtm,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> 
> v2: use different random seeds in children to avoid same engine
>     pattern selection (Kamil)
>     check execution time and report failure if it's too long (Kamil)
> v3: drop variable (Kamil)
> ---
>  tests/xe/xe_create.c | 103 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
> index ae21154646..b427c51fd5 100644
> --- a/tests/xe/xe_create.c
> +++ b/tests/xe/xe_create.c
> @@ -88,6 +88,103 @@ static void create_invalid_size(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +enum engine_destroy {
> +	NOLEAK,
> +	LEAK
> +};
> +
> +static uint32_t __xe_engine_create(int fd, uint32_t vm,
> +				   struct drm_xe_engine_class_instance *instance,
> +				   uint64_t ext,
> +				   uint32_t *enginep)
> +{
> +	struct drm_xe_engine_create create = {
> +		.extensions = ext,
> +		.vm_id = vm,
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(instance),
> +	};
> +	int err = 0;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create) == 0) {
> +		*enginep = create.engine_id;
> +	} else {
> +		igt_warn("Can't create engine, errno: %d\n", errno);
> +		err = -errno;
> +		igt_assume(err);
> +	}
> +	errno = 0;
> +
> +	return err;
> +}
> +
> +#define MAXENGINES 2048
> +#define MAXTIME 2
> +
> +/**
> + * SUBTEST: create-engines-%s
> + * Description: Check process ability of multiple engines creation
> + * Run type: FULL
> + *
> + * arg[1]:
> + *
> + * @noleak:				destroy engines in the code
> + * @leak:				destroy engines in close() path
> + */
> +static void create_engines(int fd, enum engine_destroy ed)
> +{
> +	struct timespec tv = { };
> +	uint32_t num_engines, engines_per_process, vm;
> +	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> +
> +	fd = drm_reopen_driver(fd);
> +	num_engines = xe_number_hw_engines(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +
> +	engines_per_process = max_t(uint32_t, 1, MAXENGINES / nproc);
> +	igt_debug("nproc: %u, engines per process: %u\n", nproc, engines_per_process);
> +
> +	igt_nsec_elapsed(&tv);
> +
> +	igt_fork(n, nproc) {
> +		struct drm_xe_engine_class_instance *hwe;
> +		uint32_t engine, engines[engines_per_process];
> +		int idx, err, i;
> +
> +		srandom(n);
> +
> +		for (i = 0; i < engines_per_process; i++) {
> +			idx = rand() % num_engines;
> +			hwe = xe_hw_engine(fd, idx);
> +			err = __xe_engine_create(fd, vm, hwe, 0, &engine);
> +			igt_debug("[%2d] Create engine: err=%d, engine=%u [idx = %d]\n",
> +				  n, err, engine, i);
> +			if (err)
> +				break;
> +
> +			if (ed == NOLEAK)
> +				engines[i] = engine;
> +		}
> +
> +		if (ed == NOLEAK) {
> +			while (--i >= 0) {
> +				igt_debug("[%2d] Destroy engine: %u\n", n, engines[i]);
> +				xe_engine_destroy(fd, engines[i]);
> +			}
> +		}
> +	}
> +	igt_waitchildren();
> +
> +	xe_vm_destroy(fd, vm);
> +	close(fd);
> +
> +	seconds = igt_seconds_elapsed(&tv);
> +	igt_assert_f(seconds < MAXTIME,
> +		     "Creating %d engines tooks too long: %d [limit: %d]\n",
> +		     MAXENGINES, seconds, MAXTIME);
> +}
> +
>  /**
>   * SUBTEST: create-massive-size
>   * Description: Verifies xe bo create returns expected error code on massive
> @@ -121,6 +218,12 @@ igt_main
>  		create_invalid_size(xe);
>  	}
>  
> +	igt_subtest("create-engines-noleak")
> +		create_engines(xe, NOLEAK);
> +
> +	igt_subtest("create-engines-leak")
> +		create_engines(xe, LEAK);
> +
>  	igt_subtest("create-massive-size") {
>  		create_massive_size(xe);
>  	}
> -- 
> 2.34.1
> 
