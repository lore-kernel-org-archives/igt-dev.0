Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51C788F1E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 16:17:30 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u10so11566022lfo.8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 09:17:30 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 21 Apr 2020 19:17:17 +0300
Message-Id: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 0/8] Use device dependant module parameters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Rebased and fixed Jani's work. Patches which didn't change I did maintain
Jani's authorship. These changes match to my kernel where there is path
/sys/kernel/debug/dri/<device>/i915_params/

Special part is the search of 'default device' in patch
'use igt_params_set_save for igt_set_module_param*'. Don't know if it is 
the most obvious way nor do I know will this work on non-Intel driver.

Patch #4 Jani had not added S-o-b, will be added if Jani comment.

/Juha-Pekka

Jani Nikula (5):
  lib/params: add igt_params.c for module parameter access
  lib/params: overhaul param saving
  params open with path return
  igt/params: add generic saving module parameter set
  lib/debugfs: use regular module param functions for prefault_disable

Juha-Pekka Heikkila (3):
  lib/params: start renaming functions igt_params_*
  igt/params: use igt_params_set_save for igt_set_module_param*
  tests/gem_eio: switch to using igt_params_set()

 benchmarks/gem_exec_reloc.c           |   2 +-
 lib/Makefile.sources                  |   2 +
 lib/drmtest.c                         |   2 +-
 lib/i915/gem_submission.c             |   3 +-
 lib/igt.h                             |   1 +
 lib/igt_aux.c                         | 146 +----------
 lib/igt_aux.h                         |   3 -
 lib/igt_gt.c                          |   3 +-
 lib/igt_params.c                      | 359 ++++++++++++++++++++++++++
 lib/igt_params.h                      |  47 ++++
 lib/igt_psr.c                         |   1 +
 lib/igt_sysfs.c                       |  68 -----
 lib/igt_sysfs.h                       |   5 -
 lib/meson.build                       |   1 +
 tests/i915/gem_ctx_exec.c             |   2 +-
 tests/i915/gem_ctx_persistence.c      |  10 +-
 tests/i915/gem_eio.c                  |  57 ++--
 tests/i915/gem_mmap_gtt.c             |   2 +-
 tests/i915/gem_reset_stats.c          |   6 +-
 tests/i915/sysfs_heartbeat_interval.c |   3 +-
 tests/i915/sysfs_preempt_timeout.c    |   3 +-
 tests/i915/sysfs_timeslice_duration.c |   3 +-
 22 files changed, 458 insertions(+), 271 deletions(-)
 create mode 100644 lib/igt_params.c
 create mode 100644 lib/igt_params.h

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
