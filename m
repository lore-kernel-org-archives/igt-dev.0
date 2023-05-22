Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772FC10E2CA
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 11:16:21 +0000 (UTC)
Date: Mon, 22 May 2023 13:16:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230522111617.mugrfldam6q4ak47@zkempczy-mobl2>
References: <20230516165058.4047595-2-bhanuprakash.modem@intel.com>
 <20230519150956.519525-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519150956.519525-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V3 01/20] lib: Interface to close the drm fd
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

On Fri, May 19, 2023 at 08:39:56PM +0530, Bhanuprakash Modem wrote:
> Add new helper drm_close_driver() to close the drm fd. Now
> every user could call drm_close_driver() instead of close().
> 
> V2: - Fix commit message
>     - Add debug prints
> V3: - Check the validity of fd before close
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/drmtest.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 45 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 7630bb793..d148211a2 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -605,6 +605,50 @@ int drm_open_driver(int chipset)
>  	return fd;
>  }
>  
> +static bool is_valid_fd(int fd)
> +{
> +	char path[32];
> +	char buf[PATH_MAX];
> +	int len;
> +
> +	if (fd < 0)
> +		return false;
> +
> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
> +
> +	memset(buf, 0, sizeof(buf));
> +	len = readlink(path, buf, sizeof(buf) - 1);
> +	if (len <= 0)
> +		return false;
> +
> +	buf[len] = '\0';
> +	if (strstr(buf, "/dev/dri/card") == buf ||
> +	    strstr(buf, "/dev/dri/renderD") == buf)
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * drm_close_driver:
> + * @fd: a drm file descriptor
> + *
> + * Check the given drm file descriptor @fd is valid & Close if it is
> + * an valid drm fd.
> + *
> + * Returns: 0 on success or -1 on error.
> + */
> +int drm_close_driver(int fd)
> +{
> +	if (!is_valid_fd(fd)) {
> +		igt_debug("Don't attempt to close standard/invalid file "
> +			  "descriptor: %d\n", fd);

I would change this debug to igt_warn(). Closing not drm fd looks like
programmer mistake and should be fixed. With this minor fix:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		return -1;
> +	}
> +
> +	return close(fd);
> +}
> +
>  /**
>   * drm_open_driver_master:
>   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index ae86ee19a..9c3ea5d14 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -105,6 +105,7 @@ int drm_open_driver_render(int chipset);
>  int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
> +int drm_close_driver(int fd);
>  
>  int drm_reopen_driver(int fd);
>  
> -- 
> 2.40.0
> 
