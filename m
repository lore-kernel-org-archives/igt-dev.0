Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD05ACF45C1
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 18:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F69610E2A9;
	Mon, 12 Jan 2026 18:40:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4A10E2A9;
 Mon, 12 Jan 2026 18:40:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7552098861923390851=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fbas?=
 =?utf-8?q?ic=3A_Enable_dynamic_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 Jan 2026 18:40:39 -0000
Message-ID: <176824323948.147285.627389269491064985@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260112140137.311483-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260112140137.311483-2-balasubramani.vivekanandan@intel.com>
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

--===============7552098861923390851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_basic: Enable dynamic subtest
URL   : https://patchwork.freedesktop.org/series/159958/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8697_BAT -> XEIGTPW_14324_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14324_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14324_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14324_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [PASS][1] -> [SKIP][2] +53 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * {igt@xe_exec_basic@multigpu-no-exec-rebind@ccs0} (NEW):
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][3] +6 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind@ccs0.html

  * {igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@rcs0} (NEW):
    - bat-bmg-3:          NOTRUN -> [WARN][4] +60 other tests warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@rcs0.html

  
New tests
---------

  New tests have been introduced between XEIGT_8697_BAT and XEIGTPW_14324_BAT:

### New IGT tests (483) ###

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@rcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vcs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vcs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@ccs0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@vcs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@vcs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@bcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@multigpu-once-null@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@vecs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@rcs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@ccs0:
    - Statuses : 1 warn(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@multigpu-once-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@no-exec-basic@bcs0:
    - Statuses : 11 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@ccs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

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
    - Exec time: [0.00] s

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
    - Exec time: [0.00, 0.01] s

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

  Here are the changes found in XEIGTPW_14324_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6520])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8697 -> IGTPW_14324

  IGTPW_14324: 14324
  IGT_8697: 8697
  xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d: e9383891a008f23b432b7b3c4ca2d7dd0f49824d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/index.html

--===============7552098861923390851==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_basic: Enable dynamic subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159958/">https://patchwork.freedesktop.org/series/159958/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8697_BAT -&gt; XEIGTPW_14324_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14324_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14324_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14324_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-no-exec-rebind@ccs0} (NEW):</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind@ccs0.html">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@rcs0} (NEW):</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@rcs0.html">WARN</a> +60 other tests warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8697_BAT and XEIGTPW_14324_BAT:</p>
<h3>New IGT tests (483)</h3>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr@vecs1:</p>
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
<li>Exec time: [0.00, 0.01] s</li>
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
<li>Exec time: [0.00] s</li>
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
<li>Exec time: [0.00, 0.01] s</li>
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
<p>Here are the changes found in XEIGTPW_14324_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8697 -&gt; IGTPW_14324</li>
</ul>
<p>IGTPW_14324: 14324<br />
  IGT_8697: 8697<br />
  xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d: e9383891a008f23b432b7b3c4ca2d7dd0f49824d</p>

</body>
</html>

--===============7552098861923390851==--
