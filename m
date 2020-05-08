Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752CA6EAF0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2020 11:07:25 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <20200507190944.19520-5-juhapekka.heikkila@gmail.com>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
 <20200507190944.19520-5-juhapekka.heikkila@gmail.com>
Date: Fri, 08 May 2020 14:07:20 +0300
Message-ID: <87r1vu65xz.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] lib/params: add igt_params_open()
 which will return path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 07 May 2020, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> From: Jani Nikula <jani.nikula@intel.com>
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

I no longer have recollection how much of this is mine, and how much is
JP's. In any case, for the parts I've contributed,

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Feel free to retain or take authorship as you feel just.

BR,
Jani.


> ---
>  lib/igt_params.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/lib/igt_params.c b/lib/igt_params.c
> index b5ac1266..fe4b1df3 100644
> --- a/lib/igt_params.c
> +++ b/lib/igt_params.c
> @@ -107,17 +107,7 @@ static void igt_params_save(int dir, const char *path, const char *name)
>  	module_params = data;
>  }
>  
> -/**
> - * igt_params_open:
> - * @device: fd of the device
> - *
> - * This opens the module parameters directory (under sysfs) corresponding
> - * to the device for use with igt_sysfs_set() and igt_sysfs_get().
> - *
> - * Returns:
> - * The directory fd, or -1 on failure.
> - */
> -int igt_params_open(int device)
> +static int __igt_params_open(int device, char **outpath)
>  {
>  	int dir, params = -1;
>  
> @@ -141,11 +131,28 @@ int igt_params_open(int device)
>  
>  		sprintf(path, "/sys/module/%s/parameters", name);
>  		params = open(path, O_RDONLY);
> +		if (params >= 0 && outpath)
> +			*outpath = strdup(path);
>  	}
>  
>  	return params;
>  }
>  
> +/**
> + * igt_params_open:
> + * @device: fd of the device
> + *
> + * This opens the module parameters directory (under sysfs) corresponding
> + * to the device for use with igt_sysfs_set() and igt_sysfs_get().
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_params_open(int device)
> +{
> +	return __igt_params_open(device, NULL);
> +}
> +
>  /**
>   * igt_params_set:
>   * @device: fd of the device

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
