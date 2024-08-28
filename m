Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B832CC54E71
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 10:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ABF10E355;
	Wed, 28 Aug 2024 10:10:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEE210E355;
 Wed, 28 Aug 2024 10:10:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8977612034974783642=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/xe=3A_Add_system=5Fallo?=
 =?utf-8?q?cator_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Aug 2024 10:10:27 -0000
Message-ID: <172483982713.809918.14918522278426463019@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827231653.2580766-1-matthew.brost@intel.com>
In-Reply-To: <20240827231653.2580766-1-matthew.brost@intel.com>
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

--===============8977612034974783642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add system_allocator test (rev2)
URL   : https://patchwork.freedesktop.org/series/137545/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7993_full -> XEIGTPW_11648_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11648_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11648_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11648_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_pm_rpm@i2c.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_pm_rpm@i2c.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][5] +1062 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][6] +1033 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race (NEW):
    - {shard-bmg}:        NOTRUN -> [SKIP][7] +1068 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-lnl:          [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-1/igt@xe_oa@invalid-oa-format-id.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@xe_oa@invalid-oa-format-id.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][10] ([Intel XE#1473]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-suspend@d-dp2:
    - {shard-bmg}:        [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-dp2.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-1/igt@kms_flip@flip-vs-suspend@d-dp2.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [PASS][14] -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@xe_evict@evict-cm-threads-large.html

  
New tests
---------

  New tests have been introduced between XEIGT_7993_full and XEIGTPW_11648_full:

### New IGT tests (1074) ###

  * igt@xe_exec_system_allocator@evict-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@evict-malloc-mix-bo:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@fault-benchmark:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@fault-threads-benchmark:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-middle-munmap-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-middle-munmap-no-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-middle-remap-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-munmap-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-munmap-no-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-remap-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-file-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-free-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-mlock:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-shared:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-bo-map:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-busy:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-busy-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-race:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-new-race-nomemset:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@unaligned-alloc:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11648_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#827]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#2191])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1399]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#373]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1424])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#323])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [i915#3804])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#776])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#701])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1551]) +1 other test dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#651])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2340])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#324]) +1 other test dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-1/igt@kms_plane@plane-position-covered.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-lnl:          [PASS][45] -> [DMESG-WARN][46] ([Intel XE#324]) +3 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#1430])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1489])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_psr@psr2-primary-render.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#771] / [Intel XE#899])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#899])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#756])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1050])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#944]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#2623])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-4/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#2623])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#688])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][65] -> [FAIL][66] ([Intel XE#1600])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#1000])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1392])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#288])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#2360])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#2514])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][75] ([Intel XE#2514])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][77] -> [DMESG-WARN][78] ([Intel XE#1551] / [Intel XE#569])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][79] -> [ABORT][80] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#944])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1130] / [Intel XE#1201])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][83] ([Intel XE#911]) -> [PASS][84] +3 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x:
    - {shard-bmg}:        [DMESG-WARN][85] ([Intel XE#1033]) -> [PASS][86] +3 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][87] ([Intel XE#664]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_async_flips@test-cursor.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-3/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][89] ([Intel XE#1426]) -> [PASS][90] +3 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][91] -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [INCOMPLETE][93] ([Intel XE#1195]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - {shard-bmg}:        [INCOMPLETE][95] ([Intel XE#2597]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][97] -> [PASS][98] +2 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][99] ([Intel XE#886]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][101] ([Intel XE#324]) -> [PASS][102] +2 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][103] ([Intel XE#324]) -> [PASS][104] +2 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][105] ([Intel XE#361]) -> [PASS][106] +2 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [FAIL][107] ([Intel XE#1649]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][109] ([Intel XE#899]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][111] ([Intel XE#2443]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_vrr@flip-basic.html

  * igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:
    - shard-lnl:          [FAIL][113] -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][115] ([Intel XE#1473]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][117] ([Intel XE#2105]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - {shard-bmg}:        [DMESG-WARN][119] ([Intel XE#877]) -> [PASS][120] +7 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-5/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_oa@mmio-triggered-reports:
    - {shard-bmg}:        [FAIL][121] ([Intel XE#2249]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          [FAIL][123] ([Intel XE#2249]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][125] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_pm@s4-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#316]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][130] ([Intel XE#316]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#610]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#610])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][134] ([Intel XE#1124]) +10 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1124]) -> [SKIP][136] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][138] ([Intel XE#367]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#367]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#787]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][144] ([Intel XE#1252]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1252]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][150] ([Intel XE#787]) +48 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][154] ([Intel XE#306])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#306]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][158] ([Intel XE#373]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#373]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][162] ([Intel XE#307])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#308]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][166] ([Intel XE#308])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#323]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#323])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][170] ([Intel XE#323])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#703]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#703])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][174] ([Intel XE#455]) +17 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#651]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#651]) +24 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][178] ([Intel XE#651]) +23 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][180] ([Intel XE#653]) +24 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#653]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][184] ([Intel XE#605])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#455]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][188] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][190] ([Intel XE#2318]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#870]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#870])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1489]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][196] ([Intel XE#1489]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1122]) -> [SKIP][198] ([Intel XE#1122] / [Intel XE#1201])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#929]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][202] ([Intel XE#929]) +10 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1149]) -> [SKIP][204] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][206] ([Intel XE#327]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][208] ([Intel XE#1127])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1127]) -> [SKIP][210] ([Intel XE#1127] / [Intel XE#1201])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][212] ([Intel XE#756])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1123]) -> [SKIP][216] ([Intel XE#1123] / [Intel XE#1201])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][218] ([Intel XE#1123]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1126]) -> [SKIP][220] ([Intel XE#1126] / [Intel XE#1201])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#288]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][224] ([Intel XE#288]) +16 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2541]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_oa@mi-rpc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][228] ([Intel XE#2541]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][230] ([Intel XE#977])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][232] ([Intel XE#2284] / [Intel XE#366])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][234] ([Intel XE#944])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#944]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#944]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_7993 -> IGTPW_11648
  * Linux: xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b -> xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4

  IGTPW_11648: 11648
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b
  xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4: 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/index.html

--===============8977612034974783642==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add system_allocator test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137545/">https://patchwork.freedesktop.org/series/137545/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7993_full -&gt; XEIGTPW_11648_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11648_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11648_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11648_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_pm_rpm@i2c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset.html">SKIP</a> +1062 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">FAIL</a> +1033 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> +1068 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-1/igt@xe_oa@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@xe_oa@invalid-oa-format-id.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-many-threads-large:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-1/igt@kms_flip@flip-vs-suspend@d-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@xe_evict@evict-cm-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7993_full and XEIGTPW_11648_full:</p>
<h3>New IGT tests (1074)</h3>
<ul>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc-mix-bo:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-benchmark:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-threads-benchmark:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
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
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@unaligned-alloc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11648_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-4/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623">Intel XE#2623</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623">Intel XE#2623</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-3/igt@kms_async_flips@test-cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@kms_plane@plane-position-hole.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-5/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-4/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-5/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11648/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7993 -&gt; IGTPW_11648</li>
<li>Linux: xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b -&gt; xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4</li>
</ul>
<p>IGTPW_11648: 11648<br />
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b<br />
  xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4: 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4</p>

</body>
</html>

--===============8977612034974783642==--
