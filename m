Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8452820789708857355=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 08 Mar 2023 20:08:33 -0000
Message-ID: <167830611358.20402.5808335147064871959@emeril.freedesktop.org>
References: <20230307152130.795989-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307152130.795989-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW5pdGlh?=
 =?utf-8?q?l_Xe_test_suite_=28rev5=29?=
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

--===============8452820789708857355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial Xe test suite (rev5)
URL   : https://patchwork.freedesktop.org/series/112191/
State : success

== Summary ==

CI Bug Log - changes from IGT_7183_full -> IGTPW_8567_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/index.html

Participating hosts (8 -> 11)
------------------------------

  Additional (3): shard-rkl0 shard-tglu-9 shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8567_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe/xe_guc_pc@rc6_on_idle} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +367 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-dg1-14/igt@xe/xe_guc_pc@rc6_on_idle.html

  
New tests
---------

  New tests have been introduced between IGT_7183_full and IGTPW_8567_full:

### New IGT tests (787) ###

  * igt@xe/xe_compute@compute-square:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@base:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@forcewake:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-many-read-sync:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-once:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-cm-threads-small-multi-vm:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-small:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-cm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-external-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-small-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large-multi-vm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large-multi-vm:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-cm-virtual-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr:
    - Statuses : 3 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-basic:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@virtual-all-active:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-bind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-preempt-fence-early:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-preempt-fence-early:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many-wait:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once-wait:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:
    - Statuses : 5 skip(s)
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
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-userptr-fault:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-imm:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-imm:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-engines-close-fd:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-engine-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@engine-reset:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset-stress:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-engines-close-fd:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@spin:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd-no-exec:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-rebind:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-userptr-rebind-err:
    - Statuses : 3 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_basic_api:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_low_max:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_idle:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_reset_multiple:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_suspend:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@rc0_on_exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@rc6_on_idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_huc_copy@huc_copy:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic-exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3hot-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3cold-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-exec-after:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3hot-basic-exec:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3cold-basic-exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3hot-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-llseek-bad:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-llseek-size:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_fd_dup:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_one_bo:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_two_bos:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@export-vs-gem_close-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@reimport-vs-gem_close-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-config:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-engines:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-mem-usage:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-topology:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-twice:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-twice:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-engines-independent:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-once:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times-many-vm:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-4194304:
    - Statuses : 5 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2097152:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-67108864:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-268435456:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-536870912:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-1073741824:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-4194304:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-1073741824:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-4194304:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-1611661312:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-1611661312:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-all:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-front:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-full:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-end:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@scratch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde-page:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde2-page:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pde3-page:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@shared-pte-page:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@unbind-all-2-vmas:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@unbind-all-8-vmas:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err-destroy:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_waitfence@test:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8567_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-10:      NOTRUN -> [SKIP][2] ([i915#7701])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_buddy@all-tests:
    - shard-tglu-10:      NOTRUN -> [SKIP][3] ([i915#6433])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@drm_buddy@all-tests.html

  * igt@feature_discovery@display-2x:
    - shard-tglu-10:      NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@feature_discovery@display-2x.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-9:       NOTRUN -> [SKIP][5] ([i915#5325])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-10:      NOTRUN -> [SKIP][6] ([i915#3555] / [i915#5325])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglu-10:      NOTRUN -> [SKIP][7] ([fdo#109314])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-9:       NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][10] ([i915#2842]) +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7183/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu-9:       NOTRUN -> [SKIP][13] ([fdo#109313])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-9:       NOTRUN -> [SKIP][14] ([i915#7582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][16] ([i915#4613]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-tglu-10:      NOTRUN -> [SKIP][17] ([i915#284])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-10:      NOTRUN -> [WARN][18] ([i915#2658])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu-10:      NOTRUN -> [SKIP][19] ([i915#4270]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-9:       NOTRUN -> [SKIP][20] ([fdo#110542])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-10:      NOTRUN -> [SKIP][21] ([i915#3297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu-9:       NOTRUN -> [SKIP][22] ([i915#2527] / [i915#2856])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][23] -> [ABORT][24] ([i915#5566])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7183/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu-10:      NOTRUN -> [SKIP][25] ([i915#2527] / [i915#2856]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_module_load@load:
    - shard-tglu-10:      NOTRUN -> [SKIP][26] ([i915#6227])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_module_load@load.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-tglu-10:      NOTRUN -> [SKIP][27] ([i915#7561]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-tglu-9:       NOTRUN -> [SKIP][28] ([i915#7561])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([fdo#111644] / [i915#1397])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-tglu-10:      NOTRUN -> [SKIP][30] ([fdo#109506])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglu-9:       NOTRUN -> [SKIP][31] ([i915#3547])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-10:      NOTRUN -> [SKIP][32] ([i915#5723])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#3826])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][34] ([i915#5286]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([fdo#111614]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglu-9:       NOTRUN -> [SKIP][36] ([fdo#111615] / [i915#1845] / [i915#7651]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][37] ([fdo#111615]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([i915#3689]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([i915#3689] / [i915#6095]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][40] ([i915#3689] / [i915#3886]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][42] ([i915#6095]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][44] ([fdo#111615] / [i915#3689]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-tglu-10:      NOTRUN -> [SKIP][45] ([fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu-9:       NOTRUN -> [SKIP][46] ([i915#7828]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-tglu-10:      NOTRUN -> [SKIP][47] ([i915#7828]) +9 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([i915#3116] / [i915#3299]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][49] ([i915#3359]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-9:       NOTRUN -> [SKIP][50] ([i915#1845]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-tglu-9:       NOTRUN -> [SKIP][51] ([i915#1845] / [i915#7651]) +25 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          NOTRUN -> [FAIL][52] ([i915#72])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-tglu-10:      NOTRUN -> [SKIP][53] ([fdo#109274]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-10:      NOTRUN -> [SKIP][54] ([i915#4103]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#4767])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7183/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu-9:       NOTRUN -> [SKIP][57] ([fdo#109274] / [i915#3637]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-10:      NOTRUN -> [SKIP][58] ([fdo#109274] / [i915#3637]) +6 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-plain-flip:
    - shard-tglu-9:       NOTRUN -> [SKIP][59] ([i915#3637])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-9:       NOTRUN -> [SKIP][60] ([i915#3555]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][61] ([i915#2587] / [i915#2672])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu-10:      NOTRUN -> [SKIP][62] ([fdo#109280]) +33 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu-10:      NOTRUN -> [SKIP][63] ([fdo#110189]) +27 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/dr

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/index.html

--===============8452820789708857355==
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
<tr><td><b>Series:</b></td><td>Initial Xe test suite (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112191/">https://patchwork.freedesktop.org/series/112191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7183_full -&gt; IGTPW_8567_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/index.html</p>
<h2>Participating hosts (8 -&gt; 11)</h2>
<p>Additional (3): shard-rkl0 shard-tglu-9 shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8567_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe/xe_guc_pc@rc6_on_idle} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-dg1-14/igt@xe/xe_guc_pc@rc6_on_idle.html">SKIP</a> +367 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7183_full and IGTPW_8567_full:</p>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_debugfs@forcewake:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-small:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@no-exec-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@once-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-basic-defer-mmap:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-preempt-fence-early:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@cancel:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@parallel-close-fd-no-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_range_idle:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_suspend:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic-exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-exec-after:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-config:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_query@query-engines:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-once:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-one-bo-many-times-many-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-binds-8388608:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-2097152:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-binds-8388608:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-binds-1611661312:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-partial:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-end:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@scratch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@shared-pde3-page:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@vm-async-ops-err:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@vm-async-ops-err-destroy:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_waitfence@test:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8567_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@all-tests:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@drm_buddy@all-tests.html">SKIP</a> ([i915#6433])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7183/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7183/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl2/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2527] / [i915#2856]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#7561]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#3547])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#5286]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615] / [i915#1845] / [i915#7651]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#1845]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> ([i915#1845] / [i915#7651]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-glk7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7183/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> ([i915#4767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([fdo#109274] / [i915#3637]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_flip@basic-plain-flip.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#3555]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8567/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/dr">SKIP</a> ([fdo#110189]) +27 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8452820789708857355==--
