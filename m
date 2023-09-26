Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DD510E3C2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 12:33:09 +0000 (UTC)
Message-ID: <66c83ce3-7d52-fbe4-658c-4bbe2ccb4930@collabora.com>
Date: Tue, 26 Sep 2023 09:33:00 -0300
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230925162212.125997-1-robdclark@gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230925162212.125997-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v2] core_getversion: Test for desired device
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



On 25/09/2023 13:22, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We discovered in drm/ci that if the drm device fails to probe, all the
> tests come back as "Skip" and the job is considered successful. Fix
> the getversion test to fail if there is no drm device or if the drm
> device does not match the expected device as specified by the optional
> IGT_REQUIRED_DRIVER environment variable.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   tests/core_getversion.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 32cb976e4923..a13cc9c5c288 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -48,14 +48,21 @@ igt_simple_main
>   {
>   	int fd;
>   	drmVersionPtr v;
> +	const char *name = getenv("IGT_REQUIRED_DRIVER");
>   
> -	fd = drm_open_driver(DRIVER_ANY);
> +	fd = __drm_open_driver(DRIVER_ANY);
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
