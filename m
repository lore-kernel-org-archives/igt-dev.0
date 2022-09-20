Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 20 Sep 2022 07:06:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220920070630.1f34dd9c@maurocar-mobl2>
In-Reply-To: <20220913120441.146757-3-janusz.krzysztofik@linux.intel.com>
References: <20220913120441.146757-1-janusz.krzysztofik@linux.intel.com>
 <20220913120441.146757-3-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/core_hotunplug: Also unload
 audio before device unplug
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

On Tue, 13 Sep 2022 14:04:39 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Starting from commit e9c69e02b2f7 ("tests/core_hotunplug: Unload snd
> driver before i915 unbind") that replaced a former conservative workaround
> with a more liberal one but also moved it out of initial igt_fixture
> section to driver_unbind(), *plug* subtests (still blockisted in CI) can
> suffer from issues related to an audio driver using i915 hardware.  Fix it
> by adding a copy of the workaround in its current shape also to
> device_unplug() / bus_rescan() pair of functions.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> ---
>  tests/core_hotunplug.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 733ea8efb0..c3756889c2 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -198,6 +198,21 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>  {
>  	igt_require(priv->fd.sysfs_dev == -1);
>  
> +	/*
> +	 * FIXME: on some devices, the audio driver (snd_hda_intel)
> +	 * binds into the i915 driver. On such hardware, kernel warnings
> +	 * and errors may happen if i915 is unbind/removed before removing
> +	 * first the audio driver.
> +	 * So, add a logic that unloads the audio driver before trying to
> +	 * unbind i915 driver, reloading it when binding again.
> +	 */
> +	if (igt_audio_driver_unload(&priv->snd_driver)) {
> +		igt_skip("Audio driver %s in use, skipping test\n",
> +			 priv->snd_driver);
> +	} else if (priv->snd_driver) {
> +		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
> +	}
> +
>  	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
>  				    O_DIRECTORY);
>  	igt_assert_fd(priv->fd.sysfs_dev);
> @@ -231,6 +246,13 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
>  	igt_fail_on_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr,
>  				F_OK, 0),
>  		      "Fakely unplugged device not rediscovered (%s)!\n", priv->dev_bus_addr);
> +
> +	if (priv->snd_driver) {
> +		igt_info("Realoading %s\n", priv->snd_driver);
> +		igt_kmod_load(priv->snd_driver, NULL);
> +		free(priv->snd_driver);
> +		priv->snd_driver = NULL;
> +	}
>  }
>  
>  static void cleanup(struct hotunplug *priv)
