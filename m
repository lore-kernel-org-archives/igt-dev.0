Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26FE10E262
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 16:16:21 +0000 (UTC)
Date: Tue, 3 Jan 2023 17:16:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7RU0Lt7tAYqesbR@kamilkon-desk1>
References: <20230103143047.926968-1-mcanal@igalia.com>
 <20230103143047.926968-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103143047.926968-2-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] lib/igt_vc4: Rework
 igt_vc4_get_param()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Maira,

On 2023-01-03 at 11:30:46 -0300, Maíra Canal wrote:
> Instead of returning the return of the DRM_IOCTL_VC4_GET_PARAM ioctl,
-------------------------- ^
error code of

> make igt_vc4_get_param() return the value of the parameter, considering
> that the current return is not being used and the value of the parameter
> is being used.
> 
> Suggested-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  lib/igt_vc4.c                | 10 +++-------
>  lib/igt_vc4.h                |  2 +-
>  tests/vc4/vc4_purgeable_bo.c |  5 +----
>  3 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
> index 6b6ad16c..33c3a36e 100644
> --- a/lib/igt_vc4.c
> +++ b/lib/igt_vc4.c
> @@ -168,19 +168,15 @@ uint64_t igt_vc4_get_tiling(int fd, uint32_t handle)
>  	return get.modifier;
>  }
>  

You should describe each public lib function, see for example
lib/ioctl_wrappers.c
There are some exceptions (like not all __func have one).

This change makes sense as for functions which do not assert
for errors inside we useally use __ as prefix, so old one
should be __igt_vc4_get_param

Regards,
Kamil

> -int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val)
> +uint64_t igt_vc4_get_param(int fd, uint32_t param)
>  {
>  	struct drm_vc4_get_param arg = {
>  		.param = param,
>  	};
> -	int ret;
>  
> -	ret = igt_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg);
> -	if (ret)
> -		return ret;
> +	do_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg);
>  
> -	*val = arg.value;
> -	return 0;
> +	return arg.value;
>  }
>  
>  bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable)
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index 384d7d6e..4c08f175 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -31,7 +31,7 @@
>  uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
>  int igt_vc4_create_bo(int fd, size_t size);
>  void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
> -int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
> +uint64_t igt_vc4_get_param(int fd, uint32_t param);
>  bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
>  bool igt_vc4_is_tiled(uint64_t modifier);
>  bool igt_vc4_is_v3d(int fd);
> diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
> index 676bc1f3..27771012 100644
> --- a/tests/vc4/vc4_purgeable_bo.c
> +++ b/tests/vc4/vc4_purgeable_bo.c
> @@ -102,11 +102,8 @@ igt_main
>  	int fd, ret;
>  
>  	igt_fixture {
> -		uint64_t val = 0;
> -
>  		fd = drm_open_driver(DRIVER_VC4);
> -		igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE, &val);
> -		igt_require(val);
> +		igt_require(igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE));
>  		IGT_INIT_LIST_HEAD(&list);
>  	}
>  
> -- 
> 2.38.1
> 
