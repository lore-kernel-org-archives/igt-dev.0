Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188CB10E1D3
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Sep 2023 12:44:59 +0000 (UTC)
Date: Mon, 4 Sep 2023 14:44:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230904124454.kmnersvgc2vnm26b@zkempczy-mobl2>
References: <20230904095058.1526961-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904095058.1526961-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] lib/intel_chipset: Read device id from
 xe_device struct
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

On Mon, Sep 04, 2023 at 03:20:58PM +0530, Bhanuprakash Modem wrote:
> Upon opening the driver, we query the device id & cache it in
> the xe_device struct. So, no need to query for it every time,
> instead, just read it from the xe_device.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/intel_chipset.c | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> index 1d7166aef..760faede2 100644
> --- a/lib/intel_chipset.c
> +++ b/lib/intel_chipset.c
> @@ -127,29 +127,6 @@ static uint32_t __i915_get_drm_devid(int fd)
>  	return devid;
>  }
>  
> -static uint32_t __xe_get_drm_devid(int fd)
> -{
> -	struct drm_xe_query_config *config;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_CONFIG,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	config = malloc(query.size);
> -	igt_assert(config);
> -
> -	query.data = to_user_pointer(config);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	igt_assert(config->num_params > 0);
> -
> -	return config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
> -}
> -
>  /**
>   * intel_get_drm_devid:
>   * @fd: open i915/xe drm file descriptor
> @@ -174,7 +151,7 @@ intel_get_drm_devid(int fd)
>  	if (is_i915_device(fd))
>  		return __i915_get_drm_devid(fd);
>  	else
> -		return __xe_get_drm_devid(fd);
> +		return xe_dev_id(fd);

Ok. I remember you've introduced calling xe_device_get() in some
patch so drm_open*() and drm_reopen_driver() ensures you got fd
xe device data cached for this fd.

So:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  /**
> -- 
> 2.40.0
> 
