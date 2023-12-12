Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C4D10E6AC
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 21:31:34 +0000 (UTC)
Message-ID: <0f65d2d6-9f6e-4fbb-bb01-6121cf77c879@intel.com>
Date: Tue, 12 Dec 2023 13:31:27 -0800
Subject: Re: [PATCH v1 2/6] drm-uapi/xe: add exec_queue_id member to
 drm_xe_wait_user_fence structure
Content-Language: en-US
To: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231212173059.7-1-francois.dugast@intel.com>
 <20231212173059.7-3-francois.dugast@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231212173059.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 12/12/2023 9:30 AM, Francois Dugast wrote:
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> 
> remove the num_engines/instances members from drm_xe_wait_user_fence structure
> and add a exec_queue_id member
> 
> Right now this is only checking if the engine list is sane and nothing
> else. In the end every operation with this IOCTL is a soft check.
> So, let's formalize that and only use this IOCTL to wait on the fence.
> 
> exec_queue_id member will help to user space to get proper error code
> from kernel while in exec_queue reset
> 
> v2: Also fix test invalid_flag (Francois Dugast)
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   include/drm-uapi/xe_drm.h          | 17 +++++-----------
>   lib/xe/xe_ioctl.c                  | 29 ++++++++++++---------------
>   lib/xe/xe_ioctl.h                  | 11 ++++------
>   tests/intel/xe_evict.c             |  4 ++--
>   tests/intel/xe_exec_balancer.c     | 15 +++++++-------
>   tests/intel/xe_exec_compute_mode.c | 18 ++++++++---------
>   tests/intel/xe_exec_fault_mode.c   | 21 +++++++++++---------
>   tests/intel/xe_exec_reset.c        |  6 +++---
>   tests/intel/xe_exec_threads.c      | 15 +++++++-------
>   tests/intel/xe_waitfence.c         | 32 ++++++++++++++----------------
>   10 files changed, 79 insertions(+), 89 deletions(-)
> 
[snip]
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 094b34896..8e6c2e2e4 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -564,7 +564,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>   
>   #define THREE_SEC	MS_TO_NS(3000)
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
>   	data[0].vm_sync = 0;
>   
>   	for (i = 0; i < n_execs; i++) {
> @@ -621,7 +621,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   		int err;
>   
>   		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -				       NULL, &timeout);
> +				       exec_queues[i % n_exec_queues], &timeout);
>   		if (flags & GT_RESET)
>   			/* exec races with reset: may timeout or complete */
>   			igt_assert(err == -ETIME || !err);

I believe driver now returns EIO instead of ETIME, if I understand the 
driver changes from Krishnaiah.
So seems igt_assert above needs to replace -ETIME with -EIO.

-Brian


> @@ -631,7 +631,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
>   
>   	if (!(flags & GT_RESET)) {
>   		for (i = 1; i < n_execs; i++)
[snip]
