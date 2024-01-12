Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477E10EAD5
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 10:28:02 +0000 (UTC)
Date: Fri, 12 Jan 2024 11:27:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] lib/*.h: ensure that all includes will be there
Message-ID: <20240112102738.qovde4gx2gpwlilk@kamilkon-desk.igk.intel.com>
References: <20240111140218.464265-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240111140218.464265-1-mauro.chehab@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2024-01-11 at 15:01:27 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Headers should be self-contained, having all includes they need
> to built. Add the missing ones (alphabetically sorted).
> 
> Checking what includes were missed was done with the help of
> this small script:
> 
>     for i in $(ls lib/*.h|grep -v igt_freebsd.h|sort); do
> 	gcc -I . -I build/ -I include/ -I ./include/drm-uapi/ -I lib/ -I /usr/include/cairo/ -I /usr/include/glib-2.0 -I /usr/lib64/glib-2.0/include/ -c $i
>     done
> 
> While at this also sorted includes and added a missing logic
> to detect duplicated includes at igt_tread.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> 
> v2:
>   - improved patch description;
>   - sorted lib/intel_allocator_msgchannel.h alphabetically.
> 
>  lib/debug.h                      | 3 +++
>  lib/igt_chamelium_stream.h       | 3 +++
>  lib/igt_frame.h                  | 1 +
>  lib/igt_os.h                     | 2 ++
>  lib/igt_panfrost.h               | 4 ++++
>  lib/igt_pm.h                     | 5 +++++
>  lib/igt_sriov_device.h           | 3 +++
>  lib/igt_sysfs.h                  | 3 ++-
>  lib/igt_sysrq.h                  | 2 ++
>  lib/igt_thread.h                 | 7 +++++++
>  lib/igt_v3d.h                    | 3 +++
>  lib/igt_vc4.h                    | 5 +++++
>  lib/intel_allocator_msgchannel.h | 3 ++-
>  lib/intel_aub.h                  | 2 ++
>  lib/intel_compute.h              | 2 ++
>  lib/intel_io.h                   | 3 ++-
>  lib/intel_mocs.h                 | 2 ++
>  lib/media_spin.h                 | 2 ++
>  lib/veboxcopy.h                  | 2 ++
>  19 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/debug.h b/lib/debug.h
> index af9cf391e6a7..ca4b31e6c9da 100644
> --- a/lib/debug.h
> +++ b/lib/debug.h
> @@ -28,6 +28,9 @@
>  #ifndef _DEBUG_H_
>  #define _DEBUG_H_
>  
> +#include <stdint.h>
> +#include <stdio.h>
> +
>  #define DEBUG_PROTOCOL_VERSION 1
>  #define COMMUNICATION_OFFSET 0xc00
>  #define COMMUNICATION_QWORD 0xc0
> diff --git a/lib/igt_chamelium_stream.h b/lib/igt_chamelium_stream.h
> index 3e1c5d14ea55..685d9508a2d5 100644
> --- a/lib/igt_chamelium_stream.h
> +++ b/lib/igt_chamelium_stream.h
> @@ -27,6 +27,9 @@
>  #define IGT_CHAMELIUM_STREAM_H
>  
>  #include "config.h"
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
>  
>  enum chamelium_stream_realtime_mode {
>  	CHAMELIUM_STREAM_REALTIME_NONE = 0,
> diff --git a/lib/igt_frame.h b/lib/igt_frame.h
> index f44f57d7ce73..cf2009716bdf 100644
> --- a/lib/igt_frame.h
> +++ b/lib/igt_frame.h
> @@ -29,6 +29,7 @@
>  
>  #include "config.h"
>  
> +#include <cairo.h>
>  #include <stdbool.h>
>  
>  bool igt_frame_dump_is_enabled(void);
> diff --git a/lib/igt_os.h b/lib/igt_os.h
> index 79363b291e5d..b9af0a4b7ca0 100644
> --- a/lib/igt_os.h
> +++ b/lib/igt_os.h
> @@ -25,6 +25,8 @@
>  #ifndef IGT_OS_H
>  #define IGT_OS_H
>  
> +#include <stddef.h>
> +#include <stdint.h>
>  
>  /* These are separate to allow easier testing when porting, see the comment at
>   * the bottom of intel_os.c. */
> diff --git a/lib/igt_panfrost.h b/lib/igt_panfrost.h
> index d67947572e25..4412670bb849 100644
> --- a/lib/igt_panfrost.h
> +++ b/lib/igt_panfrost.h
> @@ -25,6 +25,10 @@
>  #ifndef IGT_PANFROST_H
>  #define IGT_PANFROST_H
>  
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +
>  #include "panfrost_drm.h"
>  
>  struct panfrost_bo {
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 306a9eb46af4..538b6e39e2e3 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -24,6 +24,11 @@
>  #ifndef IGT_PM_H
>  #define IGT_PM_H
>  
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include "igt_kms.h"
> +
>  void igt_pm_enable_audio_runtime_pm(void);
>  void igt_pm_enable_sata_link_power_management(void);
>  void igt_pm_restore_sata_link_power_management(void);
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index a3a08f8e1e24..20ffc515fd38 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -6,6 +6,9 @@
>  #ifndef __IGT_SRIOV_DEVICE_H__
>  #define __IGT_SRIOV_DEVICE_H__
>  
> +#include <stdbool.h>
> +#include <stddef.h>
> +
>  /* Library for managing SR-IOV (Single Root I/O Virtualization)
>   * devices.
>   *
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index e804cf8e109d..f37d80ec130e 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -25,8 +25,9 @@
>  #ifndef __IGT_SYSFS_H__
>  #define __IGT_SYSFS_H__
>  
> -#include <stdbool.h>
>  #include <stdarg.h>
> +#include <stdbool.h>
> +#include <stdint.h>
>  
>  #define for_each_sysfs_gt_path(i915__, path__, pathlen__) \
>  	for (int gt__ = 0; \
> diff --git a/lib/igt_sysrq.h b/lib/igt_sysrq.h
> index c941029d5961..72bfc3403a17 100644
> --- a/lib/igt_sysrq.h
> +++ b/lib/igt_sysrq.h
> @@ -25,6 +25,8 @@
>  #ifndef __IGT_SYSRQ_H__
>  #define __IGT_SYSRQ_H__
>  
> +#include "igt_core.h"
> +
>  __noreturn void igt_sysrq_reboot(void);
>  
>  #endif /* __IGT_SYSRQ_H__ */
> diff --git a/lib/igt_thread.h b/lib/igt_thread.h
> index 4b9c222d12a5..d0333cd2495a 100644
> --- a/lib/igt_thread.h
> +++ b/lib/igt_thread.h
> @@ -21,8 +21,15 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#ifndef __IGT_THREAD_H__
> +#define __IGT_THREAD_H__
> +
> +#include <stdbool.h>
> +
>  void igt_thread_clear_fail_state(void);
>  void igt_thread_fail(void);
>  void igt_thread_assert_no_failures(void);
>  
>  bool igt_thread_is_main(void);
> +
> +#endif  /* __IGT_THREAD_H__ */
> diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
> index b96a3b43a36a..3e08b1aa3b93 100644
> --- a/lib/igt_v3d.h
> +++ b/lib/igt_v3d.h
> @@ -24,6 +24,9 @@
>  #ifndef IGT_V3D_H
>  #define IGT_V3D_H
>  
> +#include <stddef.h>
> +#include <stdint.h>
> +
>  #include "v3d_drm.h"
>  
>  #define PAGE_SIZE 4096
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index 4c08f1754e00..fe7173c50eaa 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -24,6 +24,11 @@
>  #ifndef IGT_VC4_H
>  #define IGT_VC4_H
>  
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +#include "igt_fb.h"
>  #include "vc4_drm.h"
>  
>  #define PAGE_SIZE 4096
> diff --git a/lib/intel_allocator_msgchannel.h b/lib/intel_allocator_msgchannel.h
> index 55e2e0ed693f..4e51bf779f45 100644
> --- a/lib/intel_allocator_msgchannel.h
> +++ b/lib/intel_allocator_msgchannel.h
> @@ -6,9 +6,10 @@
>  #ifndef __INTEL_ALLOCATOR_MSGCHANNEL_H__
>  #define __INTEL_ALLOCATOR_MSGCHANNEL_H__
>  
> -#include <sys/types.h>
>  #include <unistd.h>
> +#include <stdbool.h>
>  #include <stdint.h>
> +#include <sys/types.h>
>  
>  enum reqtype {
>  	REQ_STOP,
> diff --git a/lib/intel_aub.h b/lib/intel_aub.h
> index 9ca548edaf34..22f23968b84c 100644
> --- a/lib/intel_aub.h
> +++ b/lib/intel_aub.h
> @@ -40,6 +40,8 @@
>  #ifndef _INTEL_AUB_H
>  #define _INTEL_AUB_H
>  
> +#include <stdint.h>
> +
>  #define AUB_MI_NOOP			(0)
>  #define AUB_MI_BATCH_BUFFER_START 	(0x31 << 23)
>  #define AUB_PIPE_CONTROL		(0x7a000002)
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index bd0348da3207..1499eef0c8e8 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -9,6 +9,8 @@
>  #ifndef INTEL_COMPUTE_H
>  #define INTEL_COMPUTE_H
>  
> +#include <stdbool.h>
> +
>  #include "xe_drm.h"
>  
>  /*
> diff --git a/lib/intel_io.h b/lib/intel_io.h
> index ea2649d9bcf3..e39384ca57f2 100644
> --- a/lib/intel_io.h
> +++ b/lib/intel_io.h
> @@ -28,9 +28,10 @@
>  #ifndef INTEL_GPU_TOOLS_H
>  #define INTEL_GPU_TOOLS_H
>  
> -#include <stdint.h>
>  #include <pciaccess.h>
>  #include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
>  
>  extern void *igt_global_mmio;
>  
> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
> index 278f143ec54f..a9e075273ed8 100644
> --- a/lib/intel_mocs.h
> +++ b/lib/intel_mocs.h
> @@ -6,6 +6,8 @@
>  #ifndef _INTEL_MOCS_H
>  #define _INTEL_MOCS_H
>  
> +#include <stdint.h>
> +
>  uint8_t intel_get_wb_mocs_index(int fd);
>  uint8_t intel_get_uc_mocs_index(int fd);
>  
> diff --git a/lib/media_spin.h b/lib/media_spin.h
> index 5e15e0216fea..8da86e6f33b8 100644
> --- a/lib/media_spin.h
> +++ b/lib/media_spin.h
> @@ -27,6 +27,8 @@
>  #ifndef MEDIA_SPIN_H
>  #define MEDIA_SPIN_H
>  
> +#include <stdint.h>
> +
>  struct intel_buf;
>  
>  void gen8_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins);
> diff --git a/lib/veboxcopy.h b/lib/veboxcopy.h
> index 925b8f52b82c..fb52b50f5da7 100644
> --- a/lib/veboxcopy.h
> +++ b/lib/veboxcopy.h
> @@ -1,6 +1,8 @@
>  #ifndef __VEBOXCOPY_H__
>  #define __VEBOXCOPY_H__
>  
> +#include "intel_bufops.h"
> +
>  void gen12_vebox_copyfunc(struct intel_bb *ibb,
>  			  struct intel_buf *src,
>  			  unsigned int width, unsigned int height,
> -- 
> 2.43.0
> 

