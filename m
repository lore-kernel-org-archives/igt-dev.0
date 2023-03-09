Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0863E10E1C2
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 17:22:46 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.13.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EBCF2580BBE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 09:22:36 -0800 (PST)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1paKuR-00DPH9-1E
 for igt-dev@lists.freedesktop.org; Thu, 09 Mar 2023 18:22:34 +0100
Message-ID: <3c2db923-2017-052c-9089-b42b4bee055b@linux.intel.com>
Date: Thu, 9 Mar 2023 18:22:34 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230309160149.101973-1-zbigniew.kempczynski@intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230309160149.101973-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_*: use correct MI_STORE_DWORD_IMM
 command length
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

On 3/9/23 17:01, Zbigniew Kempczyński wrote:
> Series which introduced intel_gpu_commands contains all necessary
> updates for i915 tests. Xe series was merged after this so this
> incompatibility wasn't catched during rebase. Alter all xe code
> which uses MI_STORE_DWORD_IMM (length 1) to MI_STORE_DWORD_IMM_GEN4
> (length 2).
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> ---
>   lib/xe/xe_spin.c                |  2 +-
>   tests/xe/xe_dma_buf_sync.c      |  2 +-
>   tests/xe/xe_evict.c             |  4 ++--
>   tests/xe/xe_exec_balancer.c     |  4 ++--
>   tests/xe/xe_exec_basic.c        |  2 +-
>   tests/xe/xe_exec_compute_mode.c |  2 +-
>   tests/xe/xe_exec_fault_mode.c   |  2 +-
>   tests/xe/xe_exec_reset.c        |  6 +++---
>   tests/xe/xe_exec_threads.c      |  6 +++---
>   tests/xe/xe_guc_pc.c            |  2 +-
>   tests/xe/xe_pm.c                |  2 +-
>   tests/xe/xe_vm.c                | 20 ++++++++++----------
>   12 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 6dc705aea6..856d0ba225 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -35,7 +35,7 @@ void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
>   	spin->start = 0;
>   	spin->end = 0xffffffff;
>   
> -	spin->batch[b++] = MI_STORE_DWORD_IMM;
> +	spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   	spin->batch[b++] = start_addr;
>   	spin->batch[b++] = start_addr >> 32;
>   	spin->batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
> index 62aafe08d0..e1a652ff53 100644
> --- a/tests/xe/xe_dma_buf_sync.c
> +++ b/tests/xe/xe_dma_buf_sync.c
> @@ -180,7 +180,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   		syncobj_import_sync_file(fd[1], syncobj, sync_fd);
>   
>   		/* Do an exec with syncobj as in fence on FD[1] */
> -		data[i]->batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i]->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i]->batch[b++] = sdi_addr;
>   		data[i]->batch[b++] = sdi_addr >> 32;
>   		data[i]->batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
> index b54a503a18..6741b07365 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -131,7 +131,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>   		addr += bo_size;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -314,7 +314,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>   		addr += bo_size;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
> index 1d5743a467..809dcebb1d 100644
> --- a/tests/xe/xe_exec_balancer.c
> +++ b/tests/xe/xe_exec_balancer.c
> @@ -267,7 +267,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
>   			batches[j] = batch_addr;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -499,7 +499,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
> index f259cd1058..d9af97d80c 100644
> --- a/tests/xe/xe_exec_basic.c
> +++ b/tests/xe/xe_exec_basic.c
> @@ -175,7 +175,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
> index 0f674f5964..d0cd0e57f8 100644
> --- a/tests/xe/xe_exec_compute_mode.c
> +++ b/tests/xe/xe_exec_compute_mode.c
> @@ -193,7 +193,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
> index 065bfb61d2..2a67352c2a 100644
> --- a/tests/xe/xe_exec_fault_mode.c
> +++ b/tests/xe/xe_exec_fault_mode.c
> @@ -215,7 +215,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
> index 2b47a6b059..a5bde252e8 100644
> --- a/tests/xe/xe_exec_reset.c
> +++ b/tests/xe/xe_exec_reset.c
> @@ -200,7 +200,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
>   			exec_addr = spin_addr;
>   		} else {
>   			b = 0;
> -			data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   			data[i].batch[b++] = sdi_addr;
>   			data[i].batch[b++] = sdi_addr >> 32;
>   			data[i].batch[b++] = 0xc0ffee;
> @@ -349,7 +349,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   			exec_addr = spin_addr;
>   		} else {
>   			b = 0;
> -			data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   			data[i].batch[b++] = sdi_addr;
>   			data[i].batch[b++] = sdi_addr >> 32;
>   			data[i].batch[b++] = 0xc0ffee;
> @@ -501,7 +501,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   			exec_addr = spin_addr;
>   		} else {
>   			b = 0;
> -			data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   			data[i].batch[b++] = sdi_addr;
>   			data[i].batch[b++] = sdi_addr >> 32;
>   			data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
> index edf104900c..9601e1a2dc 100644
> --- a/tests/xe/xe_exec_threads.c
> +++ b/tests/xe/xe_exec_threads.c
> @@ -143,7 +143,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>   			batches[j] = batch_addr;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -338,7 +338,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -563,7 +563,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   			exec_addr = spin_addr;
>   		} else {
>   			b = 0;
> -			data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   			data[i].batch[b++] = sdi_addr;
>   			data[i].batch[b++] = sdi_addr >> 32;
>   			data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
> index 52ccea3916..3ed6d36ff0 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -78,7 +78,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 9c8f50781f..cf4fb8fad2 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -214,7 +214,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index e59c1dd5e2..f3dd926b24 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -53,7 +53,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
>   		igt_assert(addrs[i] + sizeof(uint32_t) <= batch_addr ||
>   			   batch_addr + batch_size <= addrs[i]);
>   
> -		batch_map[b++] = MI_STORE_DWORD_IMM;
> +		batch_map[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		batch_map[b++] = addr_low(addrs[i]);
>   		batch_map[b++] = addr_high(fd, addrs[i]);
>   		batch_map[b++] = hash_addr(addrs[i]);
> @@ -485,7 +485,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>   		int e = i % n_engines;
>   
>   		b = 0;
> -		data[i]->batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i]->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i]->batch[b++] = sdi_addr;
>   		data[i]->batch[b++] = sdi_addr >> 32;
>   		data[i]->batch[b++] = 0xc0ffee;
> @@ -534,7 +534,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>   
>   		b = 0;
>   		memset(data[i], 0, sizeof(struct shared_pte_page_data));
> -		data[i]->batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i]->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i]->batch[b++] = sdi_addr;
>   		data[i]->batch[b++] = sdi_addr >> 32;
>   		data[i]->batch[b++] = 0xc0ffee;
> @@ -675,7 +675,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
>   		 * progress.
>   		 */
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -787,7 +787,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   		uint64_t sdi_addr = addr + sdi_offset;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -920,7 +920,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   		data = map + (addr - base_addr);
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data[i].batch[b++] = sdi_addr;
>   		data[i].batch[b++] = sdi_addr >> 32;
>   		data[i].batch[b++] = 0xc0ffee;
> @@ -1029,7 +1029,7 @@ static void *hammer_thread(void *tdata)
>   		uint64_t sdi_addr = t->addr + sdi_offset;
>   
>   		b = 0;
> -		data->batch[b++] = MI_STORE_DWORD_IMM;
> +		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data->batch[b++] = sdi_addr;
>   		data->batch[b++] = sdi_addr >> 32;
>   		data->batch[b++] = 0xc0ffee;
> @@ -1155,7 +1155,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>   		data = map + i * page_size;
>   
>   		b = 0;
> -		data->batch[b++] = MI_STORE_DWORD_IMM;
> +		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data->batch[b++] = sdi_addr;
>   		data->batch[b++] = sdi_addr >> 32;
>   		data->batch[b++] = 0xc0ffee;
> @@ -1212,7 +1212,7 @@ try_again_after_invalidate:
>   		if (i < unbind_n_page_offfset ||
>   		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
>   			b = 0;
> -			data->batch[b++] = MI_STORE_DWORD_IMM;
> +			data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   			data->batch[b++] = sdi_addr;
>   			data->batch[b++] = sdi_addr >> 32;
>   			data->batch[b++] = 0xc0ffee;
> @@ -1283,7 +1283,7 @@ try_again_after_invalidate:
>   		data = map + i * page_size;
>   
>   		b = 0;
> -		data->batch[b++] = MI_STORE_DWORD_IMM;
> +		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>   		data->batch[b++] = sdi_addr;
>   		data->batch[b++] = sdi_addr >> 32;
>   		data->batch[b++] = 0xc0ffee;
