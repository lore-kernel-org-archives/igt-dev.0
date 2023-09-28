Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70FA10E64C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 12:19:39 +0000 (UTC)
Date: Thu, 28 Sep 2023 14:19:16 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <ZRVvRFHn5OJjL6Db@fdugast-desk.home>
References: <20230928110516.7-1-francois.dugast@intel.com>
 <20230928110516.7-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928110516.7-9-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 08/14] drm-uapi/xe: Use common
 drm_xe_ext_set_property extension
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:05:10AM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with commit ("drm/xe/uapi: Use common drm_xe_ext_set_property extension")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/drm-uapi/xe_drm.h     | 21 +++------------------
>  tests/intel/xe_exec_reset.c   | 10 +++++-----
>  tests/intel/xe_exec_threads.c |  4 ++--
>  tests/intel/xe_vm.c           |  2 +-
>  4 files changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 734af1b62..a2dc80727 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -569,12 +569,11 @@ struct drm_xe_vm_bind_op_error_capture {
>  	__u64 size;
>  };
>  
> -/** struct drm_xe_ext_vm_set_property - VM set property extension */
> -struct drm_xe_ext_vm_set_property {
> +/** struct drm_xe_ext_set_property - XE set property extension */
> +struct drm_xe_ext_set_property {
>  	/** @base: base user extension */
>  	struct xe_user_extension base;
>  
> -#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	/** @property: property to set */
>  	__u32 property;
>  
> @@ -590,6 +589,7 @@ struct drm_xe_ext_vm_set_property {
>  
>  struct drm_xe_vm_create {
>  #define XE_VM_EXTENSION_SET_PROPERTY	0
> +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -754,21 +754,6 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> -/** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
> -struct drm_xe_ext_exec_queue_set_property {
> -	/** @base: base user extension */
> -	struct xe_user_extension base;
> -
> -	/** @property: property to set */
> -	__u32 property;
> -
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
> -	/** @value: property value */
> -	__u64 value;
> -};
> -
>  /**
>   * struct drm_xe_exec_queue_set_property - exec queue set property
>   *
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 68e17cc98..ca8d7cc13 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -185,13 +185,13 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_exec_queue_set_property job_timeout = {
> +		struct drm_xe_ext_set_property job_timeout = {
>  			.base.next_extension = 0,
>  			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property = XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
>  			.value = 50,
>  		};
> -		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
> +		struct drm_xe_ext_set_property preempt_timeout = {
>  			.base.next_extension = 0,
>  			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> @@ -372,13 +372,13 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_exec_queue_set_property job_timeout = {
> +		struct drm_xe_ext_set_property job_timeout = {
>  			.base.next_extension = 0,
>  			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property = XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
>  			.value = 50,
>  		};
> -		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
> +		struct drm_xe_ext_set_property preempt_timeout = {
>  			.base.next_extension = 0,
>  			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> @@ -540,7 +540,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	memset(data, 0, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
> +		struct drm_xe_ext_set_property preempt_timeout = {
>  			.base.next_extension = 0,
>  			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 306d8113d..b22c9c052 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -518,7 +518,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	memset(sync_all, 0, sizeof(sync_all));
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
> +		struct drm_xe_ext_set_property preempt_timeout = {
>  			.base.next_extension = 0,
>  			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> @@ -1054,7 +1054,7 @@ static void threads(int fd, int flags)
>  	pthread_cond_init(&cond, 0);
>  
>  	if (flags & SHARED_VM) {
> -		struct drm_xe_ext_vm_set_property ext = {
> +		struct drm_xe_ext_set_property ext = {
>  			.base.next_extension = 0,
>  			.base.name = XE_VM_EXTENSION_SET_PROPERTY,
>  			.property =
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index f96305851..75e7a384b 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -404,7 +404,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  	};
>  #define N_BINDS		32
>  	struct drm_xe_vm_bind_op_error_capture capture = {};
> -	struct drm_xe_ext_vm_set_property ext = {
> +	struct drm_xe_ext_set_property ext = {
>  		.base.next_extension = 0,
>  		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
>  		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
> -- 
> 2.34.1
> 
