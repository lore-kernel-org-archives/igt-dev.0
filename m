Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0C6E8C9
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 18:12:30 +0000 (UTC)
Date: Tue, 7 Apr 2020 21:12:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200407181226.GM6112@intel.com>
References: <20200407163525.75416-1-jose.souza@intel.com>
 <20200407163525.75416-2-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407163525.75416-2-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 2/2] tests/kms_fbcon_fbt: Handle FBC
 enabled on fbcon in GEN9+
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

On Tue, Apr 07, 2020 at 09:35:25AM -0700, Jos=E9 Roberto de Souza wrote:
> As now kernel enables FBC on linear surfaces on GEN9+, it will allow
> FBC to be enabled on fbcon, so doing the changes he to tests this new
> case.
> =

> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_fbcon_fbt.c | 42 ++++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> =

> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index b8000a24..dba6c6b1 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -42,6 +42,7 @@ struct drm_info {
>  	int debugfs_fd;
>  	drmModeResPtr res;
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS];
> +	int devid;

uint32_t

Series is
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  };
>  =

>  static void wait_user(const char *msg)
> @@ -67,6 +68,8 @@ static void setup_drm(struct drm_info *drm)
>  		drm->connectors[i] =3D drmModeGetConnectorCurrent(drm->fd,
>  						drm->res->connectors[i]);
>  =

> +	drm->devid =3D intel_get_drm_devid(drm->fd);
> +
>  	kmstest_set_vt_graphics_mode();
>  }
>  =

> @@ -139,19 +142,30 @@ static bool fbc_wait_until_disabled(int debugfs_fd)
>  	return r;
>  }
>  =

> -static bool fbc_wait_until_update(int debugfs)
> +static bool fbc_not_compressing_enabled(int debugfs_fd)
> +{
> +	char buf[128];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
> +				sizeof(buf));
> +	return strstr(buf, "FBC enabled\nCompressing: no");
> +}
> +
> +static bool fbc_wait_until_update(struct drm_info *drm)
>  {
>  	/*
> -	 * FBC is not expected to be enabled because fbcon do not uses a tiled
> -	 * framebuffer so a fence can not be setup on the framebuffer and FBC
> -	 * code requires a fence to accurate track frontbuffer modifications
> -	 * (what maybe is not necessary anymore as we now have
> -	 * intel_fbc_invalidate()/flush()).
> +	 * As now kernel enables FBC on linear surfaces on GEN9+, check if the
> +	 * fbcon cursor blinking is causing the FBC to uncompress the
> +	 * framebuffer.
>  	 *
> -	 * If one day fbcon starts to use a tiled framebuffer we would need to
> -	 * check the 'Compressing' status as in each blink it would be disabled.
> +	 * For older GENs FBC is still expected to be disabled as it still
> +	 * relies on a tiled and fenceable framebuffer to track modifications.
>  	 */
> -	return fbc_wait_until_disabled(debugfs);
> +	if (AT_LEAST_GEN(drm->devid, 9))
> +		return igt_wait(fbc_not_compressing_enabled(drm->debugfs_fd),
> +				2500, 1);
> +	else
> +		return fbc_wait_until_disabled(drm->debugfs_fd);
>  }
>  =

>  typedef bool (*connector_possible_fn)(drmModeConnectorPtr connector);
> @@ -220,9 +234,9 @@ static bool psr_supported_on_chipset(int debugfs_fd)
>  	return psr_sink_support(debugfs_fd, PSR_MODE_1);
>  }
>  =

> -static bool psr_wait_until_update(int debugfs_fd)
> +static bool psr_wait_until_update(struct drm_info *drm)
>  {
> -	return psr_long_wait_update(debugfs_fd, PSR_MODE_1);
> +	return psr_long_wait_update(drm->debugfs_fd, PSR_MODE_1);
>  }
>  =

>  static void disable_features(int debugfs_fd)
> @@ -245,7 +259,7 @@ static inline void psr_debugfs_enable(int debugfs_fd)
>  struct feature {
>  	bool (*supported_on_chipset)(int debugfs_fd);
>  	bool (*wait_until_enabled)(int debugfs_fd);
> -	bool (*wait_until_update)(int debugfs_fd);
> +	bool (*wait_until_update)(struct drm_info *drm);
>  	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
>  	void (*enable)(int debugfs_fd);
>  } fbc =3D {
> @@ -295,13 +309,13 @@ static void subtest(struct drm_info *drm, struct fe=
ature *feature, bool suspend)
>  	sleep(3);
>  =

>  	wait_user("Back to fbcon.");
> -	igt_assert(feature->wait_until_update(drm->debugfs_fd));
> +	igt_assert(feature->wait_until_update(drm));
>  =

>  	if (suspend) {
>  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>  					      SUSPEND_TEST_NONE);
>  		sleep(5);
> -		igt_assert(feature->wait_until_update(drm->debugfs_fd));
> +		igt_assert(feature->wait_until_update(drm));
>  	}
>  }
>  =

> -- =

> 2.26.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
