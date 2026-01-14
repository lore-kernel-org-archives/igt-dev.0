Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F78FD31A0F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2BE10E147;
	Wed, 14 Jan 2026 06:12:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DF010E58D;
 Wed, 14 Jan 2026 06:12:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3630135097314697802=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fbas?=
 =?utf-8?q?ic=3A_Enable_dynamic_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Jan 2026 06:12:27 -0000
Message-ID: <176837114787.153233.7607785926595125546@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113145314.331614-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260113145314.331614-2-balasubramani.vivekanandan@intel.com>
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

--===============3630135097314697802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_basic: Enable dynamic subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/159958/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8699_BAT -> XEIGTPW_14337_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14337_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14337_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14337_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [PASS][1] -> [SKIP][2] +53 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * {igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-rcs0} (NEW):
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][3] +73 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-rcs0.html

  * {igt@xe_exec_basic@multigpu-once-userptr@card0-vcs1} (NEW):
    - bat-bmg-3:          NOTRUN -> [WARN][4] +69 other tests warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr@card0-vcs1.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-ptl-2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-ptl-2/igt@xe_waitfence@reltime.html

  
New tests
---------

  New tests have been introduced between XEIGT_8699_BAT and XEIGTPW_14337_BAT:

### New IGT tests (861) ###

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vecs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vecs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vecs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vecs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-vecs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card0-vecs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-vecs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-ccs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vecs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-ccs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vecs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vecs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vcs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vecs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vcs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vecs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-ccs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-null@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@card0-vecs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card1-vcs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-vcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-vcs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card0-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-vcs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-userptr@card1-vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@no-exec-basic@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@rcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@vcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@vecs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14337_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#6519]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8699 -> IGTPW_14337
  * Linux: xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5 -> xe-4380-1580579412915ac76344699e53124b580060302d

  IGTPW_14337: 14337
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5: 7907558010710b0829258fc6a7bbcbb8783b8aa5
  xe-4380-1580579412915ac76344699e53124b580060302d: 1580579412915ac76344699e53124b580060302d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/index.html

--===============3630135097314697802==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_basic: Enable dynamic subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159958/">https://patchwork.freedesktop.org/series/159958/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8699_BAT -&gt; XEIGTPW_14337_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14337_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14337_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14337_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-rcs0} (NEW):</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-rcs0.html">INCOMPLETE</a> +73 other tests incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-once-userptr@card0-vcs1} (NEW):</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr@card0-vcs1.html">WARN</a> +69 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8699_BAT and XEIGTPW_14337_BAT:</p>
<h3>New IGT tests (861)</h3>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vecs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vecs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-vecs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card0-vecs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-vecs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@card1-vecs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-ccs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card0-vecs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vcs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card0-vecs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-ccs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-vecs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-vcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-vcs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card0-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@card1-vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@bcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@ccs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@rcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@vcs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@vecs0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14337_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14337/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8699 -&gt; IGTPW_14337</li>
<li>Linux: xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5 -&gt; xe-4380-1580579412915ac76344699e53124b580060302d</li>
</ul>
<p>IGTPW_14337: 14337<br />
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5: 7907558010710b0829258fc6a7bbcbb8783b8aa5<br />
  xe-4380-1580579412915ac76344699e53124b580060302d: 1580579412915ac76344699e53124b580060302d</p>

</body>
</html>

--===============3630135097314697802==--
