Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3C910E245
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 15:21:55 +0000 (UTC)
Message-ID: <b3b79a6c-666f-4558-9fee-c0f49f66b3a7@collabora.com>
Date: Mon, 8 Jan 2024 12:21:48 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 i-g-t] lib/drmtest: load forced module
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231222131031.33880-1-kamil.konieczny@linux.intel.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231222131031.33880-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 22/12/2023 10:10, Kamil Konieczny wrote:
> Opening drm card may end up in loading kernel module. Take into
> account forced driver set by IGT_FORCE_DRIVER and load that one.
> If forced is in known ones, use function for loading it
> otherwise load it only when requested was DRIVER_ANY. Special
> case is VGEM which should always be loaded as itself. It can
> end up in not loading any module in case when igt test requested
> specific one, for example i915 but forced is different.
> 
> v2: fixed typo, added r-b (Lukasz)
>      rebase
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/drmtest.c | 65 ++++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 46 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index c98754798..52b5a2020 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -221,6 +221,26 @@ struct _opened_device_path {
>   	struct igt_list_head link;
>   };
>   
> +static void modulename_to_chipset(const char *name, unsigned int *chip)

Couldn't this function return `chip` instead of receiving the pointer as 
parameter? And maybe rename to get_chipset_from_module_name()

> +{
> +	if (!name)
> +		return;
> +
> +	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start < end; ) {
> +		int mid = start + (end - start) / 2;
> +		int ret = strcmp(modules[mid].module, name);
> +
> +		if (ret < 0) {
> +			start = mid + 1;
> +		} else if (ret > 0) {
> +			end = mid;
> +		} else {
> +			*chip = modules[mid].bit;
> +			break;
> +		}
> +	}

Would it make sense to set chip to DRIVER_ANY here ? It might help to 
simplify a bit the code below.



In overall it make sense.

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks

> +}
> +
>   /*
>    * Logs path of opened device. Device path opened for the first time is logged at info level,
>    * subsequent opens (if any) are logged at debug level.
> @@ -263,7 +283,7 @@ int __drm_open_device(const char *name, unsigned int chipset)
>   {
>   	const char *forced;
>   	char dev_name[16] = "";
> -	int chip = DRIVER_ANY;
> +	unsigned int chip = DRIVER_ANY;
>   	int fd;
>   
>   	fd = open(name, O_RDWR);
> @@ -280,18 +300,7 @@ int __drm_open_device(const char *name, unsigned int chipset)
>   		goto err;
>   	}
>   
> -	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start < end; ){
> -		int mid = start + (end - start) / 2;
> -		int ret = strcmp(modules[mid].module, dev_name);
> -		if (ret < 0) {
> -			start = mid + 1;
> -		} else if (ret > 0) {
> -			end = mid;
> -		} else {
> -			chip = modules[mid].bit;
> -			break;
> -		}
> -	}
> +	modulename_to_chipset(dev_name, &chip);
>   
>   	if ((chipset & chip) == chip) {
>   		log_opened_device_path(name);
> @@ -375,16 +384,34 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
>   void drm_load_module(unsigned int chipset)
>   {
>   	static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
> +	const char *forced = forced_driver();
> +	unsigned int chip = 0;
> +	bool want_any = chipset == DRIVER_ANY;
> +
> +	if (forced) {
> +		if (chipset == DRIVER_VGEM)
> +			chip = DRIVER_VGEM; /* ignore forced */
> +		else
> +			modulename_to_chipset(forced, &chip);
> +
> +		chipset &= chip; /* forced can be in known modules */
> +	}
>   
>   	pthread_mutex_lock(&mutex);
> -	for (const struct module *m = modules; m->module; m++) {
> -		if (chipset & m->bit) {
> -			if (m->modprobe)
> -				m->modprobe(m->module);
> -			else
> -				modprobe(m->module);
> +	if (forced && chipset == 0) {
> +		if (want_any)
> +			modprobe(forced);
> +	} else {
> +		for (const struct module *m = modules; m->module; m++) {
> +			if (chipset & m->bit) {
> +				if (m->modprobe)
> +					m->modprobe(m->module);
> +				else
> +					modprobe(m->module);
> +			}
>   		}
>   	}
> +
>   	pthread_mutex_unlock(&mutex);
>   	igt_devices_scan(true);
>   }
