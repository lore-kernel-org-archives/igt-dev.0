Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5E110E40F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 09:42:13 +0000 (UTC)
Date: Tue, 4 Oct 2022 12:41:47 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <Yzv/20FYx2pVueLC@platvala-desk.ger.corp.intel.com>
References: <20220928202152.536233-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928202152.536233-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] Introduced partial FreeBSD compatibility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 03:21:52PM -0500, Jake Freeland wrote:
> FreeBSD's Linux compatbility layer, LinuxKPI, has introduced
> modern drm drivers to the FreeBSD desktop. With drm drivers,
> comes the need for drm testing. This patch allows a portion
> of igt-gpu-tools to compile on FreeBSD
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> ---
>  benchmarks/gem_exec_tracer.c   |   4 ++
>  benchmarks/gem_syslatency.c    |   6 ++
>  include/linux-uapi/sync_file.h |   5 ++
>  lib/i915/intel_memory_region.c |   4 ++
>  lib/i915/perf.c                |   2 +
>  lib/igt_audio.c                |   4 ++
>  lib/igt_aux.c                  |   2 +
>  lib/igt_aux.h                  |   6 +-
>  lib/igt_core.c                 |   8 ++-
>  lib/igt_core.h                 |   7 ++
>  lib/igt_debugfs.c              |   2 +
>  lib/igt_device.c               |   2 +
>  lib/igt_device_scan.c          |   4 ++
>  lib/igt_eld.c                  |   4 ++
>  lib/igt_frame.c                |   4 ++
>  lib/igt_freebsd.h              | 121 +++++++++++++++++++++++++++++++++
>  lib/igt_kmod.h                 |   2 +
>  lib/igt_kms.c                  |   4 ++
>  lib/igt_os.c                   |  19 ++++++
>  lib/igt_perf.c                 |   2 +
>  lib/igt_perf.h                 |   4 ++
>  lib/igt_pm.c                   |   2 +
>  lib/igt_sysfs.c                |   2 +
>  lib/tests/igt_exit_handler.c   |   4 ++
>  lib/tests/igt_fork.c           |   2 +-
>  lib/tests/igt_tests_common.h   |   9 +++
>  runner/executor.c              |   6 ++
>  runner/job_list.c              |   5 ++
>  tests/i915/gem_close_race.c    |   2 +
>  tests/i915/gem_mmap_gtt.c      |   2 +-
>  tests/i915/gem_mmap_offset.c   |   2 +-
>  tests/i915/i915_module_load.c  |   2 +
>  tests/i915/i915_pm_backlight.c |   4 ++
>  tests/i915/i915_pm_rpm.c       |   8 +++
>  tests/kms_content_protection.c |   2 +
>  tests/kms_flip.c               |   4 ++
>  tests/kms_sysfs_edid_timing.c  |   4 ++
>  tests/tools_test.c             |   4 ++
>  tools/intel_gvtg_test.c        |   4 ++
>  39 files changed, 274 insertions(+), 10 deletions(-)
>  create mode 100644 lib/igt_freebsd.h
> 
> diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
> index e6973991..7e86473e 100644
> --- a/benchmarks/gem_exec_tracer.c
> +++ b/benchmarks/gem_exec_tracer.c
> @@ -41,6 +41,10 @@
>  #include "intel_aub.h"
>  #include "intel_chipset.h"
>  
> +#ifdef __FreeBSD__
> +#include "igt_freebsd.h"
> +#endif
> +
>  static int (*libc_close)(int fd);
>  static int (*libc_ioctl)(int fd, unsigned long request, void *argp);
>  
> diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
> index 035ee934..dafc6ac0 100644
> --- a/benchmarks/gem_syslatency.c
> +++ b/benchmarks/gem_syslatency.c
> @@ -42,12 +42,18 @@
>  #include <limits.h>
>  #include "drm.h"
>  
> +#ifdef __linux__
>  #include <linux/unistd.h>
> +#elif defined(__FreeBSD__)
> +#include "igt_freebsd.h"
> +#endif
>  
>  #include "i915/gem_create.h"
>  #include "i915/gem_ring.h"
>  
> +#ifdef __linux__
>  #define sigev_notify_thread_id _sigev_un._tid
> +#endif
>  
>  static volatile int done;
>  
> diff --git a/include/linux-uapi/sync_file.h b/include/linux-uapi/sync_file.h
> index b4f2db00..270c1cbc 100644
> --- a/include/linux-uapi/sync_file.h
> +++ b/include/linux-uapi/sync_file.h
> @@ -12,8 +12,13 @@
>  #ifndef _LINUX_SYNC_H
>  #define _LINUX_SYNC_H
>  
> +#ifdef __linux__
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/ioctl.h>
> +#include "igt_freebsd.h"
> +#endif
>  
>  /**
>   * struct sync_merge_data - data passed to merge ioctl
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 568bace9..0a59f290 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -21,7 +21,11 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#elif defined(__FreeBSD__)
> +#include <limits.h>
> +#endif
>  #include <signal.h>
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index d88835ff..beda6b8a 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -29,7 +29,9 @@
>  #include <fcntl.h>
>  #include <sys/ioctl.h>
>  #include <sys/stat.h>
> +#ifdef __linux__
>  #include <sys/sysmacros.h>
> +#endif
>  #include <sys/types.h>
>  #include <unistd.h>
>  
> diff --git a/lib/igt_audio.c b/lib/igt_audio.c
> index e0b1bafe..201a39c6 100644
> --- a/lib/igt_audio.c
> +++ b/lib/igt_audio.c
> @@ -26,6 +26,10 @@
>  
>  #include "config.h"
>  
> +#ifdef __FreeBSD__
> +#include <limits.h>
> +#endif
> +
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <gsl/gsl_fft_real.h>
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index edb53425..d7e2714f 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -52,7 +52,9 @@
>  #include <assert.h>
>  #include <grp.h>
>  
> +#ifdef __linux__
>  #include <proc/readproc.h>
> +#endif
>  #include <libudev.h>
>  
>  #include "drmtest.h"
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index c8d487b6..912f36c1 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -34,9 +34,7 @@
>  #include <sys/time.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> -#ifdef __linux__
> -# include <sys/syscall.h>
> -#endif
> +#include <sys/syscall.h>
>  
>  #include <i915/gem_submission.h>
>  
> @@ -48,8 +46,8 @@
>  # ifndef HAVE_GETTID
>  #  define gettid() (pid_t)(syscall(__NR_gettid))
>  # endif
> -#endif
>  #define sigev_notify_thread_id _sigev_un._tid
> +#endif
>  
>  /* auxialiary igt helpers from igt_aux.c */
>  /* generally useful helpers */
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index e7425326..17d5e013 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -43,9 +43,7 @@
>  #include <unistd.h>
>  #include <sys/wait.h>
>  #include <sys/types.h>
> -#ifdef __linux__
>  #include <sys/syscall.h>
> -#endif
>  #include <pthread.h>
>  #include <sys/utsname.h>
>  #include <termios.h>
> @@ -786,6 +784,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
>  
>  static void oom_adjust_for_doom(void)
>  {
> +#ifdef __linux__
>  	int fd;
>  	const char always_kill[] = "1000";
>  
> @@ -793,7 +792,7 @@ static void oom_adjust_for_doom(void)
>  	igt_assert(fd != -1);
>  	igt_assert(write(fd, always_kill, sizeof(always_kill)) == sizeof(always_kill));
>  	close(fd);
> -
> +#endif
>  }
>  
>  /**
> @@ -2224,6 +2223,9 @@ bool __igt_fork_helper(struct igt_helper_process *proc)
>  	case 0:
>  		reset_helper_process_list();
>  		oom_adjust_for_doom();
> +#ifdef __FreeBSD__
> +		raise(SIGTERM);
> +#endif

Can't say I understand why this is added. Is this a /* TODO */ of some
description?


-- 
Petri Latvala



>  
>  		return true;
>  	default:
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index aa98e8ed..18e1009d 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -31,7 +31,11 @@
>  #define IGT_CORE_H
>  
>  #include <assert.h>
> +#ifdef __linux__
>  #include <byteswap.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/endian.h>
> +#endif
>  #include <setjmp.h>
>  #include <stdbool.h>
>  #include <stdint.h>
> @@ -47,6 +51,9 @@
>  #define IGT_LOG_DOMAIN (NULL)
>  #endif
>  
> +#ifdef __FreeBSD__
> +#include "igt_freebsd.h"
> +#endif
>  
>  #ifndef STATIC_ANALYSIS_BUILD
>  #if defined(__clang_analyzer__) || defined(__COVERITY__) || defined(__KLOCWORK__)
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a56688a5..fa1e3b69 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -25,7 +25,9 @@
>  #include <inttypes.h>
>  #include <sys/stat.h>
>  #include <sys/mount.h>
> +#ifdef __linux__
>  #include <sys/sysmacros.h>
> +#endif
>  #include <dirent.h>
>  #include <errno.h>
>  #include <stdio.h>
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index fddfba72..49b77122 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -25,7 +25,9 @@
>  #include <fcntl.h>
>  
>  #include <sys/stat.h>
> +#ifdef __linux__
>  #include <sys/sysmacros.h>
> +#endif
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index eb6b45b8..6a921d52 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -32,7 +32,11 @@
>  #include <fcntl.h>
>  #include <glib.h>
>  #include <libudev.h>
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#elif defined(__FreeBSD__)
> +#include <limits.h>
> +#endif
>  #include <sys/stat.h>
>  #include <sys/time.h>
>  #include <sys/types.h>
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c
> index ef6625df..e05ad6de 100644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -23,6 +23,10 @@
>   * Authors: Simon Ser <simon.ser@intel.com>
>   */
>  
> +#ifdef __FreeBSD__
> +#include <limits.h>
> +#endif
> +
>  #include "config.h"
>  
>  #include <dirent.h>
> diff --git a/lib/igt_frame.c b/lib/igt_frame.c
> index 45523a79..ab74e678 100644
> --- a/lib/igt_frame.c
> +++ b/lib/igt_frame.c
> @@ -24,6 +24,10 @@
>   *  Paul Kocialkowski <paul.kocialkowski@linux.intel.com>
>   */
>  
> +#ifdef __FreeBSD__
> +#include <limits.h>
> +#endif
> +
>  #include "config.h"
>  
>  #include <fcntl.h>
> diff --git a/lib/igt_freebsd.h b/lib/igt_freebsd.h
> new file mode 100644
> index 00000000..81ba5c01
> --- /dev/null
> +++ b/lib/igt_freebsd.h
> @@ -0,0 +1,121 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright (c) 2022, Jake Freeland <jfree@FreeBSD.org>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#if !defined(IGT_FREEBSD_H) && defined(__FreeBSD__)
> +#define IGT_FREEBSD_H
> +
> +#include <sys/errno.h>
> +#include <sys/mman.h>
> +#include <sys/mount.h>
> +#include <sys/sched.h>
> +#include <sys/types.h>
> +#include <sys/watchdog.h>
> +
> +#include <pthread.h>
> +#include <setjmp.h>
> +#include <signal.h>
> +#include <unistd.h>
> +
> +/*
> + * Proper substitutions:
> + * The following macros replace Linux-specific functions
> + * and macros with their FreeBSD equivalents.
> + */
> +
> +#define	__s32	int32_t
> +#define	__u32	uint32_t
> +#define	__u64	uint64_t
> +
> +#define	sighandler_t	sig_t
> +#define	ino64_t		ino_t
> +
> +#define	jmp_buf	sigjmp_buf
> +
> +#define	PTRACE_TRACEME  PT_TRACE_ME
> +#define	PTRACE_ATTACH   PT_ATTACH
> +#define	PTRACE_PEEKDATA PT_READ_D
> +#define	PTRACE_POKEDATA PT_WRITE_D
> +#define	PTRACE_DETACH   PT_DETACH
> +
> +#define	I2C_RDWR		I2CRDWR
> +#define	I2C_M_RD		IIC_M_RD
> +#define	i2c_msg			iic_msg
> +#define	i2c_rdwr_ioctl_data	iic_rdwr_data
> +
> +#define	_IOC_TYPE(nr)	(((nr) >> 8) & 255)
> +
> +#define	SYS_getdents64	SYS_freebsd11_getdents
> +
> +#define	mount(src, dest, fstype, flags, data)	\
> +	mount(fstype, dest, flags, data)
> +
> +/*
> + * Improper substitutions:
> + * The following macros are temporary replacements for functions
> + * and macros that exist on Linux and do not exist on FreeBSD.
> + */
> +
> +#define	ETIME	ETIMEDOUT
> +
> +#define	MAP_POPULATE	MAP_PREFAULT_READ
> +
> +#define	MADV_HUGEPAGE	MADV_SEQUENTIAL
> +#define	MADV_DONTFORK	MADV_NOSYNC
> +
> +#define	WDIOC_KEEPALIVE	WDIOCPATPAT
> +
> +#define	SCHED_RESET_ON_FORK	0
> +#define	SCHED_IDLE	SCHED_OTHER
> +
> +#define	gettid()	getpid()
> +
> +#define	pthread_sigqueue(pid, signo, value)	\
> +	sigqueue(pid, signo, value)
> +
> +#define	signalfd(fd, mask, flags)	-ENOSYS
> +#define	timerfd_create(c, f)		-ENOSYS
> +#define	timerfd_settime(fd, f, n, o)	-ENOSYS
> +
> +/*
> + * Macro conflict resolution.
> + */
> +
> +#undef	ALIGN
> +#undef	PAGE_SIZE
> +
> +struct signalfd_siginfo {
> +	uint32_t ssi_signo;
> +	uint32_t ssi_pid;
> +};
> +
> +struct kmod_module {
> +	size_t size;
> +};
> +
> +typedef struct {
> +	char state;
> +} proc_t;
> +
> +#endif /* IGT_FREEBSD_H */
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index f98dd29f..6596092b 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -24,7 +24,9 @@
>  #ifndef IGT_KMOD_H
>  #define IGT_KMOD_H
>  
> +#ifdef __linux__
>  #include <libkmod.h>
> +#endif
>  
>  #include "igt_list.h"
>  
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 665594aa..532a3aa8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -43,6 +43,10 @@
>  #include <sys/kd.h>
>  #endif
>  
> +#ifdef __FreeBSD__
> +#include <sys/consio.h>
> +#endif
> +
>  #include <libudev.h>
>  #include <poll.h>
>  #include <errno.h>
> diff --git a/lib/igt_os.c b/lib/igt_os.c
> index bdd5d933..bb6994e1 100644
> --- a/lib/igt_os.c
> +++ b/lib/igt_os.c
> @@ -44,6 +44,9 @@
>  #include <sys/sysinfo.h>
>  #elif defined(HAVE_SWAPCTL) /* Solaris */
>  #include <sys/swap.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/sysctl.h>
> +#include <sys/types.h>
>  #endif
>  #include <sys/resource.h>
>  
> @@ -148,6 +151,15 @@ igt_get_avail_ram_mb(void)
>  	npages = sysconf(_SC_AVPHYS_PAGES);
>  
>  	retval = (uint64_t) pagesize * npages;
> +#elif defined(__FreeBSD__)
> +	uint64_t npages, pagesize;
> +	size_t npages_len = sizeof(npages);
> +	size_t pagesize_len = sizeof(pagesize);
> +
> +	sysctlbyname("vm.stats.vm.v_free_count", &npages, &npages_len, NULL, 0);
> +	sysctlbyname("vm.stats.vm.v_page_size", &pagesize, &pagesize_len, NULL, 0);
> +
> +	retval = pagesize * npages;
>  #else
>  #error "Unknown how to get available RAM for this OS"
>  #endif
> @@ -210,6 +222,13 @@ igt_get_total_swap_mb(void)
>  	free(buf);
>  
>  	retval = (uint64_t) pagesize * totalpages;
> +#elif defined(__FreeBSD__)
> +	uint64_t swap_total;
> +	size_t swap_total_len = sizeof(swap_total);
> +
> +	sysctlbyname("vm.swap_total", &swap_total, &swap_total_len, NULL, 0);
> +
> +	retval = swap_total;
>  #else
>  #warning "Unknown how to get swap size for this OS"
>  	return 0;
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index b743859f..11c91c5f 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -4,8 +4,10 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/stat.h>
> +#ifdef __linux__
>  #include <sys/sysinfo.h>
>  #include <sys/sysmacros.h>
> +#endif
>  #include <time.h>
>  #include <unistd.h>
>  
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index a8328c70..0cd91386 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -27,10 +27,13 @@
>  
>  #include <stdint.h>
>  
> +#ifdef __linux__
>  #include <linux/perf_event.h>
> +#endif
>  
>  #include "igt_gt.h"
>  
> +#ifdef __linux__
>  static inline int
>  perf_event_open(struct perf_event_attr *attr,
>  		pid_t pid,
> @@ -50,6 +53,7 @@ perf_event_open(struct perf_event_attr *attr,
>      attr->size = sizeof(*attr);
>      return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
>  }
> +#endif /* __linux__ */
>  
>  uint64_t igt_perf_type_id(const char *device);
>  int igt_perf_open(uint64_t type, uint64_t config);
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 312288d0..1e6e9ed3 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -33,7 +33,9 @@
>  #include <string.h>
>  #include <unistd.h>
>  #include <sys/stat.h>
> +#ifdef __linux__
>  #include <sys/sysmacros.h>
> +#endif
>  #include <sys/types.h>
>  #include <dirent.h>
>  
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 9c307694..a913be4c 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -24,7 +24,9 @@
>  
>  #include <inttypes.h>
>  #include <sys/stat.h>
> +#ifdef __linux__
>  #include <sys/sysmacros.h>
> +#endif
>  #include <sys/mount.h>
>  #include <errno.h>
>  #include <stdarg.h>
> diff --git a/lib/tests/igt_exit_handler.c b/lib/tests/igt_exit_handler.c
> index 892a7f14..d2381944 100644
> --- a/lib/tests/igt_exit_handler.c
> +++ b/lib/tests/igt_exit_handler.c
> @@ -125,5 +125,9 @@ int main(int argc, char **argv)
>  	internal_assert_wexited(status, IGT_EXIT_SKIP);
>  
>  	status = testfunc(SIG);
> +#ifdef __linux__
>  	internal_assert_wsignaled(status, SIGTERM);
> +#elif defined(__FreeBSD__)
> +	internal_assert(status == 0);
> +#endif
>  }
> diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
> index d19d0945..c7193b06 100644
> --- a/lib/tests/igt_fork.c
> +++ b/lib/tests/igt_fork.c
> @@ -109,7 +109,7 @@ __noreturn static void igt_fork_timeout_leak(void)
>  __noreturn static void subtest_leak(void)
>  {
>  	pid_t *children =
> -		mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +		mmap(0, 4096, PROT_WRITE | PROT_READ, MAP_SHARED | MAP_ANON, -1, 0);
>  	const int num_children = 4096 / sizeof(*children);
>  
>  	igt_subtest_init(fake_argc, fake_argv);
> diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
> index 058f6265..e8183897 100644
> --- a/lib/tests/igt_tests_common.h
> +++ b/lib/tests/igt_tests_common.h
> @@ -48,8 +48,17 @@ static inline void internal_assert_wexited(int wstatus, int exitcode)
>  
>  static inline void internal_assert_wsignaled(int wstatus, int signal)
>  {
> +#ifdef __linux__
>  	internal_assert(WIFSIGNALED(wstatus) &&
>  			WTERMSIG(wstatus) == signal);
> +#elif defined(__FreeBSD__)
> +	if (WIFSIGNALED(wstatus))
> +		internal_assert(WTERMSIG(wstatus) == signal);
> +	else if (WIFEXITED(wstatus))
> +		internal_assert(WEXITSTATUS(wstatus) == signal + 128);
> +	else
> +		internal_assert(0);
> +#endif
>  }
>  
>  static inline void internal_assert_not_wsignaled(int wstatus)
> diff --git a/runner/executor.c b/runner/executor.c
> index 964d0063..c54072cf 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -2,7 +2,9 @@
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <glib.h>
> +#ifdef __linux__
>  #include <linux/watchdog.h>
> +#endif
>  #if HAVE_OPING
>  #include <oping.h>
>  #endif
> @@ -33,6 +35,10 @@
>  #define KMSG_HEADER "[IGT] "
>  #define KMSG_WARN 4
>  
> +#ifdef __FreeBSD__
> +#include <sys/watchdog.h>
> +#endif
> +
>  static struct {
>  	int *fds;
>  	size_t num_dogs;
> diff --git a/runner/job_list.c b/runner/job_list.c
> index 520a98da..6bfa7162 100644
> --- a/runner/job_list.c
> +++ b/runner/job_list.c
> @@ -1,7 +1,12 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/wait.h>
> +#include <limits.h>
> +#endif
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 938fde8f..42fe1657 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -61,7 +61,9 @@ static bool has_softpin;
>  static uint64_t exec_addr;
>  static uint64_t data_addr;
>  
> +#ifdef __linux__
>  #define sigev_notify_thread_id _sigev_un._tid
> +#endif
>  
>  static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  {
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index e39b9047..4f05eb18 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -566,7 +566,7 @@ test_ptrace(int fd)
>  	for (int i = 0; i < sz / sizeof(long); i++) {
>  		long ret;
>  
> -		ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i);
> +		ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i, NULL);
>  		igt_assert_eq_u64(ret, CC);
>  		cpy[i] = ret;
>  
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 7e8c02d1..fc4245f6 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -520,7 +520,7 @@ static void test_ptrace(int i915)
>  				for (int i = 0; i < SZ / sizeof(long); i++) {
>  					long ret;
>  
> -					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i);
> +					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i, NULL);
>  					igt_assert_eq_u64(ret, CC);
>  					cpy[i] = ret;
>  
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 4c72157c..9bec4c18 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -23,7 +23,9 @@
>  #include "igt.h"
>  #include <dirent.h>
>  #include <sys/utsname.h>
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#endif
>  #include <signal.h>
>  #include <libgen.h>
>  #include <signal.h>
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index cafae7f7..c520cf20 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -46,6 +46,10 @@ struct context {
>  #define FADESTEPS 10
>  #define FADESPEED 100 /* milliseconds between steps */
>  
> +#ifdef __FreeBSD__
> +#include <libgen.h>
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>  
>  static int backlight_read(int *result, const char *fname)
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index e95875dc..761e76f9 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -40,8 +40,10 @@
>  #include <sys/mman.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> +#ifdef __linux__
>  #include <linux/i2c.h>
>  #include <linux/i2c-dev.h>
> +#endif
>  
>  #include <drm.h>
>  
> @@ -54,6 +56,12 @@
>  #include "igt_device.h"
>  #include "igt_edid.h"
>  
> +#ifdef __FreeBSD__
> +#include <limits.h>
> +#include <dev/iicbus/iic.h>
> +#define	addr	slave
> +#endif
> +
>  #define MSR_PC8_RES	0x630
>  #define MSR_PC9_RES	0x631
>  #define MSR_PC10_RES	0x632
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3041f1cd..e0e5af78 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -24,7 +24,9 @@
>  
>  #include <poll.h>
>  #include <fcntl.h>
> +#ifdef __linux__
>  #include <sys/epoll.h>
> +#endif
>  #include <sys/stat.h>
>  #include <libudev.h>
>  #include "igt.h"
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 0567edea..1127e418 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -45,6 +45,10 @@
>  #include "i915/gem_create.h"
>  #include "igt_stats.h"
>  
> +#ifdef __FreeBSD__
> +#include <sys/consio.h>
> +#endif
> +
>  #define TEST_DPMS		(1 << 0)
>  
>  #define TEST_PAN		(1 << 3)
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index 77521108..cd980c6a 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -26,6 +26,10 @@
>  #include <fcntl.h>
>  #include <sys/stat.h>
>  
> +#ifdef __FreeBSD__
> +#include <limits.h>
> +#endif
> +
>  #define THRESHOLD_PER_CONNECTOR		150
>  #define THRESHOLD_PER_CONNECTOR_MEAN	140
>  #define THRESHOLD_ALL_CONNECTORS_MEAN	100
> diff --git a/tests/tools_test.c b/tests/tools_test.c
> index 237f0433..89a19d11 100644
> --- a/tests/tools_test.c
> +++ b/tests/tools_test.c
> @@ -28,7 +28,11 @@
>  #include <fcntl.h>
>  #include <libgen.h>
>  #include <unistd.h>
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#elif defined(__FreeBSD__)
> +#include <limits.h>
> +#endif
>  
>  #define TOOLS "../tools/"
>  
> diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
> index ad5ee6a6..3e53c6d9 100644
> --- a/tools/intel_gvtg_test.c
> +++ b/tools/intel_gvtg_test.c
> @@ -55,6 +55,10 @@
>  #include <limits.h>
>  #include <dirent.h>
>  
> +#ifdef __FreeBSD__
> +#include <sys/wait.h>
> +#endif
> +
>  #define RANDOM(x) (rand() % x)
>  
>  
> -- 
> 2.37.3
> 
