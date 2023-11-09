Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A0F10E202
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 12:14:43 +0000 (UTC)
Date: Thu, 9 Nov 2023 13:14:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231109121435.umnr4spqwttkcjyu@kamilkon-desk.igk.intel.com>
References: <20231109024115.2950091-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231109024115.2950091-1-jesse.zhang@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/amdgpu: fix code sytle issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,
On 2023-11-09 at 10:41:15 +0800, Jesse Zhang wrote:

please correct subject:

[PATCH i-g-t 1/3] lib/amdgpu: fix code sytle issue
--------------------------------------- ^^
s/sytle/style/
Also drop "issue", so:

[PATCH i-g-t 1/3] lib/amdgpu: fix code style

> Fix some waring and error when check with checkpatch.pl, like these:
------------- ^ ----- ^ -------- ^^^^^^^^^^
warnings
errors

Fix some warings and errors spotted with checkpatch.pl, like these:

> 
> RROR: spaces required around that '=' (ctx:VxW)
- ^
ERROR:

> +       int fd= -1;
>               ^
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Tim Huang <tim.huang@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_pci_unplug.c | 50 ++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
> index 078398b5e..047a8700b 100644
> --- a/lib/amdgpu/amd_pci_unplug.c
> +++ b/lib/amdgpu/amd_pci_unplug.c
> @@ -1,4 +1,5 @@
> -/* SPDX-License-Identifier: MIT
> +// SPDX-License-Identifier: MIT
> +/*
>   * Copyright 2022 Advanced Micro Devices, Inc.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
> @@ -19,7 +20,8 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   * OTHER DEALINGS IN THE SOFTWARE.
>   *
> -*/
> + */
> +
>  #include <linux/limits.h>
>  #include <fcntl.h>
------------ ^^^^^^^
You may also want to sort them alphabetically,
in separate patch.

Regards,
Kamil

>  #include <sys/stat.h>

> @@ -68,10 +70,10 @@ static int
>  amdgpu_hotunplug_trigger(const char *pathname)
>  {
>  	int len;
> -	int fd= -1;
> +	int fd = -1;
>  
>  	fd = open(pathname, O_WRONLY);
> -	if (fd <= 0 )
> +	if (fd <= 0)
>  		goto release;
>  
>  	len = write(fd, "1", 1);
> @@ -93,7 +95,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
>  
>  	unplug->num_devices = amdgpu_open_devices(render_mode, MAX_CARDS_SUPPORTED,
>  											  unplug->drm_amdgpu_fds);
> -	if (unplug->num_devices == 0 )
> +	if (unplug->num_devices == 0)
>  		goto release;
>  
>  	if (setup->open_device && setup->open_device2 && unplug->num_devices < 2) {
> @@ -105,7 +107,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
>  	tmp_str = amdgpu_get_device_from_fd(unplug->drm_amdgpu_fds[0]);
>  	abort_oom_if_null(tmp_str);
>  	unplug->sysfs_remove = realloc(tmp_str, strlen(tmp_str) * 2);
> -	abort_oom_if_null(unplug->sysfs_remove );
> +	abort_oom_if_null(unplug->sysfs_remove);
>  	strcat(unplug->sysfs_remove, "/remove");
>  
>  	r = amdgpu_device_initialize(unplug->drm_amdgpu_fds[0], &major_version,
> @@ -140,6 +142,7 @@ static void
>  amdgpu_hotunplug_teardown_test(struct amd_pci_unplug *unplug)
>  {
>  	int i;
> +
>  	if (unplug->device_handle) {
>  		amdgpu_device_deinitialize(unplug->device_handle);
>  		unplug->device_handle = NULL;
> @@ -149,7 +152,7 @@ amdgpu_hotunplug_teardown_test(struct amd_pci_unplug *unplug)
>  		unplug->device_handle2 = NULL;
>  	}
>  	for (i = 0; i < unplug->num_devices; i++) {
> -		if (unplug->drm_amdgpu_fds[i] >= 0 ) {
> +		if (unplug->drm_amdgpu_fds[i] >= 0) {
>  			close(unplug->drm_amdgpu_fds[i]);
>  			unplug->drm_amdgpu_fds[i] = -1;
>  		}
> @@ -206,10 +209,11 @@ amdgpu_nop_cs(void *handle)
>  	struct amdgpu_cs_request ibs_request;
>  	struct amdgpu_cs_ib_info ib_info;
>  	int bo_cmd_size = 4096;
> -	struct amd_pci_unplug * unplug = handle;
> +	struct amd_pci_unplug *unplug = handle;
>  	amdgpu_device_handle device_handle = unplug->device_handle;
>  
> -	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
> +	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
> +
>  	r = amdgpu_cs_ctx_create(device_handle, &context);
>  	igt_assert_eq(r, 0);
>  
> @@ -221,7 +225,7 @@ amdgpu_nop_cs(void *handle)
>  
>  	memset(ib_result_cpu, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
> -	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP , 16);
> +	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16);
>  
>  	r = amdgpu_bo_list_create(device_handle, 1, &ib_result_handle, NULL, &bo_list);
>  	igt_assert_eq(r, 0);
> @@ -252,10 +256,11 @@ amdgpu_nop_cs(void *handle)
>  }
>  
>  static pthread_t*
> -amdgpu_create_cs_thread(struct amd_pci_unplug * unplug)
> +amdgpu_create_cs_thread(struct amd_pci_unplug *unplug)
>  {
>  	int r;
>  	pthread_t *thread = malloc(sizeof(*thread));
> +
>  	if (!thread)
>  		return NULL;
>  
> @@ -270,7 +275,7 @@ amdgpu_create_cs_thread(struct amd_pci_unplug * unplug)
>  }
>  
>  static void
> -amdgpu_wait_cs_thread(struct amd_pci_unplug * unplug, pthread_t *thread)
> +amdgpu_wait_cs_thread(struct amd_pci_unplug *unplug, pthread_t *thread)
>  {
>  	unplug->do_cs = false;
>  
> @@ -280,13 +285,13 @@ amdgpu_wait_cs_thread(struct amd_pci_unplug * unplug, pthread_t *thread)
>  
>  static void
>  amdgpu_hotunplug_test(bool render_mode, const struct amd_pci_unplug_setup *setup,
> -					  struct amd_pci_unplug * unplug,  bool with_cs)
> +					  struct amd_pci_unplug *unplug,  bool with_cs)
>  {
>  	int r;
>  	pthread_t *thread = NULL;
>  
>  	r = amdgpu_hotunplug_setup_test(render_mode, setup, unplug);
> -	igt_assert_eq(r , 1);
> +	igt_assert_eq(r, 1);
>  
>  	if (with_cs)
>  		thread = amdgpu_create_cs_thread(unplug);
> @@ -311,9 +316,9 @@ amdgpu_hotunplug_simple(struct amd_pci_unplug_setup *setup,
>  	amdgpu_hotunplug_test(true, setup, unplug, false);
>  }
>  
> - void
> - amdgpu_hotunplug_with_cs(struct amd_pci_unplug_setup *setup,
> - 						 struct amd_pci_unplug *unplug)
> +void
> +amdgpu_hotunplug_with_cs(struct amd_pci_unplug_setup *setup,
> +						 struct amd_pci_unplug *unplug)
>  {
>  	memset(unplug, 0, sizeof(*unplug));
>  	setup->open_device = true;
> @@ -339,7 +344,7 @@ amdgpu_hotunplug_with_exported_bo(struct amd_pci_unplug_setup *setup,
>  	setup->open_device = true;
>  
>  	r = amdgpu_hotunplug_setup_test(true, setup, unplug);
> -	igt_assert_eq(r , 1);
> +	igt_assert_eq(r, 1);
>  
>  	r = amdgpu_bo_alloc(unplug->device_handle, &request, &bo_handle);
>  	igt_assert_eq(r, 0);
> @@ -359,7 +364,7 @@ amdgpu_hotunplug_with_exported_bo(struct amd_pci_unplug_setup *setup,
>  	*ptr = 0xdeafbeef;
>  
>  	munmap(ptr, 4096);
> -	close (dma_buf_fd);
> +	close(dma_buf_fd);
>  
>  	r = amdgpu_hotunplug_rescan();
>  	igt_assert_eq(r > 0, 1);
> @@ -382,7 +387,7 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unplug_setup *setup,
>  	struct amdgpu_cs_fence fence_status = {0};
>  	int shared_fd;
>  	int bo_cmd_size = 4096;
> -	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
> +	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
>  
>  	memset(unplug, 0, sizeof(*unplug));
>  	setup->open_device = true;
> @@ -390,9 +395,8 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unplug_setup *setup,
>  
>  
>  	r = amdgpu_hotunplug_setup_test(true, setup, unplug);
> -	if( r != 1) {
> +	if (r != 1)
>  		goto release;
> -	}
>  
>  	r = amdgpu_cs_ctx_create(unplug->device_handle, &context);
>  	igt_assert_eq(r, 0);
> @@ -404,7 +408,7 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unplug_setup *setup,
>  	igt_assert_eq(r, 0);
>  	memset(ib_result_cpu, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
> -	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP , 16);
> +	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16);
>  
>  	r = amdgpu_bo_list_create(unplug->device_handle, 1, &ib_result_handle, NULL,
>  							  &bo_list);
> -- 
> 2.25.1
> 
