Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD2D10E0F9
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 09:35:30 +0000 (UTC)
Date: Fri, 29 Sep 2023 11:34:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230929093459.4dhd3tk35q6u2yd2@kamilkon-desk.igk.intel.com>
References: <20230928210527.268270-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230928210527.268270-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH v4] core_getversion: Test for desired device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Helen Koike <helen.koike@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,

On 2023-09-28 at 14:05:27 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We discovered in drm/ci that if the drm device fails to probe, all the
> tests come back as "Skip" and the job is considered successful. Fix
> the getversion test to fail if there is no drm device or if the drm
> device does not match the expected device as specified by the optional
> IGT_REQUIRED_DRIVER environment variable.
----- ^^^^^^^^
FORCE

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
> I dropped the previous two lib/drmtest patches, as they are no longer
> strictly required.  I think they are still nice-to-have, but they are
> unchanged since the previous version so it didn't seem useful to re-
> send them.
> 
>  tests/core_getversion.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 32cb976e4923..8c8e0c9a3e5e 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -48,14 +48,21 @@ igt_simple_main
>  {
>  	int fd;
>  	drmVersionPtr v;
> +	const char *name = getenv("IGT_FORCE_DRIVER");
>  
> -	fd = drm_open_driver(DRIVER_ANY);
> +	fd = __drm_open_driver(DRIVER_ANY);

Did you tested it?

> +	igt_assert_fd(fd);

imho better igt_assert_f(fd > 0, "Error opening driver, forced: %s\n", name ? name : "(not-used)");

Regards,
Kamil

>  	v = drmGetVersion(fd);
>  	igt_assert_neq(strlen(v->name), 0);
>  	igt_assert_neq(strlen(v->date), 0);
>  	igt_assert_neq(strlen(v->desc), 0);
>  	if (is_i915_device(fd))
>  		igt_assert_lte(1, v->version_major);
> +	if (name) {
> +		igt_assert_f(!strcmp(name, v->name),
> +			     "Expected driver \"%s\" but got \"%s\"\n",
> +			     name, v->name);
> +	}
>  
>  	drmFree(v);
>  	drm_close_driver(fd);
> -- 
> 2.41.0
> 
