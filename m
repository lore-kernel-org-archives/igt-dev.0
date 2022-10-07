Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CE310E138
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 23:28:10 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y4so173870iof.3
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 16:28:10 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 18:27:51 -0500
Message-Id: <20221007232757.3210308-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 0/6] Introduce FreeBSD support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

FreeBSD's LinuxKPI compatibility layer allows for Linux drm
drivers to function on FreeBSD systems. Unfortunately,
LinuxKPI comes with its own set of issues that need testing.
This patch includes an igt_freebsd header and many small
modifications to get igt-gpu-tools compiling on FreeBSD.

Jake Freeland (6):
  lib/igt_freebsd.h: Create FreeBSD compatibility header
  Ifdef out linux-specific headers
  Include <sys/syscall.h> for FreeBSD systems
  lib/igt_os.c: Add FreeBSD system info collection
  tests/i915/i915_pm_rpm.c: Add FreeBSD I/O iic header
  Include igt_freebsd.h in gem benchmarks

 benchmarks/gem_exec_tracer.c   |   4 ++
 benchmarks/gem_syslatency.c    |   6 ++
 lib/i915/intel_memory_region.c |   2 +
 lib/i915/perf.c                |   2 +
 lib/igt_aux.h                  |   2 +-
 lib/igt_core.c                 |   2 +-
 lib/igt_core.h                 |   6 ++
 lib/igt_debugfs.c              |   2 +
 lib/igt_device.c               |   2 +
 lib/igt_device_scan.c          |   2 +
 lib/igt_freebsd.h              | 118 +++++++++++++++++++++++++++++++++
 lib/igt_os.c                   |  18 +++++
 lib/igt_perf.c                 |   2 +
 lib/igt_perf.h                 |   2 +
 lib/igt_pm.c                   |   2 +
 lib/igt_sysfs.c                |   2 +
 runner/executor.c              |   2 +
 runner/job_list.c              |   2 +
 tests/i915/i915_module_load.c  |   2 +
 tests/i915/i915_pm_rpm.c       |   5 ++
 tests/tools_test.c             |   2 +
 21 files changed, 185 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_freebsd.h

-- 
2.37.3
