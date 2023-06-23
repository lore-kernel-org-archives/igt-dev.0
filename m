Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715ED10E631
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 07:32:35 +0000 (UTC)
Date: Fri, 23 Jun 2023 09:32:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230623093229.46db7b8e@maurocar-mobl2>
In-Reply-To: <20230608140208.41492-2-matthew.brost@intel.com>
References: <20230608140208.41492-1-matthew.brost@intel.com>
 <20230608140208.41492-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] xe/xe_exec_basic: A sections to test NULL
 (sparse) bindings
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

On Thu,  8 Jun 2023 07:02:08 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Update xe_exec_basic which create a NULL binding for store data address,
> this store should just be dropped.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/xe/xe_exec_basic.c | 33 ++++++++++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
> index 059e6ae89..a1c66fd5c 100644
> --- a/tests/xe/xe_exec_basic.c
> +++ b/tests/xe/xe_exec_basic.c
> @@ -28,6 +28,7 @@
>  #define BIND_ENGINE	(0x1 << 4)
>  #define DEFER_ALLOC	(0x1 << 5)
>  #define DEFER_BIND	(0x1 << 6)
> +#define SPARSE		(0x1 << 7)
>  
>  /**
>   * SUBTEST: once-%s
> @@ -74,6 +75,10 @@
>   * @bindengine-userptr-rebind:		bind engine userptr rebind
>   * @bindengine-userptr-invalidate:	bind engine userptr invalidate
>   * @bindengine-userptr-invalidate-race:	bind engine userptr invalidate racy
> + * @null:				null
> + * @null-defer-mmap:			null defer mmap
> + * @null-defer-bind:			null defer bind
> + * @null-rebind:			null rebind
>   */
>  
>  static void
> @@ -90,6 +95,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		.syncs = to_user_pointer(sync),
>  	};
>  	uint64_t addr[MAX_N_ENGINES];
> +	uint64_t sparse_addr[MAX_N_ENGINES];
>  	uint32_t vm[MAX_N_ENGINES];
>  	uint32_t engines[MAX_N_ENGINES];
>  	uint32_t bind_engines[MAX_N_ENGINES];
> @@ -114,8 +120,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_get_default_alignment(fd));
>  
>  	addr[0] = 0x1a0000;
> -	for (i = 1; i < MAX_N_ENGINES; ++i)
> +	sparse_addr[0] = 0x301a0000;
> +	for (i = 1; i < MAX_N_ENGINES; ++i) {
>  		addr[i] = addr[i - 1] + (0x1ull << 32);
> +		sparse_addr[i] = sparse_addr[i - 1] + (0x1ull << 32);
> +	}
>  
>  	if (flags & USERPTR) {
>  #define	MAP_ADDRESS	0x00007fadeadbe000
> @@ -164,6 +173,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_vm_bind_userptr_async(fd, vm[i], bind_engines[i],
>  						 to_user_pointer(data), addr[i],
>  						 bo_size, sync, 1);
> +		if (flags & SPARSE)
> +			__xe_vm_bind_assert(fd, vm[i], bind_engines[i],
> +					    0, 0, sparse_addr[i], bo_size,
> +					    XE_VM_BIND_OP_MAP |
> +					    XE_VM_BIND_FLAG_ASYNC |
> +					    XE_VM_BIND_FLAG_NULL, sync,
> +					    1, 0, 0);
>  	}
>  
>  	if (flags & DEFER_BIND)
> @@ -175,7 +191,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>  		uint64_t batch_addr = __addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr = __addr + sdi_offset;
> +		uint64_t sdi_addr = (flags & SPARSE ? sparse_addr[i % n_vm] :
> +				     __addr)+ sdi_offset;
>  		int e = i % n_engines;
>  
>  		b = 0;
> @@ -262,9 +279,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  					INT64_MAX, 0, NULL));
>  	}
>  
> -	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
> -	     i < n_execs; i++)
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> +	if (!(flags & SPARSE)) {
> +		for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
> +		     i < n_execs; i++)
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
>  
>  	for (i = 0; i < n_engines; i++) {
>  		syncobj_destroy(fd, syncobjs[i]);
> @@ -297,6 +316,10 @@ igt_main
>  		{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
>  		{ "userptr", USERPTR },
>  		{ "rebind", REBIND },
> +		{ "null", SPARSE },
> +		{ "null-defer-mmap", SPARSE | DEFER_ALLOC },
> +		{ "null-defer-bind", SPARSE | DEFER_ALLOC | DEFER_BIND },
> +		{ "null-rebind", SPARSE | REBIND },
>  		{ "userptr-rebind", USERPTR | REBIND },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
>  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
