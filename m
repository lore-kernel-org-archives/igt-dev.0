Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B2BC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 15:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B54C10F6C1;
	Mon, 22 Apr 2024 15:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WF2WbdcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D00112C15
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713800898; x=1745336898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BPkR94Dnh2VJgcvScDETu+pCu955OF6PhCCBUb12G9I=;
 b=WF2WbdcXP7IfCMfYZP2KiiDyA1XsHnWfCKhdkb5xbI87U6uAUkq/ot/L
 sJAH7Vw7xwIhVsX034BeiGS5rjOwqIQjNhZ0G0vEZQln/UXBe1fqk1k29
 BrTh9GkdgGL28lqC3yfwJRtOzscn8TxZz61Kl7luqOZp6Ljcf3Y+ioi37
 +lNVOY5PJBdWUIg4ft1DwfAagRn0//dxkzgNP8H0STRcz/jS/d+mUGpzy
 pAjtFx3vTl9asGeydoHTuIQ2va+TLvk0U/ualmczWUIs2sDxnv7L1W3KR
 A2C8ZtVxIbMhkGbiMu5A7IYqZCRm2w+81UwYDKOMAPbf3xqj2D5J7LrUW g==;
X-CSE-ConnectionGUID: moitlWq8R8CHMzpwGrNlbA==
X-CSE-MsgGUID: pwY+Xs4UR0C+w/4fZPf0Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9516341"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9516341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 08:48:17 -0700
X-CSE-ConnectionGUID: Ek5cLmADSYySIn5CdNk99w==
X-CSE-MsgGUID: Yj4kOW/7QgizrafclKhEUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="55266948"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 08:48:12 -0700
Date: Mon, 22 Apr 2024 17:48:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>, Reagan Bohan <xbjfk.github@gmail.com>
Subject: Re: [PATCH 2/3] Change sys/poll.h to poll.h
Message-ID: <20240422154810.tz7xjqkviqiaz5bj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Reagan Bohan <reagan@ourmail.work>,
 Reagan Bohan <xbjfk.github@gmail.com>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240421232204.31704-3-reagan@ourmail.work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240421232204.31704-3-reagan@ourmail.work>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Reagan,
On 2024-04-21 at 23:20:47 +0000, Reagan Bohan wrote:
> From: Reagan Bohan <xbjfk.github@gmail.com>
> 
> sys/poll.h is not the correct header, and POSIX makes no mention of it.

It is correct but ot standard, could you rewrite your description
a bit?

> Musl libc emits a warning when sys/poll.h is used.

In what project is it emitting this?

Missing s-o-b (note that is should be the same as From:).

> ---
>  benchmarks/gem_busy.c           | 2 +-
>  benchmarks/gem_latency.c        | 2 +-
>  lib/dmabuf_sync_file.h          | 2 +-
>  lib/igt_aux.c                   | 2 +-
>  lib/igt_dummyload.c             | 2 +-
>  runner/executor.c               | 2 +-
>  tests/amdgpu/amd_prime.c        | 2 +-

Please split this into separate patches for each of main
parts for igt, so one for benchmarks, lib, ... up  to tests,
also use i-g-t in all patches send to igt-dev ML, for example:

Subject: [PATCH i-g-t 2/N] lib: use poll.h in includes
Subject: [PATCH i-g-t 3/N] benchmarks: use poll.h in includes
Subject: [PATCH i-g-t 4/N] runner: use poll.h in includes
Subject: [PATCH i-g-t 5/N] tests: use poll.h in includes

with each one changing that include header.
Last nit - please use checkpatch.pl script from Linux kernel
sources for checks if anything is missing in your patches.

Regards,
Kamil

>  tests/core_auth.c               | 2 +-
>  tests/drm_read.c                | 2 +-
>  tests/intel/gem_exec_capture.c  | 2 +-
>  tests/intel/gem_exec_fair.c     | 2 +-
>  tests/intel/gem_exec_fence.c    | 2 +-
>  tests/intel/gem_exec_nop.c      | 2 +-
>  tests/intel/gem_exec_schedule.c | 2 +-
>  tests/intel/gem_wait.c          | 2 +-
>  tests/intel/kms_busy.c          | 2 +-
>  tests/intel/prime_busy.c        | 2 +-
>  tests/intel/xe_dma_buf_sync.c   | 2 +-
>  tests/kms_cursor_legacy.c       | 2 +-
>  tests/kms_flip.c                | 2 +-
>  tests/kms_lease.c               | 2 +-
>  tests/kms_prime.c               | 2 +-
>  tests/kms_sequence.c            | 2 +-
>  tests/kms_vblank.c              | 2 +-
>  tests/prime_vgem.c              | 2 +-
>  tests/testdisplay.c             | 2 +-
>  tests/vgem_basic.c              | 2 +-
>  tests/vgem_slow.c               | 2 +-
>  tools/intel_dp_compliance.c     | 2 +-
>  tools/intel_guc_logger.c        | 2 +-
>  tools/intel_gvtg_test.c         | 2 +-
>  tools/msm_dp_compliance.c       | 2 +-
>  32 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
> index 514e3387e..95d0fb971 100644
> --- a/benchmarks/gem_busy.c
> +++ b/benchmarks/gem_busy.c
> @@ -33,8 +33,8 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <sys/stat.h>
> -#include <sys/poll.h>
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <time.h>
> diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
> index 6abf366f9..d3ebab005 100644
> --- a/benchmarks/gem_latency.c
> +++ b/benchmarks/gem_latency.c
> @@ -36,10 +36,10 @@
>  #include <inttypes.h>
>  #include <limits.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
> -#include <sys/poll.h>
>  #include <sys/resource.h>
>  
>  #include "drm.h"
> diff --git a/lib/dmabuf_sync_file.h b/lib/dmabuf_sync_file.h
> index d642ff30c..e115b5f94 100644
> --- a/lib/dmabuf_sync_file.h
> +++ b/lib/dmabuf_sync_file.h
> @@ -9,7 +9,7 @@
>  #ifdef __linux__
>  #include <linux/dma-buf.h>
>  #endif
> -#include <sys/poll.h>
> +#include <poll.h>
>  #include <stdbool.h>
>  #include <stdint.h>
>  
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index d6aeb876b..e7210e5be 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -39,10 +39,10 @@
>  #include <sys/mman.h>
>  #include <signal.h>
>  #include <pciaccess.h>
> +#include <poll.h>
>  #include <stdlib.h>
>  #include <time.h>
>  #include <unistd.h>
> -#include <sys/poll.h>
>  #include <sys/wait.h>
>  #include <sys/resource.h>
>  #include <sys/time.h>
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 2e842929b..a9a2de077 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -24,8 +24,8 @@
>  
>  #include <time.h>
>  #include <signal.h>
> +#include <poll.h>
>  #include <pthread.h>
> -#include <sys/poll.h>
>  #include <sys/timerfd.h>
>  
>  #include <i915_drm.h>
> diff --git a/runner/executor.c b/runner/executor.c
> index d3e6296dd..4b374d223 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -16,7 +16,6 @@
>  #include <sys/ioctl.h>
>  #include <sys/mman.h>
>  #include <sys/select.h>
> -#include <sys/poll.h>
>  #include <sys/signalfd.h>
>  #include <sys/socket.h>
>  #include <sys/stat.h>
> @@ -25,6 +24,7 @@
>  #include <sys/utsname.h>
>  #include <sys/wait.h>
>  #include <dirent.h>
> +#include <poll.h>
>  #include <time.h>
>  #include <unistd.h>
>  
> diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
> index 6916c3173..6bcf11198 100644
> --- a/tests/amdgpu/amd_prime.c
> +++ b/tests/amdgpu/amd_prime.c
> @@ -24,7 +24,7 @@
>  #include <amdgpu.h>
>  #include <amdgpu_drm.h>
>  
> -#include <sys/poll.h>
> +#include <poll.h>
>  
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index 2d6ad83e9..f4381bba0 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -34,12 +34,12 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <sched.h>
>  #include <sys/mount.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
> -#include <sys/poll.h>
>  #include <sys/resource.h>
>  #include "drm.h"
>  /**
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index 94c53fded..144c2140f 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -39,10 +39,10 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
> -#include <sys/poll.h>
>  #include <pthread.h>
>  #include "drm.h"
>  
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 57b178f3e..3c8660ac5 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -22,8 +22,8 @@
>   */
>  
>  #include <ctype.h>
> +#include <poll.h>
>  #include <sched.h>
> -#include <sys/poll.h>
>  #include <zlib.h>
>  
>  #include "i915/gem.h"
> diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
> index e71fa2f0d..003cd1c4f 100644
> --- a/tests/intel/gem_exec_fair.c
> +++ b/tests/intel/gem_exec_fair.c
> @@ -5,8 +5,8 @@
>  
>  #include "config.h"
>  
> +#include <poll.h>
>  #include <pthread.h>
> -#include <sys/poll.h>
>  #include <sys/ioctl.h>
>  #include <sys/mman.h>
>  #include <sys/resource.h>
> diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
> index e4263b3f9..28bad83f6 100644
> --- a/tests/intel/gem_exec_fence.c
> +++ b/tests/intel/gem_exec_fence.c
> @@ -21,9 +21,9 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#include <poll.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
> -#include <sys/poll.h>
>  #include <sys/signal.h>
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> index 6c547a412..0f1da1a47 100644
> --- a/tests/intel/gem_exec_nop.c
> +++ b/tests/intel/gem_exec_nop.c
> @@ -33,9 +33,9 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
> -#include <sys/poll.h>
>  #include <sys/time.h>
>  #include <time.h>
>  
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 70243e72b..cae846794 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -25,8 +25,8 @@
>  
>  #include <linux/userfaultfd.h>
>  
> +#include <poll.h>
>  #include <pthread.h>
> -#include <sys/poll.h>
>  #include <sys/ioctl.h>
>  #include <sys/mman.h>
>  #include <sys/syscall.h>
> diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
> index fa6eb9f77..149f1ce71 100644
> --- a/tests/intel/gem_wait.c
> +++ b/tests/intel/gem_wait.c
> @@ -25,7 +25,7 @@
>   *
>   */
>  
> -#include <sys/poll.h>
> +#include <poll.h>
>  
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index 004d9ee6e..db45e286e 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -31,7 +31,7 @@
>   * Test category: functionality test
>   */
>  
> -#include <sys/poll.h>
> +#include <poll.h>
>  #include <signal.h>
>  #include <time.h>
>  
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
> index 66af5f8a3..351b16138 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -21,7 +21,7 @@
>   * IN THE SOFTWARE.
>   */
>  
> -#include <sys/poll.h>
> +#include <poll.h>
>  
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index b69283093..2db576ba8 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -20,7 +20,7 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  #include <linux/dma-buf.h>
> -#include <sys/poll.h>
> +#include <poll.h>
>  
>  #define MAX_N_BO	16
>  #define N_FD		2
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index a430f735a..5b97028c7 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -32,8 +32,8 @@
>   * Test category: functionality test
>   */
>  
> +#include <poll.h>
>  #include <sched.h>
> -#include <sys/poll.h>
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 15c3b5ba2..d352ee14c 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -40,9 +40,9 @@
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <math.h>
> +#include <poll.h>
>  #include <stdint.h>
>  #include <unistd.h>
> -#include <sys/poll.h>
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
>  
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index f7531c803..9e56d8b8b 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -38,8 +38,8 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <time.h>
> -#include <sys/poll.h>
>  #include <sys/stat.h>
>  #include <sys/time.h>
>  #include <sys/wait.h>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 135c75168..0b5dbf06e 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -37,8 +37,8 @@
>  #include "igt_sysfs.h"
>  #include <fcntl.h>
>  
> +#include <poll.h>
>  #include <sys/ioctl.h>
> -#include <sys/poll.h>
>  #include <time.h>
>  
>  /**
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 23867d1aa..bf3cdf821 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -40,7 +40,7 @@
>  #include <inttypes.h>
>  #include <errno.h>
>  #include <time.h>
> -#include <sys/poll.h>
> +#include <poll.h>
>  #include <sys/stat.h>
>  #include <sys/time.h>
>  #include <sys/wait.h>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 956ba483a..696bc0b71 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -37,8 +37,8 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <time.h>
> -#include <sys/poll.h>
>  #include <sys/stat.h>
>  #include <sys/time.h>
>  #include <sys/wait.h>
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index fa19d8e64..8f1cf8552 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -21,8 +21,8 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#include <poll.h>
>  #include <sys/ioctl.h>
> -#include <sys/poll.h>
>  #include <time.h>
>  
>  #include "i915/gem.h"
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index 109ed496a..e83655fb5 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -64,8 +64,8 @@
>  #include <stdbool.h>
>  #include <strings.h>
>  #include <unistd.h>
> +#include <poll.h>
>  #include <termios.h>
> -#include <sys/poll.h>
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
>  #include <sys/types.h>
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index cb92efbf5..6d4b89976 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -27,8 +27,8 @@
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  
> +#include <poll.h>
>  #include <sys/mman.h>
> -#include <sys/poll.h>
>  #include <sys/stat.h>
>  #include <dirent.h>
>  /**
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index 35761a4ee..91c3fc501 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -26,8 +26,8 @@
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  
> +#include <poll.h>
>  #include <sys/mman.h>
> -#include <sys/poll.h>
>  #include <sys/stat.h>
>  #include <dirent.h>
>  /**
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index 2e20d7f09..99196a450 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -113,9 +113,9 @@
>  #include <stdint.h>
>  #include <stdbool.h>
>  #include <strings.h>
> +#include <poll.h>
>  #include <unistd.h>
>  #include <termios.h>
> -#include <sys/poll.h>
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
>  #include <sys/types.h>
> diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
> index 5f1de8db5..629b4e660 100644
> --- a/tools/intel_guc_logger.c
> +++ b/tools/intel_guc_logger.c
> @@ -29,10 +29,10 @@
>  #include <sys/ioctl.h>
>  #include <string.h>
>  #include <errno.h>
> +#include <poll.h>
>  #include <signal.h>
>  #include <stdlib.h>
>  #include <unistd.h>
> -#include <sys/poll.h>
>  #include <sys/wait.h>
>  #include <sys/types.h>
>  #include <sys/syscall.h>
> diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
> index ad5ee6a65..408e703bf 100644
> --- a/tools/intel_gvtg_test.c
> +++ b/tools/intel_gvtg_test.c
> @@ -37,9 +37,9 @@
>  #include <stdint.h>
>  #include <stdbool.h>
>  #include <strings.h>
> +#include <poll.h>
>  #include <unistd.h>
>  #include <termios.h>
> -#include <sys/poll.h>
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
>  #include <sys/types.h>
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> index 6941d3855..c37b3bc1c 100644
> --- a/tools/msm_dp_compliance.c
> +++ b/tools/msm_dp_compliance.c
> @@ -115,8 +115,8 @@
>  #include <stdbool.h>
>  #include <strings.h>
>  #include <unistd.h>
> +#include <poll.h>
>  #include <termios.h>
> -#include <sys/poll.h>
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
>  #include <sys/types.h>
> -- 
> 2.43.2
> 
