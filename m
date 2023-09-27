Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDB410E56E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 16:50:01 +0000 (UTC)
Date: Wed, 27 Sep 2023 18:42:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230927164248.d4qmmph4m33d4mkp@kamilkon-desk.igk.intel.com>
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230926184748.199187-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230926184748.199187-3-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH v3 3/3] core_getversion: Test for desired
 device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,

On 2023-09-26 at 11:47:47 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We discovered in drm/ci that if the drm device fails to probe, all the
> tests come back as "Skip" and the job is considered successful. Fix
> the getversion test to fail if there is no drm device or if the drm
> device does not match the expected device as specified by the optional
> IGT_REQUIRED_DRIVER environment variable.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  tests/core_getversion.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 32cb976e4923..b298a6890ef9 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -48,14 +48,25 @@ igt_simple_main
>  {
>  	int fd;
>  	drmVersionPtr v;
> +	const char *name = getenv("IGT_REQUIRED_DRIVER");
> +	int chipset = DRIVER_ANY;
>  
> -	fd = drm_open_driver(DRIVER_ANY);
> +	if (name)
> +		chipset = drm_find_chipset(name);

This will not work as you want, it will load your driver
instead of DRIVER_ANY, imho leave this line as is:

	fd = drm_open_driver(DRIVER_ANY);

and drop taking chipset.

> +
> +	fd = __drm_open_driver(chipset);
> +	igt_assert_fd(fd);

I tested this on machine with i915 driver and when running:

build/tests# IGT_REQUIRED_DRIVER=v3d ./core_getversion

it failed on following assert:

(core_getversion:577767) igt_kmod-DEBUG: Unknown symbol in module v3d or unknown parameter
(core_getversion:577767) CRITICAL: Failed assertion: fd >= 0

After my changes:
(core_getversion:577941) CRITICAL: Expected driver "v3d" but got "i915"

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
