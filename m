Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4578905189856526694=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 09 Mar 2023 12:30:24 -0000
Message-ID: <167836502443.12423.7871421452694683113@emeril.freedesktop.org>
References: <20230307211818.910093-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307211818.910093-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW5pdGlh?=
 =?utf-8?q?l_Xe_test_suite_=28rev6=29?=
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

--===============4578905189856526694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial Xe test suite (rev6)
URL   : https://patchwork.freedesktop.org/series/112191/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12824_full -> IGTPW_8572_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8572_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe/xe_exec_basic@once-rebind} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +363 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-dg1-14/igt@xe/xe_exec_basic@once-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_eio@unwedge-stress:
    - {shard-tglu}:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-tglu-8/igt@gem_eio@unwedge-stress.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-5/igt@gem_eio@unwedge-stress.html

  * igt@i915_module_load@resize-bar:
    - {shard-dg1}:        NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-dg1-18/igt@i915_module_load@resize-bar.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12824_full and IGTPW_8572_full:

### New IGT tests (787) ###

  * igt@xe/xe_compute@compute-square:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@base:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@forcewake:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt1:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-many-read-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-once:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-large:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-external:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-external-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small-multi-vm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-external:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-external-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@virtual-all-active:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-preempt-fence-early:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-preempt-fence-early:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many-wait:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once-wait:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-userptr-fault:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-userptr-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-fault:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cancel:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cat-error:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-cat-error:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset-stress:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cancel:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-rebind:
    - Statuses : 5 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_basic_api:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_low_max:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_idle:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_huc_copy@huc_copy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@system:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@vram:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@vram-system:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmio@mmio-invalid:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmio@mmio-timestamp:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-exec-after:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic-exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3cold-basic-exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3hot-basic-exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3cold-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-exec-after:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-llseek-bad:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-llseek-size:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_fd_dup:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_one_bo:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-config:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-engines:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-gts:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-hwconfig:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-invalid-query:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-invalid-size:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-mem-usage:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-topology:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-twice:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-twice:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-engines-independent:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-once:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times-many-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-8388608:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-33554432:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-33554432:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-536870912:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2147483648:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-33554432:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-16777216:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-2147483648:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-3145728:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-full:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-end:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-all:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-one-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-all:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-end:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-front:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde3-page:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pte-page:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@unbind-all-2-vmas:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@unbind-all-8-vmas:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err-destroy:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_waitfence@test:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8572_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_mm@all-tests:
    - shard-tglu-10:      NOTRUN -> [SKIP][5] ([i915#6433])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@drm_mm@all-tests.html

  * igt@feature_discovery@display-2x:
    - shard-tglu-10:      NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@feature_discovery@display-2x.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][9] ([i915#2842]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-tglu-10:      NOTRUN -> [SKIP][10] ([i915#7697]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-tglu-10:      NOTRUN -> [ABORT][11] ([i915#7975])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-apl:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#4613])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-10:      NOTRUN -> [SKIP][13] ([i915#4613]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-10:      NOTRUN -> [WARN][14] ([i915#2658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglu-10:      NOTRUN -> [SKIP][15] ([i915#4270]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-10:      NOTRUN -> [SKIP][16] ([i915#3297]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_userptr_blits@access-control.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-10:      NOTRUN -> [SKIP][17] ([i915#2527] / [i915#2856]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-10:      NOTRUN -> [SKIP][18] ([i915#6412])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu-10:      NOTRUN -> [SKIP][19] ([i915#7561])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-tglu-10:      NOTRUN -> [FAIL][20] ([i915#3825])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-10:      NOTRUN -> [SKIP][21] ([fdo#111644] / [i915#1397]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-10:      NOTRUN -> [SKIP][22] ([fdo#109302])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][23] ([i915#5286]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-tglu-10:      NOTRUN -> [SKIP][24] ([fdo#111614]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-tglu-10:      NOTRUN -> [SKIP][25] ([fdo#111615]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][26] ([i915#3689] / [i915#3886]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#3886]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][28] ([fdo#111615] / [i915#3689]) +7 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([i915#3689] / [i915#6095]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][30] ([i915#6095]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][31] ([i915#3689]) +12 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu-10:      NOTRUN -> [SKIP][32] ([fdo#111827])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#7828]) +7 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [FAIL][34] ([i915#315] / [i915#6946]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([i915#3116] / [i915#3299]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][36] ([i915#7173])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl2/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][37] ([i915#3359]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([fdo#109279] / [i915#3359])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([i915#3555]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-10:      NOTRUN -> [SKIP][40] ([i915#4103])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-tglu-10:      NOTRUN -> [SKIP][41] ([fdo#109274]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][42] ([fdo#109274] / [i915#3637]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#2122])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][45] ([i915#2587] / [i915#2672]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu-10:      NOTRUN -> [SKIP][46] ([fdo#109280]) +48 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu-10:      NOTRUN -> [SKIP][47] ([fdo#110189]) +38 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([i915#5176]) +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][49] ([i915#5235]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_prime@d3hot:
    - shard-tglu-10:      NOTRUN -> [SKIP][50] ([i915#6524])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-tglu-10:      NOTRUN -> [SKIP][51] ([i915#658]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][52] ([i915#5289])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2437])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl4/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglu-10:      NOTRUN -> [SKIP][54] ([fdo#109289]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-userptr:
    - shard-tglu-10:      NOTRUN -> [SKIP][55] ([fdo#109295] / [i915#3301])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@prime_vgem@basic-userptr.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-tglu-10:      NOTRUN -> [SKIP][56] ([i915#2575]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * {igt@xe/xe_evict@evict-beng-small-multi-vm-cm} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][57] ([fdo#109315]) +737 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-rkl-2/igt@xe/xe_evict@evict-beng-small-multi-vm-cm.html

  * {igt@xe/xe_exec_basic@many-engines-basic-defer-bind} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][58] ([fdo#109315] / [i915#2575]) +523 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-1/igt@xe/xe_exec_basic@many-engines-basic-defer-bind.html

  * {igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +783 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl6/igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm.html

  * {igt@xe/xe_exec_reset@gt-reset-stress} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271]) +787 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-glk6/igt@xe/xe_exec_reset@gt-reset-stress.html

  * {igt@xe/xe_exec_threads@threads-basic} (NEW):
    - shard-tglu-10:      NOTRUN -> [SKIP][61] ([fdo#109315] / [i915#2575]) +206 similar issues
   [6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/index.html

--===============4578905189856526694==
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
<tr><td><b>Series:</b></td><td>Initial Xe test suite (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112191/">https://patchwork.freedesktop.org/series/112191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12824_full -&gt; IGTPW_8572_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8572_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe/xe_exec_basic@once-rebind} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-dg1-14/igt@xe/xe_exec_basic@once-rebind.html">SKIP</a> +363 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-tglu-8/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-5/igt@gem_eio@unwedge-stress.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-dg1-18/igt@i915_module_load@resize-bar.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12824_full and IGTPW_8572_full:</p>
<h3>New IGT tests (787)</h3>
<ul>
<li>
<p>igt@xe/xe_compute@compute-square:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@base:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@forcewake:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@gt0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@gt1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-external:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-external:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-small-external-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-basic-defer-mmap:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-preempt-fence-early:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-many-wait:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-once:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-once-wait:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-basic-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-basic-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-basic-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cancel:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cat-error:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-engines-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cm-cat-error:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-cancel:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-cat-error:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-engines-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-cancel:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-cat-error:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-close-engines-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-engine-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-rebind-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind-bindengine:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind-err:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind-err:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_low_max:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_range_exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_range_idle:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_huc_copy@huc_copy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmap@system:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmap@vram:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_mmap@vram-system:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-exec-after:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-basic-exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-exec-after:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-multiple-execs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-config:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-engines:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-gts:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-invalid-size:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-mem-usage:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-topology:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-engine-many:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-engine-twice:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-many:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-twice:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-8388608:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-33554432:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-2097152:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-33554432:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-134217728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-16777216:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-2097152:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-binds-3145728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-misaligned-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-userptr-binds-3145728:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-either-side-full:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-all:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-front:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@shared-pde3-page:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@unbind-all-8-vmas:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8572_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_mm@all-tests:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@drm_mm@all-tests.html">SKIP</a> ([i915#6433])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> ([i915#7975])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([i915#2527] / [i915#2856]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">FAIL</a> ([i915#3825])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#5286]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#6095]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_chamelium_color@gamma.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> ([i915#7828]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#315] / [i915#6946]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl2/igt@kms_content_protection@srm@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> ([i915#3555]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#109274] / [i915#3637]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([fdo#110189]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@prime_vgem@basic-userptr.html">SKIP</a> ([fdo#109295] / [i915#3301])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-10/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> ([i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_evict@evict-beng-small-multi-vm-cm} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-rkl-2/igt@xe/xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> ([fdo#109315]) +737 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_basic@many-engines-basic-defer-bind} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-tglu-1/igt@xe/xe_exec_basic@many-engines-basic-defer-bind.html">SKIP</a> ([fdo#109315] / [i915#2575]) +523 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-apl6/igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm.html">SKIP</a> ([fdo#109271]) +783 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_reset@gt-reset-stress} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8572/shard-glk6/igt@xe/xe_exec_reset@gt-reset-stress.html">SKIP</a> ([fdo#109271]) +787 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe/xe_exec_threads@threads-basic} (NEW):</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; [SKIP][61] ([fdo#109315] / [i915#2575]) +206 similar issues<br />
   [6</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4578905189856526694==--
