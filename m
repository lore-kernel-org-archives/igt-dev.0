Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 20 Sep 2022 07:23:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220920072341.57c0433b@maurocar-mobl2>
In-Reply-To: <20220913120441.146757-4-janusz.krzysztofik@linux.intel.com>
References: <20220913120441.146757-1-janusz.krzysztofik@linux.intel.com>
 <20220913120441.146757-4-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/core_hotunplug: Don't apply
 i915 workarounds on other platforms
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

On Tue, 13 Sep 2022 14:04:40 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Starting from commit 0edabd8a4a08 ("core_hotunplug: fix audio unbind
> logic") audio modules are unloaded unconditionally before graphics driver
> unbind.  This is required for i915 to be unbound cleanly from a graphics
> device.  However, we have no indications that non-Intel platforms require
> the same.

Actually, there was a much more generic solution merged, but that depends
on a patch upstream to lib/module not applied. See:

	https://lore.kernel.org/all/cover.1651348913.git.mchehab@kernel.org/

So, we ended reverting the changes on this changeset:

	03706cd84099 ("lib/igt_kmod: remove the conditional audio removal code")

In any case, other drivers may have similar issues, if the audio driver
binds into the video driver. So, I would place any chipset-specific logic
for the current logic inside igt_audio_driver_unload(), as this will make it
more generic, as any other audio driver unbind needs will be self-contained
inside the library, and, if some day Kernel lib/modules.c gets fixed to
properly report bind (as proposed on my patchset), the library will get
the hack to have the snd-hda-intel name hardcoded on it, and the code
will work with any GPU/snd audio driver combination.

> Since we care for other platforms using this test and contributing to it,
> not developing their own, keep i915 workarounds limited to i915 devices.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  tests/core_hotunplug.c | 58 +++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index c3756889c2..29cb26ab12 100644
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
> @@ -140,19 +141,20 @@ static void prepare(struct hotunplug *priv)
>  static void driver_unbind(struct hotunplug *priv, const char *prefix,
>  			  int timeout)
>  {
> -	/*
> -	 * FIXME: on some devices, the audio driver (snd_hda_intel)
> -	 * binds into the i915 driver. On such hardware, kernel warnings
> -	 * and errors may happen if i915 is unbind/removed before removing
> -	 * first the audio driver.
> -	 * So, add a logic that unloads the audio driver before trying to
> -	 * unbind i915 driver, reloading it when binding again.
> -	 */
> -	if (igt_audio_driver_unload(&priv->snd_driver)) {
> -		igt_skip("Audio driver %s in use, skipping test\n",
> -			 priv->snd_driver);
> -	} else if (priv->snd_driver) {
> -		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
> +	if (priv->chipset == DRIVER_INTEL) {
> +		/*
> +		 * FIXME: on some devices, the audio driver (snd_hda_intel)
> +		 * binds into the i915 driver. On such hardware, kernel warnings
> +		 * and errors may happen if i915 is unbind/removed before removing
> +		 * first the audio driver.
> +		 * So, add a logic that unloads the audio driver before trying to
> +		 * unbind i915 driver, reloading it when binding again.
> +		 */
> +		if (igt_audio_driver_unload(&priv->snd_driver))
> +			igt_skip("Audio driver %s in use, skipping test\n",
> +				 priv->snd_driver);
> +		else if (priv->snd_driver)
> +			igt_info("Unloaded audio driver %s\n", priv->snd_driver);
>  	}
>  
>  	local_debug("%sunbinding the driver from the device\n", prefix);
> @@ -198,19 +200,20 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>  {
>  	igt_require(priv->fd.sysfs_dev == -1);
>  
> -	/*
> -	 * FIXME: on some devices, the audio driver (snd_hda_intel)
> -	 * binds into the i915 driver. On such hardware, kernel warnings
> -	 * and errors may happen if i915 is unbind/removed before removing
> -	 * first the audio driver.
> -	 * So, add a logic that unloads the audio driver before trying to
> -	 * unbind i915 driver, reloading it when binding again.
> -	 */
> -	if (igt_audio_driver_unload(&priv->snd_driver)) {
> -		igt_skip("Audio driver %s in use, skipping test\n",
> -			 priv->snd_driver);
> -	} else if (priv->snd_driver) {
> -		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
> +	if (priv->chipset == DRIVER_INTEL) {
> +		/*
> +		 * FIXME: on some devices, the audio driver (snd_hda_intel)
> +		 * binds into the i915 driver. On such hardware, kernel warnings
> +		 * and errors may happen if i915 is unbind/removed before removing
> +		 * first the audio driver.
> +		 * So, add a logic that unloads the audio driver before trying to
> +		 * unbind i915 driver, reloading it when binding again.
> +		 */
> +		if (igt_audio_driver_unload(&priv->snd_driver))
> +			igt_skip("Audio driver %s in use, skipping test\n",
> +				 priv->snd_driver);
> +		else if (priv->snd_driver)
> +			igt_info("Unloaded audio driver %s\n", priv->snd_driver);
>  	}
>  
>  	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
> @@ -625,6 +628,7 @@ igt_main
>  		.need_healthcheck = true,
>  		.has_intel_perf = false,
>  		.snd_driver	= NULL,
> +		.chipset	= DRIVER_ANY,
>  	};
>  
>  	igt_fixture {
> @@ -634,6 +638,8 @@ igt_main
>  		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
>  
>  		if (is_i915_device(fd_drm)) {
> +			priv.chipset = DRIVER_INTEL;
> +
>  			gem_quiescent_gpu(fd_drm);
>  			igt_require_gem(fd_drm);
>  
