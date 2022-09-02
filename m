Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C3810E869
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Sep 2022 14:50:39 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id cv7so1587641qvb.3
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Sep 2022 07:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220902141414.1132986-1-jfree@freebsd.org>
In-Reply-To: <20220902141414.1132986-1-jfree@freebsd.org>
From: Jake Freeland <jake@technologyfriends.net>
Date: Fri, 2 Sep 2022 09:50:18 -0500
Message-ID: <CAOgZAGaKR0M-G2u9XrQiSwG5Q3nRqSW_+k=UG3MdLwm5NWHvWw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000006ae1c005e7b2da4a"
Subject: Re: [igt-dev] [PATCH i-g-t] Introduced partial FreeBSD compatibility
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

--0000000000006ae1c005e7b2da4a
Content-Type: text/plain; charset="UTF-8"

Hi there,

I am considering bundling all FreeBSD-specific igt macros into an
`igt_freebsd.h` header
for greater accessibility. If this idea is acceptable, I need a place to
create this file.
What's the appropriate location for an igt-specific header that does not
have a corresponding
source file?

Thank you,
Jake Freeland

On Fri, Sep 2, 2022 at 9:14 AM Jake Freeland <jake@technologyfriends.net>
wrote:

> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> ---
>  benchmarks/gem_exec_tracer.c          |   4 +
>  benchmarks/gem_syslatency.c           |   9 ++
>  include/linux-uapi/sync_file.h        |   8 ++
>  lib/i915/gem_engine_topology.c        |   4 +
>  lib/i915/gem_mman.c                   |   5 ++
>  lib/i915/intel_memory_region.c        |   4 +
>  lib/i915/perf.c                       |   2 +
>  lib/igt_audio.c                       |   4 +
>  lib/igt_aux.c                         |  44 ++++++++++
>  lib/igt_aux.h                         |   6 +-
>  lib/igt_core.c                        |  16 +++-
>  lib/igt_core.h                        |   6 ++
>  lib/igt_debugfs.c                     |   6 ++
>  lib/igt_device.c                      |   2 +
>  lib/igt_device_scan.c                 |   4 +
>  lib/igt_eld.c                         |   4 +
>  lib/igt_frame.c                       |   4 +
>  lib/igt_kmod.c                        | 118 ++++++++++++++++++++++++++
>  lib/igt_kmod.h                        |   2 +
>  lib/igt_kms.c                         |   4 +
>  lib/igt_os.c                          |  19 +++++
>  lib/igt_perf.c                        |  58 +++++++++++++
>  lib/igt_perf.h                        |   4 +
>  lib/igt_pm.c                          |   2 +
>  lib/igt_syncobj.c                     |   4 +
>  lib/igt_sysfs.c                       |   2 +
>  lib/igt_vgem.c                        |   5 ++
>  lib/intel_allocator.c                 |   4 +
>  lib/intel_batchbuffer.c               |   5 ++
>  lib/sw_sync.c                         |   4 +
>  lib/tests/igt_exit_handler.c          |   4 +
>  lib/tests/igt_fork.c                  |   4 +
>  lib/tests/igt_tests_common.h          |   9 ++
>  runner/executor.c                     |  14 +++
>  tests/core_auth.c                     |   4 +
>  tests/drm_import_export.c             |   4 +
>  tests/dumb_buffer.c                   |   5 ++
>  tests/i915/gem_close_race.c           |   6 ++
>  tests/i915/gem_concurrent_all.c       |   5 ++
>  tests/i915/gem_create.c               |   4 +
>  tests/i915/gem_ctx_exec.c             |   4 +
>  tests/i915/gem_ctx_persistence.c      |   4 +
>  tests/i915/gem_ctx_shared.c           |   4 +
>  tests/i915/gem_exec_fence.c           |   4 +
>  tests/i915/gem_exec_latency.c         |   4 +
>  tests/i915/gem_lmem_swapping.c        |   4 +
>  tests/i915/gem_madvise.c              |   4 +
>  tests/i915/gem_mmap_gtt.c             |  14 +++
>  tests/i915/gem_mmap_offset.c          |  14 +++
>  tests/i915/gem_shrink.c               |   4 +
>  tests/i915/gem_wait.c                 |   4 +
>  tests/i915/i915_hangman.c             |   4 +
>  tests/i915/i915_module_load.c         |   2 +
>  tests/i915/i915_pm_backlight.c        |   4 +
>  tests/i915/i915_pm_rpm.c              |  13 +++
>  tests/i915/sysfs_heartbeat_interval.c |   4 +
>  tests/kms_content_protection.c        |   2 +
>  tests/kms_cursor_legacy.c             |   4 +
>  tests/kms_flip.c                      |   4 +
>  tests/kms_sysfs_edid_timing.c         |   4 +
>  tests/sw_sync.c                       |   3 +
>  tests/syncobj_timeline.c              |   4 +
>  tests/syncobj_wait.c                  |   4 +
>  tests/tools_test.c                    |   5 ++
>  tests/vc4_purgeable_bo.c              |   4 +
>  tests/vc4_wait_bo.c                   |   4 +
>  tests/vc4_wait_seqno.c                |   4 +
>  tools/intel_gvtg_test.c               |   3 +
>  68 files changed, 552 insertions(+), 6 deletions(-)
>
> diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
> index e6973991..084c8e65 100644
> --- a/benchmarks/gem_exec_tracer.c
> +++ b/benchmarks/gem_exec_tracer.c
> @@ -41,6 +41,10 @@
>  #include "intel_aub.h"
>  #include "intel_chipset.h"
>
> +#ifdef __FreeBSD__
> +#define        _IOC_TYPE(nr)   (((nr) >> 8) & 255)
> +#endif
> +
>  static int (*libc_close)(int fd);
>  static int (*libc_ioctl)(int fd, unsigned long request, void *argp);
>
> diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
> index 035ee934..be92ff0f 100644
> --- a/benchmarks/gem_syslatency.c
> +++ b/benchmarks/gem_syslatency.c
> @@ -42,12 +42,21 @@
>  #include <limits.h>
>  #include "drm.h"
>
> +#ifdef __linux__
>  #include <linux/unistd.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/mman.h>
> +#define        MAP_POPULATE    MAP_PREFAULT_READ
> +#define        gettid()        getpid()
> +#define        MADV_HUGEPAGE   MADV_SEQUENTIAL
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
> diff --git a/include/linux-uapi/sync_file.h
> b/include/linux-uapi/sync_file.h
> index b4f2db00..0f1fb720 100644
> --- a/include/linux-uapi/sync_file.h
> +++ b/include/linux-uapi/sync_file.h
> @@ -12,8 +12,16 @@
>  #ifndef _LINUX_SYNC_H
>  #define _LINUX_SYNC_H
>
> +#ifdef __linux__
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/ioctl.h>
> +#include <sys/types.h>
> +#define        __s32   int32_t
> +#define        __u32   uint32_t
> +#define        __u64   uint64_t
> +#endif
>
>  /**
>   * struct sync_merge_data - data passed to merge ioctl
> diff --git a/lib/i915/gem_engine_topology.c
> b/lib/i915/gem_engine_topology.c
> index ca3333c2..9d574de5 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -88,6 +88,10 @@
>   */
>  #define SIZEOF_QUERY           offsetof(struct
> drm_i915_query_engine_info, \
>                                          engines[GEM_MAX_ENGINES])
> +#ifdef __FreeBSD__
> +#define        SYS_getdents64  SYS_freebsd11_getdents
> +#define        ino64_t         ino_t
> +#endif
>
>  static int __gem_query(int fd, struct drm_i915_query *q)
>  {
> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> index aa9ac6f3..7bd6f22b 100644
> --- a/lib/i915/gem_mman.c
> +++ b/lib/i915/gem_mman.c
> @@ -44,6 +44,11 @@
>  #define VG(x) do {} while (0)
>  #endif
>
> +#ifdef __FreeBSD__
> +#define        mmap64(addr, len, prot, flags, fd, offset) \
> +       mmap(addr, len, prot, flags, fd, offset)
> +#endif
> +
>  static int gem_mmap_gtt_version(int fd)
>  {
>         struct drm_i915_getparam gp;
> diff --git a/lib/i915/intel_memory_region.c
> b/lib/i915/intel_memory_region.c
> index 93a18982..88b2667b 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -21,7 +21,11 @@
>   * IN THE SOFTWARE.
>   */
>
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#elif defined(__FreeBSD__)
> +#include <sys/limits.h>
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
> index edb53425..e6b2bd7e 100644
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
> @@ -75,6 +77,12 @@
>  #include <libgen.h>   /* for dirname() */
>  #endif
>
> +#ifdef __FreeBSD__
> +typedef struct { char state; } proc_t;
> +#define        gettid()        getpid()
> +#define        setpgrp()       setpgid(0, 0)
> +#endif
> +
>  /**
>   * SECTION:igt_aux
>   * @short_description: Auxiliary libraries and support functions
> @@ -1206,6 +1214,7 @@ void igt_unlock_mem(void)
>         locked_mem = NULL;
>  }
>
> +#ifdef __linux__
>  /**
>   * igt_is_process_running:
>   * @comm: Name of process in the form found in /proc/pid/comm (limited to
> 15
> @@ -1780,6 +1789,41 @@ igt_lsof_kill_audio_processes(void)
>
>         return fail;
>  }
> +#elif defined(__FreeBSD__)
> +int
> +igt_is_process_running(const char *comm)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_terminate_process(int sig, const char *comm)
> +{
> +       return -ENOSYS;
> +}
> +
> +void
> +igt_lsof(const char *dpath)
> +{
> +}
> +
> +int
> +igt_lsof_kill_audio_processes(void)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +pipewire_pulse_start_reserve(void)
> +{
> +       return -ENOSYS;
> +}
> +
> +void
> +pipewire_pulse_stop_reserve(void)
> +{
> +}
> +#endif /* __linux__ */
>
>  static struct igt_siglatency {
>         timer_t timer;
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
> index e7425326..23f703f3 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -43,7 +43,7 @@
>  #include <unistd.h>
>  #include <sys/wait.h>
>  #include <sys/types.h>
> -#ifdef __linux__
> +#if defined(__linux__) || defined(__FreeBSD__)
>  #include <sys/syscall.h>
>  #endif
>  #include <pthread.h>
> @@ -85,6 +85,12 @@
>  #include <libgen.h>   /* for basename() on Solaris */
>  #endif
>
> +#ifdef __FreeBSD__
> +#define        gettid()                                getpid()
> +#define        pthread_sigqueue(pid, signo, value)     sigqueue(pid,
> signo, value)
> +#define        sighandler_t                            sig_t
> +#endif
> +
>  /**
>   * SECTION:igt_core
>   * @short_description: Core i-g-t testing support
> @@ -786,6 +792,7 @@ static void print_usage(const char *help_str, bool
> output_on_stderr)
>
>  static void oom_adjust_for_doom(void)
>  {
> +#ifdef __linux__
>         int fd;
>         const char always_kill[] = "1000";
>
> @@ -793,7 +800,7 @@ static void oom_adjust_for_doom(void)
>         igt_assert(fd != -1);
>         igt_assert(write(fd, always_kill, sizeof(always_kill)) ==
> sizeof(always_kill));
>         close(fd);
> -
> +#endif
>  }
>
>  /**
> @@ -2223,7 +2230,12 @@ bool __igt_fork_helper(struct igt_helper_process
> *proc)
>                 igt_assert(0);
>         case 0:
>                 reset_helper_process_list();
> +#ifdef __linux__
>                 oom_adjust_for_doom();
> +#elif defined(__FreeBSD__)
> +               /* not a great substitution for oom_adjust_for_doom() */
> +               raise(SIGTERM);
> +#endif
>
>                 return true;
>         default:
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index aa98e8ed..7869f722 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -31,7 +31,9 @@
>  #define IGT_CORE_H
>
>  #include <assert.h>
> +#ifdef __linux__
>  #include <byteswap.h>
> +#endif
>  #include <setjmp.h>
>  #include <stdbool.h>
>  #include <stdint.h>
> @@ -47,6 +49,10 @@
>  #define IGT_LOG_DOMAIN (NULL)
>  #endif
>
> +#ifdef __FreeBSD__
> +#include <signal.h>
> +#define        jmp_buf sigjmp_buf
> +#endif
>
>  #ifndef STATIC_ANALYSIS_BUILD
>  #if defined(__clang_analyzer__) || defined(__COVERITY__) ||
> defined(__KLOCWORK__)
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a56688a5..b7e37851 100644
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
> @@ -43,6 +45,10 @@
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>
> +#ifdef __FreeBSD__
> +#define        mount(src, dest, fstype, flags, data)   mount(fstype,
> dest, flags, data)
> +#endif
> +
>  /**
>   * SECTION:igt_debugfs
>   * @short_description: Support code for debugfs features
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
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bcf7dfeb..12a22a95 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -32,6 +32,7 @@
>  #include "igt_sysfs.h"
>  #include "igt_taints.h"
>
> +#ifdef __linux__
>  /**
>   * SECTION:igt_kmod
>   * @short_description: Wrappers around libkmod for module
> loading/unloading
> @@ -853,3 +854,120 @@ void igt_kselftests(const char *module_name,
>
>         igt_kselftest_fini(&tst);
>  }
> +#elif defined(__FreeBSD__)
> +struct kmod_module {
> +       size_t size;
> +};
> +
> +bool
> +igt_kmod_is_loaded(const char *mod_name)
> +{
> +       return false;
> +}
> +
> +void
> +igt_kmod_list_loaded(void)
> +{
> +}
> +
> +bool
> +igt_kmod_has_param(const char *mod_name, const char *param)
> +{
> +       return false;
> +}
> +
> +int
> +igt_kmod_load(const char *mod_name, const char *opts)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_kmod_unload(const char *mod_name, unsigned int flags)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_audio_driver_unload(char **whom)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_i915_driver_load(const char *opts)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_i915_driver_unload(void)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +__igt_i915_driver_unload(char **whom)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_amdgpu_driver_load(const char *opts)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_amdgpu_driver_unload(void)
> +{
> +       return -ENOSYS;
> +}
> +
> +void
> +igt_kselftests(const char *module_name,
> +    const char *module_options,
> +    const char *result_option,
> +    const char *filter)
> +{
> +}
> +
> +int
> +igt_kselftest_init(struct igt_kselftest *tst,
> +    const char *module_name)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_kselftest_begin(struct igt_kselftest *tst)
> +{
> +       return -ENOSYS;
> +}
> +
> +void
> +igt_kselftest_get_tests(struct kmod_module *kmod,
> +    const char *filter,
> +    struct igt_list_head *tests)
> +{
> +}
> +
> +int
> +igt_kselftest_execute(struct igt_kselftest *tst,
> +    struct igt_kselftest_list *tl,
> +    const char *module_options,
> +    const char *result)
> +{
> +       return -ENOSYS;
> +}
> +
> +void
> +igt_kselftest_end(struct igt_kselftest *tst)
> +{
> +}
> +
> +void
> +igt_kselftest_fini(struct igt_kselftest *tst)
> +{
> +}
> +#endif /* __linux__ */
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
> index 1ba3bd2a..f0208c10 100644
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
> index bdd5d933..ae426e3a 100644
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
>         npages = sysconf(_SC_AVPHYS_PAGES);
>
>         retval = (uint64_t) pagesize * npages;
> +#elif defined(__FreeBSD__) /* FreeBSD */
> +       uint64_t npages, pagesize;
> +       size_t npages_len = sizeof(npages);
> +       size_t pagesize_len = sizeof(pagesize);
> +
> +       sysctlbyname("vm.stats.vm.v_free_count", &npages, &npages_len,
> NULL, 0);
> +       sysctlbyname("vm.stats.vm.v_page_size", &pagesize, &pagesize_len,
> NULL, 0);
> +
> +       retval = pagesize * npages;
>  #else
>  #error "Unknown how to get available RAM for this OS"
>  #endif
> @@ -210,6 +222,13 @@ igt_get_total_swap_mb(void)
>         free(buf);
>
>         retval = (uint64_t) pagesize * totalpages;
> +#elif defined(__FreeBSD__) /* FreeBSD */
> +       uint64_t swap_total;
> +       size_t swap_total_len = sizeof(swap_total);
> +
> +       sysctlbyname("vm.swap_total", &swap_total, &swap_total_len, NULL,
> 0);
> +
> +       retval = swap_total;
>  #else
>  #warning "Unknown how to get swap size for this OS"
>         return 0;
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index b743859f..90edbbd0 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -4,13 +4,16 @@
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
>  #include "igt_perf.h"
>
> +#ifdef __linux__
>  static char *bus_address(int i915, char *path, int pathlen)
>  {
>         struct stat st;
> @@ -157,3 +160,58 @@ int igt_perf_open_group(uint64_t type, uint64_t
> config, int group)
>         return _perf_open(type, config, group,
>                           PERF_FORMAT_TOTAL_TIME_ENABLED |
> PERF_FORMAT_GROUP);
>  }
> +#elif defined(__FreeBSD__)
> +uint64_t
> +igt_perf_type_id(const char *device)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_perf_open(uint64_t type, uint64_t config)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +igt_perf_open_group(uint64_t type, uint64_t config, int group)
> +{
> +       return -ENOSYS;
> +}
> +
> +const char *
> +i915_perf_device(int i915, char *buf, int buflen)
> +{
> +       return strerror(ENOSYS);
> +}
> +
> +uint64_t
> +i915_perf_type_id(int i915)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +perf_igfx_open(uint64_t config)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +perf_igfx_open_group(uint64_t config, int group)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +perf_i915_open(int i915, uint64_t config)
> +{
> +       return -ENOSYS;
> +}
> +
> +int
> +perf_i915_open_group(int i915, uint64_t config, int group)
> +{
> +       return -ENOSYS;
> +}
> +#endif /* __linux__ */
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
>                 pid_t pid,
> @@ -50,6 +53,7 @@ perf_event_open(struct perf_event_attr *attr,
>      attr->size = sizeof(*attr);
>      return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
>  }
> +#endif /* __linux__ */
>
>  uint64_t igt_perf_type_id(const char *device);
>  int igt_perf_open(uint64_t type, uint64_t config);
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 99251b40..a6036e03 100644
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
> diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
> index a24ed10b..eb302986 100644
> --- a/lib/igt_syncobj.c
> +++ b/lib/igt_syncobj.c
> @@ -27,6 +27,10 @@
>  #include "igt.h"
>  #include "igt_syncobj.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  /**
>   * SECTION:igt_syncobj
>   * @short_description: Library with syncobj helpers
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
> diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> index 7f933b23..9483b896 100644
> --- a/lib/igt_vgem.c
> +++ b/lib/igt_vgem.c
> @@ -30,6 +30,11 @@
>  #include "igt_core.h"
>  #include "ioctl_wrappers.h"
>
> +#ifdef __FreeBSD__
> +#define        mmap64(addr, len, prot, flags, fd, offset) \
> +       mmap(addr, len, prot, flags, fd, offset)
> +#endif
> +
>  /**
>   * SECTION:igt_vgem
>   * @short_description: VGEM support library
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index 717d7fc5..bd840f57 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -17,6 +17,10 @@
>  #include "intel_allocator.h"
>  #include "intel_allocator_msgchannel.h"
>
> +#ifdef __FreeBSD__
> +#define        gettid()        getpid()
> +#endif
> +
>  //#define ALLOCDBG
>  #ifdef ALLOCDBG
>  #define alloc_info igt_info
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index ef1b5947..8004c09e 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -60,6 +60,11 @@
>  #define BCS_SRC_Y (1 << 0)
>  #define BCS_DST_Y (1 << 1)
>
> +#ifdef __FreeBSD__
> +/* memory leak */
> +#define        tdestroy(root, free_node)
> +#endif
> +
>  /**
>   * SECTION:intel_batchbuffer
>   * @short_description: Batchbuffer and blitter support
> diff --git a/lib/sw_sync.c b/lib/sw_sync.c
> index 6c762c8b..e5a73ffa 100644
> --- a/lib/sw_sync.c
> +++ b/lib/sw_sync.c
> @@ -41,6 +41,10 @@
>  #include "drmtest.h"
>  #include "ioctl_wrappers.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  /**
>   * SECTION:sw_sync
>   * @short_description: Software sync (fencing) support library
> diff --git a/lib/tests/igt_exit_handler.c b/lib/tests/igt_exit_handler.c
> index 892a7f14..d2381944 100644
> --- a/lib/tests/igt_exit_handler.c
> +++ b/lib/tests/igt_exit_handler.c
> @@ -125,5 +125,9 @@ int main(int argc, char **argv)
>         internal_assert_wexited(status, IGT_EXIT_SKIP);
>
>         status = testfunc(SIG);
> +#ifdef __linux__
>         internal_assert_wsignaled(status, SIGTERM);
> +#elif defined(__FreeBSD__)
> +       internal_assert(status == 0);
> +#endif
>  }
> diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
> index d19d0945..4a2d50d4 100644
> --- a/lib/tests/igt_fork.c
> +++ b/lib/tests/igt_fork.c
> @@ -109,7 +109,11 @@ __noreturn static void igt_fork_timeout_leak(void)
>  __noreturn static void subtest_leak(void)
>  {
>         pid_t *children =
> +#ifdef __linux__
>                 mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +#elif defined(__FreeBSD__)
> +               mmap(0, 4096, PROT_WRITE | PROT_READ, MAP_SHARED |
> MAP_ANON, -1, 0);
> +#endif
>         const int num_children = 4096 / sizeof(*children);
>
>         igt_subtest_init(fake_argc, fake_argv);
> diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
> index 058f6265..e8183897 100644
> --- a/lib/tests/igt_tests_common.h
> +++ b/lib/tests/igt_tests_common.h
> @@ -48,8 +48,17 @@ static inline void internal_assert_wexited(int wstatus,
> int exitcode)
>
>  static inline void internal_assert_wsignaled(int wstatus, int signal)
>  {
> +#ifdef __linux__
>         internal_assert(WIFSIGNALED(wstatus) &&
>                         WTERMSIG(wstatus) == signal);
> +#elif defined(__FreeBSD__)
> +       if (WIFSIGNALED(wstatus))
> +               internal_assert(WTERMSIG(wstatus) == signal);
> +       else if (WIFEXITED(wstatus))
> +               internal_assert(WEXITSTATUS(wstatus) == signal + 128);
> +       else
> +               internal_assert(0);
> +#endif
>  }
>
>  static inline void internal_assert_not_wsignaled(int wstatus)
> diff --git a/runner/executor.c b/runner/executor.c
> index 964d0063..65e3d2ba 100644
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
> @@ -14,7 +16,9 @@
>  #include <sys/ioctl.h>
>  #include <sys/select.h>
>  #include <sys/poll.h>
> +#ifdef __linux__
>  #include <sys/signalfd.h>
> +#endif
>  #include <sys/stat.h>
>  #include <sys/time.h>
>  #include <sys/types.h>
> @@ -33,6 +37,16 @@
>  #define KMSG_HEADER "[IGT] "
>  #define KMSG_WARN 4
>
> +#ifdef __FreeBSD__
> +#include <sys/watchdog.h>
> +struct signalfd_siginfo {
> +       uint32_t ssi_signo;
> +       uint32_t ssi_pid;
> +};
> +#define        WDIOC_KEEPALIVE                 WDIOCPATPAT
> +#define        signalfd(fd, mask, flags)       -ENOSYS
> +#endif
> +
>  static struct {
>         int *fds;
>         size_t num_dogs;
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index c9ad3fb9..fdd46e92 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -48,6 +48,10 @@
>  # include <pthread.h>
>  #endif
>
> +#ifdef __FreeBSD__
> +#define        pthread_self()  getpid()
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Call drmGetMagic() and drmAuthMagic() and see if it
> behaves.");
>
>  static bool
> diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c
> index 06245e8b..448d2d70 100644
> --- a/tests/drm_import_export.c
> +++ b/tests/drm_import_export.c
> @@ -45,6 +45,10 @@
>  #define DURATION 10
>  IGT_TEST_DESCRIPTION("Basic check to verify the behaviour of libdrm bo
> for prime/flink");
>
> +#ifdef __FreeBSD__
> +#define        gettid()        getpid()
> +#endif
> +
>  int fd;
>  drm_intel_bufmgr *bufmgr;
>  int fd1;
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 2c6261bd..e5278a90 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -50,6 +50,11 @@
>  #include "igt_aux.h"
>  #include "ioctl_wrappers.h"
>
> +#ifdef __FreeBSD__
> +#undef jmp_buf
> +#define        sighandler_t    sig_t
> +#endif
> +
>  IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer
> interface.");
>
>  static int __dumb_create(int fd, struct drm_mode_create_dumb *create)
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 938fde8f..0b7378b2 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -53,6 +53,10 @@
>  #define BLT_WRITE_ALPHA                (1<<21)
>  #define BLT_WRITE_RGB          (1<<20)
>
> +#ifdef __FreeBSD__
> +#define        gettid()                getpid()
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Test try to race gem_close against workload
> submission.");
>
>  static uint32_t devid;
> @@ -61,7 +65,9 @@ static bool has_softpin;
>  static uint64_t exec_addr;
>  static uint64_t data_addr;
>
> +#ifdef __linux__
>  #define sigev_notify_thread_id _sigev_un._tid
> +#endif
>
>  static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  {
> diff --git a/tests/i915/gem_concurrent_all.c
> b/tests/i915/gem_concurrent_all.c
> index 25b7daf8..e965dadb 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -53,6 +53,11 @@
>  #include "igt.h"
>  #include "igt_vgem.h"
>
> +/* improper substitution */
> +#ifdef __FreeBSD__
> +#define        MADV_DONTFORK   MADV_NOSYNC
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Test of pread/pwrite/mmap behavior when writing to
> active"
>                      " buffers.");
>
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index d7d2a017..18d9324e 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -61,6 +61,10 @@
>  #include "i915/gem_mman.h"
>  #include "i915_drm.h"
>
> +#ifdef __FreeBSD__
> +#define        sighandler_t    sig_t
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext
> works"
>                      " and that invalid input combinations are rejected.");
>
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 3d94f01d..3cc7a87c 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -48,6 +48,10 @@
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Test context batch buffer execution.");
>
>  /* Copied from gem_exec_nop.c */
> diff --git a/tests/i915/gem_ctx_persistence.c
> b/tests/i915/gem_ctx_persistence.c
> index 50196edb..afda4675 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -50,6 +50,10 @@
>  static unsigned long reset_timeout_ms = RESET_TIMEOUT_MS;
>  #define NSEC_PER_MSEC (1000 * 1000ull)
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  static void cleanup(int i915)
>  {
>         igt_drop_caches_set(i915,
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index eb3b024f..fe1c788b 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -54,6 +54,10 @@
>  #define MAX_PRIO I915_CONTEXT_MAX_USER_PRIORITY
>  #define MIN_PRIO I915_CONTEXT_MIN_USER_PRIORITY
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  static int priorities[] = {
>         [LO] = MIN_PRIO / 2,
>         [HI] = MAX_PRIO / 2,
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index f24bebdb..50b14c87 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -36,6 +36,10 @@
>  #include "intel_ctx.h"
>  #include "sw_sync.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
>
>  #ifndef SYNC_IOC_MERGE
> diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
> index fcdf7787..dad9ea27 100644
> --- a/tests/i915/gem_exec_latency.c
> +++ b/tests/i915/gem_exec_latency.c
> @@ -55,6 +55,10 @@
>  #define CORK 0x2
>  #define PREEMPT 0x4
>
> +#ifdef __FreeBSD__
> +#define        SCHED_RESET_ON_FORK     0
> +#endif
> +
>  static unsigned int ring_size;
>  static double rcs_clock;
>  static struct intel_mmio_data mmio_data;
> diff --git a/tests/i915/gem_lmem_swapping.c
> b/tests/i915/gem_lmem_swapping.c
> index cccdb319..34ca455f 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -25,6 +25,10 @@
>  #include "i915/i915_blt.h"
>  #include "i915/intel_mocs.h"
>
> +#ifdef __FreeBSD__
> +#define        MAP_POPULATE                    MAP_PREFAULT_READ
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
>
>  #define __round_mask(x, y) ((__typeof__(x))((y) - 1))
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 2502d84c..4c6cdbc4 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -39,6 +39,10 @@
>  #include "drm.h"
>  #include "i915/gem_create.h"
>
> +#ifdef __FreeBSD__
> +#define        sighandler_t    sig_t
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Checks that the kernel reports EFAULT when trying
> to use"
>                      " purged bo.");
>
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index e39b9047..8daa6248 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -54,6 +54,16 @@
>
>  #define abs(x) ((x) >= 0 ? (x) : -(x))
>
> +#ifdef __FreeBSD__
> +#define        mmap64(addr, len, prot, flags, fd, offset) \
> +       mmap(addr, len, prot, flags, fd, offset)
> +#define        PTRACE_TRACEME  PT_TRACE_ME
> +#define        PTRACE_ATTACH   PT_ATTACH
> +#define        PTRACE_PEEKDATA PT_READ_D
> +#define        PTRACE_POKEDATA PT_WRITE_D
> +#define        PTRACE_DETACH   PT_DETACH
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Ensure that all operations around MMAP_GTT ioctl
> works.");
>
>  static int OBJECT_SIZE = 16*1024*1024;
> @@ -566,7 +576,11 @@ test_ptrace(int fd)
>         for (int i = 0; i < sz / sizeof(long); i++) {
>                 long ret;
>
> +#ifdef __linux__
>                 ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i);
> +#elif defined(__FreeBSD__)
> +               ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i, 0);
> +#endif
>                 igt_assert_eq_u64(ret, CC);
>                 cpy[i] = ret;
>
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 5e6b19eb..21bcdddd 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -38,6 +38,16 @@
>  #include "igt.h"
>  #include "igt_x86.h"
>
> +#ifdef __FreeBSD__
> +#define        mmap64(addr, len, prot, flags, fd, offset) \
> +       mmap(addr, len, prot, flags, fd, offset)
> +#define        PTRACE_TRACEME  PT_TRACE_ME
> +#define        PTRACE_ATTACH   PT_ATTACH
> +#define        PTRACE_PEEKDATA PT_READ_D
> +#define        PTRACE_POKEDATA PT_WRITE_D
> +#define        PTRACE_DETACH   PT_DETACH
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n");
>
>  static int mmap_offset_ioctl(int i915, struct drm_i915_gem_mmap_offset
> *arg)
> @@ -370,7 +380,11 @@ static void test_ptrace(int i915)
>                         for (int i = 0; i < SZ / sizeof(long); i++) {
>                                 long ret;
>
> +#ifdef __linux__
>                                 ret = ptrace(PTRACE_PEEKDATA, pid, ptr +
> i);
> +#elif defined(__FreeBSD__)
> +                               ret = ptrace(PTRACE_PEEKDATA, pid, ptr +
> i, 0);
> +#endif
>                                 igt_assert_eq_u64(ret, CC);
>                                 cpy[i] = ret;
>
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index 49df35c2..e9dd49cf 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -38,6 +38,10 @@
>  #define MADV_FREE 8
>  #endif
>
> +#ifdef __FreeBSD__
> +#define        MAP_POPULATE    MAP_PREFAULT_READ
> +#endif
> +
>  static void get_pages(int fd, uint64_t alloc)
>  {
>         uint32_t handle = gem_create(fd, alloc);
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index 230304aa..9655fb09 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -32,6 +32,10 @@
>  #include "igt.h"
>  #include "igt_vgem.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
>
>  static int __gem_wait(int fd, struct drm_i915_gem_wait *w)
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index c7d69fdd..c0bde6be 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -50,6 +50,10 @@ static int sysfs = -1;
>
>  #define OFFSET_ALIVE   10
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
>
>  static void check_alive(void)
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
> diff --git a/tests/i915/i915_pm_backlight.c
> b/tests/i915/i915_pm_backlight.c
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
> index e95875dc..6a30ecf6 100644
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
> @@ -54,6 +56,17 @@
>  #include "igt_device.h"
>  #include "igt_edid.h"
>
> +#ifdef __FreeBSD__
> +#include <limits.h>
> +#include <dev/iicbus/iic.h>
> +
> +#define        I2C_RDWR                I2CRDWR
> +#define        I2C_M_RD                IIC_M_RD
> +#define        i2c_msg                 iic_msg
> +#define        i2c_rdwr_ioctl_data     iic_rdwr_data
> +#define        addr                    slave
> +#endif
> +
>  #define MSR_PC8_RES    0x630
>  #define MSR_PC9_RES    0x631
>  #define MSR_PC10_RES   0x632
> diff --git a/tests/i915/sysfs_heartbeat_interval.c
> b/tests/i915/sysfs_heartbeat_interval.c
> index 8cebf627..cb1f37f8 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -42,6 +42,10 @@
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>
> +#ifdef __FreeBSD__
> +#define        sighandler_t    sig_t
> +#endif
> +
>  #define ATTR "heartbeat_interval_ms"
>  #define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker
> */
>
> diff --git a/tests/kms_content_protection.c
> b/tests/kms_content_protection.c
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
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1b697667..67a470b6 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -47,6 +47,10 @@
>
>  #define PAGE_SIZE      4096
>
> +#ifdef __FreeBSD__
> +#define        SCHED_IDLE      SCHED_OTHER
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Stress legacy cursor ioctl");
>
>  igt_pipe_crc_t *pipe_crc;
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
>  #define TEST_DPMS              (1 << 0)
>
>  #define TEST_PAN               (1 << 3)
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
>  #define THRESHOLD_PER_CONNECTOR                150
>  #define THRESHOLD_PER_CONNECTOR_MEAN   140
>  #define THRESHOLD_ALL_CONNECTORS_MEAN  100
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index cbd773fc..1290a284 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -38,6 +38,9 @@
>
>  #include "sw_sync.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
>
>  IGT_TEST_DESCRIPTION("Test SW Sync Framework");
>
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 20375cdd..795fd3fb 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -31,6 +31,10 @@
>  #include <signal.h>
>  #include "drm.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
>
>  /* One tenth of a second */
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index 669d0adf..4f31fb76 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -31,6 +31,10 @@
>  #include <signal.h>
>  #include "drm.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  IGT_TEST_DESCRIPTION("Tests for the drm sync object wait API");
>
>  /* One tenth of a second */
> diff --git a/tests/tools_test.c b/tests/tools_test.c
> index 237f0433..6652927a 100644
> --- a/tests/tools_test.c
> +++ b/tests/tools_test.c
> @@ -28,7 +28,12 @@
>  #include <fcntl.h>
>  #include <libgen.h>
>  #include <unistd.h>
> +#ifdef __linux__
>  #include <linux/limits.h>
> +#elif defined(__FreeBSD__)
> +#include <limits.h>
> +#define        get_current_dir_name()  getwd(NULL)
> +#endif
>
>  #define TOOLS "../tools/"
>
> diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4_purgeable_bo.c
> index d9f7547f..5aa734b4 100644
> --- a/tests/vc4_purgeable_bo.c
> +++ b/tests/vc4_purgeable_bo.c
> @@ -35,6 +35,10 @@
>  #include <sys/ioctl.h>
>  #include "vc4_drm.h"
>
> +#ifdef __FreeBSD__
> +#undef jmp_buf
> +#endif
> +
>  struct igt_vc4_bo {
>         struct igt_list_head node;
>         int handle;
> diff --git a/tests/vc4_wait_bo.c b/tests/vc4_wait_bo.c
> index 65a085a3..2c3c9da8 100644
> --- a/tests/vc4_wait_bo.c
> +++ b/tests/vc4_wait_bo.c
> @@ -34,6 +34,10 @@
>  #include <sys/ioctl.h>
>  #include "vc4_drm.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  static void
>  test_used_bo(int fd, uint64_t timeout)
>  {
> diff --git a/tests/vc4_wait_seqno.c b/tests/vc4_wait_seqno.c
> index bcc263cb..c04c8d78 100644
> --- a/tests/vc4_wait_seqno.c
> +++ b/tests/vc4_wait_seqno.c
> @@ -33,6 +33,10 @@
>  #include <sys/ioctl.h>
>  #include "vc4_drm.h"
>
> +#ifdef __FreeBSD__
> +#define        ETIME   ETIMEDOUT
> +#endif
> +
>  igt_main
>  {
>         int fd;
> diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
> index ad5ee6a6..2f0c94f0 100644
> --- a/tools/intel_gvtg_test.c
> +++ b/tools/intel_gvtg_test.c
> @@ -44,6 +44,9 @@
>  #include <sys/ioctl.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> +#ifdef __FreeBSD__
> +#include <sys/wait.h>
> +#endif
>  #include <string.h>
>  #include <stdlib.h>
>  #include <signal.h>
> --
> 2.37.2
>
>

--0000000000006ae1c005e7b2da4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div><br></div><div>I am considering bundling all=
 FreeBSD-specific igt macros into an `igt_freebsd.h` header</div><div>for g=
reater accessibility. If this idea is acceptable, I need a place to create =
this file.</div><div>What&#39;s the appropriate location for an igt-specifi=
c header that does not have a corresponding</div><div>source file?</div><di=
v><br></div><div>Thank you,</div><div>Jake Freeland</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 2, 202=
2 at 9:14 AM Jake Freeland &lt;<a href=3D"mailto:jake@technologyfriends.net=
">jake@technologyfriends.net</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Signed-off-by: Jake Freeland &lt;<a href=3D"mai=
lto:jfree@freebsd.org" target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
---<br>
=C2=A0benchmarks/gem_exec_tracer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +<br>
=C2=A0benchmarks/gem_syslatency.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A09 ++<br>
=C2=A0include/linux-uapi/sync_file.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A08 ++<br>
=C2=A0lib/i915/gem_engine_topology.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0lib/i915/gem_mman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
=C2=A0lib/i915/intel_memory_region.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0lib/i915/perf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0lib/igt_audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_aux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 ++++++++++<br>
=C2=A0lib/igt_aux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0lib/igt_core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +++-<br>
=C2=A0lib/igt_core.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 ++<br>
=C2=A0lib/igt_debugfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 ++<br>
=C2=A0lib/igt_device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0lib/igt_device_scan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_eld.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_frame.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_kmod.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 118 ++++++++++++++++++++++++++<br>
=C2=A0lib/igt_kmod.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0lib/igt_kms.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_os.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++++<br>
=C2=A0lib/igt_perf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 58 +++++++++++++<br>
=C2=A0lib/igt_perf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_pm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0lib/igt_syncobj.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/igt_sysfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0lib/igt_vgem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 ++<br>
=C2=A0lib/intel_allocator.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/intel_batchbuffer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
=C2=A0lib/sw_sync.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0lib/tests/igt_exit_handler.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +<br>
=C2=A0lib/tests/igt_fork.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0lib/tests/igt_tests_common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A09 ++<br>
=C2=A0runner/executor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 +++<br>
=C2=A0tests/core_auth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/drm_import_export.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/dumb_buffer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
=C2=A0tests/i915/gem_close_race.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 ++<br>
=C2=A0tests/i915/gem_concurrent_all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A05 ++<br>
=C2=A0tests/i915/gem_create.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_ctx_exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_ctx_persistence.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 =
+<br>
=C2=A0tests/i915/gem_ctx_shared.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_exec_fence.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_exec_latency.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_lmem_swapping.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0tests/i915/gem_madvise.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_mmap_gtt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 14 +++<br>
=C2=A0tests/i915/gem_mmap_offset.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 14 +++<br>
=C2=A0tests/i915/gem_shrink.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/gem_wait.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/i915_hangman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/i915/i915_module_load.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +<br>
=C2=A0tests/i915/i915_pm_backlight.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0tests/i915/i915_pm_rpm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 +++<br>
=C2=A0tests/i915/sysfs_heartbeat_interval.c |=C2=A0 =C2=A04 +<br>
=C2=A0tests/kms_content_protection.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0tests/kms_cursor_legacy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/kms_flip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0tests/kms_sysfs_edid_timing.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
=C2=A0tests/sw_sync.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0tests/syncobj_timeline.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0tests/syncobj_wait.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0tests/tools_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 ++<br>
=C2=A0tests/vc4_purgeable_bo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0tests/vc4_wait_bo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/vc4_wait_seqno.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0tools/intel_gvtg_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A068 files changed, 552 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c<br=
>
index e6973991..084c8e65 100644<br>
--- a/benchmarks/gem_exec_tracer.c<br>
+++ b/benchmarks/gem_exec_tracer.c<br>
@@ -41,6 +41,10 @@<br>
=C2=A0#include &quot;intel_aub.h&quot;<br>
=C2=A0#include &quot;intel_chipset.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOC_TYPE(nr)=C2=A0 =C2=A0(((nr) &gt;&g=
t; 8) &amp; 255)<br>
+#endif<br>
+<br>
=C2=A0static int (*libc_close)(int fd);<br>
=C2=A0static int (*libc_ioctl)(int fd, unsigned long request, void *argp);<=
br>
<br>
diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c<br>
index 035ee934..be92ff0f 100644<br>
--- a/benchmarks/gem_syslatency.c<br>
+++ b/benchmarks/gem_syslatency.c<br>
@@ -42,12 +42,21 @@<br>
=C2=A0#include &lt;limits.h&gt;<br>
=C2=A0#include &quot;drm.h&quot;<br>
<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/unistd.h&gt;<br>
+#elif defined(__FreeBSD__)<br>
+#include &lt;sys/mman.h&gt;<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_POPULATE=C2=A0 =C2=A0 MAP_PREFAULT_=
READ<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 get=
pid()<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 MADV_HUGEPAGE=C2=A0 =C2=A0MADV_SEQUENTI=
AL<br>
+#endif<br>
<br>
=C2=A0#include &quot;i915/gem_create.h&quot;<br>
=C2=A0#include &quot;i915/gem_ring.h&quot;<br>
<br>
+#ifdef __linux__<br>
=C2=A0#define sigev_notify_thread_id _sigev_un._tid<br>
+#endif<br>
<br>
=C2=A0static volatile int done;<br>
<br>
diff --git a/include/linux-uapi/sync_file.h b/include/linux-uapi/sync_file.=
h<br>
index b4f2db00..0f1fb720 100644<br>
--- a/include/linux-uapi/sync_file.h<br>
+++ b/include/linux-uapi/sync_file.h<br>
@@ -12,8 +12,16 @@<br>
=C2=A0#ifndef _LINUX_SYNC_H<br>
=C2=A0#define _LINUX_SYNC_H<br>
<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/ioctl.h&gt;<br>
=C2=A0#include &lt;linux/types.h&gt;<br>
+#elif defined(__FreeBSD__)<br>
+#include &lt;sys/ioctl.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 __s32=C2=A0 =C2=A0int32_t<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32=C2=A0 =C2=A0uint32_t<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64=C2=A0 =C2=A0uint64_t<br>
+#endif<br>
<br>
=C2=A0/**<br>
=C2=A0 * struct sync_merge_data - data passed to merge ioctl<br>
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.=
c<br>
index ca3333c2..9d574de5 100644<br>
--- a/lib/i915/gem_engine_topology.c<br>
+++ b/lib/i915/gem_engine_topology.c<br>
@@ -88,6 +88,10 @@<br>
=C2=A0 */<br>
=C2=A0#define SIZEOF_QUERY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offsetof=
(struct drm_i915_query_engine_info, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0en=
gines[GEM_MAX_ENGINES])<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 SYS_getdents64=C2=A0 SYS_freebsd11_getd=
ents<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ino64_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ino_t<br>
+#endif<br>
<br>
=C2=A0static int __gem_query(int fd, struct drm_i915_query *q)<br>
=C2=A0{<br>
diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c<br>
index aa9ac6f3..7bd6f22b 100644<br>
--- a/lib/i915/gem_mman.c<br>
+++ b/lib/i915/gem_mman.c<br>
@@ -44,6 +44,11 @@<br>
=C2=A0#define VG(x) do {} while (0)<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap64(addr, len, prot, flags, fd, offs=
et) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(addr, len, prot, flags, fd, offset)<br>
+#endif<br>
+<br>
=C2=A0static int gem_mmap_gtt_version(int fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_getparam gp;<br>
diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.=
c<br>
index 93a18982..88b2667b 100644<br>
--- a/lib/i915/intel_memory_region.c<br>
+++ b/lib/i915/intel_memory_region.c<br>
@@ -21,7 +21,11 @@<br>
=C2=A0 * IN THE SOFTWARE.<br>
=C2=A0 */<br>
<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/limits.h&gt;<br>
+#elif defined(__FreeBSD__)<br>
+#include &lt;sys/limits.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;signal.h&gt;<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &lt;sys/time.h&gt;<br>
diff --git a/lib/i915/perf.c b/lib/i915/perf.c<br>
index d88835ff..beda6b8a 100644<br>
--- a/lib/i915/perf.c<br>
+++ b/lib/i915/perf.c<br>
@@ -29,7 +29,9 @@<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/sysmacros.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
<br>
diff --git a/lib/igt_audio.c b/lib/igt_audio.c<br>
index e0b1bafe..201a39c6 100644<br>
--- a/lib/igt_audio.c<br>
+++ b/lib/igt_audio.c<br>
@@ -26,6 +26,10 @@<br>
<br>
=C2=A0#include &quot;config.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;limits.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;gsl/gsl_fft_real.h&gt;<br>
diff --git a/lib/igt_aux.c b/lib/igt_aux.c<br>
index edb53425..e6b2bd7e 100644<br>
--- a/lib/igt_aux.c<br>
+++ b/lib/igt_aux.c<br>
@@ -52,7 +52,9 @@<br>
=C2=A0#include &lt;assert.h&gt;<br>
=C2=A0#include &lt;grp.h&gt;<br>
<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;proc/readproc.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;libudev.h&gt;<br>
<br>
=C2=A0#include &quot;drmtest.h&quot;<br>
@@ -75,6 +77,12 @@<br>
=C2=A0#include &lt;libgen.h&gt;=C2=A0 =C2=A0/* for dirname() */<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+typedef struct { char state; } proc_t;<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 get=
pid()<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 setpgrp()=C2=A0 =C2=A0 =C2=A0 =C2=A0set=
pgid(0, 0)<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:igt_aux<br>
=C2=A0 * @short_description: Auxiliary libraries and support functions<br>
@@ -1206,6 +1214,7 @@ void igt_unlock_mem(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 locked_mem =3D NULL;<br>
=C2=A0}<br>
<br>
+#ifdef __linux__<br>
=C2=A0/**<br>
=C2=A0 * igt_is_process_running:<br>
=C2=A0 * @comm: Name of process in the form found in /proc/pid/comm (limite=
d to 15<br>
@@ -1780,6 +1789,41 @@ igt_lsof_kill_audio_processes(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fail;<br>
=C2=A0}<br>
+#elif defined(__FreeBSD__)<br>
+int<br>
+igt_is_process_running(const char *comm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_terminate_process(int sig, const char *comm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+void<br>
+igt_lsof(const char *dpath)<br>
+{<br>
+}<br>
+<br>
+int<br>
+igt_lsof_kill_audio_processes(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+pipewire_pulse_start_reserve(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+void<br>
+pipewire_pulse_stop_reserve(void)<br>
+{<br>
+}<br>
+#endif /* __linux__ */<br>
<br>
=C2=A0static struct igt_siglatency {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_t timer;<br>
diff --git a/lib/igt_aux.h b/lib/igt_aux.h<br>
index c8d487b6..912f36c1 100644<br>
--- a/lib/igt_aux.h<br>
+++ b/lib/igt_aux.h<br>
@@ -34,9 +34,7 @@<br>
=C2=A0#include &lt;sys/time.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
-#ifdef __linux__<br>
-# include &lt;sys/syscall.h&gt;<br>
-#endif<br>
+#include &lt;sys/syscall.h&gt;<br>
<br>
=C2=A0#include &lt;i915/gem_submission.h&gt;<br>
<br>
@@ -48,8 +46,8 @@<br>
=C2=A0# ifndef HAVE_GETTID<br>
=C2=A0#=C2=A0 define gettid() (pid_t)(syscall(__NR_gettid))<br>
=C2=A0# endif<br>
-#endif<br>
=C2=A0#define sigev_notify_thread_id _sigev_un._tid<br>
+#endif<br>
<br>
=C2=A0/* auxialiary igt helpers from igt_aux.c */<br>
=C2=A0/* generally useful helpers */<br>
diff --git a/lib/igt_core.c b/lib/igt_core.c<br>
index e7425326..23f703f3 100644<br>
--- a/lib/igt_core.c<br>
+++ b/lib/igt_core.c<br>
@@ -43,7 +43,7 @@<br>
=C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
-#ifdef __linux__<br>
+#if defined(__linux__) || defined(__FreeBSD__)<br>
=C2=A0#include &lt;sys/syscall.h&gt;<br>
=C2=A0#endif<br>
=C2=A0#include &lt;pthread.h&gt;<br>
@@ -85,6 +85,12 @@<br>
=C2=A0#include &lt;libgen.h&gt;=C2=A0 =C2=A0/* for basename() on Solaris */=
<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 getpid()<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_sigqueue(pid, signo, value)=C2=
=A0 =C2=A0 =C2=A0sigqueue(pid, signo, value)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 sighandler_t=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sig_=
t<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:igt_core<br>
=C2=A0 * @short_description: Core i-g-t testing support<br>
@@ -786,6 +792,7 @@ static void print_usage(const char *help_str, bool outp=
ut_on_stderr)<br>
<br>
=C2=A0static void oom_adjust_for_doom(void)<br>
=C2=A0{<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char always_kill[] =3D &quot;1000&quot;;<=
br>
<br>
@@ -793,7 +800,7 @@ static void oom_adjust_for_doom(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert(fd !=3D -1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert(write(fd, always_kill, sizeof(always=
_kill)) =3D=3D sizeof(always_kill));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -2223,7 +2230,12 @@ bool __igt_fork_helper(struct igt_helper_process *pr=
oc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_helper_proces=
s_list();<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oom_adjust_for_doom=
();<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* not a great subs=
titution for oom_adjust_for_doom() */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise(SIGTERM);<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
diff --git a/lib/igt_core.h b/lib/igt_core.h<br>
index aa98e8ed..7869f722 100644<br>
--- a/lib/igt_core.h<br>
+++ b/lib/igt_core.h<br>
@@ -31,7 +31,9 @@<br>
=C2=A0#define IGT_CORE_H<br>
<br>
=C2=A0#include &lt;assert.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;byteswap.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;setjmp.h&gt;<br>
=C2=A0#include &lt;stdbool.h&gt;<br>
=C2=A0#include &lt;stdint.h&gt;<br>
@@ -47,6 +49,10 @@<br>
=C2=A0#define IGT_LOG_DOMAIN (NULL)<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;signal.h&gt;<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp_buf sigjmp_buf<br>
+#endif<br>
<br>
=C2=A0#ifndef STATIC_ANALYSIS_BUILD<br>
=C2=A0#if defined(__clang_analyzer__) || defined(__COVERITY__) || defined(_=
_KLOCWORK__)<br>
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c<br>
index a56688a5..b7e37851 100644<br>
--- a/lib/igt_debugfs.c<br>
+++ b/lib/igt_debugfs.c<br>
@@ -25,7 +25,9 @@<br>
=C2=A0#include &lt;inttypes.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;sys/mount.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/sysmacros.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;dirent.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
@@ -43,6 +45,10 @@<br>
=C2=A0#include &quot;igt_debugfs.h&quot;<br>
=C2=A0#include &quot;igt_sysfs.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount(src, dest, fstype, flags, data)=
=C2=A0 =C2=A0mount(fstype, dest, flags, data)<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:igt_debugfs<br>
=C2=A0 * @short_description: Support code for debugfs features<br>
diff --git a/lib/igt_device.c b/lib/igt_device.c<br>
index fddfba72..49b77122 100644<br>
--- a/lib/igt_device.c<br>
+++ b/lib/igt_device.c<br>
@@ -25,7 +25,9 @@<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/sysmacros.h&gt;<br>
+#endif<br>
=C2=A0#include &quot;igt.h&quot;<br>
=C2=A0#include &quot;igt_device.h&quot;<br>
=C2=A0#include &quot;igt_sysfs.h&quot;<br>
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c<br>
index eb6b45b8..6a921d52 100644<br>
--- a/lib/igt_device_scan.c<br>
+++ b/lib/igt_device_scan.c<br>
@@ -32,7 +32,11 @@<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;glib.h&gt;<br>
=C2=A0#include &lt;libudev.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/limits.h&gt;<br>
+#elif defined(__FreeBSD__)<br>
+#include &lt;limits.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;sys/time.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
diff --git a/lib/igt_eld.c b/lib/igt_eld.c<br>
index ef6625df..e05ad6de 100644<br>
--- a/lib/igt_eld.c<br>
+++ b/lib/igt_eld.c<br>
@@ -23,6 +23,10 @@<br>
=C2=A0 * Authors: Simon Ser &lt;<a href=3D"mailto:simon.ser@intel.com" targ=
et=3D"_blank">simon.ser@intel.com</a>&gt;<br>
=C2=A0 */<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;limits.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#include &quot;config.h&quot;<br>
<br>
=C2=A0#include &lt;dirent.h&gt;<br>
diff --git a/lib/igt_frame.c b/lib/igt_frame.c<br>
index 45523a79..ab74e678 100644<br>
--- a/lib/igt_frame.c<br>
+++ b/lib/igt_frame.c<br>
@@ -24,6 +24,10 @@<br>
=C2=A0 *=C2=A0 Paul Kocialkowski &lt;<a href=3D"mailto:paul.kocialkowski@li=
nux.intel.com" target=3D"_blank">paul.kocialkowski@linux.intel.com</a>&gt;<=
br>
=C2=A0 */<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;limits.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#include &quot;config.h&quot;<br>
<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c<br>
index bcf7dfeb..12a22a95 100644<br>
--- a/lib/igt_kmod.c<br>
+++ b/lib/igt_kmod.c<br>
@@ -32,6 +32,7 @@<br>
=C2=A0#include &quot;igt_sysfs.h&quot;<br>
=C2=A0#include &quot;igt_taints.h&quot;<br>
<br>
+#ifdef __linux__<br>
=C2=A0/**<br>
=C2=A0 * SECTION:igt_kmod<br>
=C2=A0 * @short_description: Wrappers around libkmod for module loading/unl=
oading<br>
@@ -853,3 +854,120 @@ void igt_kselftests(const char *module_name,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_kselftest_fini(&amp;tst);<br>
=C2=A0}<br>
+#elif defined(__FreeBSD__)<br>
+struct kmod_module {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size;<br>
+};<br>
+<br>
+bool<br>
+igt_kmod_is_loaded(const char *mod_name)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+}<br>
+<br>
+void<br>
+igt_kmod_list_loaded(void)<br>
+{<br>
+}<br>
+<br>
+bool<br>
+igt_kmod_has_param(const char *mod_name, const char *param)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+}<br>
+<br>
+int<br>
+igt_kmod_load(const char *mod_name, const char *opts)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_kmod_unload(const char *mod_name, unsigned int flags)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_audio_driver_unload(char **whom)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_i915_driver_load(const char *opts)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_i915_driver_unload(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+__igt_i915_driver_unload(char **whom)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_amdgpu_driver_load(const char *opts)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_amdgpu_driver_unload(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+void<br>
+igt_kselftests(const char *module_name,<br>
+=C2=A0 =C2=A0 const char *module_options,<br>
+=C2=A0 =C2=A0 const char *result_option,<br>
+=C2=A0 =C2=A0 const char *filter)<br>
+{<br>
+}<br>
+<br>
+int<br>
+igt_kselftest_init(struct igt_kselftest *tst,<br>
+=C2=A0 =C2=A0 const char *module_name)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_kselftest_begin(struct igt_kselftest *tst)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+void<br>
+igt_kselftest_get_tests(struct kmod_module *kmod,<br>
+=C2=A0 =C2=A0 const char *filter,<br>
+=C2=A0 =C2=A0 struct igt_list_head *tests)<br>
+{<br>
+}<br>
+<br>
+int<br>
+igt_kselftest_execute(struct igt_kselftest *tst,<br>
+=C2=A0 =C2=A0 struct igt_kselftest_list *tl,<br>
+=C2=A0 =C2=A0 const char *module_options,<br>
+=C2=A0 =C2=A0 const char *result)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+void<br>
+igt_kselftest_end(struct igt_kselftest *tst)<br>
+{<br>
+}<br>
+<br>
+void<br>
+igt_kselftest_fini(struct igt_kselftest *tst)<br>
+{<br>
+}<br>
+#endif /* __linux__ */<br>
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h<br>
index f98dd29f..6596092b 100644<br>
--- a/lib/igt_kmod.h<br>
+++ b/lib/igt_kmod.h<br>
@@ -24,7 +24,9 @@<br>
=C2=A0#ifndef IGT_KMOD_H<br>
=C2=A0#define IGT_KMOD_H<br>
<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;libkmod.h&gt;<br>
+#endif<br>
<br>
=C2=A0#include &quot;igt_list.h&quot;<br>
<br>
diff --git a/lib/igt_kms.c b/lib/igt_kms.c<br>
index 1ba3bd2a..f0208c10 100644<br>
--- a/lib/igt_kms.c<br>
+++ b/lib/igt_kms.c<br>
@@ -43,6 +43,10 @@<br>
=C2=A0#include &lt;sys/kd.h&gt;<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;sys/consio.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#include &lt;libudev.h&gt;<br>
=C2=A0#include &lt;poll.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
diff --git a/lib/igt_os.c b/lib/igt_os.c<br>
index bdd5d933..ae426e3a 100644<br>
--- a/lib/igt_os.c<br>
+++ b/lib/igt_os.c<br>
@@ -44,6 +44,9 @@<br>
=C2=A0#include &lt;sys/sysinfo.h&gt;<br>
=C2=A0#elif defined(HAVE_SWAPCTL) /* Solaris */<br>
=C2=A0#include &lt;sys/swap.h&gt;<br>
+#elif defined(__FreeBSD__)<br>
+#include &lt;sys/sysctl.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
=C2=A0#endif<br>
=C2=A0#include &lt;sys/resource.h&gt;<br>
<br>
@@ -148,6 +151,15 @@ igt_get_avail_ram_mb(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 npages =3D sysconf(_SC_AVPHYS_PAGES);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D (uint64_t) pagesize * npages;<br>
+#elif defined(__FreeBSD__) /* FreeBSD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t npages, pagesize;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t npages_len =3D sizeof(npages);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t pagesize_len =3D sizeof(pagesize);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysctlbyname(&quot;vm.stats.vm.v_free_count&quo=
t;, &amp;npages, &amp;npages_len, NULL, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysctlbyname(&quot;vm.stats.vm.v_page_size&quot=
;, &amp;pagesize, &amp;pagesize_len, NULL, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D pagesize * npages;<br>
=C2=A0#else<br>
=C2=A0#error &quot;Unknown how to get available RAM for this OS&quot;<br>
=C2=A0#endif<br>
@@ -210,6 +222,13 @@ igt_get_total_swap_mb(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(buf);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D (uint64_t) pagesize * totalpages;<br=
>
+#elif defined(__FreeBSD__) /* FreeBSD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t swap_total;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t swap_total_len =3D sizeof(swap_total);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysctlbyname(&quot;vm.swap_total&quot;, &amp;sw=
ap_total, &amp;swap_total_len, NULL, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D swap_total;<br>
=C2=A0#else<br>
=C2=A0#warning &quot;Unknown how to get swap size for this OS&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
diff --git a/lib/igt_perf.c b/lib/igt_perf.c<br>
index b743859f..90edbbd0 100644<br>
--- a/lib/igt_perf.c<br>
+++ b/lib/igt_perf.c<br>
@@ -4,13 +4,16 @@<br>
=C2=A0#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/sysinfo.h&gt;<br>
=C2=A0#include &lt;sys/sysmacros.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;time.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
<br>
=C2=A0#include &quot;igt_perf.h&quot;<br>
<br>
+#ifdef __linux__<br>
=C2=A0static char *bus_address(int i915, char *path, int pathlen)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st;<br>
@@ -157,3 +160,58 @@ int igt_perf_open_group(uint64_t type, uint64_t config=
, int group)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return _perf_open(type, config, group,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_GROUP);<br>
=C2=A0}<br>
+#elif defined(__FreeBSD__)<br>
+uint64_t<br>
+igt_perf_type_id(const char *device)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_perf_open(uint64_t type, uint64_t config)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+igt_perf_open_group(uint64_t type, uint64_t config, int group)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+const char *<br>
+i915_perf_device(int i915, char *buf, int buflen)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return strerror(ENOSYS);<br>
+}<br>
+<br>
+uint64_t<br>
+i915_perf_type_id(int i915)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+perf_igfx_open(uint64_t config)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+perf_igfx_open_group(uint64_t config, int group)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+perf_i915_open(int i915, uint64_t config)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
+int<br>
+perf_i915_open_group(int i915, uint64_t config, int group)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+#endif /* __linux__ */<br>
diff --git a/lib/igt_perf.h b/lib/igt_perf.h<br>
index a8328c70..0cd91386 100644<br>
--- a/lib/igt_perf.h<br>
+++ b/lib/igt_perf.h<br>
@@ -27,10 +27,13 @@<br>
<br>
=C2=A0#include &lt;stdint.h&gt;<br>
<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/perf_event.h&gt;<br>
+#endif<br>
<br>
=C2=A0#include &quot;igt_gt.h&quot;<br>
<br>
+#ifdef __linux__<br>
=C2=A0static inline int<br>
=C2=A0perf_event_open(struct perf_event_attr *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pid_t pid,<br>
@@ -50,6 +53,7 @@ perf_event_open(struct perf_event_attr *attr,<br>
=C2=A0 =C2=A0 =C2=A0attr-&gt;size =3D sizeof(*attr);<br>
=C2=A0 =C2=A0 =C2=A0return syscall(__NR_perf_event_open, attr, pid, cpu, gr=
oup_fd, flags);<br>
=C2=A0}<br>
+#endif /* __linux__ */<br>
<br>
=C2=A0uint64_t igt_perf_type_id(const char *device);<br>
=C2=A0int igt_perf_open(uint64_t type, uint64_t config);<br>
diff --git a/lib/igt_pm.c b/lib/igt_pm.c<br>
index 99251b40..a6036e03 100644<br>
--- a/lib/igt_pm.c<br>
+++ b/lib/igt_pm.c<br>
@@ -33,7 +33,9 @@<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/sysmacros.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;dirent.h&gt;<br>
<br>
diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c<br>
index a24ed10b..eb302986 100644<br>
--- a/lib/igt_syncobj.c<br>
+++ b/lib/igt_syncobj.c<br>
@@ -27,6 +27,10 @@<br>
=C2=A0#include &quot;igt.h&quot;<br>
=C2=A0#include &quot;igt_syncobj.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:igt_syncobj<br>
=C2=A0 * @short_description: Library with syncobj helpers<br>
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c<br>
index 9c307694..a913be4c 100644<br>
--- a/lib/igt_sysfs.c<br>
+++ b/lib/igt_sysfs.c<br>
@@ -24,7 +24,9 @@<br>
<br>
=C2=A0#include &lt;inttypes.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/sysmacros.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/mount.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;stdarg.h&gt;<br>
diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c<br>
index 7f933b23..9483b896 100644<br>
--- a/lib/igt_vgem.c<br>
+++ b/lib/igt_vgem.c<br>
@@ -30,6 +30,11 @@<br>
=C2=A0#include &quot;igt_core.h&quot;<br>
=C2=A0#include &quot;ioctl_wrappers.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap64(addr, len, prot, flags, fd, offs=
et) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(addr, len, prot, flags, fd, offset)<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:igt_vgem<br>
=C2=A0 * @short_description: VGEM support library<br>
diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c<br>
index 717d7fc5..bd840f57 100644<br>
--- a/lib/intel_allocator.c<br>
+++ b/lib/intel_allocator.c<br>
@@ -17,6 +17,10 @@<br>
=C2=A0#include &quot;intel_allocator.h&quot;<br>
=C2=A0#include &quot;intel_allocator_msgchannel.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 get=
pid()<br>
+#endif<br>
+<br>
=C2=A0//#define ALLOCDBG<br>
=C2=A0#ifdef ALLOCDBG<br>
=C2=A0#define alloc_info igt_info<br>
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c<br>
index ef1b5947..8004c09e 100644<br>
--- a/lib/intel_batchbuffer.c<br>
+++ b/lib/intel_batchbuffer.c<br>
@@ -60,6 +60,11 @@<br>
=C2=A0#define BCS_SRC_Y (1 &lt;&lt; 0)<br>
=C2=A0#define BCS_DST_Y (1 &lt;&lt; 1)<br>
<br>
+#ifdef __FreeBSD__<br>
+/* memory leak */<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 tdestroy(root, free_node)<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:intel_batchbuffer<br>
=C2=A0 * @short_description: Batchbuffer and blitter support<br>
diff --git a/lib/sw_sync.c b/lib/sw_sync.c<br>
index 6c762c8b..e5a73ffa 100644<br>
--- a/lib/sw_sync.c<br>
+++ b/lib/sw_sync.c<br>
@@ -41,6 +41,10 @@<br>
=C2=A0#include &quot;drmtest.h&quot;<br>
=C2=A0#include &quot;ioctl_wrappers.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0/**<br>
=C2=A0 * SECTION:sw_sync<br>
=C2=A0 * @short_description: Software sync (fencing) support library<br>
diff --git a/lib/tests/igt_exit_handler.c b/lib/tests/igt_exit_handler.c<br=
>
index 892a7f14..d2381944 100644<br>
--- a/lib/tests/igt_exit_handler.c<br>
+++ b/lib/tests/igt_exit_handler.c<br>
@@ -125,5 +125,9 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 internal_assert_wexited(status, IGT_EXIT_SKIP);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D testfunc(SIG);<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 internal_assert_wsignaled(status, SIGTERM);<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0internal_assert(status =3D=3D 0);<br>
+#endif<br>
=C2=A0}<br>
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c<br>
index d19d0945..4a2d50d4 100644<br>
--- a/lib/tests/igt_fork.c<br>
+++ b/lib/tests/igt_fork.c<br>
@@ -109,7 +109,11 @@ __noreturn static void igt_fork_timeout_leak(void)<br>
=C2=A0__noreturn static void subtest_leak(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid_t *children =3D<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap(0, 4096, PROT_=
WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(0, 4096, PROT_=
WRITE | PROT_READ, MAP_SHARED | MAP_ANON, -1, 0);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int num_children =3D 4096 / sizeof(*child=
ren);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_subtest_init(fake_argc, fake_argv);<br>
diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h<br=
>
index 058f6265..e8183897 100644<br>
--- a/lib/tests/igt_tests_common.h<br>
+++ b/lib/tests/igt_tests_common.h<br>
@@ -48,8 +48,17 @@ static inline void internal_assert_wexited(int wstatus, =
int exitcode)<br>
<br>
=C2=A0static inline void internal_assert_wsignaled(int wstatus, int signal)=
<br>
=C2=A0{<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 internal_assert(WIFSIGNALED(wstatus) &amp;&amp;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 WTERMSIG(wstatus) =3D=3D signal);<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (WIFSIGNALED(wstatus))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_assert(WTE=
RMSIG(wstatus) =3D=3D signal);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (WIFEXITED(wstatus))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_assert(WEX=
ITSTATUS(wstatus) =3D=3D signal + 128);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_assert(0);=
<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static inline void internal_assert_not_wsignaled(int wstatus)<br>
diff --git a/runner/executor.c b/runner/executor.c<br>
index 964d0063..65e3d2ba 100644<br>
--- a/runner/executor.c<br>
+++ b/runner/executor.c<br>
@@ -2,7 +2,9 @@<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;glib.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/watchdog.h&gt;<br>
+#endif<br>
=C2=A0#if HAVE_OPING<br>
=C2=A0#include &lt;oping.h&gt;<br>
=C2=A0#endif<br>
@@ -14,7 +16,9 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &lt;sys/select.h&gt;<br>
=C2=A0#include &lt;sys/poll.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/signalfd.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;sys/time.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
@@ -33,6 +37,16 @@<br>
=C2=A0#define KMSG_HEADER &quot;[IGT] &quot;<br>
=C2=A0#define KMSG_WARN 4<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;sys/watchdog.h&gt;<br>
+struct signalfd_siginfo {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ssi_signo;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ssi_pid;<br>
+};<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 WDIOC_KEEPALIVE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WDIOCPATPAT<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 signalfd(fd, mask, flags)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0-ENOSYS<br>
+#endif<br>
+<br>
=C2=A0static struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int *fds;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t num_dogs;<br>
diff --git a/tests/core_auth.c b/tests/core_auth.c<br>
index c9ad3fb9..fdd46e92 100644<br>
--- a/tests/core_auth.c<br>
+++ b/tests/core_auth.c<br>
@@ -48,6 +48,10 @@<br>
=C2=A0# include &lt;pthread.h&gt;<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_self()=C2=A0 getpid()<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Call drmGetMagic() and drmAuthMagic() and =
see if it behaves.&quot;);<br>
<br>
=C2=A0static bool<br>
diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c<br>
index 06245e8b..448d2d70 100644<br>
--- a/tests/drm_import_export.c<br>
+++ b/tests/drm_import_export.c<br>
@@ -45,6 +45,10 @@<br>
=C2=A0#define DURATION 10<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Basic check to verify the behaviour of lib=
drm bo for prime/flink&quot;);<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 get=
pid()<br>
+#endif<br>
+<br>
=C2=A0int fd;<br>
=C2=A0drm_intel_bufmgr *bufmgr;<br>
=C2=A0int fd1;<br>
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c<br>
index 2c6261bd..e5278a90 100644<br>
--- a/tests/dumb_buffer.c<br>
+++ b/tests/dumb_buffer.c<br>
@@ -50,6 +50,11 @@<br>
=C2=A0#include &quot;igt_aux.h&quot;<br>
=C2=A0#include &quot;ioctl_wrappers.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#undef jmp_buf<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 sighandler_t=C2=A0 =C2=A0 sig_t<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;This is a test for the generic dumb buffer=
 interface.&quot;);<br>
<br>
=C2=A0static int __dumb_create(int fd, struct drm_mode_create_dumb *create)=
<br>
diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c<br>
index 938fde8f..0b7378b2 100644<br>
--- a/tests/i915/gem_close_race.c<br>
+++ b/tests/i915/gem_close_race.c<br>
@@ -53,6 +53,10 @@<br>
=C2=A0#define BLT_WRITE_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1&lt;&lt;21)<br>
=C2=A0#define BLT_WRITE_RGB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1&lt;&lt;20)=
<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 getpid()<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Test try to race gem_close against workloa=
d submission.&quot;);<br>
<br>
=C2=A0static uint32_t devid;<br>
@@ -61,7 +65,9 @@ static bool has_softpin;<br>
=C2=A0static uint64_t exec_addr;<br>
=C2=A0static uint64_t data_addr;<br>
<br>
+#ifdef __linux__<br>
=C2=A0#define sigev_notify_thread_id _sigev_un._tid<br>
+#endif<br>
<br>
=C2=A0static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops=
)<br>
=C2=A0{<br>
diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_al=
l.c<br>
index 25b7daf8..e965dadb 100644<br>
--- a/tests/i915/gem_concurrent_all.c<br>
+++ b/tests/i915/gem_concurrent_all.c<br>
@@ -53,6 +53,11 @@<br>
=C2=A0#include &quot;igt.h&quot;<br>
=C2=A0#include &quot;igt_vgem.h&quot;<br>
<br>
+/* improper substitution */<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 MADV_DONTFORK=C2=A0 =C2=A0MADV_NOSYNC<b=
r>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Test of pread/pwrite/mmap behavior when wr=
iting to active&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot; buffers.&quot;);<br>
<br>
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c<br>
index d7d2a017..18d9324e 100644<br>
--- a/tests/i915/gem_create.c<br>
+++ b/tests/i915/gem_create.c<br>
@@ -61,6 +61,10 @@<br>
=C2=A0#include &quot;i915/gem_mman.h&quot;<br>
=C2=A0#include &quot;i915_drm.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 sighandler_t=C2=A0 =C2=A0 sig_t<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Ensure that basic gem_create and gem_creat=
e_ext works&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot; and that invalid input combinations are rejected.&quot;);<br>
<br>
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c<br>
index 3d94f01d..3cc7a87c 100644<br>
--- a/tests/i915/gem_ctx_exec.c<br>
+++ b/tests/i915/gem_ctx_exec.c<br>
@@ -48,6 +48,10 @@<br>
=C2=A0#include &quot;igt_sysfs.h&quot;<br>
=C2=A0#include &quot;sw_sync.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Test context batch buffer execution.&quot;=
);<br>
<br>
=C2=A0/* Copied from gem_exec_nop.c */<br>
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persiste=
nce.c<br>
index 50196edb..afda4675 100644<br>
--- a/tests/i915/gem_ctx_persistence.c<br>
+++ b/tests/i915/gem_ctx_persistence.c<br>
@@ -50,6 +50,10 @@<br>
=C2=A0static unsigned long reset_timeout_ms =3D RESET_TIMEOUT_MS;<br>
=C2=A0#define NSEC_PER_MSEC (1000 * 1000ull)<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0static void cleanup(int i915)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_drop_caches_set(i915,<br>
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c<br>
index eb3b024f..fe1c788b 100644<br>
--- a/tests/i915/gem_ctx_shared.c<br>
+++ b/tests/i915/gem_ctx_shared.c<br>
@@ -54,6 +54,10 @@<br>
=C2=A0#define MAX_PRIO I915_CONTEXT_MAX_USER_PRIORITY<br>
=C2=A0#define MIN_PRIO I915_CONTEXT_MIN_USER_PRIORITY<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0static int priorities[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [LO] =3D MIN_PRIO / 2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [HI] =3D MAX_PRIO / 2,<br>
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c<br>
index f24bebdb..50b14c87 100644<br>
--- a/tests/i915/gem_exec_fence.c<br>
+++ b/tests/i915/gem_exec_fence.c<br>
@@ -36,6 +36,10 @@<br>
=C2=A0#include &quot;intel_ctx.h&quot;<br>
=C2=A0#include &quot;sw_sync.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Check that execbuf waits for explicit fenc=
es&quot;);<br>
<br>
=C2=A0#ifndef SYNC_IOC_MERGE<br>
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c<=
br>
index fcdf7787..dad9ea27 100644<br>
--- a/tests/i915/gem_exec_latency.c<br>
+++ b/tests/i915/gem_exec_latency.c<br>
@@ -55,6 +55,10 @@<br>
=C2=A0#define CORK 0x2<br>
=C2=A0#define PREEMPT 0x4<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 SCHED_RESET_ON_FORK=C2=A0 =C2=A0 =C2=A0=
0<br>
+#endif<br>
+<br>
=C2=A0static unsigned int ring_size;<br>
=C2=A0static double rcs_clock;<br>
=C2=A0static struct intel_mmio_data mmio_data;<br>
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.=
c<br>
index cccdb319..34ca455f 100644<br>
--- a/tests/i915/gem_lmem_swapping.c<br>
+++ b/tests/i915/gem_lmem_swapping.c<br>
@@ -25,6 +25,10 @@<br>
=C2=A0#include &quot;i915/i915_blt.h&quot;<br>
=C2=A0#include &quot;i915/intel_mocs.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_POPULATE=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_PREFAULT_READ<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Exercise local memory swapping.&quot;);<br=
>
<br>
=C2=A0#define __round_mask(x, y) ((__typeof__(x))((y) - 1))<br>
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c<br>
index 2502d84c..4c6cdbc4 100644<br>
--- a/tests/i915/gem_madvise.c<br>
+++ b/tests/i915/gem_madvise.c<br>
@@ -39,6 +39,10 @@<br>
=C2=A0#include &quot;drm.h&quot;<br>
=C2=A0#include &quot;i915/gem_create.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 sighandler_t=C2=A0 =C2=A0 sig_t<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Checks that the kernel reports EFAULT when=
 trying to use&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot; purged bo.&quot;);<br>
<br>
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c<br>
index e39b9047..8daa6248 100644<br>
--- a/tests/i915/gem_mmap_gtt.c<br>
+++ b/tests/i915/gem_mmap_gtt.c<br>
@@ -54,6 +54,16 @@<br>
<br>
=C2=A0#define abs(x) ((x) &gt;=3D 0 ? (x) : -(x))<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap64(addr, len, prot, flags, fd, offs=
et) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(addr, len, prot, flags, fd, offset)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_TRACEME=C2=A0 PT_TRACE_ME<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_ATTACH=C2=A0 =C2=A0PT_ATTACH<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_PEEKDATA PT_READ_D<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_POKEDATA PT_WRITE_D<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_DETACH=C2=A0 =C2=A0PT_DETACH<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Ensure that all operations around MMAP_GTT=
 ioctl works.&quot;);<br>
<br>
=C2=A0static int OBJECT_SIZE =3D 16*1024*1024;<br>
@@ -566,7 +576,11 @@ test_ptrace(int fd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; sz / sizeof(long); i++=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long ret;<br>
<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptrace(PTRA=
CE_PEEKDATA, pid, gtt + i);<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ptrace(PTRA=
CE_PEEKDATA, pid, gtt + i, 0);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert_eq_u64(r=
et, CC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpy[i] =3D ret;<br>
<br>
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c<br=
>
index 5e6b19eb..21bcdddd 100644<br>
--- a/tests/i915/gem_mmap_offset.c<br>
+++ b/tests/i915/gem_mmap_offset.c<br>
@@ -38,6 +38,16 @@<br>
=C2=A0#include &quot;igt.h&quot;<br>
=C2=A0#include &quot;igt_x86.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap64(addr, len, prot, flags, fd, offs=
et) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(addr, len, prot, flags, fd, offset)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_TRACEME=C2=A0 PT_TRACE_ME<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_ATTACH=C2=A0 =C2=A0PT_ATTACH<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_PEEKDATA PT_READ_D<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_POKEDATA PT_WRITE_D<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTRACE_DETACH=C2=A0 =C2=A0PT_DETACH<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Basic MMAP_OFFSET IOCTL tests for mem regi=
ons\n&quot;);<br>
<br>
=C2=A0static int mmap_offset_ioctl(int i915, struct drm_i915_gem_mmap_offse=
t *arg)<br>
@@ -370,7 +380,11 @@ static void test_ptrace(int i915)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for (int i =3D 0; i &lt; SZ / sizeof(long); i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long ret;<br>
<br>
+#ifdef __linux__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptrace(PTRACE_PEEKDATA, pid,=
 ptr + i);<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ptrace(PTRACE_PEEKDATA, pid, =
ptr + i, 0);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert_eq_u64(ret, CC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpy[i] =3D ret;<br>
<br>
diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c<br>
index 49df35c2..e9dd49cf 100644<br>
--- a/tests/i915/gem_shrink.c<br>
+++ b/tests/i915/gem_shrink.c<br>
@@ -38,6 +38,10 @@<br>
=C2=A0#define MADV_FREE 8<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_POPULATE=C2=A0 =C2=A0 MAP_PREFAULT_=
READ<br>
+#endif<br>
+<br>
=C2=A0static void get_pages(int fd, uint64_t alloc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle =3D gem_create(fd, alloc);<br>
diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c<br>
index 230304aa..9655fb09 100644<br>
--- a/tests/i915/gem_wait.c<br>
+++ b/tests/i915/gem_wait.c<br>
@@ -32,6 +32,10 @@<br>
=C2=A0#include &quot;igt.h&quot;<br>
=C2=A0#include &quot;igt_vgem.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Tests the GEM_WAIT ioctl&quot;);<br>
<br>
=C2=A0static int __gem_wait(int fd, struct drm_i915_gem_wait *w)<br>
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c<br>
index c7d69fdd..c0bde6be 100644<br>
--- a/tests/i915/i915_hangman.c<br>
+++ b/tests/i915/i915_hangman.c<br>
@@ -50,6 +50,10 @@ static int sysfs =3D -1;<br>
<br>
=C2=A0#define OFFSET_ALIVE=C2=A0 =C2=A010<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Tests for hang detection and recovery&quot=
;);<br>
<br>
=C2=A0static void check_alive(void)<br>
diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c<=
br>
index 4c72157c..9bec4c18 100644<br>
--- a/tests/i915/i915_module_load.c<br>
+++ b/tests/i915/i915_module_load.c<br>
@@ -23,7 +23,9 @@<br>
=C2=A0#include &quot;igt.h&quot;<br>
=C2=A0#include &lt;dirent.h&gt;<br>
=C2=A0#include &lt;sys/utsname.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/limits.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;signal.h&gt;<br>
=C2=A0#include &lt;libgen.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.=
c<br>
index cafae7f7..c520cf20 100644<br>
--- a/tests/i915/i915_pm_backlight.c<br>
+++ b/tests/i915/i915_pm_backlight.c<br>
@@ -46,6 +46,10 @@ struct context {<br>
=C2=A0#define FADESTEPS 10<br>
=C2=A0#define FADESPEED 100 /* milliseconds between steps */<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;libgen.h&gt;<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Basic backlight sysfs test&quot;);<br>
<br>
=C2=A0static int backlight_read(int *result, const char *fname)<br>
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c<br>
index e95875dc..6a30ecf6 100644<br>
--- a/tests/i915/i915_pm_rpm.c<br>
+++ b/tests/i915/i915_pm_rpm.c<br>
@@ -40,8 +40,10 @@<br>
=C2=A0#include &lt;sys/mman.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/i2c.h&gt;<br>
=C2=A0#include &lt;linux/i2c-dev.h&gt;<br>
+#endif<br>
<br>
=C2=A0#include &lt;drm.h&gt;<br>
<br>
@@ -54,6 +56,17 @@<br>
=C2=A0#include &quot;igt_device.h&quot;<br>
=C2=A0#include &quot;igt_edid.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;limits.h&gt;<br>
+#include &lt;dev/iicbus/iic.h&gt;<br>
+<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C_RDWR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 I2CRDWR<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C_M_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 IIC_M_RD<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c_msg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iic_msg<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c_rdwr_ioctl_data=C2=A0 =C2=A0 =C2=A0=
iic_rdwr_data<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slave<br>
+#endif<br>
+<br>
=C2=A0#define MSR_PC8_RES=C2=A0 =C2=A0 0x630<br>
=C2=A0#define MSR_PC9_RES=C2=A0 =C2=A0 0x631<br>
=C2=A0#define MSR_PC10_RES=C2=A0 =C2=A00x632<br>
diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heart=
beat_interval.c<br>
index 8cebf627..cb1f37f8 100644<br>
--- a/tests/i915/sysfs_heartbeat_interval.c<br>
+++ b/tests/i915/sysfs_heartbeat_interval.c<br>
@@ -42,6 +42,10 @@<br>
=C2=A0#include &quot;igt_sysfs.h&quot;<br>
=C2=A0#include &quot;sw_sync.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 sighandler_t=C2=A0 =C2=A0 sig_t<br>
+#endif<br>
+<br>
=C2=A0#define ATTR &quot;heartbeat_interval_ms&quot;<br>
=C2=A0#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kwo=
rker */<br>
<br>
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c<br>
index 3041f1cd..e0e5af78 100644<br>
--- a/tests/kms_content_protection.c<br>
+++ b/tests/kms_content_protection.c<br>
@@ -24,7 +24,9 @@<br>
<br>
=C2=A0#include &lt;poll.h&gt;<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;sys/epoll.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;libudev.h&gt;<br>
=C2=A0#include &quot;igt.h&quot;<br>
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c<br>
index 1b697667..67a470b6 100644<br>
--- a/tests/kms_cursor_legacy.c<br>
+++ b/tests/kms_cursor_legacy.c<br>
@@ -47,6 +47,10 @@<br>
<br>
=C2=A0#define PAGE_SIZE=C2=A0 =C2=A0 =C2=A0 4096<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 SCHED_IDLE=C2=A0 =C2=A0 =C2=A0 SCHED_OT=
HER<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Stress legacy cursor ioctl&quot;);<br>
<br>
=C2=A0igt_pipe_crc_t *pipe_crc;<br>
diff --git a/tests/kms_flip.c b/tests/kms_flip.c<br>
index 0567edea..1127e418 100755<br>
--- a/tests/kms_flip.c<br>
+++ b/tests/kms_flip.c<br>
@@ -45,6 +45,10 @@<br>
=C2=A0#include &quot;i915/gem_create.h&quot;<br>
=C2=A0#include &quot;igt_stats.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;sys/consio.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#define TEST_DPMS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 0)<br>
<br>
=C2=A0#define TEST_PAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1 &lt;&lt; 3)<br>
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c<=
br>
index 77521108..cd980c6a 100644<br>
--- a/tests/kms_sysfs_edid_timing.c<br>
+++ b/tests/kms_sysfs_edid_timing.c<br>
@@ -26,6 +26,10 @@<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;limits.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#define THRESHOLD_PER_CONNECTOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 150<br>
=C2=A0#define THRESHOLD_PER_CONNECTOR_MEAN=C2=A0 =C2=A0140<br>
=C2=A0#define THRESHOLD_ALL_CONNECTORS_MEAN=C2=A0 100<br>
diff --git a/tests/sw_sync.c b/tests/sw_sync.c<br>
index cbd773fc..1290a284 100644<br>
--- a/tests/sw_sync.c<br>
+++ b/tests/sw_sync.c<br>
@@ -38,6 +38,9 @@<br>
<br>
=C2=A0#include &quot;sw_sync.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Test SW Sync Framework&quot;);<br>
<br>
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c<br>
index 20375cdd..795fd3fb 100644<br>
--- a/tests/syncobj_timeline.c<br>
+++ b/tests/syncobj_timeline.c<br>
@@ -31,6 +31,10 @@<br>
=C2=A0#include &lt;signal.h&gt;<br>
=C2=A0#include &quot;drm.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Tests for the drm timeline sync object API=
&quot;);<br>
<br>
=C2=A0/* One tenth of a second */<br>
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c<br>
index 669d0adf..4f31fb76 100644<br>
--- a/tests/syncobj_wait.c<br>
+++ b/tests/syncobj_wait.c<br>
@@ -31,6 +31,10 @@<br>
=C2=A0#include &lt;signal.h&gt;<br>
=C2=A0#include &quot;drm.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Tests for the drm sync object wait API&quo=
t;);<br>
<br>
=C2=A0/* One tenth of a second */<br>
diff --git a/tests/tools_test.c b/tests/tools_test.c<br>
index 237f0433..6652927a 100644<br>
--- a/tests/tools_test.c<br>
+++ b/tests/tools_test.c<br>
@@ -28,7 +28,12 @@<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;libgen.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
+#ifdef __linux__<br>
=C2=A0#include &lt;linux/limits.h&gt;<br>
+#elif defined(__FreeBSD__)<br>
+#include &lt;limits.h&gt;<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_current_dir_name()=C2=A0 getwd(NULL=
)<br>
+#endif<br>
<br>
=C2=A0#define TOOLS &quot;../tools/&quot;<br>
<br>
diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4_purgeable_bo.c<br>
index d9f7547f..5aa734b4 100644<br>
--- a/tests/vc4_purgeable_bo.c<br>
+++ b/tests/vc4_purgeable_bo.c<br>
@@ -35,6 +35,10 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &quot;vc4_drm.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#undef jmp_buf<br>
+#endif<br>
+<br>
=C2=A0struct igt_vc4_bo {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct igt_list_head node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int handle;<br>
diff --git a/tests/vc4_wait_bo.c b/tests/vc4_wait_bo.c<br>
index 65a085a3..2c3c9da8 100644<br>
--- a/tests/vc4_wait_bo.c<br>
+++ b/tests/vc4_wait_bo.c<br>
@@ -34,6 +34,10 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &quot;vc4_drm.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0static void<br>
=C2=A0test_used_bo(int fd, uint64_t timeout)<br>
=C2=A0{<br>
diff --git a/tests/vc4_wait_seqno.c b/tests/vc4_wait_seqno.c<br>
index bcc263cb..c04c8d78 100644<br>
--- a/tests/vc4_wait_seqno.c<br>
+++ b/tests/vc4_wait_seqno.c<br>
@@ -33,6 +33,10 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &quot;vc4_drm.h&quot;<br>
<br>
+#ifdef __FreeBSD__<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
+#endif<br>
+<br>
=C2=A0igt_main<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c<br>
index ad5ee6a6..2f0c94f0 100644<br>
--- a/tools/intel_gvtg_test.c<br>
+++ b/tools/intel_gvtg_test.c<br>
@@ -44,6 +44,9 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
+#ifdef __FreeBSD__<br>
+#include &lt;sys/wait.h&gt;<br>
+#endif<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div>

--0000000000006ae1c005e7b2da4a--
