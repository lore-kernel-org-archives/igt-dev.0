Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AEA6ED8F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 15:11:32 +0000 (UTC)
Date: Thu, 4 Feb 2021 17:11:28 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YBwOoJ1ptEeFIyY1@platvala-desk.ger.corp.intel.com>
References: <20210204140841.15972-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204140841.15972-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Enable selective
 fetch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 06:08:41AM -0800, Jos=E9 Roberto de Souza wrote:
> Reload driver enabling PSR2 selective fetch to start to have
> some tests coverage of this feature by CI.
> =

> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_psr2_sf.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> =

> diff --git a/tests/kms_psr2_sf.c b/tests/kms_psr2_sf.c
> index 296ed8476..751d6ff03 100644
> --- a/tests/kms_psr2_sf.c
> +++ b/tests/kms_psr2_sf.c
> @@ -24,6 +24,7 @@
>  =

>  #include "igt.h"
>  #include "igt_sysfs.h"
> +#include "igt_kmod.h"
>  #include "igt_psr.h"
>  #include <errno.h>
>  #include <stdbool.h>
> @@ -544,6 +545,14 @@ static void cleanup(data_t *data)
>  	igt_remove_fb(data->drm_fd, &data->fb_test);
>  }
>  =

> +static void reload_driver(bool enable_sel_fetch)
> +{
> +	const char *params =3D enable_sel_fetch ? "enable_psr2_sel_fetch=3D1" :=
 "";
> +
> +	igt_i915_driver_unload();
> +	igt_assert_eq(igt_i915_driver_load(params), 0);
> +}


Does this parameter need to be set at load time or would igt_params_set() s=
uffice?


-- =

Petri Latvala



> +
>  igt_main
>  {
>  	data_t data =3D {};
> @@ -552,6 +561,9 @@ igt_main
>  	igt_fixture {
>  		int r;
>  =

> +		/* TODO: drop this as soon driver enables it by default */
> +		reload_driver(true);
> +
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
>  		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
> @@ -645,5 +657,7 @@ igt_main
>  		close(data.debugfs_fd);
>  		drm_intel_bufmgr_destroy(data.bufmgr);
>  		display_fini(&data);
> +
> +		reload_driver(false);
>  	}
>  }
> -- =

> 2.30.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
