Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA56E10E7B8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 12:00:50 +0000 (UTC)
Message-ID: <84082d79-28fd-46f8-aa94-315f61c393c5@linux.intel.com>
Date: Wed, 13 Dec 2023 13:00:45 +0100
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 1/2] lib/xe/xe_ioctl: add __xe_exec_sync() helper
Content-Language: en-US
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
References: <20231212174816.5292-1-lukasz.laguna@intel.com>
 <20231212174816.5292-2-lukasz.laguna@intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231212174816.5292-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 12/12/2023 6:48 PM, Lukasz Laguna wrote:
> Add non-asserting variant of xe_exec_sync().
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/xe/xe_ioctl.c | 12 +++++++++---
>   lib/xe/xe_ioctl.h |  2 ++
>   2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index cdad3d7e2..b5cd3ae35 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -448,8 +448,8 @@ void xe_exec(int fd, struct drm_xe_exec *exec)
>   	igt_assert_eq(__xe_exec(fd, exec), 0);
>   }
>   
> -void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
> -		  struct drm_xe_sync *sync, uint32_t num_syncs)
> +int __xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
> +		   struct drm_xe_sync *sync, uint32_t num_syncs)
>   {
>   	struct drm_xe_exec exec = {
>   		.exec_queue_id = exec_queue,
> @@ -459,7 +459,13 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>   		.num_batch_buffer = 1,
>   	};
>   
> -	igt_assert_eq(__xe_exec(fd, &exec), 0);
> +	return __xe_exec(fd, &exec);
> +}
> +
> +void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
> +		    struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	igt_assert_eq(__xe_exec_sync(fd, exec_queue, addr, sync, num_syncs), 0);
>   }

To be honest, I'm a bit confused with the xe_exec_sync naming.

sync typically refers to synchronous operations, which are operations 
that block further execution until they have finished, so I would
actually expect the xe_exec_wait behavior.

>   
>   void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index c8d46fb29..3679ce66b 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -88,6 +88,8 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size);
>   void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
>   int __xe_exec(int fd, struct drm_xe_exec *exec);
>   void xe_exec(int fd, struct drm_xe_exec *exec);
> +int __xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
> +		   struct drm_xe_sync *sync, uint32_t num_syncs);
>   void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>   		  struct drm_xe_sync *sync, uint32_t num_syncs);
>   void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
