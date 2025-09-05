Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798D1CA1012
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 03:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F20410EB0C;
	Fri,  5 Sep 2025 03:24:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596AE10EB08;
 Fri,  5 Sep 2025 03:24:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6064707797121519453=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Madvise_Tests_in_IGT_=28re?=
 =?utf-8?q?v12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Sep 2025 03:24:16 -0000
Message-ID: <175704265634.305943.15500683087708716228@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
In-Reply-To: <20250904082701.2154029-1-nishit.sharma@intel.com>
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

--===============6064707797121519453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Madvise Tests in IGT (rev12)
URL   : https://patchwork.freedesktop.org/series/153335/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8524_FULL -> XEIGTPW_13694_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13694_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_system_allocator@many-malloc-prefetch-madvise} (NEW):
    - shard-lnl:          NOTRUN -> [WARN][1] +12 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@xe_exec_system_allocator@many-malloc-prefetch-madvise.html

  
New tests
---------

  New tests have been introduced between XEIGT_8524_FULL and XEIGTPW_13694_FULL:

### New IGT tests (187) ###

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@madvise-atomic-vma:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@madvise-multi-vma:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@madvise-no-range-invalidate-same-attr:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-gl:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-vram:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@madvise-preffered-loc-sram-migrate-pages:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@madvise-range-invalidate-change-attr:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@madvise-split-vma:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@many-64k-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.57] s

  * igt@xe_exec_system_allocator@many-64k-malloc-madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.83] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.22] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.89] s

  * igt@xe_exec_system_allocator@many-64k-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@xe_exec_system_allocator@many-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.52] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.51] s

  * igt@xe_exec_system_allocator@many-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@xe_exec_system_allocator@many-free-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.20] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.10] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 3.00] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.46] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.47] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.31] s

  * igt@xe_exec_system_allocator@many-large-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.17] s

  * igt@xe_exec_system_allocator@many-large-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.12] s

  * igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 2.94] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.88] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.81] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.76] s

  * igt@xe_exec_system_allocator@many-large-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.31] s

  * igt@xe_exec_system_allocator@many-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.88] s

  * igt@xe_exec_system_allocator@many-mmap-free-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.00] s

  * igt@xe_exec_system_allocator@many-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.74] s

  * igt@xe_exec_system_allocator@many-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.63] s

  * igt@xe_exec_system_allocator@many-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.47] s

  * igt@xe_exec_system_allocator@many-stride-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.20] s

  * igt@xe_exec_system_allocator@many-stride-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.30] s

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 3.31] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.05] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.31] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.24] s

  * igt@xe_exec_system_allocator@many-stride-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.46] s

  * igt@xe_exec_system_allocator@once-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-large-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-large-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-large-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@once-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@once-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@once-mmap-new-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@once-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_exec_system_allocator@process-many-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.74] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.74] s

  * igt@xe_exec_system_allocator@process-many-large-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@xe_exec_system_allocator@process-many-large-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@xe_exec_system_allocator@process-many-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@process-many-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_exec_system_allocator@process-many-stride-free-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.89] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@xe_exec_system_allocator@process-many-stride-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@xe_exec_system_allocator@threads-many-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.22] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.98] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.23] s

  * igt@xe_exec_system_allocator@threads-many-large-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.92] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.21] s

  * igt@xe_exec_system_allocator@threads-many-large-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@xe_exec_system_allocator@threads-many-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@threads-many-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.43] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.11] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.42] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.28] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-madvise:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.70] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.26] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.45] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.74] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.40] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.79] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.48] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.40] s

  * igt@xe_exec_system_allocator@twice-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_system_allocator@twice-large-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:
    - Statuses : 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_exec_system_allocator@twice-malloc-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise:
    - Statuses : 1 pass(s) 1 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-mmap-new-madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@twice-new-madvise:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13694_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#664])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#610])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +10 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#607])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#610])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#367]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +153 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#3442])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2669]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][21] ([Intel XE#3124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#4416]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#306])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#373]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#307])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1178]) +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#308])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2321])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2320]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2321]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#309]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2291])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#323])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1508])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#4302])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#4354])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4422])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4422])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#703])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1421])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2316]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#301]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1401]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1397] / [Intel XE#1745])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1397])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +12 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2293]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2311]) +16 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656]) +10 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#651]) +23 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#5390]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#651]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#658])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1469])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2352])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2313]) +13 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2312]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#653]) +21 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#455])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1503]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-5/igt@kms_hdr@static-toggle.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#346])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#346])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#616]) +3 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#5021])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2763]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2763]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#736])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#718])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1129]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2505])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2893])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#4608])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#2387])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1406]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#4609])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1127])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#3414] / [Intel XE#3904])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#2883]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1435])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2168])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2168])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1499])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#1499])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-5/igt@kms_vrr@negative-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1499]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [FAIL][111] ([Intel XE#5963])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1447])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#5890]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#5626]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4837]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4837]) +11 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4837]) +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#688]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2322]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1392])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1392]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#288]) +15 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2360])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4915]) +399 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4943]) +12 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4943]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2229])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#5100])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1416])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#378])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@xe_module_load@force-load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3573]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1337])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2427])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1173]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2284] / [Intel XE#366])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#579])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4650])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4650])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4733]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4733]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#944])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#944]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#944]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4130]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@xe_sriov_auto_provisioning@fair-allocation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4130])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][148] ([Intel XE#3862]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [FAIL][150] ([Intel XE#5376]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][154] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][156] ([Intel XE#2291]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][158] ([Intel XE#1340]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][160] ([Intel XE#2316]) -> [PASS][161] +3 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][162] ([Intel XE#301]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][164] ([Intel XE#301]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][166] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][168] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][170] ([Intel XE#718]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][172] ([Intel XE#4459]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][174] ([Intel XE#4227]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-8/igt@kms_vrr@flipline.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1392]) -> [PASS][177] +4 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#3876]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][180] ([Intel XE#5786]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_threads@threads-cm-fd-rebind:
    - shard-bmg:          [FAIL][182] -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@xe_exec_threads@threads-cm-fd-rebind.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@xe_exec_threads@threads-cm-fd-rebind.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][184] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][185] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][186] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [DMESG-WARN][187] ([Intel XE#1727] / [Intel XE#3113])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][188] ([Intel XE#2341]) -> [FAIL][189] ([Intel XE#1178]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_content_protection@legacy.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][190] ([Intel XE#2311]) -> [SKIP][191] ([Intel XE#2312]) +8 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][192] ([Intel XE#2312]) -> [SKIP][193] ([Intel XE#2311]) +10 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#5390]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][196] ([Intel XE#5390]) -> [SKIP][197] ([Intel XE#2312]) +10 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][198] ([Intel XE#2312]) -> [SKIP][199] ([Intel XE#2313]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][200] ([Intel XE#2313]) -> [SKIP][201] ([Intel XE#2312]) +12 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][202] ([Intel XE#4596]) -> [SKIP][203] ([Intel XE#5021])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][204] ([Intel XE#1729]) -> [SKIP][205] ([Intel XE#2426])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][206] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][207] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8524 -> IGTPW_13694

  IGTPW_13694: 13694
  IGT_8524: 8524
  xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae6bdecb0e65ec4ff97

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/index.html

--===============6064707797121519453==
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
<tr><td><b>Series:</b></td><td>Madvise Tests in IGT (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153335/">https://patchwork.freedesktop.org/series/153335/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13694/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13694/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8524_FULL -&gt; XEIGTPW_13694_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
694_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_exec_system_allocator@many-malloc-prefetch-madvise} (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@xe_exec_system_allocator@many-ma=
lloc-prefetch-madvise.html">WARN</a> +12 other tests warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8524_FULL and XEIGTPW_13694=
_FULL:</p>
<h3>New IGT tests (187)</h3>
<ul>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-inc:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-vma:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-multi-vma:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-no-range-invalidate-same-attr:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-gl:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-vram:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-sram-migrate-pages:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-range-invalidate-change-attr:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-split-vma:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-madvise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvi=
se:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 3.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 2.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-mad=
vise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-madvise:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-madvis=
e:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefet=
ch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-mad=
vise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madv=
ise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ma=
dvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-madvise:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-mad=
vise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-madvise:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvis=
e:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefet=
ch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-mad=
vise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-madv=
ise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ma=
dvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-madvise:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-madv=
ise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-ma=
dvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-pr=
efetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-madvise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-rema=
p-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvi=
se:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fre=
e-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise=
:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetc=
h-madvise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-madv=
ise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvi=
se:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-mad=
vise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-madvise:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-madv=
ise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:</=
p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-madvise:=
</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvis=
e:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefet=
ch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-mad=
vise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-madv=
ise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ma=
dvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-madvise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13694_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_async_flips@test-cursor.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416=
">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@kms_chamelium_color@ctm-max.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_chamelium_edid@hdmi-mode-tim=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-1=
28x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3694/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694=
/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4=
302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13694/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/ig=
t@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13694/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-dg2-432/i=
gt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-5/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt=
@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-435/igt@kms_joiner@basic-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Int=
el XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-on=
off@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_psr@psr-sprite-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-=
lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-5/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@xe_compute@ccs-mode-compute-kern=
el.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5963">Intel XE#5963</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_compute_preempt@compute-pre=
empt-many-all-ram@engine-drm_xe_engine_class_compute.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#589=
0</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-en=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-fault=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@xe_eudebug_online@basic-breakpoi=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@xe_exec_fault_mode@twice-userp=
tr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-=
batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-large-malloc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +399 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_exec_system_allocator@threads=
-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-4/igt@xe_exec_system_allocator@twice-l=
arge-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-1/igt@xe_mmap@pci-membarrier.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100"=
>Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-466/igt@xe_pat@display-vs-wb-transient=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Inte=
l XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-2/igt@xe_pmu@all-fn-engine-activity-lo=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sche=
d-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@xe_pxp@display-black-pxp-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-5/igt@xe_query@multigpu-query-config.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-463/igt@xe_query@multigpu-query-mem-us=
age.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-lnl-8/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-dg2-436/igt@xe_sriov_auto_provisioning@fai=
r-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13694/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5376">Intel XE#5376</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13694/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/sha=
rd-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13694/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legac=
y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel=
 XE#1340</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13694/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13694/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS=
</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13694/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13694/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi=
-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13694/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13694/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-l=
nl-2/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_136=
94/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-lnl-8/igt@kms_vrr@flipline.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-=
lnl-3/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13694/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic=
-defer-mmap.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876=
">Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13694/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-pref=
etch.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5786">Intel XE#5786</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@xe_exec_system_allocator@many=
-stride-malloc-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-7/igt@xe_exec_threads@threads-cm-fd-rebind.html">FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/=
shard-bmg-5/igt@xe_exec_threads@threads-cm-fd-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13694/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Inte=
l XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13694/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13694/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-7/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13694/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13694/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8524/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send=
_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13694/shard-bmg-3/igt@xe_fault_inje=
ction@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#=
5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8524 -&gt; IGTPW_13694</li>
</ul>
<p>IGTPW_13694: 13694<br />
  IGT_8524: 8524<br />
  xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae=
6bdecb0e65ec4ff97</p>

</body>
</html>

--===============6064707797121519453==--
