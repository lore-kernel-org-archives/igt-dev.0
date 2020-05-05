Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35376E566
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 07:16:07 +0000 (UTC)
Date: Tue, 5 May 2020 10:16:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200505071604.GM9497@platvala-desk.ger.corp.intel.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-6-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428202255.31309-6-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] igt/params: add generic saving
 module parameter set
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

On Tue, Apr 28, 2020 at 11:22:53PM +0300, Juha-Pekka Heikkila wrote:
> From: Jani Nikula <jani.nikula@intel.com>
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_params.c | 57 ++++++++++++++++++++++++++++++++++++++++--------
>  lib/igt_params.h |  3 +++
>  2 files changed, 51 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_params.c b/lib/igt_params.c
> index fe4b1df3..d9cf986c 100644
> --- a/lib/igt_params.c
> +++ b/lib/igt_params.c
> @@ -153,6 +153,29 @@ int igt_params_open(int device)
>  	return __igt_params_open(device, NULL);
>  }
>  
> +__attribute__((format(printf, 3, 0)))
> +static bool __igt_params_set(int device, const char *parameter,
> +			     const char *fmt, va_list ap, bool save)
> +{
> +	char *path = NULL;
> +	int dir;
> +	int ret;
> +
> +	dir = __igt_params_open(device, save ? &path : NULL);
> +	if (dir < 0)
> +		return false;
> +
> +	if (save)
> +		igt_params_save(dir, path, parameter);
> +
> +	ret = igt_sysfs_vprintf(dir, parameter, fmt, ap);
> +
> +	close(dir);
> +	free(path);
> +
> +	return ret > 0;
> +}
> +
>  /**
>   * igt_params_set:
>   * @device: fd of the device
> @@ -164,20 +187,36 @@ int igt_params_open(int device)
>  bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
>  {
>  	va_list ap;
> -	int dir;
> -	int ret;
> -
> -	dir = igt_params_open(device);
> -	if (dir < 0)
> -		return false;
> +	bool ret;
>  
>  	va_start(ap, fmt);
> -	ret = igt_sysfs_vprintf(dir, parameter, fmt, ap);
> +	ret = __igt_params_set(device, parameter, fmt, ap, false);
>  	va_end(ap);
>  
> -	close(dir);
> +	return ret;
> +}
>  
> -	return ret > 0;
> +/**
> + * igt_params_set_save:
> + * @device: fd of the device or -1 to default to first matching starting from
> + *	    zero. See __igt_params_open()


This documentation is still only understandable if you already know what it does.

"-- to default to the first /dev/dri/cardX device, starting from zero" ?

"See <a function without documentation>" in generated documentation is
less than useful as well... Maybe just drop that sentence altogether
from docs, point to the function in a normal comment? Or link to
igt_debugfs_path() that will do the actual -1 handling...

With better docs,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> + * @parameter: the name of the parameter to set
> + * @fmt: printf-esque format string
> + *
> + * Save the original value to be restored.
> + *
> + * Returns true on success
> + */
> +bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...)
> +{
> +	va_list ap;
> +	bool ret;
> +
> +	va_start(ap, fmt);
> +	ret = __igt_params_set(device, parameter, fmt, ap, true);
> +	va_end(ap);
> +
> +	return ret;
>  }
>  
>  /**
> diff --git a/lib/igt_params.h b/lib/igt_params.h
> index 52eed77f..1b750d23 100644
> --- a/lib/igt_params.h
> +++ b/lib/igt_params.h
> @@ -31,6 +31,9 @@ int igt_params_open(int device);
>  __attribute__((format(printf, 3, 4)))
>  bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
>  
> +__attribute__((format(printf, 3, 4)))
> +bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...);
> +
>  void igt_set_module_param(const char *name, const char *val);
>  void igt_set_module_param_int(const char *name, int val);
>  
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
