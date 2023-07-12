Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F02610E49F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 07:33:41 +0000 (UTC)
Message-ID: <02ceddc0-2934-d9ae-ad82-180989f8c9b1@intel.com>
Date: Wed, 12 Jul 2023 09:33:25 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
 <20230711112009.122482-5-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230711112009.122482-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 04/17] lib/xe_ioctl: Export
 non-assert xe_exec function
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

On 11.07.2023 13:19, Zbigniew Kempczyński wrote:
> Export __xe_exec() helper to allow caller to handle the error
> individually.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/xe/xe_ioctl.c | 2 +-
>   lib/xe/xe_ioctl.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)

That change is fine by me, but if you're really keen, you can check it 
with others.

But for now:
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 9ead7307c4..0b5c7a4fce 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -357,7 +357,7 @@ void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
>   	return __xe_bo_map(fd, bo, size, prot);
>   }
>   
> -static int __xe_exec(int fd, struct drm_xe_exec *exec)
> +int __xe_exec(int fd, struct drm_xe_exec *exec)
>   {
>   	int err = 0;
>   
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index e014ad66c9..320e0f9f68 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -75,6 +75,7 @@ void xe_engine_destroy(int fd, uint32_t engine);
>   uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>   void *xe_bo_map(int fd, uint32_t bo, size_t size);
>   void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
> +int __xe_exec(int fd, struct drm_xe_exec *exec);
>   void xe_exec(int fd, struct drm_xe_exec *exec);
>   void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
>   		  struct drm_xe_sync *sync, uint32_t num_syncs);
