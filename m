Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D045210E614
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 19:16:13 +0000 (UTC)
Date: Tue, 11 Apr 2023 21:16:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Message-ID: <20230411191609.2esm57gth6lnjwle@zkempczy-mobl2>
References: <20230411135358.2981763-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411135358.2981763-1-christoph.manszewski@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/xe: Set syncs pointer in drm_xe_exec
 correctly
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

On Tue, Apr 11, 2023 at 03:53:58PM +0200, Christoph Manszewski wrote:
> Drop the 'address-of' operator as xe_exec_ioctl expects a pointer
> to 'struct drm_xe_sync' array.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/xe/xe_dma_buf_sync.c      |  2 +-
>  tests/xe/xe_evict.c             |  4 ++--
>  tests/xe/xe_exec_balancer.c     |  6 +++---
>  tests/xe/xe_exec_basic.c        |  2 +-
>  tests/xe/xe_exec_compute_mode.c |  2 +-
>  tests/xe/xe_exec_fault_mode.c   |  4 ++--
>  tests/xe/xe_exec_reset.c        |  8 ++++----
>  tests/xe/xe_exec_threads.c      |  6 +++---
>  tests/xe/xe_guc_pc.c            |  2 +-
>  tests/xe/xe_pm.c                |  2 +-
>  tests/xe/xe_vm.c                | 12 ++++++------
>  11 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
> index 8b97480a..8920b141 100644
> --- a/tests/xe/xe_dma_buf_sync.c
> +++ b/tests/xe/xe_dma_buf_sync.c
> @@ -152,7 +152,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  		};
>  		struct drm_xe_exec exec = {
>  			.num_batch_buffer = 1,
> -			.syncs = to_user_pointer(&sync),
> +			.syncs = to_user_pointer(sync),

I wondered before why &sync is working here.

Luckily for us &sync == sync (compiler generates same addresses).
But I agree with you that 'sync' without & should be used.
Some explanation of this phenomena is sync == &sync[0], what
matches to struct drm_xe_exec *ptr. Initialization like

ptr = &sync;

will generate compiler warning so your patch is correct, from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		};
>  		uint32_t syncobj;
>  		int b = 0;
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
> index eddbbd6f..5687cce3 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -44,7 +44,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t syncobjs[MAX_N_ENGINES];
> @@ -220,7 +220,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t *bo;
> diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
> index f3341a99..2018c810 100644
> --- a/tests/xe/xe_exec_balancer.c
> +++ b/tests/xe/xe_exec_balancer.c
> @@ -44,7 +44,7 @@ static void test_all_active(int fd, int gt, int class)
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_INSTANCE];
>  	uint32_t syncobjs[MAX_INSTANCE];
> @@ -186,7 +186,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t syncobjs[MAX_N_ENGINES];
> @@ -407,7 +407,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	size_t bo_size;
> diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
> index 2a3cebd3..2a176a5b 100644
> --- a/tests/xe/xe_exec_basic.c
> +++ b/tests/xe/xe_exec_basic.c
> @@ -86,7 +86,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr[MAX_N_ENGINES];
>  	uint32_t vm[MAX_N_ENGINES];
> diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
> index 60713a95..68519399 100644
> --- a/tests/xe/xe_exec_compute_mode.c
> +++ b/tests/xe/xe_exec_compute_mode.c
> @@ -98,7 +98,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t bind_engines[MAX_N_ENGINES];
> diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
> index b5d924a3..a3ab1727 100644
> --- a/tests/xe/xe_exec_fault_mode.c
> +++ b/tests/xe/xe_exec_fault_mode.c
> @@ -118,7 +118,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t bind_engines[MAX_N_ENGINES];
> @@ -360,7 +360,7 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engine;
>  	size_t bo_size;
> diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
> index 57dc90dd..0d72a3f2 100644
> --- a/tests/xe/xe_exec_reset.c
> +++ b/tests/xe/xe_exec_reset.c
> @@ -38,7 +38,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engine;
>  	uint32_t syncobj;
> @@ -160,7 +160,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t syncobjs[MAX_N_ENGINES];
> @@ -372,7 +372,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t syncobjs[MAX_N_ENGINES];
> @@ -549,7 +549,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	size_t bo_size;
> diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
> index c34d8aec..3f2c2de9 100644
> --- a/tests/xe/xe_exec_threads.c
> +++ b/tests/xe/xe_exec_threads.c
> @@ -53,7 +53,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	struct drm_xe_sync sync_all[MAX_N_ENGINES];
>  	struct drm_xe_exec exec = {
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t syncobjs[MAX_N_ENGINES];
> @@ -262,7 +262,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	size_t bo_size;
> @@ -471,7 +471,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t bind_engines[MAX_N_ENGINES];
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
> index 39a755d7..5c71ae14 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -42,7 +42,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t bind_engines[MAX_N_ENGINES];
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 23b8246e..44154143 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -216,7 +216,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t bind_engines[MAX_N_ENGINES];
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index c09b9714..d4cec104 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -529,7 +529,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t syncobjs[MAX_N_ENGINES];
> @@ -701,7 +701,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  #define N_ENGINES	2
>  	uint32_t engines[N_ENGINES];
> @@ -857,7 +857,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t engine, bind_engine = 0;
>  #define BIND_ARRAY_MAX_N_EXEC	16
> @@ -1029,7 +1029,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr = 0x1ull << 30, base_addr = 0x1ull << 30;
>  	uint32_t vm;
> @@ -1184,7 +1184,7 @@ static void *hammer_thread(void *tdata)
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	struct {
>  		uint32_t batch[16];
> @@ -1303,7 +1303,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
>  		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> +		.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
>  	uint32_t vm;
> -- 
> 2.39.2
> 
