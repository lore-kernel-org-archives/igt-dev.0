Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1749459683018152806=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 06 Mar 2023 09:33:59 -0000
Message-ID: <167809523968.4156.8024593084986698400@emeril.freedesktop.org>
References: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW5pdGlh?=
 =?utf-8?q?l_Xe_test_suite_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1749459683018152806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial Xe test suite (rev4)
URL   : https://patchwork.freedesktop.org/series/112191/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12801_full -> IGTPW_8553_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8553_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8553_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/index.html

Participating hosts (20 -> 19)
------------------------------

  Missing    (1): shard-dg2-11 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8553_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-snb5/igt@i915_pm_rps@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl6/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl2/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted.html

  * {igt@xe/xe_evict@evict-beng-large} (NEW):
    - {shard-dg2-3}:      NOTRUN -> [SKIP][5] +98 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-3/igt@xe/xe_evict@evict-beng-large.html

  * {igt@xe/xe_exec_balancer@twice-virtual-basic} (NEW):
    - {shard-dg2-7}:      NOTRUN -> [SKIP][6] +62 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-7/igt@xe/xe_exec_balancer@twice-virtual-basic.html

  * {igt@xe/xe_exec_basic@many-bindengine} (NEW):
    - {shard-dg2-6}:      NOTRUN -> [SKIP][7] +70 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-6/igt@xe/xe_exec_basic@many-bindengine.html

  * {igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch} (NEW):
    - {shard-dg2-5}:      NOTRUN -> [SKIP][8] +94 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-5/igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * {igt@xe/xe_exec_reset@gt-reset} (NEW):
    - {shard-dg2-8}:      NOTRUN -> [SKIP][9] +124 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-8/igt@xe/xe_exec_reset@gt-reset.html

  * {igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate} (NEW):
    - {shard-dg2-12}:     NOTRUN -> [SKIP][10] +58 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-12/igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * {igt@xe/xe_guc_pc@freq_basic_api} (NEW):
    - {shard-dg2-10}:     NOTRUN -> [SKIP][11] +93 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-10/igt@xe/xe_guc_pc@freq_basic_api.html

  * {igt@xe/xe_vm@large-binds-134217728} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][12] +124 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg1-12/igt@xe/xe_vm@large-binds-134217728.html

  * {igt@xe/xe_vm@mixed-binds-1611661312} (NEW):
    - {shard-dg2-1}:      NOTRUN -> [SKIP][13] +39 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-1/igt@xe/xe_vm@mixed-binds-1611661312.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_create@create-ext-cpu-access-big:
    - {shard-dg2-6}:      NOTRUN -> [ABORT][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - {shard-dg2-6}:      NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12801_full and IGTPW_8553_full:

### New IGT tests (787) ###

  * igt@xe/xe_compute@compute:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@base:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@forcewake:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-many-read-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-once:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-small-multi-vm:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-external:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-external-cm:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-small:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-external:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-external-cm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small-multi-vm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large-multi-vm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-cm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-large:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small-multi-vm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-external:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-external-cm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-rebind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-basic:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-rebind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-rebind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-rebind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@virtual-all-active:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-bind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-invalidate:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-invalidate-race:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-bind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-bind:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-mmap:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-basic-defer-mmap:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr-invalidate-race:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-invalidate:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many-wait:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once-wait:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-imm:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-fault:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-imm:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-prefetch:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-userptr-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cancel:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd-no-exec:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-gt-reset:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset-stress:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cancel:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cat-error:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@spin:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cancel:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd-no-exec:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-engine-reset:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-gt-reset:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-rebind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-rebind:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-invalidate-race:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind-bindengine:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind-bindengine:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind-err:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind-err:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_basic_api:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_low_max:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_exec:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_reset_multiple:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@rc0_on_exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@rc6_on_idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_huc_copy@huc_copy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@system:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@vram:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@vram-system:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmio@mmio-invalid:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmio@mmio-timestamp:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-basic-exec:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-multiple-execs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3cold-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3hot-basic-exec:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-multiple-execs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3hot-basic-exec:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-basic-exec:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3cold-basic-exec:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3hot-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-exec-after:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-multiple-execs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-llseek-bad:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-llseek-size:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_fd_dup:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_one_bo:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_two_bos:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@export-vs-gem_close-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@reimport-vs-gem_close-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-config:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-engines:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-gts:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-hwconfig:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-invalid-query:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-invalid-size:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-mem-usage:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-topology:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-many:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-twice:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-twice:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-engines-independent:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-once:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times-many-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-1073741824:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-134217728:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-2147483648:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-33554432:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-67108864:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-536870912:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-67108864:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-8388608:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-16777216:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2097152:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-536870912:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-67108864:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-1073741824:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-33554432:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2147483648:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-268435456:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-536870912:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-8388608:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-2097152:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-33554432:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-8388608:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-16777216:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-268435456:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-33554432:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-4194304:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-67108864:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-1073741824:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-536870912:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-8388608:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-1611661312:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-1611661312:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-1611661312:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-all:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-full:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-end:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-front:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-one-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-end:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-front:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@scratch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde-page:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde2-page:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde3-page:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pte-page:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@unbind-all-2-vmas:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@unbind-all-8-vmas:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err-destroy:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_waitfence@test:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8553_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-tglu-9:       NOTRUN -> [SKIP][16] ([i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@fbdev@read.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-10:      NOTRUN -> [SKIP][17] ([i915#5325])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1099]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb1/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-9:       NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-10:      NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][23] ([i915#2842]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2842]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu-10:      NOTRUN -> [SKIP][26] ([fdo#109313])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-scanout@vcs1:
    - shard-tglu-9:       NOTRUN -> [SKIP][27] ([i915#3639]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_exec_reloc@basic-scanout@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-9:       NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([i915#4613]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglu-9:       NOTRUN -> [SKIP][30] ([fdo#111656])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb6/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-9:       NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#4270]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_pxp@display-protected-crc.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][34] ([i915#2724])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb5/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu-9:       NOTRUN -> [SKIP][35] ([fdo#109289]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu-10:      NOTRUN -> [SKIP][36] ([i915#2527] / [i915#2856]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-9:       NOTRUN -> [SKIP][37] ([i915#2527] / [i915#2856])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([i915#6412])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([i915#6590])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-9:       NOTRUN -> [SKIP][40] ([fdo#111644] / [i915#1397])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#6537])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl3/igt@i915_pm_rps@engine-order.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl1/igt@i915_pm_rps@engine-order.html

  * igt@i915_selftest@live@dmabuf:
    - shard-apl:          [PASS][43] -> [DMESG-FAIL][44] ([i915#7562])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl4/igt@i915_selftest@live@dmabuf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl2/igt@i915_selftest@live@dmabuf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-10:      NOTRUN -> [INCOMPLETE][45] ([i915#7443])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-10:      NOTRUN -> [SKIP][46] ([i915#5286]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][47] ([fdo#111614]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([fdo#111615]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl4/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][50] ([i915#3689] / [i915#6095]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][51] ([i915#3689] / [i915#3886]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][52] ([i915#3689]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][53] ([fdo#111615] / [i915#3689])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu-10:      NOTRUN -> [SKIP][54] ([i915#6095]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
    - shard-tglu-9:       NOTRUN -> [SKIP][55] ([fdo#111615] / [i915#1845] / [i915#7651]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-tglu-9:       NOTRUN -> [SKIP][56] ([fdo#111827])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-tglu-10:      NOTRUN -> [SKIP][57] ([fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-tglu-10:      NOTRUN -> [SKIP][58] ([i915#7828]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu-9:       NOTRUN -> [SKIP][59] ([i915#7828])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [FAIL][60] ([i915#315] / [i915#6946]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][61] ([i915#3116] / [i915#3299])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][62] ([i915#3359])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-tglu-10:      NOTRUN -> [SKIP][63] ([fdo#109274]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][64] -> [FAIL][65] ([i915#2346])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl6/igt@kms_c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/index.html

--===============1749459683018152806==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Initial Xe test suite (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112191/">https://patchwork.freedesktop.org/series/112191/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12801_full -&gt; IGTPW_8553_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8553_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8553_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/index.html</p>
<h2>Participating hosts (20 -&gt; 19)</h2>
<p>Missing    (1): shard-dg2-11 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8553_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-snb5/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb4/igt@i915_pm_rps@reset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl6/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl2/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted.html">DMESG-WARN</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_evict@evict-beng-large} (NEW):</p>
<ul>
<li>{shard-dg2-3}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-3/igt@xe/xe_evict@evict-beng-large.html">SKIP</a> +98 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_balancer@twice-virtual-basic} (NEW):</p>
<ul>
<li>{shard-dg2-7}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-7/igt@xe/xe_exec_balancer@twice-virtual-basic.html">SKIP</a> +62 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_basic@many-bindengine} (NEW):</p>
<ul>
<li>{shard-dg2-6}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-6/igt@xe/xe_exec_basic@many-bindengine.html">SKIP</a> +70 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch} (NEW):</p>
<ul>
<li>{shard-dg2-5}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-5/igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> +94 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_reset@gt-reset} (NEW):</p>
<ul>
<li>{shard-dg2-8}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-8/igt@xe/xe_exec_reset@gt-reset.html">SKIP</a> +124 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate} (NEW):</p>
<ul>
<li>{shard-dg2-12}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-12/igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate.html">SKIP</a> +58 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_guc_pc@freq_basic_api} (NEW):</p>
<ul>
<li>{shard-dg2-10}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-10/igt@xe/xe_guc_pc@freq_basic_api.html">SKIP</a> +93 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_vm@large-binds-134217728} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg1-12/igt@xe/xe_vm@large-binds-134217728.html">SKIP</a> +124 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_vm@mixed-binds-1611661312} (NEW):</p>
<ul>
<li>{shard-dg2-1}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-1/igt@xe/xe_vm@mixed-binds-1611661312.html">SKIP</a> +39 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>{shard-dg2-6}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>{shard-dg2-6}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12801_full and IGTPW_8553_full:</p>
<h3>New IGT tests (787)</h3>
<ul>
<li>
<p>igt@xe/xe_compute@compute:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@base:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@forcewake:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@gt0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@gt1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-many:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-many-read-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-external:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-external:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-threads-large:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-cm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-external:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-external-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-external:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-external-cm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-virtual-basic:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-virtual-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-basic-defer-mmap:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-bind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-basic-defer-bind:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-basic-defer-mmap:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-basic-defer-bind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-basic-defer-mmap:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-many-wait:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-once:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-once-wait:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-basic-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-basic-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-rebind-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-basic-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-imm:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-prefetch:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cancel:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cat-error:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-engines-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-cat-error:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-close-engines-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-engine-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@engine-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@gt-reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-cancel:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-cat-error:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-engines-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-fd-no-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-engine-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@spin:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-cancel:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-cat-error:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-close-engines-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-engine-reset:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind-err:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-rebind-bindengine:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind-bindengine:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind-err:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind-err:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_basic_api:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_fixed_exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_low_max:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_range_exec:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_range_idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_reset_multiple:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_suspend:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@rc0_on_exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@rc6_on_idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_huc_copy@huc_copy:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmap@system:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmap@vram:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmap@vram-system:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmio@mmio-invalid:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmio@mmio-timestamp:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3hot-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3hot-basic-exec:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-exec-after:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-exec-after:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-multiple-execs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-basic-exec:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-exec-after:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-multiple-execs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-config:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-engines:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-gts:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-hwconfig:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-invalid-query:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-invalid-size:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-mem-usage:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-topology:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-engine-many:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-engine-twice:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-twice:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-engines-independent:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-once:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-one-bo-many-times-many-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-1073741824:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-134217728:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-2097152:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-2147483648:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-33554432:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-67108864:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-16777216:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-2097152:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-536870912:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-67108864:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-268435456:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-536870912:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-8388608:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-16777216:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-268435456:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-33554432:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-4194304:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-67108864:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-binds-1611661312:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-binds-3145728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-misaligned-binds-1611661312:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-misaligned-binds-3145728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-userptr-binds-1611661312:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-userptr-binds-3145728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-userptr-misaligned-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-userptr-misaligned-binds-3145728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-all:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-either-side-full:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-either-side-partial:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-either-side-partial-hammer:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-either-side-full:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-end:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-front:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@scratch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@shared-pde-page:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@shared-pde2-page:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@shared-pde3-page:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@shared-pte-page:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@unbind-all-2-vmas:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@unbind-all-8-vmas:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@vm-async-ops-err:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@vm-async-ops-err-destroy:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_waitfence@test:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8553_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@fbdev@read.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb1/igt@gem_ctx_persistence@legacy-engines-persistence.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@vcs1:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_exec_reloc@basic-scanout@vcs1.html">SKIP</a> ([i915#3639]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl3/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl1/igt@i915_pm_rps@engine-order.html">FAIL</a> ([i915#6537])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl4/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl2/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> ([i915#7562])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#7443])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl4/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#1845] / [i915#7651]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#315] / [i915#6946]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-tglu-10/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12801/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8553/shard-apl6/igt@kms_c">FAIL</a> ([i915#2346])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1749459683018152806==--
