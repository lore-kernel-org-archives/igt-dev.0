Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658510E137
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 13:09:33 +0000 (UTC)
Date: Mon, 4 Dec 2023 14:09:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231204130906.mpg2hotb6dm3q2yr@kamilkon-desk.igk.intel.com>
References: <20231201210013.16147-1-brian.welty@intel.com>
 <20231201210013.16147-2-brian.welty@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201210013.16147-2-brian.welty@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe_ioctl: Add _xe_wait_ufence()
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

Hi Brian,
On 2023-12-01 at 13:00:12 -0800, Brian Welty wrote:
> xe_wait_ufence is expected to fail if GPU hangs or is reset. We need
> a version of calling XE_WAIT_USER_FENCE without the assertion that it
> won't expire (timeout), for use with IGTs that intentionally cause
> hangs or reset.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

+cc Fransois as he is preparing xe uAPI changes.

> ---
>  lib/xe/xe_ioctl.c | 22 ++++++++++++++++------
>  lib/xe/xe_ioctl.h |  3 +++
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index a5fe7dd792..b9828fc49f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -446,9 +446,9 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
>  	syncobj_destroy(fd, sync.handle);
>  }
>  
> -int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> -		       struct drm_xe_engine_class_instance *eci,
> -		       int64_t timeout)
> +int _xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
------ ^
Please use two underscores for non-assertiong igt function:

int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,

> +		    struct drm_xe_engine_class_instance *eci,
> +		    int64_t *timeout)
>  {
>  	struct drm_xe_wait_user_fence wait = {
>  		.addr = to_user_pointer(addr),
> @@ -456,14 +456,24 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
>  		.value = value,
>  		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> -		.timeout = timeout,
> +		.timeout = *timeout,

Check for NULL, same way as eci is checked.
Btw you may choose asserting for non-null timeout (instead of
using zero or other value as default).

Regards,
Kamil

>  		.num_engines = eci ? 1 :0,
>  		.instances = eci ? to_user_pointer(eci) : 0,
>  	};
>  
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait))
> +		return -errno;
>  
> -	return wait.timeout;
> +	*timeout = wait.timeout;
> +	return 0;
> +}
> +
> +int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       int64_t timeout)
> +{
> +	igt_assert_eq(_xe_wait_ufence(fd, addr, value, eci, &timeout), 0);
> +	return timeout;
>  }
>  
>  /**
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 6d91d3e8e6..7476a62c81 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -88,6 +88,9 @@ void xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
> +int _xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       struct drm_xe_engine_class_instance *eci,
>  		       int64_t timeout);
> -- 
> 2.38.0
> 
