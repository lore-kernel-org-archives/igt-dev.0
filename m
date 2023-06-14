Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5707D10E43C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 10:34:58 +0000 (UTC)
Date: Wed, 14 Jun 2023 12:34:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614103454.3zxcgszfp2vnb2rr@kamilkon-desk1>
References: <20230602162011.90097-1-zbigniew.kempczynski@intel.com>
 <20230602162011.90097-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602162011.90097-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/xe_ioctl: Return remaining
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

On 2023-06-02 at 18:20:09 +0200, Zbigniew Kempczyński wrote:
> When user fence is signalled we may want to be aware how long did it
> take. Return remaining timeout after fence was successfully signalled.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/xe/xe_ioctl.c | 4 +++-
>  lib/xe/xe_ioctl.h | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 3331046b46..e73c581f9f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -401,7 +401,7 @@ void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
>  	syncobj_destroy(fd, sync.handle);
>  }
>  
> -void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +long xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-- ^^^^
imho this should be uint64_t

Regards,
Kamil

>  		    struct drm_xe_engine_class_instance *eci,
>  		    int64_t timeout)
>  {
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
> index 9b44892fe9..860de9af58 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -79,7 +79,7 @@ void xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
> -void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +long xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		    struct drm_xe_engine_class_instance *eci,
>  		    int64_t timeout);
>  long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> -- 
> 2.34.1
> 
