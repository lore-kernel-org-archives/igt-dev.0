Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C656C10E125
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 10:54:31 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 5 Jul 2023 10:54:27 +0000
Message-ID: <MW3PR11MB4748FD362BEFDDAAF6FF2BC7AE2FA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230704210530.7721-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230704210530.7721-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t] tests/xe/xe_evict: Check for memory
 availability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranj=
ana
> Vishwanathapura
> Sent: 05 July 2023 02:36
> To: igt-dev@lists.freedesktop.org
> Cc: Hellstrom, Thomas <thomas.hellstrom@intel.com>
> Subject: [igt-dev] [RFC i-g-t] tests/xe/xe_evict: Check for memory availa=
bility
>=20
> On systems with low system memory the subtests fail in various ways inclu=
ding
> returning -ENOMEM, hanging, etc.
> Ensure system has enough memory for the tests, otherwise skip it.

Instead of skipping the tests, we can update the num_bo to fit in the avail=
able memory.

>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/xe/xe_evict.c | 42 ++++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>=20
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c index
> 1a70f1b45..d28400f1c 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -454,6 +454,13 @@ static uint64_t calc_bo_size(uint64_t vram_size, int
> mul, int div)
>  	return (ALIGN(vram_size, 0x40000000)  * mul) / div;  }
>=20
> +static bool has_required_memory(uint64_t mem_size, uint64_t vram_size,
> +				int num_bos, uint64_t bo_size)
> +{
> +	/* Assume 1/2 of system memory is available to use */
> +	return (mem_size / 2 + vram_size) >=3D (num_bos * bo_size); }
I think here available VRAM size for use needs to considered instead of tot=
al VRAM size.

Thanks,
Rahul
> +
>  /**
>   * SUBTEST: evict-%s
>   * Description:  %arg[1] evict test.
> @@ -658,12 +665,13 @@ igt_main
>  			MIXED_THREADS | MULTI_VM | THREADED |
> BIND_ENGINE },
>  		{ NULL },
>  	};
> -	uint64_t vram_size;
> +	uint64_t mem_size, vram_size;
>  	int fd;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		igt_require(xe_has_vram(fd));
> +		mem_size =3D igt_get_total_ram_mb() << 20;
>  		vram_size =3D xe_vram_size(fd, 0);
>  		igt_assert(vram_size);
>=20
> @@ -673,25 +681,31 @@ igt_main
>  	}
>=20
>  	for (const struct section *s =3D sections; s->name; s++) {
> -		igt_subtest_f("evict-%s", s->name)
> -			test_evict(-1, hwe, s->n_engines, s->n_execs,
> -				   calc_bo_size(vram_size, s->mul, s->div),
> -				   s->flags, NULL);
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size =3D calc_bo_size(vram_size, s->mul, s-
> >div);
> +
> +			igt_require(has_required_memory(mem_size,
> vram_size, s->n_execs / 2, bo_size));
> +			test_evict(-1, hwe, s->n_engines, s->n_execs, bo_size,
> s->flags, NULL);
> +		}
>  	}
>=20
>  	for (const struct section_cm *s =3D sections_cm; s->name; s++) {
> -		igt_subtest_f("evict-%s", s->name)
> -			test_evict_cm(-1, hwe, s->n_engines, s->n_execs,
> -				      calc_bo_size(vram_size, s->mul, s->div),
> -				      s->flags, NULL);
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size =3D calc_bo_size(vram_size, s->mul, s-
> >div);
> +
> +			igt_require(has_required_memory(mem_size,
> vram_size, s->n_execs / 2, bo_size));
> +			test_evict(-1, hwe, s->n_engines, s->n_execs, bo_size,
> s->flags, NULL);
> +		}
>  	}
>=20
>  	for (const struct section_threads *s =3D sections_threads; s->name; s++=
) {
> -		igt_subtest_f("evict-%s", s->name)
> -			threads(-1, hwe, s->n_threads, s->n_engines,
> -				 s->n_execs,
> -				 calc_bo_size(vram_size, s->mul, s->div),
> -				 s->flags);
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size =3D calc_bo_size(vram_size, s->mul, s-
> >div);
> +
> +			igt_require(has_required_memory(mem_size,
> vram_size,
> +							s->n_threads * (s-
> >n_execs / 2), bo_size));
> +			threads(-1, hwe, s->n_threads, s->n_engines, s-
> >n_execs, bo_size, s->flags);
> +		}
>  	}
>=20
>  	igt_fixture
> --
> 2.21.0.rc0.32.g243a4c7e27
