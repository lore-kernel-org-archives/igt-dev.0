Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5649742988481894441=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 13 Mar 2023 18:34:15 -0000
Message-ID: <167873245588.1030.6707123383712510923@emeril.freedesktop.org>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGln?=
 =?utf-8?b?dF9kb2MucHkgKHJldjIp?=
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

--===============5649742988481894441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add igt_doc.py (rev2)
URL   : https://patchwork.freedesktop.org/series/114959/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12841_full -> IGTPW_8589_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8589_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +422 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-17/igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1:
    - {shard-tglu}:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-2/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-5/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12841_full and IGTPW_8589_full:

### New IGT tests (786) ###

  * igt@xe_compute@compute-square:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_debugfs@base:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_debugfs@forcewake:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_debugfs@gt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_dma_buf_sync@export-dma-buf-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_dma_buf_sync@export-dma-buf-many-read-sync:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-cm-threads-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-cm-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-large-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-large-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-large-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-small-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-small-external:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-small-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-small-multi-vm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-cm-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-cm-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-large:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-large-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-large-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-large-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-large-multi-vm-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-mixed-many-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-mixed-many-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-mixed-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-mixed-threads-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-small:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-small-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-small-external:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-small-external-cm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-small-multi-vm-cm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-threads-large:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-threads-large-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-threads-small:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict@evict-threads-small-multi-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-cm-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-cm-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-parallel-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-engines-virtual-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-virtual-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@many-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-parallel-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@no-exec-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-cm-virtual-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-cm-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-cm-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-parallel-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-parallel-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-virtual-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@once-virtual-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-parallel-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-parallel-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-parallel-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-virtual-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_balancer@virtual-all-active:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-bindengine-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-many-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@many-userptr-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@no-exec-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-basic-defer-mmap:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@once-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-basic-defer-bind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-basic-defer-mmap:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-bindengine-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-preempt-fence-early:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@many-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-bindengine:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@once-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_compute_mode@twice-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@atomic-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@atomic-many-wait:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@atomic-once:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@atomic-once-wait:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-bindengine-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-basic-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-basic-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-basic-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-rebind-imm:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-rebind-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cancel:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cm-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cm-close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cm-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cm-engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@cm-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@engine-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@gt-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@gt-reset-stress:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-cat-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-close-engines-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-close-fd-no-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-engine-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@parallel-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@spin:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-cancel:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-cat-error:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-close-engines-close-fd:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-close-fd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-engine-reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_reset@virtual-gt-reset:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-bal-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-userptr-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-cm-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-rebind:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-fd-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-fd-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-mixed-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-rebind-bindengine:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-rebind-bindengine:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-rebind-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-userptr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-userptr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-userptr-invalidate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-userptr-invalidate-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_threads@threads-userptr-rebind:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_basic_api:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_fixed_exec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_fixed_idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_low_max:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_range_exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_range_idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_reset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_reset_multiple:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@freq_suspend:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@rc0_on_exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_guc_pc@rc6_on_idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_huc_copy@huc_copy:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_mmap@system:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_mmap@vram:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_mmap@vram-system:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_mmio@mmio-invalid:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_mmio@mmio-timestamp:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@d3cold-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@d3cold-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@d3hot-basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@d3hot-multiple-execs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s2idle-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s2idle-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s2idle-exec-after:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s2idle-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s3-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s3-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s3-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s3-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s3-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s3-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s4-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s4-basic-exec:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s4-d3cold-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s4-d3hot-basic-exec:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s4-exec-after:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm@s4-multiple-execs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@basic-llseek-bad:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@basic-llseek-size:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@basic-with_one_bo:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@basic-with_two_bos:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@export-vs-gem_close-race:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_prime_self_import@reimport-vs-gem_close-race:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-config:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-engines:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-gts:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-hwconfig:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-invalid-query:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-invalid-size:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-mem-usage:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-topology:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-array-engine-many:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-array-engine-twice:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-array-many:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-array-twice:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-engines-independent:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-once:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-one-bo-many-times:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@bind-one-bo-many-times-many-vm:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-binds-8388608:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-268435456:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-split-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-2097152:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-4194304:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-67108864:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-1073741824:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-16777216:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-2147483648:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-268435456:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-33554432:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-4194304:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-536870912:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-binds-8388608:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-1073741824:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-134217728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-16777216:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-2097152:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-2147483648:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-268435456:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-33554432:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-4194304:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-536870912:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@large-userptr-split-misaligned-binds-8388608:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-misaligned-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-misaligned-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-userptr-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-userptr-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@mixed-userptr-misaligned-binds-3145728:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-many-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-many-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-many-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-either-side-full:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-end:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-many-all:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-many-end:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-many-front:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@munmap-style-unbind-userptr-one-partial:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@scratch:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@shared-pde-page:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@shared-pde2-page:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@shared-pde3-page:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@shared-pte-page:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@unbind-all-2-vmas:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@unbind-all-8-vmas:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@vm-async-ops-err:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@vm-async-ops-err-destroy:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_waitfence@test:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8589_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-apl:          [PASS][4] -> [ABORT][5] ([i915#180])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#4275])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#3886]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271]) +808 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][12] ([i915#7173])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl2/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#2346])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * {igt@xe_exec_basic@many-bindengine-rebind} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][17] ([fdo#109315] / [i915#2575]) +614 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-7/igt@xe_exec_basic@many-bindengine-rebind.html

  * {igt@xe_vm@large-binds-536870912} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][18] ([fdo#109315]) +748 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-3/igt@xe_vm@large-binds-536870912.html

  * {igt@xe_vm@large-userptr-misaligned-binds-2097152} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271]) +785 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@xe_vm@large-userptr-misaligned-binds-2097152.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][20] ([i915#7742]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@info:
    - {shard-rkl}:        [SKIP][22] ([i915#2582]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@fbdev@info.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@fbdev@info.html

  * {igt@gem_barrier_race@remote-request@rcs0}:
    - shard-apl:          [ABORT][24] ([i915#8211] / [i915#8234]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl4/igt@gem_barrier_race@remote-request@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl6/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - {shard-rkl}:        [FAIL][26] ([i915#2842]) -> [PASS][27] +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][28] ([i915#2842]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - {shard-rkl}:        [SKIP][30] ([fdo#109313]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - {shard-rkl}:        [SKIP][32] ([i915#3281]) -> [PASS][33] +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][34] ([i915#7276]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_userptr_blits@forbidden-operations:
    - {shard-rkl}:        [SKIP][36] ([i915#3282]) -> [PASS][37] +5 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gen9_exec_parse@shadow-peek:
    - {shard-rkl}:        [SKIP][38] ([i915#2527]) -> [PASS][39] +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-psr:
    - {shard-rkl}:        [SKIP][40] ([i915#658]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@i915_pm_dc@dc6-psr.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-dg1}:        [SKIP][42] ([i915#1397]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - {shard-rkl}:        [SKIP][44] ([fdo#109308]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_suspend@debugfs-reader:
    - {shard-rkl}:        [FAIL][46] ([fdo#103375]) -> [PASS][47] +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-rkl}:        [SKIP][48] ([i915#1845] / [i915#4098]) -> [PASS][49] +28 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - {shard-tglu}:       [SKIP][50] ([i915#1845]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][52] ([i915#2346]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][54] ([i915#79]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [FAIL][56] ([i915#2122]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [ABORT][58] ([i915#180]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - {shard-tglu}:       [SKIP][60] ([i915#1849]) -> [PASS][61] +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - {shard-rkl}:        [SKIP][62] ([i915#1849] / [i915#4098]) -> [PASS][63] +17 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - {shard-rkl}:        [SKIP][64] ([i915#1849]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-1/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html

  * igt@kms_psr@primary_mmap_gtt:
    - {shard-rkl}:        [SKIP][66] ([i915#1072]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@kms_psr@primary_mmap_gtt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
    - {shard-tglu}:       [SKIP][68] ([fdo#109274]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html

  * igt@kms_vblank@pipe-d-wait-forked-busy:
    - {shard-tglu}:       [SKIP][70] ([i915#1845] / [i915#7651]) -> [PASS][71] +15 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_vblank@pipe-d-wait-forked-busy.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-5/igt@kms_vblank@pipe-d-wait-forked-busy.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][72] ([i915#2436]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][74] ([i915#1722]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@perf@polling-small-buf.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-4/igt@perf@polling-small-buf.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][76] ([i915#4349]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@perf_pmu@idle@rcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@perf_pmu@idle@rcs0.html

  * igt@perf_pmu@module-unload:
    - {shard-dg1}:        [DMESG-WARN][78] ([i915#1982] / [i915#4391]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-18/igt@perf_pmu@module-unload.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-18/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@basic-write:
    - {shard-rkl}:        [SKIP][80] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@prime_vgem@basic-write.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@syncobj_wait@wait-delayed-signal:
    - {shard-dg1}:        [DMESG-WARN][82] ([i915#1982]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-13/igt@syncobj_wait@wait-delayed-signal.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-13/igt@syncobj_wait@wait-delayed-signal.html

  * igt@sysfs_heartbeat_interval@precise@rcs0:
    - {shard-dg1}:        [FAIL][84] ([i915#1755]) -> [PASS][85] +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-14/igt@sysfs_heartbeat_interval@precise@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-14/igt@sysfs_heartbeat_interval@precise@rcs0.html

  * igt@testdisplay:
    - {shard-rkl}:        [SKIP][86] ([i915#4098]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@testdisplay.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@testdisplay.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: ht

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/index.html

--===============5649742988481894441==
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
<tr><td><b>Series:</b></td><td>Add igt_doc.py (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114959/">https://patchwork.freedesktop.org/series/114959/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12841_full -&gt; IGTPW_8589_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8589_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-17/igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch.html">SKIP</a> +422 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1:<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-2/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-5/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12841_full and IGTPW_8589_full:</p>
<h3>New IGT tests (786)</h3>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@base:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@forcewake:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many-read-sync:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-cm-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-parallel-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-parallel-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-engines-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-many-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-preempt-fence-early:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindengine:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many-wait:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-once:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-once-wait:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-basic-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-basic-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-engines-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-rebind-imm:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cancel:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-engines-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-engines-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-engine-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@engine-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-cancel:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-cat-error:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-engines-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd-no-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-engine-reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@spin:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-cancel:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-cat-error:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-engines-close-fd:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-engine-reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind-err:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind-bindengine:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-rebind-bindengine:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-rebind-err:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-invalidate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_exec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_low_max:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_reset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_reset_multiple:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_suspend:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@rc0_on_exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@rc6_on_idle:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram-system:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmio@mmio-invalid:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmio@mmio-timestamp:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-config:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gts:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-hwconfig:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-query:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-size:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-mem-usage:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-topology:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-engine-many:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-engine-twice:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-many:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-twice:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-engines-independent:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-one-bo-many-times-many-vm:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-8388608:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2097152:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-1073741824:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-16777216:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-2147483648:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-268435456:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-33554432:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-4194304:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-536870912:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-8388608:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-1073741824:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-134217728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-16777216:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-2097152:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-2147483648:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-268435456:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-33554432:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-4194304:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-536870912:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-8388608:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-binds-3145728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-misaligned-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-misaligned-binds-3145728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-3145728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-3145728:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-front:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-either-side-full:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-either-side-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-either-side-full:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-end:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-front:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-all:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-end:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-front:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-one-partial:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@scratch:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde-page:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde3-page:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@unbind-all-2-vmas:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@unbind-all-8-vmas:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-async-ops-err:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-async-ops-err-destroy:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@test:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8589_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">ABORT</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#4275])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +808 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl2/igt@kms_content_protection@legacy@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@many-bindengine-rebind} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-7/igt@xe_exec_basic@many-bindengine-rebind.html">SKIP</a> ([fdo#109315] / [i915#2575]) +614 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@large-binds-536870912} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-3/igt@xe_vm@large-binds-536870912.html">SKIP</a> ([fdo#109315]) +748 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@large-userptr-misaligned-binds-2097152} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +785 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@fbdev@info.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@fbdev@info.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_barrier_race@remote-request@rcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl4/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> ([i915#8211] / [i915#8234]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl6/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@i915_pm_dc@dc6-psr.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@i915_suspend@debugfs-reader.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@i915_suspend@debugfs-reader.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">SKIP</a> ([i915#1845]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">ABORT</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-1/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> ([i915#1072]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@kms_psr@primary_mmap_gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-b:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-busy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-tglu-6/igt@kms_vblank@pipe-d-wait-forked-busy.html">SKIP</a> ([i915#1845] / [i915#7651]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-tglu-5/igt@kms_vblank@pipe-d-wait-forked-busy.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@perf@polling-small-buf.html">FAIL</a> ([i915#1722]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-4/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@perf_pmu@idle@rcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-18/igt@perf_pmu@module-unload.html">DMESG-WARN</a> ([i915#1982] / [i915#4391]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-18/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / [i915#3291] / [i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@wait-delayed-signal:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-13/igt@syncobj_wait@wait-delayed-signal.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-13/igt@syncobj_wait@wait-delayed-signal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-dg1-14/igt@sysfs_heartbeat_interval@precise@rcs0.html">FAIL</a> ([i915#1755]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-dg1-14/igt@sysfs_heartbeat_interval@precise@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12841/shard-rkl-2/igt@testdisplay.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8589/shard-rkl-6/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============5649742988481894441==--
