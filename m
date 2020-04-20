Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186D76E51C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 12:17:53 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id kb16so4505609pjb.1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 05:17:53 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Apr 2020 15:17:39 +0300
Message-Id: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/8] Use device dependant module parameters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Rebased and fixed Jani's work. Some patches changed in ways I put my
own S-b in place. These changes match to my kernel where there is path
/sys/kernel/debug/dri/<device>/i915_params/

/Juha-Pekka

Jani Nikula (8):
  lib/params: add igt_params.c for module parameter access
  lib/params: start renaming functions igt_params_*
  lib/params: overhaul param saving
  params open with path return
  igt/params: add generic saving module parameter set
  igt/params: use igt_params_set_save for igt_set_module_param*
  lib/debugfs: use regular module param functions for
    prefault_disable
  tests/gem_eio: switch to using igt_params_set()

 benchmarks/gem_exec_reloc.c           |   2 +-
 lib/Makefile.sources                  |   2 +
 lib/drmtest.c                         |   2 +-
 lib/i915/gem_submission.c             |   3 +-
 lib/igt.h                             |   1 +
 lib/igt_aux.c                         | 146 +-----------
 lib/igt_aux.h                         |   3 -
 lib/igt_gt.c                          |   3 +-
 lib/igt_params.c                      | 326 ++++++++++++++++++++++++++
 lib/igt_params.h                      |  47 ++++
 lib/igt_psr.c                         |   1 +
 lib/igt_sysfs.c                       |  68 ------
 lib/igt_sysfs.h                       |   5 -
 lib/meson.build                       |   1 +
 tests/i915/gem_ctx_exec.c             |   2 +-
 tests/i915/gem_ctx_persistence.c      |  10 +-
 tests/i915/gem_eio.c                  |  57 ++---
 tests/i915/gem_mmap_gtt.c             |   2 +-
 tests/i915/gem_reset_stats.c          |   6 +-
 tests/i915/sysfs_heartbeat_interval.c |   3 +-
 tests/i915/sysfs_preempt_timeout.c    |   3 +-
 tests/i915/sysfs_timeslice_duration.c |   3 +-
 22 files changed, 425 insertions(+), 271 deletions(-)
 create mode 100644 lib/igt_params.c
 create mode 100644 lib/igt_params.h

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
