Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9C66E5CD
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 18:32:33 +0000 (UTC)
Date: Thu, 19 Nov 2020 10:32:25 -0800
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
Message-ID: <20201119183225.GA21281@InViCtUs>
References: <20201103013304.128195-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103013304.128195-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/fbcon: Skip test if fbcon modeset
 if not compatible with feature tested
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

On Mon, Nov 02, 2020 at 05:33:04PM -0800, Jos=E9 Roberto de Souza wrote:
> IGT has no control of what is going to be the modeset of fbcon and as
> it could set a mode that is not compatible with the feature being
> tested lets check for those incompatibilities and skip the test if
> needed.
> =

> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/2327
LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

-RK
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_fbcon_fbt.c | 47 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> =

> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index e99a1f2f2..4df4db521 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -255,6 +255,48 @@ static inline void psr_debugfs_enable(int device, in=
t debugfs_fd)
>  	psr_enable(device, debugfs_fd, PSR_MODE_1);
>  }
>  =

> +static void fbc_skips_on_fbcon(int debugfs_fd)
> +{
> +	const char *reasons[] =3D {
> +		"incompatible mode",
> +		"mode too large for compression",
> +		"framebuffer not tiled or fenced",
> +		"pixel format is invalid",
> +		"rotation unsupported",
> +		"tiling unsupported",
> +		"framebuffer stride not supported",
> +		"per-pixel alpha blending is incompatible with FBC",
> +		"pixel rate is too big",
> +		"CFB requirements changed",
> +		"plane Y offset is misaligned",
> +		"plane height + offset is non-modulo of 4"
> +	};
> +	bool skip =3D false;
> +	char buf[128];
> +	int i;
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf, sizeof(buf)=
);
> +	if (strstr(buf, "FBC enabled\n"))
> +		return;
> +
> +	for (i =3D 0; skip =3D=3D false && i < ARRAY_SIZE(reasons); i++)
> +		skip =3D strstr(buf, reasons[i]);
> +
> +	if (skip)
> +		igt_skip("fbcon modeset is not compatible with FBC\n");
> +}
> +
> +static void psr_skips_on_fbcon(int debugfs_fd)
> +{
> +	/*
> +	 * Unless fbcon enables interlaced mode all other PSR restrictions
> +	 * will be caught and skipped in supported_on_chipset() hook.
> +	 * As PSR don't expose in debugfs why it is not enabling for now
> +	 * not checking not even if it was not enabled because of interlaced
> +	 * mode, if some day it happens changes will be needed first.
> +	 */
> +}
> +
>  struct feature {
>  	bool (*supported_on_chipset)(int device, int debugfs_fd);
>  	bool (*wait_until_enabled)(int debugfs_fd);
> @@ -262,6 +304,8 @@ struct feature {
>  	bool (*wait_until_update)(struct drm_info *drm);
>  	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
>  	void (*enable)(int device, int debugfs_fd);
> +	/* skip test if feature can't be enabled due fbcon modeset */
> +	void (*skips_on_fbcon)(int debugfs_fd);
>  } fbc =3D {
>  	.supported_on_chipset =3D fbc_supported_on_chipset,
>  	.wait_until_enabled =3D fbc_wait_until_enabled,
> @@ -269,6 +313,7 @@ struct feature {
>  	.wait_until_update =3D fbc_wait_until_update,
>  	.connector_possible_fn =3D connector_can_fbc,
>  	.enable =3D fbc_modparam_enable,
> +	.skips_on_fbcon =3D fbc_skips_on_fbcon,
>  }, psr =3D {
>  	.supported_on_chipset =3D psr_supported_on_chipset,
>  	.wait_until_enabled =3D psr_wait_until_enabled,
> @@ -276,6 +321,7 @@ struct feature {
>  	.wait_until_update =3D psr_wait_until_update,
>  	.connector_possible_fn =3D connector_can_psr,
>  	.enable =3D psr_debugfs_enable,
> +	.skips_on_fbcon =3D psr_skips_on_fbcon,
>  };
>  =

>  static void restore_fbcon(struct drm_info *drm)
> @@ -317,6 +363,7 @@ static void subtest(struct drm_info *drm, struct feat=
ure *feature, bool suspend)
>  	sleep(3);
>  =

>  	wait_user("Back to fbcon.");
> +	feature->skips_on_fbcon(drm->debugfs_fd);
>  	igt_assert(feature->wait_until_update(drm));
>  =

>  	if (suspend) {
> -- =

> 2.29.2
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
