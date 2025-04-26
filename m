Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76843C369CB
	for <igt-dev@archiver.kernel.org>; Sat, 26 Apr 2025 10:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E49D10E347;
	Sat, 26 Apr 2025 10:21:27 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE3010E347;
 Sat, 26 Apr 2025 10:21:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3112176339246700856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/xe=3A_Add_system=5Fa?=
 =?utf-8?q?llocator_test_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 26 Apr 2025 10:21:25 -0000
Message-ID: <174566288553.14602.935963572997298078@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250425182011.693273-1-matthew.brost@intel.com>
In-Reply-To: <20250425182011.693273-1-matthew.brost@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============3112176339246700856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add system_allocator test (rev5)
URL   : https://patchwork.freedesktop.org/series/137545/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8339_FULL -> XEIGTPW_13046_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13046_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13046_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13046_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-433/igt@kms_hdr@static-toggle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_multiple@tiling-4@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_plane_multiple@tiling-4@pipe-c-dp-4.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * {igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] +1373 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][7] +129 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][8] +100 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  
New tests
---------

  New tests have been introduced between XEIGT_8339_FULL and XEIGTPW_13046_FULL:

### New IGT tests (1536) ###

  * igt@xe_exec_system_allocator@evict-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 26.77] s

  * igt@xe_exec_system_allocator@evict-malloc-mix-bo:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@fault-benchmark:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.33] s

  * igt@xe_exec_system_allocator@fault-process-benchmark:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.16] s

  * igt@xe_exec_system_allocator@fault-process-same-page-benchmark:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.54] s

  * igt@xe_exec_system_allocator@fault-threads-benchmark:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.69] s

  * igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.87] s

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@many-execqueues-free-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-execqueues-free-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.42] s

  * igt@xe_exec_system_allocator@many-execqueues-free-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-fork-read:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.81] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.29] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.91] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.34] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.95] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.21] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.63] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.47] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.63] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.04] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.35] s

  * igt@xe_exec_system_allocator@many-execqueues-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@xe_exec_system_allocator@many-execqueues-new-bo-map:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@xe_exec_system_allocator@many-execqueues-new-busy:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@many-execqueues-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.42] s

  * igt@xe_exec_system_allocator@many-execqueues-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.28] s

  * igt@xe_exec_system_allocator@many-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@many-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@many-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.28] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.48] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.15] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.39] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.59] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.66] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.73] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.85] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.50] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.64] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.76] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.78] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.27] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.44] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.42] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.15] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.73] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [1.93, 7.84] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.84] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.76] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.27] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.98] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.85] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.79] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.43] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.13] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.84] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.31] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.67] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.40] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.81] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.09] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.68] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.64] s

  * igt@xe_exec_system_allocator@many-large-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.18] s

  * igt@xe_exec_system_allocator@many-large-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.45] s

  * igt@xe_exec_system_allocator@many-large-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 11.40] s

  * igt@xe_exec_system_allocator@many-large-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.23] s

  * igt@xe_exec_system_allocator@many-large-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@xe_exec_system_allocator@many-large-malloc-bo-unmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@many-large-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@many-large-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.31] s

  * igt@xe_exec_system_allocator@many-large-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.80] s

  * igt@xe_exec_system_allocator@many-large-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@many-large-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@xe_exec_system_allocator@many-large-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@many-large-malloc-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@xe_exec_system_allocator@many-large-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@xe_exec_system_allocator@many-large-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@xe_exec_system_allocator@many-large-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@many-large-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.62] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.52] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.05] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@xe_exec_system_allocator@many-large-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@many-large-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@xe_exec_system_allocator@many-large-mmap-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.70] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.47] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.63] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.33] s

  * igt@xe_exec_system_allocator@many-large-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@many-large-mmap-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-large-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.95] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.05] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.49] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.36] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.05] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.92] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.88] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.63] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.81] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.31] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@xe_exec_system_allocator@many-large-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@xe_exec_system_allocator@many-large-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@xe_exec_system_allocator@many-large-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.29] s

  * igt@xe_exec_system_allocator@many-large-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.85] s

  * igt@xe_exec_system_allocator@many-large-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.03] s

  * igt@xe_exec_system_allocator@many-large-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.97] s

  * igt@xe_exec_system_allocator@many-large-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.19] s

  * igt@xe_exec_system_allocator@many-large-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.69] s

  * igt@xe_exec_system_allocator@many-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@many-malloc-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@many-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@many-malloc-fork-read:
    - Statuses : 2 pass(s)
    - Exec time: [6.72, 12.62] s

  * igt@xe_exec_system_allocator@many-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.10] s

  * igt@xe_exec_system_allocator@many-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@many-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@many-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@many-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@many-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@many-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@xe_exec_system_allocator@many-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@many-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@many-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@xe_exec_system_allocator@many-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@xe_exec_system_allocator@many-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.27] s

  * igt@xe_exec_system_allocator@many-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@many-mmap-mlock-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@xe_exec_system_allocator@many-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@xe_exec_system_allocator@many-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.73] s

  * igt@xe_exec_system_allocator@many-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@xe_exec_system_allocator@many-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@many-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@many-mmap-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@xe_exec_system_allocator@many-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.83] s

  * igt@xe_exec_system_allocator@many-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.90] s

  * igt@xe_exec_system_allocator@many-mmap-remap-dontunmap-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.20] s

  * igt@xe_exec_system_allocator@many-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.24] s

  * igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.31] s

  * igt@xe_exec_system_allocator@many-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@xe_exec_system_allocator@many-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@many-mmap-shared-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@xe_exec_system_allocator@many-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.57] s

  * igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.82] s

  * igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@xe_exec_system_allocator@many-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.47] s

  * igt@xe_exec_system_allocator@many-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.23] s

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@xe_exec_system_allocator@many-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@many-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.35] s

  * igt@xe_exec_system_allocator@many-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@many-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@many-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@xe_exec_system_allocator@many-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@xe_exec_system_allocator@many-stride-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.88] s

  * igt@xe_exec_system_allocator@many-stride-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@xe_exec_system_allocator@many-stride-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.36] s

  * igt@xe_exec_system_allocator@many-stride-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@xe_exec_system_allocator@many-stride-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@xe_exec_system_allocator@many-stride-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.35] s

  * igt@xe_exec_system_allocator@many-stride-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@many-stride-malloc-fork-read:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 12.68] s

  * igt@xe_exec_system_allocator@many-stride-malloc-fork-read-after:
    - Statuses : 2 pass(s)
    - Exec time: [9.56, 15.04] s

  * igt@xe_exec_system_allocator@many-stride-malloc-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.29] s

  * igt@xe_exec_system_allocator@many-stride-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@xe_exec_system_allocator@many-stride-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-stride-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@many-stride-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@many-stride-mmap:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.26] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.33] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.84] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.94] s

  * igt@xe_exec_system_allocator@many-stride-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.25] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.86] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.81] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.49] s

  * igt@xe_exec_system_allocator@many-stride-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@many-stride-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@many-stride-mmap-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.37] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.91] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.96] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.75] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.56] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.20] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.16] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.06] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.49] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.65] s

  * igt@xe_exec_system_allocator@many-stride-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.16] s

  * igt@xe_exec_system_allocator@many-stride-new-bo-map:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.35] s

  * igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@xe_exec_system_allocator@many-stride-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.18] s

  * igt@xe_exec_system_allocator@many-stride-new-busy-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 2.83] s

  * igt@xe_exec_system_allocator@many-stride-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.43] s

  * igt@xe_exec_system_allocator@many-stride-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.82] s

  * igt@xe_exec_system_allocator@many-stride-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@xe_exec_system_allocator@once-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-large-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@once-large-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-large-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-large-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-large-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@once-large-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-malloc-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@once-large-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@once-large-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@once-large-malloc-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-large-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-malloc-multi-fault:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@once-large-malloc-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@once-large-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@once-large-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@once-large-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-large-mmap-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_system_allocator@once-large-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@once-large-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@once-large-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-dontunmap:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-ro:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-large-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-large-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-large-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-large-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@once-large-new-bo-map-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-new-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@once-large-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@once-large-new-race-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@once-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-malloc-fork-read:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@once-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@once-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-malloc-multi-fault:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_system_allocator@once-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-free-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-mmap-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-mmap-remap-ro:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-new:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@once-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-new-bo-map-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-new-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@once-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@partial-middle-munmap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@partial-middle-munmap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@partial-middle-remap-cpu-fault:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@partial-munmap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@partial-munmap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@partial-remap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.27] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_system_allocator@process-many-free:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@xe_exec_system_allocator@process-many-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.64] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.85] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.37] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.02] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@process-many-large-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@process-many-large-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@xe_exec_system_allocator@process-many-large-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.26] s

  * igt@xe_exec_system_allocator@process-many-large-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-fork-read:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-mlock:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-large-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-mlock-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.93] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.90] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.53] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.87] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.75] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@xe_exec_system_allocator@process-many-large-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.74] s

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@xe_exec_system_allocator@process-many-large-new-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@xe_exec_system_allocator@process-many-large-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@xe_exec_system_allocator@process-many-large-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.75] s

  * igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.91] s

  * igt@xe_exec_system_allocator@process-many-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@process-many-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@process-many-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-malloc-mlock:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-malloc-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.12] s

  * igt@xe_exec_system_allocator@process-many-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@process-many-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.19] s

  * igt@xe_exec_system_allocator@process-many-mmap-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@process-many-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-ro:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@process-many-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@process-many-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-new-race-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-stride-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.05] s

  * igt@xe_exec_system_allocator@process-many-stride-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@xe_exec_system_allocator@process-many-stride-free-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@xe_exec_system_allocator@process-many-stride-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.92] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-fork-read:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.14] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.19] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.79] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.35] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.88] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-stride-new:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@xe_exec_system_allocator@process-many-stride-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@xe_exec_system_allocator@process-many-stride-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@process-many-stride-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@process-many-stride-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@xe_exec_system_allocator@process-many-stride-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@xe_exec_system_allocator@process-many-stride-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.90] s

  * igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.93] s

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 21.39] s

  * igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-multi-fault:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.32] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@threads-many-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.09] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.00] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.37] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 7.59] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.33] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.49] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.95] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.69] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.37] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.67] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.29] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.83] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.02] s

  * igt@xe_exec_system_allocator@threads-many-large-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.58] s

  * igt@xe_exec_system_allocator@threads-many-large-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@xe_exec_system_allocator@threads-many-large-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@xe_exec_system_allocator@threads-many-large-free-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.90, 4.81] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.94] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.42] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap:
    - Statuses : 2 pass(s)
    - Exec time: [1.17, 6.57] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.81] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.37] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.25] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.29] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.06] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.34] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.49] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.95] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.20] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.25] s

  * igt@xe_exec_system_allocator@threads-many-large-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.79] s

  * igt@xe_exec_system_allocator@threads-many-large-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.25] s

  * igt@xe_exec_system_allocator@threads-many-large-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.96] s

  * igt@xe_exec_system_allocator@threads-many-large-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.77] s

  * igt@xe_exec_system_allocator@threads-many-large-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.38] s

  * igt@xe_exec_system_allocator@threads-many-large-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@threads-many-large-new-race-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@threads-many-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-many-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-many-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@threads-many-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@threads-many-mmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@threads-many-mmap-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-mmap-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-dontunmap:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-dontunmap:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-many-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@threads-many-new-bo-map:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@threads-many-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-many-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@threads-many-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-many-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-stride-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.17] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.09] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.98] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-multi-fault:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.23] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.36] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.58] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.28] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [0.82, 3.81] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.90] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.57] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.71] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.89] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.16] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.00] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@xe_exec_system_allocator@threads-many-stride-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.85] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.15] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.95] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.79] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.86] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.53] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@xe_exec_system_allocator@threads-shared-alloc-many-stride-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-shared-alloc-many-stride-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-alloc-many-stride-malloc-sync:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.31] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-fork-read-after:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-multi-fault:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.97] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.95] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.46] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.94] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.66] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.26] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.86] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.36] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.84] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.52] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.04] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.83] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.69] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.64] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.51] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.46] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.70] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.74] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.83] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.31] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.05] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.36] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.07] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.88] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.67] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.19] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.27] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.92] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.76] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.93] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.84] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap:
    - Statuses : 2 pass(s)
    - Exec time: [1.70, 8.58] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.40] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.70] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.90] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro-dontunmap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.71] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.86] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [1.65, 2.73] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.55] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.35] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.29] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.37] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.43] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.98] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.39] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.45] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.04] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.33] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.55] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-multi-fault:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.30] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.80] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.44] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.40] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [1.02, 2.88] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.29] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.82] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.38] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.50] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.29] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.78] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-remap:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.42] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.84] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.79] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.89] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.87] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.86] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.35] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.71] s

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@twice-free:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-free-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-free-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@twice-large-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@twice-large-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@twice-large-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@twice-large-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@twice-large-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@twice-large-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@twice-large-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@twice-large-malloc-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-large-malloc-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@twice-large-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-large-mmap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-large-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-large-mmap-file-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_system_allocator@twice-large-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-large-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@twice-large-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@twice-large-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@twice-large-mmap-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@twice-large-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-dontunmap-eocheck:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-ro-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-large-mmap-shared-remap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@twice-large-new-busy-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@twice-large-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@twice-large-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-malloc-busy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-malloc-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@twice-malloc-fork-read-after:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@twice-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-malloc-multi-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@twice-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-malloc-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-free:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-free-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-free-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-free-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@twice-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-new-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-remap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@twice-mmap-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-remap-eocheck:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-new-bo-map-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-new-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@unaligned-alloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13046_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2233])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#623])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1466])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3157])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#911]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3279])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3658])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1512])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +8 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#787]) +195 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#3432])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#306]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#373]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2341])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#307])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#3278])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2321])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#308])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2321])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#323])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2291]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#309]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#1475])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#4294])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2244])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2244]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#701])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1421]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#3321]) +2 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#301]) +7 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#301])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2316])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][75] ([Intel XE#301]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][76] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#886]) +4 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#2882]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293] / [Intel XE#2380])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1401]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2311]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2312]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651]) +13 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#651]) +10 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +13 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2313]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#656]) +23 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1470])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1503])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#616]) +3 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#616])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#599]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#4596])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][101] ([Intel XE#4427])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2493])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2763]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2763]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1439] / [Intel XE#3141])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2893]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1489])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2893] / [Intel XE#4608]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4608]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1489]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1128])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4609]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1406]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3414])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#3414] / [Intel XE#3904])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1127])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2330])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1127])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#1435])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#1729])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#362])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#756])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#756])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1123])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4837]) +9 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4837]) +7 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#4837]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#4518])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#688]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2322]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1392]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1392]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1392]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#288]) +16 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2360])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#584]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#560])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#4045])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#378])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@xe_module_load@force-load.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#977])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2284])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2284] / [Intel XE#366])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][149] -> [ABORT][150] ([Intel XE#1794])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#944])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#3342])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@master-rmfb:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#4208] / [i915#2575]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-432/igt@kms_addfb_basic@master-rmfb.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_addfb_basic@master-rmfb.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:
    - shard-lnl:          [FAIL][155] ([Intel XE#3719] / [Intel XE#911]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][157] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          [SKIP][161] ([Intel XE#2320]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x64.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][163] ([Intel XE#2291]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [FAIL][165] -> [PASS][166] +4 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][167] ([Intel XE#2373]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][169] ([Intel XE#2882]) -> [PASS][170] +9 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][171] ([Intel XE#2316]) -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][173] ([Intel XE#2882] / [Intel XE#4309]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][175] ([Intel XE#4309]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][177] ([Intel XE#301]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][179] ([Intel XE#301]) -> [PASS][180] +2 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][181] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][183] ([Intel XE#1503]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@kms_hdr@static-swap.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-bmg:          [FAIL][185] ([Intel XE#4891]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][187] ([Intel XE#4692]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][189] ([Intel XE#4794] / [Intel XE#4807]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_setmode@basic.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][191] ([Intel XE#4807]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][193] ([Intel XE#4794]) -> [PASS][194] +4 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][195] ([Intel XE#2883]) -> [PASS][196] +3 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][197] ([Intel XE#1435]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [FAIL][199] ([Intel XE#4892]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_vblank@query-busy.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_vblank@query-busy.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-system-vram01-241x241:
    - shard-bmg:          [DMESG-WARN][201] ([Intel XE#3428]) -> [PASS][202] +13 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-system-vram01-241x241.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-system-vram01-241x241.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1392]) -> [PASS][204] +6 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][205] ([Intel XE#1794]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-lnl-2/igt@xe_pm@s4-basic.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@xe_pm@s4-basic.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4208]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-dg2-432/igt@xe_vm@munmap-style-unbind-one-partial.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#3428]) -> [SKIP][210] ([Intel XE#2316])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][211] ([Intel XE#2311]) -> [SKIP][212] ([Intel XE#2312]) +9 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#4141]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][215] ([Intel XE#4141]) -> [SKIP][216] ([Intel XE#2312]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][217] ([Intel XE#2312]) -> [SKIP][218] ([Intel XE#2311]) +17 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#2313]) -> [SKIP][220] ([Intel XE#2312]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#2313]) +20 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][223] ([Intel XE#4596]) -> [SKIP][224] ([Intel XE#2493])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [SKIP][248], [PASS][249], [PASS][250]) ([Intel XE#2457]) -> ([PASS][251], [SKIP][252], [PASS][253], [PASS][254], [PASS][255], [DMESG-WARN][256], [DMESG-WARN][257], [PASS][258], [DMESG-WARN][259], [DMESG-WARN][260], [DMESG-WARN][261], [DMESG-WARN][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276]) ([Intel XE#2457] / [Intel XE#3428])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-8/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-8/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-7/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-7/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-7/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-1/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4309
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794
  [Intel XE#4807]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4891
  [Intel XE#4892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8339 -> IGTPW_13046

  IGTPW_13046: 13046
  IGT_8339: 8339
  xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20: 6e67a7af43567bb9f23fe156fde7efa3d214fd20

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/index.html

--===============3112176339246700856==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/xe: Add system_allocator test (rev5)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137545/">https://patchwork.freedesktop.org/series/137545/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13046/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13046/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8339_FULL -&gt; XEIGTPW_13046_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13046_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13046_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
046_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-433/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-434=
/igt@kms_hdr@static-toggle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_plane_multiple@tiling-4@pi=
pe-c-dp-4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13046/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">=
INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontu=
nmap-eocheck} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@xe_exec_system_allocator@threa=
ds-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> +1373 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-mmap-free-huge.html">FAIL</a> +129 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-mmap-new-huge.html">FAIL</a> +100 other tests fa=
il</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8339_FULL and XEIGTPW_13046=
_FULL:</p>
<h3>New IGT tests (1536)</h3>
<ul>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 26.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc-mix-bo:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-benchmark:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-process-benchmark:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-process-same-page-benchmark:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-threads-benchmark:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap-nomemset:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-fork-read:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eochec=
k:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eoc=
heck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap-dontunmap=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap-dontunmap=
-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-remap-eocheck:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race-nomemset:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read-afte=
r:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge-nomems=
et:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race-nomems=
et:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</=
p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock-nomemset:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemse=
t:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race-nomemset:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-dontunmap:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.93, 7.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-dontunmap-=
eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-eocheck:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunm=
ap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunm=
ap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-eocheck=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-nomemset:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-don=
tunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-don=
tunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-eoc=
heck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map-nomemset:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 11.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 15.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eoch=
eck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.72, 12.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap-eocheck:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-fork-read:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 12.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.56, 15.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap-eocheck:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.75] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap-eocheck=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap-eoc=
heck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-multi-fault:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap-eocheck:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-shared-remap-dontunmap-eoch=
eck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-race-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-fork-read:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-multi-fault:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-remap-dontunmap-eocheck:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-cpu-fault:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-fork-read:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-fork-read-af=
ter:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomems=
et:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-race-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nome=
mset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomem=
set:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-nomemset:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunma=
p:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunma=
p-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-eocheck:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontu=
nmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontu=
nmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eoche=
ck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-nomemse=
t:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-d=
ontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-d=
ontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-e=
ocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unm=
ap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unm=
ap-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-n=
omemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-r=
ead:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-r=
ead-after:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-=
fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomems=
et:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlo=
ck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlo=
ck-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-hug=
e:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-hug=
e-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-rac=
e:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nom=
emset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge=
-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nome=
mset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race=
-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-do=
ntunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-do=
ntunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-eo=
check:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro=
-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro=
-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-r=
emap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-r=
emap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-r=
emap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-r=
emap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-fork-read:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-fork-read-after:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-mlock:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:=
</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:<=
/p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap-eoc=
heck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap-=
eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-eocheck:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontun=
map:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-eochec=
k:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-dontunmap-eocheck:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-ro:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap-eochec=
k:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-remap-dontunmap:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-remap-dontunmap-eo=
check:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap-nomemse=
t:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-busy-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-fork-read:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-fork-read-after:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-race-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge-nomemset=
:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:=
</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eo=
check:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap=
-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontu=
nmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontu=
nmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-eoche=
ck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 21.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-fork-read:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-fork-read-af=
ter:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock-nomems=
et:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-multi-fault:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemse=
t:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nome=
mset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomem=
set:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race-nomem=
set:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunma=
p:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunma=
p-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-eocheck:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro-dontu=
nmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro-dontu=
nmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro-eoche=
ck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-d=
ontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-d=
ontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-e=
ocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map-nomemset=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unm=
ap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unm=
ap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-r=
ead:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-r=
ead-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-=
fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-nomems=
et:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlo=
ck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlo=
ck-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-hug=
e:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-hug=
e-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-rac=
e:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nom=
emset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock-no=
memset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-nome=
mset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race=
-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-do=
ntunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 7.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-do=
ntunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-eo=
check:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-r=
emap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-r=
emap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-r=
emap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-r=
emap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy-nome=
mset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.90, 4.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read-after:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-mlock-nomemset:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:=
</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-race-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:<=
/p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race-nomemset:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.17, 6.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eoc=
heck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap-=
eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-eocheck:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-eochec=
k:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-dontunmap-eocheck:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-dontunmap-eochec=
k:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-dontunmap:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-dontunmap-eo=
check:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock-nomemset:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-multi-fault:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock-nomemse=
t:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset=
:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:=
</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race-nomemset:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap-eo=
check:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.82, 3.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.90] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap=
-eocheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-eocheck:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-nomemset:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap-dontu=
nmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap-dontu=
nmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-remap-eoche=
ck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-alloc-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-alloc-many-stride-malloc-rac=
e:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-alloc-many-stride-malloc-syn=
c:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race=
:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race=
-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo=
-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo=
-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bu=
sy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bu=
sy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-fo=
rk-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-fo=
rk-read-after:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-ml=
ock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-ml=
ock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mu=
lti-fault:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-no=
memset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-ra=
ce:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-ra=
ce-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file=
-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file=
-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file=
-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mloc=
k:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mloc=
k-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-nome=
mset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race=
-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-ro-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy-=
nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-=
nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-race-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fre=
e:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fre=
e-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fre=
e-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fre=
e-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-dontunmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro-eocheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unma=
p:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unma=
p-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-re=
ad:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-re=
ad-after:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-f=
ault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-nomemse=
t:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race-no=
memset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mloc=
k:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mloc=
k-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-nome=
mset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge=
:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge=
-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-nome=
mset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race=
-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge-nome=
mset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:=
</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-=
nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-=
nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-nomemset:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.70, 8.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-don=
tunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-don=
tunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-eoc=
heck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.90] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro-=
dontunmap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro-=
dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-ro-=
eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-re=
map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-re=
map-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.65, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-re=
map-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-re=
map-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomem=
set:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy-nomemset=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read-aft=
er:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock-nomemse=
t:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomem=
set:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race-nomem=
set:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:<=
/p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge-nomems=
et:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race-nomems=
et:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race-nomemset:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap=
-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-eocheck:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontun=
map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontun=
map-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-eochec=
k:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-do=
ntunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-do=
ntunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-eo=
check:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unm=
ap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unm=
ap-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-r=
ead:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-r=
ead-after:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock-=
nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-multi-=
fault:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-nomems=
et:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlo=
ck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlo=
ck-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-nom=
emset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-rac=
e:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nom=
emset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge=
-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race=
-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-nomemset=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nom=
emset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-do=
ntunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.02, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-do=
ntunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro=
-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro=
-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-n=
omemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-r=
emap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-r=
emap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-r=
emap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-r=
emap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy-nome=
mset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-nomemset:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nome=
mset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-=
malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-=
malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-dontunmap-eocheck:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-ro-dontunmap-eocheck=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared-remap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap-eoc=
heck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-busy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-multi-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-race:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@unaligned-alloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13046_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_bw@connected-linear-tiling=
-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_bw@linear-tiling-3-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +195 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_chamelium_color@degamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-=
nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_content_protection@atomic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_content_protection@dp-mst-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
46/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel =
XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046=
/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4=
294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_dsc@dsc-with-output-format=
s-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13046/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@=
c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13046/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-=
hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13046/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interrup=
tible@b-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +23 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
70">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-432/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2=
-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/sha=
rd-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-434/igt@kms_plane_multiple@tiling-4.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4427">Intel XE#4427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip<=
/li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_psr@fbc-psr-cursor-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@kms_psr@fbc-psr2-no-drrs@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046=
/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@kms_tiled_display@basic-test-p=
attern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-3/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_writeback@writeback-fb-id.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-=
0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@xe_eudebug@basic-close.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extende=
d-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@xe_eudebug@discovery-empty.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-st=
andalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13046/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-7/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@xe_mmap@pci-membarrier-bad-objec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">I=
ntel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-lnl-6/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-2=
/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@master-rmfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-432/igt@kms_addfb_basic@master-rmfb.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13046/shard-dg2-433/igt@kms_addfb_basic@master-rmfb.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1=
-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic@pipe-c-edp-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-lnl-=
7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-=
linear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2160x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13046/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-cc=
s-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x64.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13046/shard-bmg-7/igt@kms_cursor_crc@cursor-random-64x64.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13046/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html"=
>FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13046/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">PASS=
</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13046/shard-bmg-8/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13046/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race@cd-=
dp2-hdmi-a3.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4309">Intel XE#4309</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_flip@blocking=
-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptib=
le@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4309">Intel XE#4309</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_flip@blocking-absolut=
e-wf_vblank-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13046/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi=
-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@kms_flip@flip-vs-expired-vbl=
ank@c-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/sha=
rd-bmg-3/igt@kms_hdr@static-swap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4891=
">Intel XE#4891</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13046/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-untiled.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4692">Intel XE#4692</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13046/shard-lnl-1/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4794">Intel XE#4794</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807">Intel =
XE#4807</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13046/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807">Intel XE=
#4807</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13046/shard-bmg-8/igt@kms_setmode@basic@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794">Inte=
l XE#4794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13046/shard-bmg-8/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">PASS</a>=
 +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">In=
tel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13046/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS=
</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13046/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_vblank@query-busy.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892">Intel XE#4892</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/s=
hard-bmg-5/igt@kms_vblank@query-busy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-system-vram01-241x241:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajo=
r-compressed-compfmt0-system-vram01-241x241.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1304=
6/shard-bmg-8/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compres=
sed-compfmt0-system-vram01-241x241.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-dg2-435/igt@xe_exec_basi=
c@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +6 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-l=
nl-7/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-dg2-432/igt@xe_vm@munmap-style-unbind-one-partial.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13046/shard-dg2-433/igt@xe_vm@munmap-style-unbind-one-partial.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8339/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13046/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE=
#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8339/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8339/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8339/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8339/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8339/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
339/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8339/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8339/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8339/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
46/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13046/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13046/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/=
igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13046/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/sha=
rd-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-6/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13046/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
46/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13046/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-7/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13046/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-5/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13046/shard-bmg-1/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13046/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13046/shard-bmg-8/igt@xe_module_load@load.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8339 -&gt; IGTPW_13046</li>
</ul>
<p>IGTPW_13046: 13046<br />
  IGT_8339: 8339<br />
  xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20: 6e67a7af43567bb9f23fe15=
6fde7efa3d214fd20</p>

</body>
</html>

--===============3112176339246700856==--
