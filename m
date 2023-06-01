Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B371E10E244
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 17:32:58 +0000 (UTC)
Date: Thu, 1 Jun 2023 19:32:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230601173257.w3ypbnwzxvw6ok2y@kamilkon-desk1>
References: <20230531193043.558461-1-zbigniew.kempczynski@intel.com>
 <20230531193043.558461-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230531193043.558461-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] xe/xe_ioctl: Add
 xe_wait_ufence_abstime() helper
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

On 2023-05-31 at 21:30:41 +0200, Zbigniew Kempczyński wrote:
> Xe user fences supports passing timeout in relative or absolute form.
> Add helper for absolute one.

Please add lib/ in Subject, for example:

lib/xe_ioctl: Add xe_wait_ufence_abstime() helper

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 66a8393fe9..fe61b70a83 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -418,6 +418,26 @@ void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
>  }
>  

Please write documentation for this new public function.

Regards,
Kamil

> +long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> +			    struct drm_xe_engine_class_instance *eci,
> +			    int64_t timeout)
> +{
> +	struct drm_xe_wait_user_fence wait = {
> +		.addr = to_user_pointer(addr),
> +		.op = DRM_XE_UFENCE_WAIT_EQ,
> +		.flags = !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP | DRM_XE_UFENCE_WAIT_ABSTIME : 0,
> +		.value = value,
> +		.mask = DRM_XE_UFENCE_WAIT_U64,
> +		.timeout = timeout,
> +		.num_engines = eci ? 1 : 0,
> +		.instances = eci ? to_user_pointer(eci) : 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +
> +	return wait.timeout;
> +}
> +
>  void xe_force_gt_reset(int fd, int gt)
>  {
>  	char reset_string[128];
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 049cd183d6..9b44892fe9 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -82,6 +82,9 @@ void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
>  void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		    struct drm_xe_engine_class_instance *eci,
>  		    int64_t timeout);
> +long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> +			    struct drm_xe_engine_class_instance *eci,
> +			    int64_t timeout);
>  void xe_force_gt_reset(int fd, int gt);
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
>  		   uint32_t property, uint32_t value);
> -- 
> 2.34.1
> 
