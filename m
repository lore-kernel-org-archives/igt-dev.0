Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 20 Sep 2022 07:04:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220920070420.68bcb154@maurocar-mobl2>
In-Reply-To: <20220913120441.146757-2-janusz.krzysztofik@linux.intel.com>
References: <20220913120441.146757-1-janusz.krzysztofik@linux.intel.com>
 <20220913120441.146757-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/core_hotunplug: Free mem
 allocated by igt_audio_driver_unload
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

On Tue, 13 Sep 2022 14:04:38 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Since we pass NULL to igt_audio_driver_unload(), realloc() it calls
> allocates new memory for us.  Free it each time we no longer need it,
> before dropping a pointer to it, to avoid memory leaking.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/core_hotunplug.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index a0d29b799a..733ea8efb0 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -187,6 +187,7 @@ static void driver_bind(struct hotunplug *priv, int timeout)
>  	if (priv->snd_driver) {
>  		igt_info("Realoading %s\n", priv->snd_driver);
>  		igt_kmod_load(priv->snd_driver, NULL);
> +		free(priv->snd_driver);
>  		priv->snd_driver = NULL;
>  	}
>  }
