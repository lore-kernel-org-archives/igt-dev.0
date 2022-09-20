Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 20 Sep 2022 07:10:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220920071021.5e60f9ea@maurocar-mobl2>
In-Reply-To: <20220913120441.146757-5-janusz.krzysztofik@linux.intel.com>
References: <20220913120441.146757-1-janusz.krzysztofik@linux.intel.com>
 <20220913120441.146757-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/core_hotunplug: Select health
 checks for initially detected chipset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 13 Sep 2022 14:04:41 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> As soon as we first time open a drm device to be exercised, we identify
> its chipset, store that information, and perform some basic device
> specific checks.  We also store a filter that matches the device bus
> address to make sure we will exercise still one and the same device after
> each driver unbind-rebind / device unplug-rediscover operation.
> 
> However, each time before we select device specific health checks, whether
> before or after a driver unbind-rebind / device unplug-rediscover
> operation, we identify the device chipset again.  Besides being more
> expensive, that approach could also result in using different set of
> health checks should device filters not work as expected.
> 
> Always use the stored chipset type instead of identifying it now and
> again.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Makes sense to me, once we have patch 3/4 applied. So,

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/core_hotunplug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 29cb26ab12..7c7ed09e63 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -400,7 +400,7 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
>  	if (closed)	/* store fd for cleanup if not dirty */
>  		priv->fd.drm_hc = fd_drm;
>  
> -	if (is_i915_device(fd_drm)) {
> +	if (priv->chipset == DRIVER_INTEL) {
>  		/* don't report library failed asserts as healthcheck failure */
>  		priv->failure = "Unrecoverable test failure";
>  		if (local_i915_healthcheck(fd_drm, "") &&
