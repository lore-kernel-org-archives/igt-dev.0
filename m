Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873CE6E525
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 07:07:22 +0000 (UTC)
Date: Tue, 5 May 2020 10:07:19 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200505070719.GL9497@platvala-desk.ger.corp.intel.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-5-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428202255.31309-5-juhapekka.heikkila@gmail.com>
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 11:22:52PM +0300, Juha-Pekka Heikkila wrote:
> From: Jani Nikula <jani.nikula@intel.com>
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Restore author's S-o-b and
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


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
> -- 
> 2.26.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
