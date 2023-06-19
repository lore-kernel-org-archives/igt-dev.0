Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C40510E0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 11:51:05 +0000 (UTC)
Date: Mon, 19 Jun 2023 13:51:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230619115102.ejsj3rg2kanof6z3@kamilkon-desk1>
References: <20230619053250.322791-1-zbigniew.kempczynski@intel.com>
 <20230619053250.322791-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230619053250.322791-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/4] lib/xe_ioctl: Return remaining
 timeout of user fence wait
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

Hi Zbigniew,

On 2023-06-19 at 07:32:48 +0200, Zbigniew Kempczyński wrote:
> When user fence is signalled we may want to be aware how long did it
> take. Return remaining timeout after fence was successfully signalled.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> ---
> v3: Replace long to int64_t as return value (Kamil)
> ---
>  lib/xe/xe_ioctl.c | 8 +++++---
>  lib/xe/xe_ioctl.h | 6 +++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index c8af747cf7..9ead7307c4 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -401,9 +401,9 @@ void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
>  	syncobj_destroy(fd, sync.handle);
>  }
>  
> -void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> -		    struct drm_xe_engine_class_instance *eci,
> -		    int64_t timeout)
> +int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       int64_t timeout)
>  {
>  	struct drm_xe_wait_user_fence wait = {
>  		.addr = to_user_pointer(addr),
> @@ -417,6 +417,8 @@ void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	};
>  
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +
> +	return wait.timeout;
>  }
>  
>  /**
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index d9d78f86c9..e014ad66c9 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -79,9 +79,9 @@ void xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
> -void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> -		    struct drm_xe_engine_class_instance *eci,
> -		    int64_t timeout);
> +int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       int64_t timeout);

Lgtm,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
>  			       struct drm_xe_engine_class_instance *eci,
>  			       int64_t timeout);
> -- 
> 2.34.1
> 
