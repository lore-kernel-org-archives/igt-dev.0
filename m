Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2C310E53B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 14:26:16 +0000 (UTC)
Date: Wed, 27 Sep 2023 16:26:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20230927142611.jm5pbvfzrmeajdes@zkempczy-mobl2>
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230926184748.199187-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 11:47:47AM -0700, Rob Clark wrote:
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

With invalid name chipset returned == 0, so we'll get unexpected
results. I would assert like:

if (name) {
	chipset = drm_find_chipset(name);
	igt_assert(chipset > 0);
}

Rest lgtm so with minor nit above addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

> +
> +	fd = __drm_open_driver(chipset);
> +	igt_assert_fd(fd);
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
