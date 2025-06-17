Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9641BC71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 01:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCBD10E47B;
	Tue, 17 Jun 2025 01:17:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFAC10E479;
 Tue, 17 Jun 2025 01:17:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2012857299989919667=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_tests/intel/xe=5Fexec=5Fsystem=5Fallocator=3A_Add_section_to?=
 =?utf-8?q?_trigger_64k_fault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jun 2025 01:17:39 -0000
Message-ID: <175012305935.84055.16279408150528350886@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616070640.2061642-1-matthew.brost@intel.com>
In-Reply-To: <20250616070640.2061642-1-matthew.brost@intel.com>
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

--===============2012857299989919667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/intel/xe_exec_system_allocator: Add section to trigger 64k fault
URL   : https://patchwork.freedesktop.org/series/150306/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8412_FULL -> XEIGTPW_13299_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13299_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13299_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13299_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-435/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6.html

  * {igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][3] +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * {igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][4] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * {igt@xe_exec_system_allocator@once-malloc-prefetch} (NEW):
    - shard-lnl:          NOTRUN -> [WARN][5] +35 other tests warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@xe_exec_system_allocator@once-malloc-prefetch.html

  
New tests
---------

  New tests have been introduced between XEIGT_8412_FULL and XEIGTPW_13299_FULL:

### New IGT tests (189) ###

  * igt@xe_exec_system_allocator@many-64k-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.00] s

  * igt@xe_exec_system_allocator@many-64k-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.40] s

  * igt@xe_exec_system_allocator@many-64k-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.94] s

  * igt@xe_exec_system_allocator@many-64k-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.63] s

  * igt@xe_exec_system_allocator@many-64k-malloc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.42] s

  * igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.14] s

  * igt@xe_exec_system_allocator@many-64k-malloc-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-malloc-fork-read:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.27] s

  * igt@xe_exec_system_allocator@many-64k-malloc-fork-read-after:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 12.33] s

  * igt@xe_exec_system_allocator@many-64k-malloc-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@xe_exec_system_allocator@many-64k-malloc-multi-fault:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-64k-malloc-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.67] s

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@many-64k-malloc-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@many-64k-malloc-race-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@many-64k-mmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 1.27] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file-mlock:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.87] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.87] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.24] s

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-mmap-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 1.42] s

  * igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.43] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.82] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.79] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@xe_exec_system_allocator@many-64k-mmap-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@xe_exec_system_allocator@many-64k-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.14, 0.76] s

  * igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@many-64k-mmap-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.19] s

  * igt@xe_exec_system_allocator@many-64k-mmap-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.59] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.04] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.92] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.09] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-nomemset:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.91] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@xe_exec_system_allocator@many-64k-new:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@xe_exec_system_allocator@many-64k-new-bo-map:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.99] s

  * igt@xe_exec_system_allocator@many-64k-new-bo-map-nomemset:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-64k-new-busy:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.73] s

  * igt@xe_exec_system_allocator@many-64k-new-busy-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.31] s

  * igt@xe_exec_system_allocator@many-64k-new-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.19] s

  * igt@xe_exec_system_allocator@many-64k-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_exec_system_allocator@many-64k-new-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@xe_exec_system_allocator@many-64k-new-race-nomemset:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.87] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.74] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.74] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@many-execqueues-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.77] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.72] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.27] s

  * igt@xe_exec_system_allocator@many-large-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.70] s

  * igt@xe_exec_system_allocator@many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@many-large-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.69] s

  * igt@xe_exec_system_allocator@many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@many-large-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.10] s

  * igt@xe_exec_system_allocator@many-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.71] s

  * igt@xe_exec_system_allocator@many-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@many-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@many-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@many-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.51] s

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.26, 2.53] s

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@once-large-malloc-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_system_allocator@once-large-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-prefetch-shared:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-prefetch:
    - Statuses : 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@once-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@prefetch-benchmark:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 97.76] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.13, 0.23] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.15] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.82] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.61] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_system_allocator@process-many-large-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.79] s

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@process-many-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.10, 0.22] s

  * igt@xe_exec_system_allocator@process-many-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-new-prefetch:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.52] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@process-many-stride-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.32] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-prefetch:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.82] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.09, 0.80] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.91] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.80] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-many-large-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.99] s

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-many-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-many-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.76] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.10, 0.76] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.60] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.27] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 3.44] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.54] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.71] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 3.04] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-prefetch:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.40] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch:
    - Statuses : 1 pass(s) 1 warn(s)
    - Exec time: [0.12, 0.44] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.26] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.54] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [6.09, 8.52] s

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-large-new-prefetch:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-malloc-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-malloc-prefetch-race:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@twice-mmap-prefetch:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_system_allocator@twice-new-prefetch:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13299_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#4665])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3658])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2191])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#367]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1512])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][26] ([Intel XE#3862]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#3862]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3432])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2669]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#3124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][34] ([Intel XE#1727] / [Intel XE#3113])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +90 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2341])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178]) +4 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#5176]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1178]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#3304])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2320]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#308]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2321]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2321]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#3226])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2291])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2291]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#4354])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#4294])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4331])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4331])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2244]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2244])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#703])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2373])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#703])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1138])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1138])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1135])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1421]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][75] -> [INCOMPLETE][76] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2316])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][78] ([Intel XE#1504]) +1 other test timeout
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#301]) +4 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#886]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1401]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#651]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2312]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2311]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#651]) +24 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4141]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#656]) +26 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#653]) +20 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +17 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2502])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#605])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#605])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#1503]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4298])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4298])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-4/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4298])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#356])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2486])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#4596])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#309]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +15 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#870])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#718])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2499])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1439] / [Intel XE#3141])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2893] / [Intel XE#4608])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4608]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1489]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2893]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1489]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1122]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#4609]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1406]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][127] -> [SKIP][128] ([Intel XE#4692])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#3414]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2413])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][133] -> [SKIP][134] ([Intel XE#1435])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1435])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1435])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#1499])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1280] / [Intel XE#455]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1123]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1126])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2504])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#4837]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4837]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#4518])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#4518])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4518])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#688]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1392]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2322]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#288]) +18 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2360])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][152] -> [DMESG-WARN][153] ([Intel XE#3876])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#4837]) +12 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * {igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#4915]) +354 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#4943]) +13 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#4943]) +15 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][158] -> [FAIL][159] ([Intel XE#5018])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1416])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_mmap@vram.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2427])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1061])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][165] ([Intel XE#1173]) +1 other test fail
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#584]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_pm@s3-mocs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#4650])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#4650])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-5/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#4733])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4733]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#944]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#944])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#944]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4130])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#3342])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#3342])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#3342])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#4351])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#4351])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][180] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][182] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][184] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][186] ([Intel XE#2291]) -> [PASS][187] +4 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][188] ([Intel XE#4302]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][190] ([Intel XE#2373]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][192] ([Intel XE#2316]) -> [PASS][193] +10 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#301]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [FAIL][196] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][198] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][200] ([Intel XE#1503]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     [INCOMPLETE][202] -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][204] ([Intel XE#616]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][206] ([Intel XE#2571]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#4208] / [i915#2575]) -> [PASS][209] +11 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1392]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_queue_property@invalid-property:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208]) -> [PASS][213] +33 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_exec_queue_property@invalid-property.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][214] ([Intel XE#3876]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#4208]) -> [SKIP][217] ([Intel XE#316])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208]) -> [SKIP][219] ([Intel XE#1124])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#4208] / [i915#2575]) -> [SKIP][221] ([Intel XE#2191])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#4208] / [i915#2575]) -> [SKIP][223] ([Intel XE#367])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208]) -> [SKIP][225] ([Intel XE#2907])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4208]) -> [SKIP][227] ([Intel XE#3442])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#4208]) -> [SKIP][229] ([Intel XE#455] / [Intel XE#787])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][230] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][231] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#4208] / [i915#2575]) -> [SKIP][233] ([Intel XE#373])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][234] ([Intel XE#1188]) -> [SKIP][235] ([Intel XE#2341])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-4/igt@kms_content_protection@uevent.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#4208] / [i915#2575]) -> [SKIP][237] ([Intel XE#308])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][238] ([Intel XE#2312]) -> [SKIP][239] ([Intel XE#2311]) +17 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][240] ([Intel XE#2311]) -> [SKIP][241] ([Intel XE#2312]) +16 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][242] ([Intel XE#4141]) -> [SKIP][243] ([Intel XE#2312]) +6 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][244] ([Intel XE#2312]) -> [SKIP][245] ([Intel XE#4141]) +8 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208]) -> [SKIP][247] ([Intel XE#651]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][249] ([Intel XE#651])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208]) -> [SKIP][251] ([Intel XE#653]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][252] ([Intel XE#2313]) -> [SKIP][253] ([Intel XE#2312]) +20 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][254] ([Intel XE#2312]) -> [SKIP][255] ([Intel XE#2313]) +18 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [INCOMPLETE][256] -> [FAIL][257] ([Intel XE#616])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_plane_cursor@overlay.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][259] ([Intel XE#2850] / [Intel XE#929])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_psr@fbc-psr-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#4208]) -> [SKIP][261] ([Intel XE#2850] / [Intel XE#929])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_psr@psr-cursor-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_psr@psr-cursor-blt.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#4208] / [i915#2575]) -> [SKIP][263] ([Intel XE#455]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#362]) -> [FAIL][265] ([Intel XE#1729])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208]) -> [SKIP][267] ([Intel XE#4497])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_eu_stall@blocking-read.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@connect-user:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#4208]) -> [SKIP][269] ([Intel XE#4837])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_eudebug@connect-user.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_eudebug@connect-user.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#4208]) -> [SKIP][271] ([Intel XE#288]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-rebind.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#4208]) -> [SKIP][273] ([Intel XE#4915]) +49 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208]) -> [SKIP][275] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_oa@buffer-fill.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#4208]) -> [SKIP][277] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#4208]) -> [SKIP][279] ([Intel XE#4650])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_pmu@fn-engine-activity-load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#4208]) -> [SKIP][281] ([Intel XE#4821])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8412 -> IGTPW_13299
  * Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -> xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96

  IGTPW_13299: 13299
  IGT_8412: 8412
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d68e7db10068df6b76
  xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96: 43ac07d088f280cfb9eeda0c4caf11b0b7b56e96

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/index.html

--===============2012857299989919667==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/intel/xe_ex=
ec_system_allocator: Add section to trigger 64k fault</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150306/">https://patchwork.freedesktop.org/series/150306/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13299/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13299/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8412_FULL -&gt; XEIGTPW_13299_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13299_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13299_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
299_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-435/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-=
a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13299/shard-dg2-433/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-h=
dmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset} (NEW):</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_exec_system_allocator@many-64=
k-mmap-free-huge-nomemset.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_exec_system_allocator@many-64=
k-mmap-new-huge-nomemset.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@once-malloc-prefetch} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@xe_exec_system_allocator@once-ma=
lloc-prefetch.html">WARN</a> +35 other tests warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8412_FULL and XEIGTPW_13299=
_FULL:</p>
<h3>New IGT tests (189)</h3>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 12.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-multi-fault:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.14, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap-eocheck:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap-eochec=
k:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-bo-map-nomemset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch-shared:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.26, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-benchmark:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 97.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-rac=
e:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.13, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch-share=
d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefet=
ch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefet=
ch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch=
-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.10, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-rac=
e:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-share=
d:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefet=
ch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefet=
ch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.09, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch=
-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-prefetch:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.99] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-race:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.10, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-pr=
efetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-pr=
efetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pref=
etch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pref=
etch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-prefe=
tch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetc=
h:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetc=
h-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 3.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch-=
shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-prefetch:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-race=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 warn(s)</li>
<li>Exec time: [0.12, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch-shared=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefet=
ch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefet=
ch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch=
-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.09, 8.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13299_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-2/i=
gt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13299/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-=
tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel =
XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_chamelium_color@gamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1178">Intel XE#1178</a>) +4 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5176">Intel XE#5176</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13299/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-=
transitions.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3299/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299=
/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4=
294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +7 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_feature_discovery@psr2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13299/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-h=
dmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interru=
ptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 o=
ther test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_flip@bo-too-big-interruptibl=
e@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13299/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_132=
99/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13299/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">I=
ntel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
05">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-b=
mg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_joiner@basic-max-non-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4298">Intel XE#4298</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-4/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-=
bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-5/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4609">Intel XE#4609</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13299/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shar=
d-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_compute_preempt@compute-pre=
empt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-=
0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0=
x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4518">Intel XE#4518</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-si=
mple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null=
-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@xe_exec_fault_mode@twice-inval=
id-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/sha=
rd-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#387=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint=
-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_exec_system_allocator@many-=
64k-mmap-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +354 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_exec_system_allocator@once-la=
rge-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_exec_sys=
tem_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-3/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-5/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@xe_sriov_auto_provisioning@res=
ources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3342">Intel XE#3342</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-lnl-2/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-4/igt@kms_bw@connecte=
d-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-d=
g2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Inte=
l XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13299/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13299/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legac=
y.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13299/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13299/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
299/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +10 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13299/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi=
-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_flip@flip-vs-expired-vbl=
ank@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_flip@flip-vs-su=
spend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/s=
hard-bmg-4/igt@kms_hdr@static-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
256.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi=
-a-6-size-256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_132=
99/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13299/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-w=
ith-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_=
plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> +11 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13299/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic=
-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_exec_queue_property@invalid-property.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13299/shard-dg2-435/igt@xe_exec_queue_property@invalid-propert=
y.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">=
Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13299/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">PASS</=
a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13299/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">I=
ntel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13299/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_bw@conn=
ected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_bw@linear-tiling-=
4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13299/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13299/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_chamelium_e=
did@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13299/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_cursor_crc@cursor-ons=
creen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-433/igt@kms_frontbu=
ffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-435/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-436/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-5/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-bmg-1/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shar=
d-dg2-436/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13299/shard-dg2-433/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_psr@psr-cursor-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1329=
9/shard-dg2-434/igt@kms_psr@psr-cursor-blt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#=
929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@kms_scaling_modes@sca=
ling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13299/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3299/shard-dg2-435/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_eudebug@connect-user.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_132=
99/shard-dg2-434/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13299/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_exec_system_allocator@process-many-execqueu=
es-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/shard-dg2-434/igt@xe_exec_sy=
stem_allocator@process-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel X=
E#4915</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13299/sha=
rd-dg2-463/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
299/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13299/shard-dg2-463/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel =
XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13299/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE#482=
1</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8412 -&gt; IGTPW_13299</li>
<li>Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -&gt; xe-3256-4=
3ac07d088f280cfb9eeda0c4caf11b0b7b56e96</li>
</ul>
<p>IGTPW_13299: 13299<br />
  IGT_8412: 8412<br />
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d=
68e7db10068df6b76<br />
  xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96: 43ac07d088f280cfb9eeda0=
c4caf11b0b7b56e96</p>

</body>
</html>

--===============2012857299989919667==--
