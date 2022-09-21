Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A821210E95C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 13:58:06 +0000 (UTC)
Date: Wed, 21 Sep 2022 15:58:01 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20220921155801.13c2de96@maurocar-mobl2>
In-Reply-To: <20220921102940.15121-2-kamil.konieczny@linux.intel.com>
References: <20220921102940.15121-1-kamil.konieczny@linux.intel.com>
 <20220921102940.15121-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH RFC i-g-t v1 1/2] tests/i915/gem_basic:
 convert to multithreaded multi-GPUs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Wed, 21 Sep 2022 12:29:39 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> This will convert basic tests to run on multi-GPU hardware
> configuration. It will take effect when --device option will be
> used and at least two devices will be found with a filter. When
> there are no filtered ones or there is only one, tests will
> fall through to old run.
>=20
> One method for use will be to extend filtered devices with '*'
> or regex:
>=20
> sudo ./gem_basic --device=3Dpci:vendor=3Dintel,device=3Ddiscrete,card=3D*
>=20
> Pros: no change in tests names, no new tests added. Use restricted
> to runs with suitable hw config.
>=20
> Cons: it can be hard to replicate failed tests or it can break
> igt-framework in compliated use cases. It is also not clear how
> to change this solution into clean macro for reuse.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Anna Karas <anna.karas@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_basic.c | 71 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 65 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 17ae190c..66413e60 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -38,6 +38,7 @@
> =20
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +#include "igt_device_scan.h"
> =20
>  IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
> =20
> @@ -48,6 +49,7 @@ test_bad_close(int fd)
>  	int ret;
> =20
>  	igt_info("Testing error return on bad close ioctl.\n");
> +	igt_info("%s: pid: %d, tid: %lu, CPU: %d\n", __func__, getpid(), pthrea=
d_self(), sched_getcpu());

Hmm... perhaps we should add pid at igt_info(), for multi-GPU scenarios, e.=
 g.
when IGT was asked to run with more than one GPUs.

Not sure if it makes sense to display tid/CPU here.

> =20
>  	close_bo.handle =3D 0x10101010;
>  	ret =3D ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
> @@ -61,6 +63,7 @@ test_create_close(int fd)
>  	uint32_t handle;
> =20
>  	igt_info("Testing creating and closing an object.\n");
> +	igt_info("%s: pid: %d, tid: %lu, CPU: %d\n", __func__, getpid(), pthrea=
d_self(), sched_getcpu());
> =20
>  	handle =3D gem_create(fd, 16*1024);
> =20
> @@ -71,6 +74,7 @@ static void
>  test_create_fd_close(int fd)
>  {
>  	igt_info("Testing closing with an object allocated.\n");
> +	igt_info("%s: pid: %d, tid: %lu, CPU: %d\n", __func__, getpid(), pthrea=
d_self(), sched_getcpu());
> =20
>  	gem_create(fd, 16*1024);
>  	/* leak it */
> @@ -78,6 +82,49 @@ test_create_fd_close(int fd)
>  	close(fd);
>  }
> =20
> +struct multi_gpu_data {
> +	int in_fd;
> +	void (*fn)(int fd);
> +};
> +
> +static void *run_on_one_gpu(void *pdata)
> +{
> +	struct multi_gpu_data *pgpu =3D pdata;
> +
> +	(pgpu->fn)(pgpu->in_fd);
> +
> +	return NULL;
> +}
> +
> +static void run_on_gpus(void (*fn)(int))
> +{
> +	struct multi_gpu_data *in_arr;
> +	pthread_t *pth;
> +	int size =3D igt_device_filter_count();
> +
> +	in_arr =3D calloc(size, sizeof(struct multi_gpu_data));
> +	igt_assert(!in_arr);
> +
> +	pth =3D calloc(size, sizeof(pthread_t));
> +	igt_assert(!pth);
> +
> +	igt_info("pid: %d, running on %d GPUs\n", getpid(), size);
> +
> +	for (int i =3D 0; i < size; ++i) {
> +		in_arr[i].in_fd =3D __drm_open_driver_another(i, DRIVER_ANY);
> +		in_arr[i].fn =3D fn;
> +	}
> +
> +	for (int i =3D 0; i < size; ++i)
> +		pthread_create(pth + i, 0, run_on_one_gpu, in_arr + i);
> +
> +	for (int i =3D 0; i < size; ++i)
> +		pthread_join(pth[i], NULL);
> +
> +	free(in_arr);
> +	free(pth);
> +}
> +

Interesting approach, but having to add the same function on all tests that
will run with multi-GPU seems too much work. We need to add the logic at
the library, if possible using some macro/inline based solution, as Anna
proposed.

>  int fd;
> =20
>  igt_main
> @@ -86,14 +133,26 @@ igt_main
>  		fd =3D drm_open_driver(DRIVER_INTEL);
> =20
>  	igt_describe("Verify that gem_close fails with bad params.");
> -	igt_subtest("bad-close")
> -		test_bad_close(fd);
> +	igt_subtest("bad-close") {
> +		if (igt_device_filter_count() < 2)
> +			test_bad_close(fd);
> +		else
> +			run_on_gpus(test_bad_close);
> +	}
> =20
>  	igt_describe("Verify basic functionality of gem_create and gem_close.");
> -	igt_subtest("create-close")
> -		test_create_close(fd);
> +	igt_subtest("create-close") {
> +		if (igt_device_filter_count() < 2)
> +			test_create_close(fd);
> +		else
> +			run_on_gpus(test_create_close);
> +	}
> =20
>  	igt_describe("Verify that closing drm driver is possible with opened ge=
m object.");
> -	igt_subtest("create-fd-close")
> -		test_create_fd_close(fd);
> +	igt_subtest("create-fd-close") {
> +		if (igt_device_filter_count() < 2)
> +			test_create_fd_close(fd);
> +		else
> +			run_on_gpus(test_create_fd_close);
> +	}
>  }

Regards,
Mauro
