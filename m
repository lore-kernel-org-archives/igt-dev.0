Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F56EF2B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2020 15:02:03 +0000 (UTC)
Date: Wed, 29 Apr 2020 18:01:17 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200429150117.GE5618@ideak-desk.fi.intel.com>
References: <20200408201925.31566-1-jose.souza@intel.com>
 <20200408201925.31566-2-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408201925.31566-2-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_fbcon_fbt: Reduce
 execution time by not calling wait_until_enabled()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 01:19:25PM -0700, Jos=E9 Roberto de Souza wrote:
> After unset all CRTCs is expected that FBC and PSR is disabled,
> calling wait_until_enabled() will make it wait until timeout to it
> return false and pass the test.
> =

> So instead lets implement is_disabled() hook, as the
> kmstest_unset_all_crtcs() is a synchronous call, the features will
> be already disabled after it, so no need to do any wait.
> =

> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  lib/igt_psr.c         | 10 ++++++++++
>  lib/igt_psr.h         |  1 +
>  tests/kms_fbcon_fbt.c | 21 ++++++++++++++++++++-
>  3 files changed, 31 insertions(+), 1 deletion(-)
> =

> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 83ccacdd..f92eff6c 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -25,6 +25,16 @@
>  #include "igt_sysfs.h"
>  #include <errno.h>
>  =

> +bool psr_disabled_check(int debugfs_fd)
> +{
> +	char buf[PSR_STATUS_MAX_LEN];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> +				sizeof(buf));
> +
> +	return strstr(buf, "PSR mode: disabled\n");
> +}
> +
>  static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
>  {
>  	char buf[PSR_STATUS_MAX_LEN];
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index ca385736..02ce760b 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -35,6 +35,7 @@ enum psr_mode {
>  	PSR_MODE_2
>  };
>  =

> +bool psr_disabled_check(int debugfs_fd);
>  bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
>  bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
>  bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index 546dff99..143be3e3 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -135,6 +135,14 @@ static bool fbc_wait_until_enabled(int debugfs_fd)
>  	return r;
>  }
>  =

> +static bool fbc_is_disabled(int debugfs_fd)
> +{
> +	bool r =3D fbc_check_status(debugfs_fd, false);
> +
> +	fbc_print_status(debugfs_fd);
> +	return r;
> +}
> +
>  static bool fbc_wait_until_disabled(int debugfs_fd)
>  {
>  	bool r =3D igt_wait(fbc_check_status(debugfs_fd, false), 5000, 1);
> @@ -250,6 +258,14 @@ static bool psr_wait_until_enabled(int debugfs_fd)
>  	return r;
>  }
>  =

> +static bool psr_is_disabled(int debugfs_fd)
> +{
> +	bool r =3D psr_disabled_check(debugfs_fd);
> +
> +	psr_print_status(debugfs_fd);
> +	return r;
> +}
> +
>  static bool psr_supported_on_chipset(int debugfs_fd)
>  {
>  	return psr_sink_support(debugfs_fd, PSR_MODE_1);
> @@ -280,18 +296,21 @@ static inline void psr_debugfs_enable(int debugfs_f=
d)
>  struct feature {
>  	bool (*supported_on_chipset)(int debugfs_fd);
>  	bool (*wait_until_enabled)(int debugfs_fd);
> +	bool (*is_disabled)(int debugfs_fd);
>  	bool (*wait_until_update)(struct drm_info *drm);
>  	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
>  	void (*enable)(int debugfs_fd);
>  } fbc =3D {
>  	.supported_on_chipset =3D fbc_supported_on_chipset,
>  	.wait_until_enabled =3D fbc_wait_until_enabled,
> +	.is_disabled =3D fbc_is_disabled,
>  	.wait_until_update =3D fbc_wait_until_update,
>  	.connector_possible_fn =3D connector_can_fbc,
>  	.enable =3D fbc_modparam_enable,
>  }, psr =3D {
>  	.supported_on_chipset =3D psr_supported_on_chipset,
>  	.wait_until_enabled =3D psr_wait_until_enabled,
> +	.is_disabled =3D psr_is_disabled,
>  	.wait_until_update =3D psr_wait_until_update,
>  	.connector_possible_fn =3D connector_can_psr,
>  	.enable =3D psr_debugfs_enable,
> @@ -310,7 +329,7 @@ static void subtest(struct drm_info *drm, struct feat=
ure *feature, bool suspend)
>  =

>  	kmstest_unset_all_crtcs(drm->fd, drm->res);
>  	wait_user("Modes unset.");
> -	igt_assert(!feature->wait_until_enabled(drm->debugfs_fd));
> +	igt_assert(feature->is_disabled(drm->debugfs_fd));
>  =

>  	set_mode_for_one_screen(drm, &fb, feature->connector_possible_fn);
>  	wait_user("Screen set.");
> -- =

> 2.26.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
