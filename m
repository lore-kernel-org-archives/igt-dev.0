Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC5C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 21:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768E610E0C1;
	Tue,  1 Sep 2026 21:41:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2110E0C1;
 Tue,  1 Sep 2026 21:40:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7385023733690721060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel/xe=5Fexec=5Fba?=
 =?utf-8?q?sic=3A_Timeline_syncobj_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Sep 2026 21:40:36 -0000
Message-ID: <178829883650.109424.8180176643125403540@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831175512.1379368-1-jan.maslak@intel.com>
In-Reply-To: <20260831175512.1379368-1-jan.maslak@intel.com>
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

--===============7385023733690721060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_basic: Timeline syncobj coverage
URL   : https://patchwork.freedesktop.org/series/173084/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9079_FULL -> XEIGTPW_15759_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15759_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15759_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15759_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1] +33 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline.html

  * {igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][2] +26 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@xe_pmu@all-fn-engine-activity-load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_pmu@all-fn-engine-activity-load.html

  
New tests
---------

  New tests have been introduced between XEIGT_9079_FULL and XEIGTPW_15759_FULL:

### New IGT tests (714) ###

  * igt@xe_exec_basic@many-basic-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@xe_exec_basic@many-basic-defer-bind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-bind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-bind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-basic-defer-bind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-basic-defer-bind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.42] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.43] s

  * igt@xe_exec_basic@many-basic-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-basic-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.43] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.21] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.43] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.54] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.57] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.47] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.47] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.65] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.75] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 0.77] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.69] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.85] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.80, 0.81] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.22] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 0.81] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.81] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.58] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 0.79] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.55] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.62] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.55] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.68] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.54] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.58] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.39] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-null-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.56] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@xe_exec_basic@many-execqueues-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.55] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.45] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.11] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@xe_exec_basic@many-execqueues-userptr-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-userptr-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.44] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.44] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.34] s

  * igt@xe_exec_basic@many-null-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-null-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-null-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.43] s

  * igt@xe_exec_basic@many-null-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-null-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-null-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.35] s

  * igt@xe_exec_basic@many-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@many-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.44] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.09] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.37] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-userptr-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.42] s

  * igt@xe_exec_basic@many-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-once-basic-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-once-null-rebind-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-once-null-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-once-rebind-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-once-userptr-timeline:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.26] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-basic-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.27] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-basic-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-basic-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.29] s

  * igt@xe_exec_basic@once-basic-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-basic-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-basic-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-basic-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-basic-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-basic-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-basic-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.27] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.23] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.29] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.28] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-null-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@once-null-defer-bind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-defer-bind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-defer-bind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-null-defer-bind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-defer-bind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.21] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-null-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.24] s

  * igt@xe_exec_basic@once-null-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-null-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-null-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-null-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-null-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-null-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-null-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.31] s

  * igt@xe_exec_basic@once-null-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-null-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@once-null-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-null-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@once-null-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-null-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@once-null-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@once-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@once-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@once-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@xe_exec_basic@once-userptr-invalidate-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-invalidate-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@once-userptr-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-userptr-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-userptr-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@once-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.20] s

  * igt@xe_exec_basic@once-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@once-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@once-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@once-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.27] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.28] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-basic-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-basic-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.24] s

  * igt@xe_exec_basic@twice-basic-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-basic-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-basic-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-basic-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-basic-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-basic-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-basic-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@twice-bindexecqueue-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.32] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.33] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@twice-null-defer-bind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-null-defer-mmap-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@twice-null-defer-mmap-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-defer-mmap-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-defer-mmap-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-null-defer-mmap-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-null-defer-mmap-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-null-rebind-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.27] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-null-rebind-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@xe_exec_basic@twice-null-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-null-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-null-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-null-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@twice-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.27] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-invalidate-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@twice-userptr-rebind-timeline@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-rebind-timeline@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-rebind-timeline@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-rebind-timeline@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-rebind-timeline@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@twice-userptr-timeline:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.28] s

  * igt@xe_exec_basic@twice-userptr-timeline@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@twice-userptr-timeline@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@twice-userptr-timeline@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-userptr-timeline@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-userptr-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@twice-userptr-timeline@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@twice-userptr-timeline@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15759_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328] / [Intel XE#7367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#610] / [Intel XE#7387])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7679])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +9 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7358])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2390] / [Intel XE#6974])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2320]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#7809])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#8265]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8680])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2373] / [Intel XE#7448])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2374] / [Intel XE#6127])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2374] / [Intel XE#6128])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4141]) +10 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +43 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7399]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +48 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#7308])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8303]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7283]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2393])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7794])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#8399])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6814] / [Intel XE#7428])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2387] / [Intel XE#7429])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][50] -> [SKIP][51] ([Intel XE#8361])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1435] / [Intel XE#8695])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6503]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-6/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#7397]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][58] ([Intel XE#8868])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [PASS][59] -> [ABORT][60] ([Intel XE#8007]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-4/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8374]) +12 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8364]) +23 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync:
    - shard-bmg:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#8649] / [Intel XE#8652])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-4/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html

  * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#8369]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#9096]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8378]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-lnl:          [PASS][70] -> [ABORT][71] ([Intel XE#8007])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#6964]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#7793]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1420] / [Intel XE#7590])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4733] / [Intel XE#7417])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#944]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#6569])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_vfio@region-info:
    - shard-bmg:          NOTRUN -> [FAIL][78] ([Intel XE#7992])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_sriov_vfio@region-info.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][79] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][81] ([Intel XE#7949]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][83] ([Intel XE#3098]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [ABORT][85] ([Intel XE#9093]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][87] ([Intel XE#8399]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
    - shard-bmg:          [DMESG-WARN][89] ([Intel XE#8649] / [Intel XE#8652]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-8/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck:
    - shard-bmg:          [INCOMPLETE][91] ([Intel XE#8159]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [ABORT][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][95] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][96] ([Intel XE#2426] / [Intel XE#5848])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [ABORT][97] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][98] ([Intel XE#8963])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-3/igt@xe_wedged@basic-wedged.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-6/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][99] ([Intel XE#8963]) -> [ABORT][100] ([Intel XE#8007] / [Intel XE#8963])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8649
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9079 -> IGTPW_15759

  IGTPW_15759: 9753605647431f6c3d39e89f058472664fd7bc4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9079: 9079
  xe-5668-b8f17b16c0f8638b9df4f090511e3ae97210eb77: b8f17b16c0f8638b9df4f090511e3ae97210eb77

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/index.html

--===============7385023733690721060==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_basic: Timeline syncobj coverage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173084/">https://patchwork.freedesktop.org/series/173084/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9079_FULL -&gt; XEIGTPW_15759_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15759_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15759_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15759_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@xe_pmu@all-fn-engine-activity-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9079_FULL and XEIGTPW_15759_FULL:</p>
<h3>New IGT tests (714)</h3>
<ul>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.80, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-timeline:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@timeline-syncobj-exec-completed-point-in@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind-timeline@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind-timeline@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind-timeline@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind-timeline@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind-timeline@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-timeline@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15759_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-6/igt@kms_sharpness_filter@filter-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-4/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-4/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8649">Intel XE#8649</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@region-info:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_sriov_vfio@region-info.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-8/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8649">Intel XE#8649</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-3/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">Intel XE#8591</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9079 -&gt; IGTPW_15759</li>
</ul>
<p>IGTPW_15759: 9753605647431f6c3d39e89f058472664fd7bc4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9079: 9079<br />
  xe-5668-b8f17b16c0f8638b9df4f090511e3ae97210eb77: b8f17b16c0f8638b9df4f090511e3ae97210eb77</p>

</body>
</html>

--===============7385023733690721060==--
