Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7F110E569
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 14:57:29 +0000 (UTC)
Message-ID: <8165db17-3d71-4192-8e6e-f4f45e41a46c@linux.intel.com>
Date: Tue, 5 Dec 2023 15:57:26 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20231205131708.15210-1-nirmoy.das@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231205131708.15210-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/xe_spin_batch: Fix compilation
 failures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Kamil merged revert of previous patch which caused build failure,

I will resend this one squashed with the reverted one.

https://patchwork.freedesktop.org/series/127363/


Thanks,

Nirmoy

On 12/5/2023 2:17 PM, Nirmoy Das wrote:
> Fix compilation failures with recent uAPI changes.
>
> v2: add missing DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
>      flag(Matt).
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   tests/intel/xe_spin_batch.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 87e1a86a2..e8dca7826 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -165,7 +165,7 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
>   static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
>   {
>   	struct drm_xe_sync sync = {
> -		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
> +		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
>   	};
>   	struct drm_xe_exec exec = {
>   		.num_batch_buffer = 1,
> @@ -195,8 +195,9 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create_flags(fd, vm, bo_size,
> -				visible_vram_if_possible(fd, hwe->gt_id));
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, hwe->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0, addr, bo_size, &sync, 1);
>   	data = xe_bo_map(fd, bo, bo_size);
> @@ -267,7 +268,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>   	if (flags & SPIN_FIX_DURATION_PREEMPT)
>   		ext = to_user_pointer(&ext_prio);
>   
> -	xe_for_each_hw_engine(fd, _hwe)
> +	xe_for_each_engine(fd, _hwe)
>   		if (_hwe->engine_class == class && _hwe->gt_id == gt)
>   			hwe = _hwe;
>   
> @@ -348,7 +349,7 @@ igt_main
>   
>   	igt_subtest("spin-fixed-duration-with-preempter")
>   		xe_for_each_gt(fd, gt)
> -			xe_for_each_hw_engine_class(class)
> +			xe_for_each_engine_class(class)
>   				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
>   
>   	igt_fixture
