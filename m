Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E7010E14A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 09:00:18 +0000 (UTC)
Date: Thu, 26 Jan 2023 10:00:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230126090011.4xi46i5pr7lk5hky@kamilkon-desk1>
References: <20230112193741.55630-1-mcanal@igalia.com>
 <20230112193741.55630-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112193741.55630-4-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 3/4] lib/igt_v3d: Rework
 igt_v3d_get_param()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-12 at 16:37:41 -0300, Maíra Canal wrote:
> Instead of assuming that igt_v3d_get_param() will succeed, allow the
> ioctl to fail and return 0. This way, it will be possible to check if the
> kernel has the capabilities needed by the test by checking if the return
> of the igt_v3d_get_param() function is different than zero.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_v3d.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
> index 68d11d7f..5d112416 100644
> --- a/lib/igt_v3d.c
> +++ b/lib/igt_v3d.c
> @@ -86,14 +86,27 @@ igt_v3d_get_bo_offset(int fd, uint32_t handle)
>  	return get.offset;
>  }
>  
> +/**
> + * igt_v3d_get_param:
> + * @fd: device file descriptor
> + * @param: v3d parameter
> + *
> + * This wraps the GET_PARAM ioctl.
> + *
> + * Returns the current value of the parameter. If the parameter is
> + * invalid, returns 0.
> + */
>  uint32_t
>  igt_v3d_get_param(int fd, enum drm_v3d_param param)
>  {
>  	struct drm_v3d_get_param get = {
>  		.param = param,
>  	};
> +	int ret;
>  
> -	do_ioctl(fd, DRM_IOCTL_V3D_GET_PARAM, &get);
> +	ret = igt_ioctl(fd, DRM_IOCTL_V3D_GET_PARAM, &get);
> +	if (ret)
> +		return 0;
>  
>  	return get.value;
>  }
> -- 
> 2.39.0
> 
