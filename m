Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65FE10E402
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 20:38:50 +0000 (UTC)
Date: Mon, 4 Dec 2023 21:38:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231204203829.j76a3orpongfqfvm@kamilkon-desk.igk.intel.com>
References: <20231204194306.12950-1-brian.welty@intel.com>
 <20231204194306.12950-2-brian.welty@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231204194306.12950-2-brian.welty@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] lib/xe_ioctl: Add
 __xe_wait_ufence()
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
On 2023-12-04 at 11:43:05 -0800, Brian Welty wrote:
> xe_wait_ufence is expected to fail if GPU hangs or is reset. We need
> a version of calling XE_WAIT_USER_FENCE without the assertion that it
> won't expire (timeout), for use with IGTs that intentionally cause
> hangs or reset.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 24 ++++++++++++++++++------
>  lib/xe/xe_ioctl.h |  3 +++
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index a5fe7dd792..36c3bd2f39 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -446,9 +446,9 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
>  	syncobj_destroy(fd, sync.handle);
>  }
>  

One more thing (sorry I forgot it in previous review), each new
public function needs to be described, please write it here.

Rest looks good, with that addressed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> -int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> -		       struct drm_xe_engine_class_instance *eci,
> -		       int64_t timeout)
> +int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		     struct drm_xe_engine_class_instance *eci,
> +		     int64_t *timeout)
>  {
>  	struct drm_xe_wait_user_fence wait = {
>  		.addr = to_user_pointer(addr),
> @@ -456,14 +456,26 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
>  		.value = value,
>  		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> -		.timeout = timeout,
>  		.num_engines = eci ? 1 :0,
>  		.instances = eci ? to_user_pointer(eci) : 0,
>  	};
>  
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +	igt_assert(timeout);
> +	wait.timeout = *timeout;
> +
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
> +	igt_assert_eq(__xe_wait_ufence(fd, addr, value, eci, &timeout), 0);
> +	return timeout;
>  }
>  
>  /**
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 6d91d3e8e6..0ecc04baf4 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -88,6 +88,9 @@ void xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
> +int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		     struct drm_xe_engine_class_instance *eci,
> +		     int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       struct drm_xe_engine_class_instance *eci,
>  		       int64_t timeout);
> -- 
> 2.38.0
> 
