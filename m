Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB61A10E529
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 17:23:10 +0000 (UTC)
Date: Wed, 7 Jun 2023 19:23:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230607172306.m4evsn4xueovgx5s@kamilkon-desk1>
References: <20230606123741.72759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606123741.72759-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_create: Add multiple engines
 create/destroy subtest
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

On 2023-06-06 at 14:37:41 +0200, Zbigniew Kempczyński wrote:
> Exercise basic engine concurrency create/destroy functionality.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/xe/xe_create.c | 92 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
> index ae21154646..e139cb8e7f 100644
> --- a/tests/xe/xe_create.c
> +++ b/tests/xe/xe_create.c
> @@ -88,6 +88,92 @@ static void create_invalid_size(int fd)
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
> +	uint32_t num_engines, engines_per_process, vm;
> +	int nproc = sysconf(_SC_NPROCESSORS_ONLN);
> +
> +	fd = drm_reopen_driver(fd);
> +	num_engines = xe_number_hw_engines(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +
> +	engines_per_process = max_t(uint32_t, 1, MAXENGINES / nproc);
> +	igt_debug("nproc: %u, engines per process: %u\n", nproc, engines_per_process);
> +
> +	igt_fork(n, nproc) {
> +		struct drm_xe_engine_class_instance *hwe;
> +		uint32_t engine, engines[engines_per_process];
> +		int idx, err, i;
> +
> +		for (i = 0; i < engines_per_process; i++) {
> +			idx = rand() % num_engines;
----------------------- ^
In each subprocess you will get the same numbers, is it your
intention ? You can use igt_srandom() before fork like:

	igt_srandom();
	r = rand();
	igt_fork(n, nproc) {
		...
		srandom(r + n);
		for (...) {
			idx = rand() % num_engines;
			...
		}

Regards,
Kamil

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
> +}
> +
>  /**
>   * SUBTEST: create-massive-size
>   * Description: Verifies xe bo create returns expected error code on massive
> @@ -121,6 +207,12 @@ igt_main
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
