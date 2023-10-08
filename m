Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B76C10E025
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Oct 2023 22:22:05 +0000 (UTC)
Message-ID: <0ebd6ca2-653b-43e4-981b-b0a88e74aef5@collabora.com>
Date: Sun, 8 Oct 2023 19:21:55 -0300
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20231004172119.289318-1-robdclark@gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231004172119.289318-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH v5] core_getversion: Test for desired device
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



On 04/10/2023 14:21, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We discovered in drm/ci that if the drm device fails to probe, all the
> tests come back as "Skip" and the job is considered successful. Fix
> the getversion test to fail if there is no drm device or if the drm
> device does not match the expected device as specified by the optional
> IGT_FORCE_DRIVER environment variable.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Tested-by: Helen Koike <helen.koike@collabora.com>
> ---
>   tests/core_getversion.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 32cb976e4923..8c8e0c9a3e5e 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -48,14 +48,21 @@ igt_simple_main
>   {
>   	int fd;
>   	drmVersionPtr v;
> +	const char *name = getenv("IGT_FORCE_DRIVER");

I just realized we already use this env var here 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_core.c?ref_type=heads#L1059


>   
> -	fd = drm_open_driver(DRIVER_ANY);
> +	fd = __drm_open_driver(DRIVER_ANY);
> +	igt_assert_fd(fd);

Which makes this assert to fail if the driver name doesn't match.

See here 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/drmtest.c#L263


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

Which means it won't reach this part, so I guess we can drop this.

What would be nice is to print the name of forced and dev_name in 
open_device() function (seeing the names was very handy in the logs, I 
was expecting this print if the env var wasn't matching and I didn't get 
it, I lost some life time debugging this heh).

Thanks,
Helen

>   
>   	drmFree(v);
>   	drm_close_driver(fd);
