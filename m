Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23D10E6FC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 15:33:05 +0000 (UTC)
Date: Thu, 13 Jul 2023 11:32:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLAZJecArErz6wRf@intel.com>
References: <20230710145856.1864141-1-matthew.brost@intel.com>
 <20230710145856.1864141-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230710145856.1864141-4-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 4/5] xe_vm: Unmap BOs in bind queue
 independent test
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

On Mon, Jul 10, 2023 at 07:58:55AM -0700, Matthew Brost wrote:
> Exercises the maple tree dep tracker logic.

could you please add a bit more of explanation here on how this
is achieving the objective?

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/xe/xe_vm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 5fd511f0b..36cd80357 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -811,6 +811,12 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
>  				NULL));
>  	igt_assert_eq(data[0].data, 0xc0ffee);
>  
> +	syncobj_destroy(fd, sync[0].handle);
> +	sync[0].handle = syncobj_create(fd, 0);
> +	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
> +	xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));

should we have an extra flag for this? no risk to the existent tests?

> +
>  	syncobj_destroy(fd, sync[0].handle);
>  	for (i = 0; i < N_ENGINES; i++) {
>  		syncobj_destroy(fd, syncobjs[i]);
> -- 
> 2.34.1
> 
