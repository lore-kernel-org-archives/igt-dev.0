Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63E10E012
 for <igt-dev@lists.freedesktop.org>; Thu, 18 May 2023 18:51:11 +0000 (UTC)
Date: Thu, 18 May 2023 20:51:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230518185107.zdawqykbc5puswee@zkempczy-mobl2>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516165058.4047595-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 01/20] lib: Interface to close the drm fd
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

On Tue, May 16, 2023 at 10:20:39PM +0530, Bhanuprakash Modem wrote:
> Add new helper drm_close_driver() to close the drm fd. Now
> every user could call drm_close_driver() instead of close().
> 
> V2: - Fix commit message
>     - Add debug prints
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/drmtest.c | 20 ++++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 7630bb793..41ad2694c 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -605,6 +605,26 @@ int drm_open_driver(int chipset)
>  	return fd;
>  }
>  
> +/**
> + * __drm_close_driver:
> + * @fd: a drm file descriptor
> + *
> + * Close the drm file descriptor @fd.
> + *
> + * Returns: 0 on success or -1 on error.
> + */
> +int drm_close_driver(int fd)
> +{
> +	/* Avoid closing standard file descriptors (0, 1, and 2). */
> +	if (fd < 3) {
> +		igt_debug("Don't attempt to close standard/invalid file "
> +			  "descriptor: %d\n", fd);
> +		return -1;
> +	}

Maybe you shouldn't allow passing invalid descriptor at all and assert?

igt_assert(fd >= 0);

?

We can avoid situation when test will blow up long time after this code.

If you want to verify your fd is really drm fd just check what fd is
leading to. Like readlink() with checking /dev/dri/card|render or sth.

--
Zbigniew

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
