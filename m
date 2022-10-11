Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ACC10E363
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 07:35:45 +0000 (UTC)
Date: Tue, 11 Oct 2022 10:35:25 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <Y0UcvT9AfBX5Axdh@platvala-desk.ger.corp.intel.com>
References: <20221007232757.3210308-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007232757.3210308-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t v1 0/6] Introduce FreeBSD support
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

On Fri, Oct 07, 2022 at 06:27:51PM -0500, Jake Freeland wrote:
> FreeBSD's LinuxKPI compatibility layer allows for Linux drm
> drivers to function on FreeBSD systems. Unfortunately,
> LinuxKPI comes with its own set of issues that need testing.
> This patch includes an igt_freebsd header and many small
> modifications to get igt-gpu-tools compiling on FreeBSD.
> 
> Jake Freeland (6):
>   lib/igt_freebsd.h: Create FreeBSD compatibility header
>   Ifdef out linux-specific headers
>   Include <sys/syscall.h> for FreeBSD systems
>   lib/igt_os.c: Add FreeBSD system info collection
>   tests/i915/i915_pm_rpm.c: Add FreeBSD I/O iic header
>   Include igt_freebsd.h in gem benchmarks
> 
>  benchmarks/gem_exec_tracer.c   |   4 ++
>  benchmarks/gem_syslatency.c    |   6 ++
>  lib/i915/intel_memory_region.c |   2 +
>  lib/i915/perf.c                |   2 +
>  lib/igt_aux.h                  |   2 +-
>  lib/igt_core.c                 |   2 +-
>  lib/igt_core.h                 |   6 ++
>  lib/igt_debugfs.c              |   2 +
>  lib/igt_device.c               |   2 +
>  lib/igt_device_scan.c          |   2 +
>  lib/igt_freebsd.h              | 118 +++++++++++++++++++++++++++++++++
>  lib/igt_os.c                   |  18 +++++
>  lib/igt_perf.c                 |   2 +
>  lib/igt_perf.h                 |   2 +
>  lib/igt_pm.c                   |   2 +
>  lib/igt_sysfs.c                |   2 +
>  runner/executor.c              |   2 +
>  runner/job_list.c              |   2 +
>  tests/i915/i915_module_load.c  |   2 +
>  tests/i915/i915_pm_rpm.c       |   5 ++
>  tests/tools_test.c             |   2 +
>  21 files changed, 185 insertions(+), 2 deletions(-)
>  create mode 100644 lib/igt_freebsd.h
> 
> -- 
> 2.37.3
> 


I'm unable to assess whether the modifications are correct on FreeBSD,
but this looks correct and doesn't affect anything on Linux. Series is

Acked-by: Petri Latvala <petri.latvala@intel.com>
