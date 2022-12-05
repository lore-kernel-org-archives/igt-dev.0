Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4CE10E0EC
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 06:10:37 +0000 (UTC)
Date: Mon, 5 Dec 2022 07:10:31 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221205071031.66f23969@maurocar-mobl2>
In-Reply-To: <20221202205705.58879-6-kamil.konieczny@linux.intel.com>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
 <20221202205705.58879-6-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] tests/i915/gem_basic: add
 multigpu-create-close subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  2 Dec 2022 21:57:03 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Add one subtest to run on more than one gpu simultanosly. For
> this to work test should be run with --device option on machine
> with two or more dgfx cards, for example with:
>=20
> --device=3Dpci:vendor=3DIntel,device=3Ddiscrete,card=3Dall
>=20
> Test will skip if only one card is present.
>=20
> Cc: Anna Karas <anna.karas@intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_basic.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 2aa5d850..9ee09782 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -40,6 +40,7 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_types.h"
> +#include "lib/igt_device_scan.h"
> =20
>  IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
> =20
> @@ -83,10 +84,16 @@ test_create_fd_close(int fd)
>  igt_main
>  {
>  	igt_fd_t(fd);
> +	int gpu_count;
> =20
> -	igt_fixture
> +	igt_fixture {
> +		int count;
>  		fd =3D drm_open_driver(DRIVER_INTEL);
> =20
> +		count =3D igt_device_filter_count();
> +		gpu_count =3D count >=3D 2 ? count : 1;

Hmm... I would just do:

		gpu_count =3D igt_device_filter_count();

As it seems that you're just wanting to ensure that gpu_count
is >=3D 1 here...

> +	}
> +
>  	igt_describe("Verify that gem_close fails with bad params.");
>  	igt_subtest("bad-close")
>  		test_bad_close(fd);
> @@ -95,6 +102,21 @@ igt_main
>  	igt_subtest("create-close")
>  		test_create_close(fd);
> =20
> +	igt_describe("Verify basic functionality of gem_create and gem_close on=
 multi-GPU.");
> +	igt_subtest("multigpu-create-close") {
> +		igt_require(gpu_count > 1);

... Yet, this is the only place where you use gpu_count. So, count <=3D 0
won't cause any troubles.

> +		igt_multi_fork(child, gpu_count) {
> +			int gpu_fd;
> +
> +			gpu_fd =3D __drm_open_driver_another(child, DRIVER_INTEL);
> +			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=3D%d\n", child, e=
rrno);
> +			test_create_close(gpu_fd);
> +			close(gpu_fd);
> +		}
> +
> +		igt_waitchildren();
> +	}
> +
>  	igt_describe("Verify that closing drm driver is possible with opened ge=
m object.");
>  	igt_subtest("create-fd-close")
>  		test_create_fd_close(fd);

Once applying this cleanup, feel free to add by RB:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro
