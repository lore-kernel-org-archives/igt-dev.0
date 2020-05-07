Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047EE6EA5B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 19:09:58 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d184so3470619pfd.4
 for <igt-dev@lists.freedesktop.org>; Thu, 07 May 2020 12:09:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu,  7 May 2020 22:09:37 +0300
Message-Id: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] Use device dependant module parameters
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

Rebased and fixed Jani's work. Patches which didn't change I did maintain
Jani's authorship. These changes match to my kernel where there is path
/sys/kernel/debug/dri/<device>/i915_params/

Special part is the search of 'default device' in patch
'use igt_params_set_save for igt_set_module_param*'. Don't know if it is 
the most obvious way nor do I know will this work on non-Intel driver.

Patch #4 Jani had not added S-o-b, will be added if Jani comment.

Fixed (commenting)issues pointed by Petri and Arkadiusz.

/Juha-Pekka

Jani Nikula (4):
  lib/params: add igt_params.c for module parameter access
  lib/params: overhaul param saving
  lib/params: add igt_params_open() which will return path
  igt/params: add generic saving module parameter set

Juha-Pekka Heikkila (3):
  lib/params: start renaming functions igt_params_*
  igt/params: use igt_params_set_save for igt_set_module_param*
  tests/gem_eio: switch to using igt_params_set()

 lib/Makefile.sources                  |   2 +
 lib/drmtest.c                         |   2 +-
 lib/i915/gem_submission.c             |   3 +-
 lib/igt.h                             |   1 +
 lib/igt_aux.c                         | 146 +----------
 lib/igt_aux.h                         |   3 -
 lib/igt_gt.c                          |   3 +-
 lib/igt_params.c                      | 362 ++++++++++++++++++++++++++
 lib/igt_params.h                      |  40 +++
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
 21 files changed, 453 insertions(+), 270 deletions(-)
 create mode 100644 lib/igt_params.c
 create mode 100644 lib/igt_params.h

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
