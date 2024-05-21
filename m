Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A91C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 06:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2DA10E01F;
	Tue, 21 May 2024 06:08:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B28A10E01F;
 Tue, 21 May 2024 06:08:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6397191651345776642=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/xe=3A_Add_System_Alloca?=
 =?utf-8?q?tor_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 May 2024 06:08:06 -0000
Message-ID: <171627168632.2162015.1812199100482586294@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521041801.1515660-1-matthew.brost@intel.com>
In-Reply-To: <20240521041801.1515660-1-matthew.brost@intel.com>
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

--===============6397191651345776642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add System Allocator test
URL   : https://patchwork.freedesktop.org/series/133846/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7864_full -> XEIGTPW_11167_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_11167_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11167_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11167_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset} (NEW):
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html

  * {igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset} (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][2] +588 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-3/igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset.html

  * {igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][3] +989 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#1201]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - {shard-lnl}:        [SKIP][6] ([Intel XE#307]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - {shard-lnl}:        [SKIP][8] ([Intel XE#1424]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - {shard-lnl}:        [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-4/igt@kms_flip@dpms-vs-vblank-race.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race.html

  
New tests
---------

  New tests have been introduced between XEIGT_7864_full and XEIGTPW_11167_full:

### New IGT tests (1070) ###

  * igt@xe_exec_system_allocator@evict-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@evict-malloc-mix-bo:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 dmesg-fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-large-new-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-large-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-new-bo-map-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-free-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-stride-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-race-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@many-stride-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@many-stride-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-malloc-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@once-malloc-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@once-new-bo-map-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@once-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@once-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@once-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@partial-middle-munmap-cpu-fault:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@partial-middle-munmap-no-cpu-fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@partial-middle-remap-cpu-fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@partial-munmap-cpu-fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@partial-munmap-no-cpu-fault:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@partial-remap-cpu-fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@process-many-large-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_system_allocator@process-many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-file:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-file-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-free:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-stride-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-stride-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.18] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@process-many-stride-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-new-busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@process-many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-free:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-free-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-free-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-malloc:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-busy:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-busy-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@twice-malloc-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-malloc-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file-mlock:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-file-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-free:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-mlock:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-new:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-race:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-shared:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-mmap-shared-nomemset:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-new:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-bo-map:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-new-bo-map-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-new-busy:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_exec_system_allocator@twice-new-busy-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-race:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@twice-new-race-nomemset:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_system_allocator@unaligned-alloc:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11167_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][12] ([Intel XE#1548])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#827]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124] / [Intel XE#1201])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#1252])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-dg2-set2:     [PASS][24] -> [FAIL][25] ([Intel XE#581])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#282])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1135])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#1201]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#651]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#1201] / [Intel XE#417])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#616])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#1201] / [Intel XE#829])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_plane_multiple@tiling-x.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#870])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@universal-planes@plane-50:
    - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1195]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_pm_rpm@universal-planes@plane-50.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-50.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#929])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#771] / [Intel XE#899])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#899])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [PASS][55] -> [DMESG-WARN][56] ([Intel XE#1214])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * {igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset} (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][58] ([Intel XE#1699]) +76 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#1192] / [Intel XE#1201])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1551])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#944])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [DMESG-WARN][64] ([Intel XE#1162]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-dg2-set2:     [SKIP][66] ([Intel XE#1201] / [i915#6077]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_addfb_basic@bo-too-small.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_atomic@atomic-invalid-params:
    - {shard-lnl}:        [FAIL][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_atomic@atomic-invalid-params.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-7/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-dg2-set2:     [SKIP][70] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][72] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][74] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][75] +5 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][78] ([Intel XE#1214]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][80] ([Intel XE#1195]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - {shard-lnl}:        [INCOMPLETE][82] ([Intel XE#1595] / [Intel XE#1602] / [Intel XE#1760]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - {shard-lnl}:        [SKIP][84] ([Intel XE#1134]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - {shard-lnl}:        [INCOMPLETE][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][90] ([Intel XE#361]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms:
    - {shard-lnl}:        [FAIL][92] ([Intel XE#718]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [DMESG-WARN][94] -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
    - {shard-lnl}:        [DMESG-WARN][96] ([Intel XE#1830]) -> [PASS][97] +2 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - {shard-lnl}:        [SKIP][98] ([Intel XE#1733]) -> [PASS][99] +4 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][100] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - {shard-lnl}:        [SKIP][102] ([Intel XE#1699]) -> [PASS][103] +5 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_module_load@many-reload.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic-exec:
    - {shard-lnl}:        [ABORT][108] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_vm@large-split-binds-536870912:
    - {shard-lnl}:        [SKIP][110] ([Intel XE#1130] / [Intel XE#1699]) -> [PASS][111] +4 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@xe_vm@large-split-binds-536870912.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-6/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][113] ([Intel XE#316]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#316]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#829])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#610]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#610])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][123] ([Intel XE#1124]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1124]) -> [SKIP][125] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#346]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#346])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][129] ([Intel XE#367]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][131] ([Intel XE#1201])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#787]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][139] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][141] ([Intel XE#787]) +55 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][143] ([Intel XE#306]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_chamelium_color@degamma.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#373]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][147] ([Intel XE#373]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#307]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#307])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#308]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][152] ([Intel XE#1162]) -> [FAIL][153] ([Intel XE#616]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#282]) -> [DMESG-WARN][155] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][157] ([Intel XE#1214] / [Intel XE#282])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#323]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#323])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][161] ([Intel XE#323]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][162] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][163] ([Intel XE#282]) +3 other tests dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][165] ([Intel XE#1214] / [Intel XE#282])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_cursor_legacy@single-move.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#703]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#703])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][168] ([Intel XE#1195]) -> [DMESG-WARN][169] ([Intel XE#1162] / [Intel XE#1214])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#651]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][173] ([Intel XE#651])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][175] ([Intel XE#651]) +15 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#653]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][179] ([Intel XE#1201])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#653])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][183] ([Intel XE#653]) +17 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#356]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#356])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#455]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][189] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][191] ([Intel XE#904] / [Intel XE#909])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#909]) -> [TIMEOUT][193] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][194] ([Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][195] ([Intel XE#904] / [Intel XE#909])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][197] ([Intel XE#305] / [Intel XE#455])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][199] ([Intel XE#305]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][201] ([Intel XE#870])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_pm_backlight@fade.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][203] ([Intel XE#908])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][205] ([Intel XE#1122])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1122]) -> [SKIP][207] ([Intel XE#1122] / [Intel XE#1201])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#929]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][211] ([Intel XE#929]) +11 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@pr-suspend:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][215] ([Intel XE#1201])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_psr@pr-suspend.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][217] ([Intel XE#1127])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][219] ([Intel XE#327])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#327]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][222] ([Intel XE#1162]) -> [DMESG-WARN][223] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][225] ([Intel XE#1201]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][227] ([Intel XE#455]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_vrr@flipline.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][229] ([Intel XE#756])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][231] ([Intel XE#1091])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1091]) -> [SKIP][233] ([Intel XE#1091] / [Intel XE#1201])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#288]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][237] ([Intel XE#288]) +14 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [INCOMPLETE][238] ([Intel XE#1195]) -> [DMESG-WARN][239] ([Intel XE#1214] / [Intel XE#1638])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#560]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#560])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][243] ([Intel XE#366]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][244] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][245] ([Intel XE#1162])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#366]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#366])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#944]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_query@multigpu-query-config.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][251] ([Intel XE#944]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][252] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][253] ([Intel XE#1760])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7864 -> IGTPW_11167
  * Linux: xe-1310-1ba62f8cea9c797427d45108df1d453f4b343240 -> xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde

  IGTPW_11167: 11167
  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1310-1ba62f8cea9c797427d45108df1d453f4b343240: 1ba62f8cea9c797427d45108df1d453f4b343240
  xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde: 3addfb8584a4fcbff8123461682e5bdfd8785bde

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/index.html

--===============6397191651345776642==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add System Allocator test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133846/">https://patchwork.freedesktop.org/series/133846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7864_full -&gt; XEIGTPW_11167_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_11167_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11167_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11167_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-3/igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset.html">SKIP</a> +588 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset.html">FAIL</a> +989 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-4/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7864_full and XEIGTPW_11167_full:</p>
<h3>New IGT tests (1070)</h3>
<ul>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc-mix-bo:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
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
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
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
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-busy:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-mlock:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-mlock:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-bo-map:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-bo-map-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-busy:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-busy-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-race:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-race-nomemset:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@unaligned-alloc:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11167_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@core_hotunplug@hotrebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_plane_multiple@tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_plane_multiple@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_pm_rpm@universal-planes@plane-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-50.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_addfb_basic@bo-too-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_addfb_basic@bo-too-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_atomic@atomic-invalid-params.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-7/igt@kms_atomic@atomic-invalid-params.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-64x64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733">Intel XE#1733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-lnl-6/igt@xe_vm@large-split-binds-536870912.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11167/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7864 -&gt; IGTPW_11167</li>
<li>Linux: xe-1310-1ba62f8cea9c797427d45108df1d453f4b343240 -&gt; xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde</li>
</ul>
<p>IGTPW_11167: 11167<br />
  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1310-1ba62f8cea9c797427d45108df1d453f4b343240: 1ba62f8cea9c797427d45108df1d453f4b343240<br />
  xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde: 3addfb8584a4fcbff8123461682e5bdfd8785bde</p>

</body>
</html>

--===============6397191651345776642==--
