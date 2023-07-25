Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50210E194
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 18:04:22 +0000 (UTC)
Date: Tue, 25 Jul 2023 20:04:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230725180418.mxnqokdcfp52rbmq@kamilkon-desk1>
References: <20230725071622.206601-1-janga.rahul.kumar@intel.com>
 <20230725071622.206601-3-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230725071622.206601-3-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/xe: Add hang library support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, kunal1.joshi@intel.com, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2023-07-25 at 12:46:22 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add hang library support using spinners.
> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  lib/igt_gt.c      | 21 +++++++++++++++++++++
------ ^^^^^^
Move this change into separate patch.

>  lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  6 ++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index 2ce464ba6..6821179ca 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -170,6 +170,15 @@ static void context_set_ban(int fd, unsigned ctx, unsigned ban)
>  
>  igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
>  {
> +	if (is_xe_device(fd)) {
> +		if (!igt_check_boolean_env_var("IGT_HANG", true))
> +			igt_skip("hang injection disabled by user [IGT_HANG=0]\n");
> +
> +		igt_require(has_gpu_reset(fd));
> +
> +		return (struct igt_hang){ 0, ctx, 0, flags };
> +       }
> +

Move code after declarations of vars.

>  	struct drm_i915_gem_context_param param = {
>  		.ctx_id = ctx,
>  	};
> @@ -219,6 +228,9 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
>  
>  void igt_disallow_hang(int fd, igt_hang_t arg)
>  {
> +	if (is_xe_device(fd))
> +		return;
> +
>  	context_set_ban(fd, arg.ctx, arg.ban);
>  
>  	if ((arg.flags & HANG_ALLOW_CAPTURE) == 0) {
> @@ -290,6 +302,9 @@ static bool has_ctx_exec(int fd, unsigned ring, uint32_t ctx)
>  static igt_hang_t __igt_hang_ctx(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>  				 unsigned flags)
>  {
> +	if (is_xe_device(fd))
> +		return xe_hang_engine(fd, ahnd, ctx, ring, flags);
> +

Move this after var declatarions.

>  	struct drm_i915_gem_context_param param;
>  	igt_spin_t *spin;
>  	unsigned ban;
> @@ -372,6 +387,12 @@ void igt_post_hang_ring(int fd, igt_hang_t arg)
>  	if (!arg.spin)
>  		return;
>  
> +	if (is_xe_device(fd)) {
> +		igt_spin_free(fd, arg.spin);
> +		xe_post_hang_ring(fd, arg);

It looks like spinner is not used here?

> +		return;
> +	}
> +
>  	gem_sync(fd, arg.spin->handle); /* Wait until it hangs */
>  	igt_spin_free(fd, arg.spin);
>  
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 488aa218e..5ec85239a 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -520,6 +520,26 @@ void xe_force_gt_reset(int fd, int gt)
>  	system(reset_string);
>  }
>  
> +
> +igt_hang_t xe_hang_engine(int fd, uint64_t ahnd, uint32_t ctx, int ring,
> +				unsigned flags)
> +{
> +	uint32_t vm;
> +	unsigned int engine;
> +	igt_spin_t *spin_t;

Add newline.

> +	vm = xe_vm_create(fd, 0, 0);
> +	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
----------------------------------------------- ^
Only one engine class here?

> +
> +	spin_t = igt_spin_new(fd, .ahnd = ahnd, .engine = engine, .vm = vm, .flags = IGT_SPIN_NO_PREEMPTION);

Add newline.

> +	return (igt_hang_t){ spin_t, engine, 0, flags };

Unused ring var?

> +}
> +
> +void xe_post_hang_ring(int fd, igt_hang_t arg)
> +{
> +	xe_engine_destroy(fd, arg.ctx);
> +	xe_vm_destroy(fd, arg.spin->vm);
> +}
> +
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
>  		   uint32_t property, uint32_t value)
>  {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 5a528b345..0e9708194 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -15,6 +15,9 @@
>  #include <stdint.h>
>  #include <xe_drm.h>
>  
> +#include "lib/igt_gt.h"
> +#include "xe_spin.h"
> +

Are you using new ioctl? If not maybe add xe_hang and xe_post_hang
to other library? Or create new one?

Regards,
Kamil

>  uint32_t xe_cs_prefetch_size(int fd);
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> @@ -89,6 +92,9 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
>  void xe_force_gt_reset(int fd, int gt);
>  void xe_force_gt_reset_all(int fd);
>  bool has_xe_gt_reset(int fd);
> +igt_hang_t xe_hang_engine(int fd, uint64_t ahnd, uint32_t ctx, int ring,
> +				unsigned flags);
> +void xe_post_hang_ring(int fd, igt_hang_t arg);
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
>  		   uint32_t property, uint32_t value);
>  
> -- 
> 2.25.1
> 
