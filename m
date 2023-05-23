Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8A10E3D9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:52:42 +0000 (UTC)
Date: Tue, 23 May 2023 08:51:18 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230523085118.0cbb983d@maurocar-mobl2>
In-Reply-To: <20230523063243.669540-3-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
 <20230523063243.669540-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t V3 02/82] tests/dsc: Move dsc helpers to lib
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

On Tue, 23 May 2023 12:01:23 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> The correct place for helpers is lib as the tests directory is
> supposed to have test files, also having the helpers in tests
> dir will break the compilation of testplan. Hence move all
> helpers to library.
>=20
> Expectation is to have an executable binary for each .c file
> the "tests" dir.
>=20
> V2: - Drop special case compilation method

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  .../kms_dsc_helper.c =3D> lib/igt_dsc_helper.c   |  2 +-
>  .../kms_dsc_helper.h =3D> lib/igt_dsc_helper.h   |  0
>  lib/meson.build                                |  1 +
>  tests/i915/kms_dsc.c                           |  2 +-
>  tests/i915/kms_psr2_sf.c                       |  2 +-
>  tests/meson.build                              | 18 ++----------------
>  6 files changed, 6 insertions(+), 19 deletions(-)
>  rename tests/i915/kms_dsc_helper.c =3D> lib/igt_dsc_helper.c (99%)
>  rename tests/i915/kms_dsc_helper.h =3D> lib/igt_dsc_helper.h (100%)
>=20
> diff --git a/tests/i915/kms_dsc_helper.c b/lib/igt_dsc_helper.c
> similarity index 99%
> rename from tests/i915/kms_dsc_helper.c
> rename to lib/igt_dsc_helper.c
> index 02d1a4848..600a90746 100644
> --- a/tests/i915/kms_dsc_helper.c
> +++ b/lib/igt_dsc_helper.c
> @@ -3,7 +3,7 @@
>   * Copyright =C2=A9 2023 Intel Corporation
>   */
> =20
> -#include "kms_dsc_helper.h"
> +#include "igt_dsc_helper.h"
> =20
>  static bool force_dsc_en_orig;
>  static int force_dsc_restore_fd =3D -1;
> diff --git a/tests/i915/kms_dsc_helper.h b/lib/igt_dsc_helper.h
> similarity index 100%
> rename from tests/i915/kms_dsc_helper.h
> rename to lib/igt_dsc_helper.h
> diff --git a/lib/meson.build b/lib/meson.build
> index 2d3456577..75e52580b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -101,6 +101,7 @@ lib_sources =3D [
>  	'veboxcopy_gen12.c',
>  	'igt_msm.c',
>  	'igt_dsc.c',
> +	'igt_dsc_helper.c',
>  	'xe/xe_compute.c',
>  	'xe/xe_compute_square_kernels.c',
>  	'xe/xe_ioctl.c',
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 3ce28f848..4af48b196 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -30,7 +30,7 @@
>   *
>   */
> =20
> -#include "kms_dsc_helper.h"
> +#include "igt_dsc_helper.h"
> =20
>  IGT_TEST_DESCRIPTION("Test to validate display stream compression");
> =20
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index 4cf986440..7c21970a5 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -25,7 +25,7 @@
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_psr.h"
> -#include "kms_dsc_helper.h"
> +#include "igt_dsc_helper.h"
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> diff --git a/tests/meson.build b/tests/meson.build
> index 5d2c573d5..48e9164f8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -224,6 +224,7 @@ i915_progs =3D [
>  	'kms_ccs',
>  	'kms_cdclk',
>  	'kms_draw_crc',
> +	'kms_dsc',
>  	'kms_fb_coherency',
>  	'kms_fbcon_fbt',
>  	'kms_fence_pin_leak',
> @@ -234,6 +235,7 @@ i915_progs =3D [
>  	'kms_mmap_write_crc',
>  	'kms_pipe_b_c_ivb',
>  	'kms_psr',
> +	'kms_psr2_sf',
>  	'kms_psr2_su',
>  	'kms_psr_stress_test',
>  	'kms_pwrite_crc',
> @@ -477,22 +479,6 @@ test_executables +=3D executable('kms_color',
>  	   install : true)
>  test_list +=3D 'kms_color'
> =20
> -test_executables +=3D executable('kms_dsc',
> -	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_help=
er.c')],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list +=3D 'kms_dsc'
> -
> -test_executables +=3D executable('kms_psr2_sf',
> -	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_=
helper.c')],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list +=3D 'kms_psr2_sf'
> -
>  if chamelium.found()
>         test_executables +=3D executable('kms_chamelium_color',
>                               [ 'chamelium/kms_chamelium_color.c', 'kms_c=
olor_helper.c' ],
