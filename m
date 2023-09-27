Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D68A10E19A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 22:24:47 +0000 (UTC)
Message-ID: <b4fcc0fd-9129-c13b-3801-253ecb3677b4@collabora.com>
Date: Wed, 27 Sep 2023 19:24:35 -0300
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230926184748.199187-3-robdclark@gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230926184748.199187-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v3 3/3] core_getversion: Test for desired
 device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 26/09/2023 15:47, Rob Clark wrote:
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
>   tests/core_getversion.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 32cb976e4923..b298a6890ef9 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -48,14 +48,25 @@ igt_simple_main
>   {
>   	int fd;
>   	drmVersionPtr v;
> +	const char *name = getenv("IGT_REQUIRED_DRIVER");

Btw, In drm/ci we are using IGT_FORCE_DRIVER

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/ci/igt_runner.sh#n6

You could use the same name here so we don't need to patch drm/ci (but 
patching there is not a issue as well, so feel free to ignore this 
comment and just chose the best name).

Regards,
Helen

> +	int chipset = DRIVER_ANY;
>   
> -	fd = drm_open_driver(DRIVER_ANY);
> +	if (name)
> +		chipset = drm_find_chipset(name);
> +
> +	fd = __drm_open_driver(chipset);
> +	igt_assert_fd(fd);
>   	v = drmGetVersion(fd);
>   	igt_assert_neq(strlen(v->name), 0);
>   	igt_assert_neq(strlen(v->date), 0);
>   	igt_assert_neq(strlen(v->desc), 0);
>   	if (is_i915_device(fd))
>   		igt_assert_lte(1, v->version_major);
> +	if (name) {
> +		igt_assert_f(!strcmp(name, v->name),
> +			     "Expected driver \"%s\" but got \"%s\"\n",
> +			     name, v->name);
> +	}
>   
>   	drmFree(v);
>   	drm_close_driver(fd);
