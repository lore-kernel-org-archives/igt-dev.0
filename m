Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AF810E4F8
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 16:13:34 +0000 (UTC)
Date: Wed, 2 Nov 2022 17:13:26 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20221102171326.65e25788@maurocar-mobl2>
In-Reply-To: <20221012110203.644576-2-janusz.krzysztofik@linux.intel.com>
References: <20221012110203.644576-1-janusz.krzysztofik@linux.intel.com>
 <20221012110203.644576-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/core_hotunplug: Select health
 checks for initially detected chipset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 12 Oct 2022 13:02:02 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> As soon as we first time open a drm device to be exercised, we identify
> its chipset and perform some basic device specific checks.  We also
> install a filter that matches the device bus address to make sure we will
> exercise still one and the same device after each driver unbind-rebind /
> device unplug-rediscover cycle.
> 
> However, each time before we select device specific health checks, whether
> before or after a driver unbind-rebind / device unplug-rediscover
> sequence, we identify the device chipset again.  Besides being more
> expensive, that approach could also result in using different set of
> health checks should device filters not work as expected.
> 
> Store detected chipset type at test start and always use that information
> instead of identifying the chipset now and again.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

LGTM

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/core_hotunplug.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index c3756889c2..68fd92238c 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -55,6 +55,7 @@ struct hotunplug {
>  	bool need_healthcheck;
>  	bool has_intel_perf;
>   	char *snd_driver;
> +	int chipset;
>  };
>  
>  /* Helpers */
> @@ -397,7 +398,7 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
>  	if (closed)	/* store fd for cleanup if not dirty */
>  		priv->fd.drm_hc = fd_drm;
>  
> -	if (is_i915_device(fd_drm)) {
> +	if (priv->chipset == DRIVER_INTEL) {
>  		/* don't report library failed asserts as healthcheck failure */
>  		priv->failure = "Unrecoverable test failure";
>  		if (local_i915_healthcheck(fd_drm, "") &&
> @@ -625,6 +626,7 @@ igt_main
>  		.need_healthcheck = true,
>  		.has_intel_perf = false,
>  		.snd_driver	= NULL,
> +		.chipset	= DRIVER_ANY,
>  	};
>  
>  	igt_fixture {
> @@ -634,6 +636,8 @@ igt_main
>  		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
>  
>  		if (is_i915_device(fd_drm)) {
> +			priv.chipset = DRIVER_INTEL;
> +
>  			gem_quiescent_gpu(fd_drm);
>  			igt_require_gem(fd_drm);
>  
