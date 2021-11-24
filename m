Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092A26E92F
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 11:20:59 +0000 (UTC)
Date: Wed, 24 Nov 2021 13:20:01 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZ4f4QE0ZabisSQl@platvala-desk.ger.corp.intel.com>
References: <20211123171008.83565-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211123171008.83565-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Disable
 Intel's PSR2 selective fetch in this test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 23, 2021 at 09:10:08AM -0800, Jos=E9 Roberto de Souza wrote:
> When doing a primary or sprite plane flip, PSR2 selective fetch code
> also adds all the planes including cursor that overlaps with the
> area being updated, so this causes legacy cursor API calls to
> wait for a pending atomic commit to finish causing tests that do
> checks with vblank counters.
>=20
> So here when running in an Intel platform that has PSR2 selective
> fetch enabled, it will switch to PSR1 before executing the subtests.
> Because what this whole test mostly wants to do, is check if userspace
> can do asynchronous cursors updates.
>=20
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2346
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jouni Hogander <jouni.hogander@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/igt_psr.c             | 31 +++++++++++++++++++++++++++++++
>  lib/igt_psr.h             |  2 ++
>  tests/kms_cursor_legacy.c | 10 ++++++++++
>  3 files changed, 43 insertions(+)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 8fa8b192f..554fe243c 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -280,3 +280,34 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
> =20
>  	return ret;
>  }
> +
> +/*
> + * Check if PSR2 selective fetch is enabled, if yes switch to PSR1 and r=
eturn
> + * true otherwise return false.
> + */
> +bool i915_psr2_selective_fetch_disable(int drm_fd)
> +{
> +	int debugfs_fd;
> +	bool ret =3D false;
> +
> +	if (!is_i915_device(drm_fd))
> +		return ret;
> +
> +	debugfs_fd =3D igt_debugfs_dir(drm_fd);
> +	if (psr2_selective_fetch_check(debugfs_fd)) {
> +		psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
> +		ret =3D true;
> +	}
> +
> +	close(debugfs_fd);
> +	return ret;
> +}
> +
> +void i915_psr2_selective_fetch_restore(int drm_fd)
> +{
> +	int debugfs_fd;
> +
> +	debugfs_fd =3D igt_debugfs_dir(drm_fd);
> +	psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
> +	close(debugfs_fd);
> +}

New functions in lib, so real docs for them please.


--=20
Petri Latvala



> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index a075f336d..0f60a1011 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -48,5 +48,7 @@ bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_bloc=
ks);
>  void psr_print_debugfs(int debugfs_fd);
> =20
>  bool i915_psr2_selective_fetch_check(int drm_fd);
> +bool i915_psr2_selective_fetch_disable(int drm_fd);
> +void i915_psr2_selective_fetch_restore(int drm_fd);
> =20
>  #endif
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index cd2f84984..e2490902e 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -27,6 +27,7 @@
> =20
>  #include "i915/gem.h"
>  #include "igt.h"
> +#include "igt_psr.h"
>  #include "igt_rand.h"
>  #include "igt_stats.h"
> =20
> @@ -1421,6 +1422,7 @@ igt_main
>  {
>  	const int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
>  	igt_display_t display =3D { .drm_fd =3D -1 };
> +	bool intel_psr2_restore =3D false;
>  	int i;
> =20
>  	igt_fixture {
> @@ -1428,6 +1430,12 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
> =20
>  		igt_display_require(&display, display.drm_fd);
> +		/*
> +		 * Not possible to evade vblank after a primary or sprite plane
> +		 * page flip with cursor legacy APIS when Intel's PSR2 selective
> +		 * fetch is enabled, so switching PSR1 for this whole test.
> +		 */
> +		intel_psr2_restore =3D i915_psr2_selective_fetch_disable(display.drm_f=
d);
>  	}
> =20
>  	/*Test description for pipe-* and all-pipe-* tests*/
> @@ -1609,6 +1617,8 @@ igt_main
>  		}
> =20
>  	igt_fixture {
> +		if (intel_psr2_restore)
> +			i915_psr2_selective_fetch_restore(display.drm_fd);
>  		igt_display_fini(&display);
>  	}
>  }
> --=20
> 2.34.0
>=20
