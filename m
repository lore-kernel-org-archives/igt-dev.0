Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3088783558718399830=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 09 Mar 2023 12:42:09 -0000
Message-ID: <167836572938.12422.798382682338184242@emeril.freedesktop.org>
References: <20230307221236.913429-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307221236.913429-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW5pdGlh?=
 =?utf-8?q?l_Xe_test_suite_=28rev7=29?=
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

--===============3088783558718399830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial Xe test suite (rev7)
URL   : https://patchwork.freedesktop.org/series/112191/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12824_full -> IGTPW_8573_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8573_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe/xe_exec_basic@twice-rebind} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +330 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-dg1-16/igt@xe/xe_exec_basic@twice-rebind.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12824_full and IGTPW_8573_full:

### New IGT tests (787) ###

  * igt@xe/xe_compute@compute-square:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@base:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@forcewake:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_debugfs@gt0:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-external-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-large-multi-vm-cm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-many-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-beng-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-cm-threads-small-multi-vm:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-large-multi-vm-cm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-many-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-mixed-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-small-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_evict@evict-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-engines-virtual-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@many-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-parallel-basic:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@once-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_balancer@virtual-all-active:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-basic-defer-mmap:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-userptr:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-many-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-engines-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-bindengine-rebind:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@no-exec-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@once-userptr-rebind:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_basic@twice-userptr:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-bindengine-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-bindengine:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-engines-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-preempt-fence-early:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@many-userptr-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_compute_mode@twice-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-many-wait:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@atomic-once-wait:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-basic-imm:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-basic-prefetch:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-invalid-userptr-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-rebind-imm:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-invalid-fault:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-imm:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-basic:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-invalid-userptr-fault:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-rebind-prefetch:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-basic-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cat-error:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@close-fd:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@cm-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@gt-reset-stress:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-engine-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@parallel-gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@spin:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-engines-close-fd:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-engine-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_reset@virtual-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-bal-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:
    - Statuses : 3 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-cm-userptr:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-fd-userptr:
    - Statuses : 5 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-hang-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-fd-userptr:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-mixed-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-rebind-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-shared-vm-rebind:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_exec_threads@threads-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_basic_api:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_fixed_idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_low_max:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@freq_range_exec:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@rc0_on_exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_guc_pc@rc6_on_idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_huc_copy@huc_copy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@system:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@vram:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmap@vram-system:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmio@mmio-invalid:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_mmio@mmio-timestamp:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@d3cold-basic-exec:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-d3hot-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-exec-after:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s2idle-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3cold-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s3-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_pm@s4-d3cold-basic-exec:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_prime_self_import@basic-with_fd_dup:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-gts:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_query@query-hwconfig:
    - Statuses : 3 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-engine-twice:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-array-twice:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-engines-independent:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-once:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@bind-one-bo-many-times-many-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-16777216:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-536870912:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-2147483648:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-4194304:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-binds-8388608:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-split-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2097152:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
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
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-misaligned-binds-8388608:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-134217728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2097152:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-2147483648:
    - Statuses : 5 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-268435456:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@large-userptr-split-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-1611661312:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-misaligned-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-1611661312:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-binds-3145728:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@mixed-userptr-misaligned-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-full:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-many-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-one-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-end:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-front:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - Statuses : 4 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-many-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial:
    - Statuses : 4 skip(s)
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
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_vm@vm-async-ops-err-destroy:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe/xe_waitfence@test:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8573_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_buddy@all-tests:
    - shard-tglu-10:      NOTRUN -> [SKIP][2] ([i915#6433]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@drm_buddy@all-tests.html

  * igt@feature_discovery@display-3x:
    - shard-tglu-10:      NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@feature_discovery@display-3x.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-10:      NOTRUN -> [SKIP][4] ([i915#5325]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-10:      NOTRUN -> [SKIP][5] ([i915#6335]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglu-10:      NOTRUN -> [SKIP][6] ([fdo#109314])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#2410])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-apl2/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl2/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-10:      NOTRUN -> [SKIP][9] ([i915#6334])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][12] ([i915#2842]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu-10:      NOTRUN -> [SKIP][13] ([fdo#109313])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-tglu-10:      NOTRUN -> [SKIP][14] ([i915#7697]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-tglu-10:      NOTRUN -> [SKIP][16] ([i915#4613]) +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_lmem_swapping@random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglu-10:      NOTRUN -> [SKIP][17] ([i915#4270]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-10:      NOTRUN -> [SKIP][18] ([i915#3297]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][19] -> [ABORT][20] ([i915#5566])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl7/igt@gen9_exec_parse@allowed-single.html
    - shard-glk:          [PASS][21] -> [ABORT][22] ([i915#5566])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-tglu-10:      NOTRUN -> [SKIP][23] ([i915#2527] / [i915#2856]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_hwmon@hwmon-write:
    - shard-tglu-10:      NOTRUN -> [SKIP][24] ([i915#7707])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_hwmon@hwmon-write.html

  * igt@i915_module_load@load:
    - shard-tglu-10:      NOTRUN -> [SKIP][25] ([i915#6227])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_module_load@load.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-10:      NOTRUN -> [SKIP][26] ([i915#6412])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-tglu-10:      NOTRUN -> [SKIP][27] ([i915#7561]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-10:      NOTRUN -> [WARN][28] ([i915#2681])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([fdo#109506]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglu-10:      NOTRUN -> [SKIP][30] ([fdo#111644] / [i915#1397]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-10:      NOTRUN -> [SKIP][31] ([fdo#109302])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-10:      NOTRUN -> [SKIP][32] ([i915#3826])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#5286]) +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][34] ([fdo#111614]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([fdo#111615]) +10 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-tglu-10:      NOTRUN -> [SKIP][36] ([i915#2705])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][37] ([i915#3689] / [i915#3886]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([fdo#111615] / [i915#3689]) +12 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][40] ([i915#3689] / [i915#6095]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][41] ([i915#6095]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu-10:      NOTRUN -> [SKIP][42] ([i915#3689]) +24 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-10:      NOTRUN -> [SKIP][43] ([i915#3742])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-tglu-10:      NOTRUN -> [SKIP][44] ([fdo#111827]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-tglu-10:      NOTRUN -> [SKIP][45] ([i915#7828]) +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [FAIL][46] ([i915#315] / [i915#6946]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][47] ([i915#3116] / [i915#3299]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][48] ([i915#7173])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl4/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-10:      NOTRUN -> [SKIP][49] ([i915#6944] / [i915#7116] / [i915#7118])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu-10:      NOTRUN -> [SKIP][50] ([fdo#109279] / [i915#3359]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][51] ([i915#3359]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-tglu-10:      NOTRUN -> [SKIP][52] ([fdo#109274]) +12 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu-10:      NOTRUN -> [SKIP][53] ([i915#4103]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglu-10:      NOTRUN -> [SKIP][54] ([i915#426])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-10:      NOTRUN -> [SKIP][55] ([i915#3469])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu-10:      NOTRUN -> [SKIP][56] ([fdo#109274] / [i915#3637]) +11 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][57] -> [ABORT][58] ([i915#180])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][59] ([i915#2587] / [i915#2672]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [PASS][60] -> [DMESG-FAIL][61] ([i915#118])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglu-10:      NOTRUN -> [SKIP][62] ([fdo#110189]) +70 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglu-10:      NOTRUN -> [SKIP][63] ([fdo#109280]) +82 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-10:      NOTRUN -> [SKIP][64] ([i915#6301])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_panel_fitting@atomic-fastset.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/index.html

--===============3088783558718399830==
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
<tr><td><b>Series:</b></td><td>Initial Xe test suite (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112191/">https://patchwork.freedesktop.org/series/112191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12824_full -&gt; IGTPW_8573_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8573_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe/xe_exec_basic@twice-rebind} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-dg1-16/igt@xe/xe_exec_basic@twice-rebind.html">SKIP</a> +330 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12824_full and IGTPW_8573_full:</p>
<h3>New IGT tests (787)</h3>
<ul>
<li>
<p>igt@xe/xe_compute@compute-square:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-external:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-beng-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-parallel-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-basic-defer-mmap:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@many-engines-many-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_basic@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@atomic-once-wait:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@close-fd:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_reset@virtual-engine-reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_exec_threads@threads-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@freq_fixed_exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_guc_pc@rc0_on_exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@d3cold-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-engine-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@bind-array-twice:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-4194304:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-binds-8388608:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-split-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-binds-2097152:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@large-userptr-split-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@mixed-misaligned-binds-1611661312:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-either-side-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe/xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8573_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_buddy@all-tests:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@drm_buddy@all-tests.html">SKIP</a> ([i915#6433]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#5325]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-apl2/igt@gem_ctx_persistence@engines-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl2/igt@gem_ctx_persistence@engines-hang@rcs0.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk5/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-glk4/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2527] / [i915#2856]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#7561]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#5286]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#6095]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#6095]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#3689]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> ([fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> ([i915#7828]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#315] / [i915#6946]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl4/igt@kms_content_protection@srm@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274] / [i915#3637]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">ABORT</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12824/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">DMESG-FAIL</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> ([fdo#110189]) +70 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +82 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8573/shard-tglu-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3088783558718399830==--
