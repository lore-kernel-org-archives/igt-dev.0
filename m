Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E03B10EAF8
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 18:57:52 +0000 (UTC)
Date: Thu, 23 Mar 2023 19:57:48 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230323185722.t6bmtwkzlw3atbjs@zkempczy-mobl2>
References: <20230320100017.2913328-1-bhanuprakash.modem@intel.com>
 <20230320100017.2913328-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320100017.2913328-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 1/5] lib/xe/xe_ioctl: Add a helper to map the
 buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, jani.nikula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 03:30:13PM +0530, Bhanuprakash Modem wrote:
> Create a new helper to map the buffer with the user PROT flags.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 14 ++++++++++++--
>  lib/xe/xe_ioctl.h |  1 +
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 9d5793dff..66a8393fe 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -334,18 +334,28 @@ uint64_t xe_bo_mmap_offset(int fd, uint32_t bo)
>  	return mmo.offset;
>  }
>  
> -void *xe_bo_map(int fd, uint32_t bo, size_t size)
> +static void *__xe_bo_map(int fd, uint16_t bo, size_t size, int prot)
>  {
>  	uint64_t mmo;
>  	void *map;
>  
>  	mmo = xe_bo_mmap_offset(fd, bo);
> -	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> +	map = mmap(NULL, size, prot, MAP_SHARED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
>  
>  	return map;
>  }
>  
> +void *xe_bo_map(int fd, uint32_t bo, size_t size)
> +{
> +	return __xe_bo_map(fd, bo, size, PROT_WRITE);
> +}
> +
> +void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
> +{
> +	return __xe_bo_map(fd, bo, size, prot);
> +}
> +
>  static int __xe_exec(int fd, struct drm_xe_exec *exec)
>  {
>  	int err = 0;
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 5c7e773fa..d8c40eda0 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -73,6 +73,7 @@ uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class);
>  void xe_engine_destroy(int fd, uint32_t engine);
>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>  void *xe_bo_map(int fd, uint32_t bo, size_t size);
> +void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
>  void xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs);
> -- 
> 2.40.0
>

Looks good:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
