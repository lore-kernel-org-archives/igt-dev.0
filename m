Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBF1CF45D5
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 22:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079A710E228;
	Mon, 12 Jan 2026 22:30:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DBD10E228;
 Mon, 12 Jan 2026 22:30:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0216848707189377411=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/intel/xe=5Fexec=5Fba?=
 =?utf-8?q?sic=3A_Enable_dynamic_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 Jan 2026 22:30:06 -0000
Message-ID: <176825700691.147966.133518499350207813@a3b018990fe9>
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

--===============0216848707189377411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_basic: Enable dynamic subtest
URL   : https://patchwork.freedesktop.org/series/159958/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8697_FULL -> XEIGTPW_14324_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8697_FULL and XEIGTPW_14324_FULL:

### New IGT tests (715) ###

  * igt@xe_exec_basic@many-basic-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-basic-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-bindexecqueue@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-basic@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-basic@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-basic@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-basic@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-basic@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-execqueues-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-null@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-execqueues-null@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_basic@many-execqueues-null@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_basic@many-execqueues-null@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_basic@many-execqueues-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-execqueues-userptr@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-userptr@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-userptr@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-null-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-null-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-null-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-null-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-null-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-null-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-null@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_exec_basic@many-null@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@many-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@many-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@many-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_exec_basic@many-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_exec_basic@many-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_basic@many-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@many-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_exec_basic@many-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@no-exec-basic-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-bind@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-basic@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-bind@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-null@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@no-exec-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-basic-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-basic-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-basic-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-basic-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-basic-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-basic-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-bindexecqueue@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-bindexecqueue@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-null-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-null-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-null-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-null-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-null-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-null@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-null@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-null@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-null@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@once-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@once-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@once-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-bind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-basic@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-basic@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-bindexecqueue@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-bindexecqueue@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-defer-bind@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-null-defer-bind@ccs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-null-defer-bind@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-null-defer-bind@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-null-defer-bind@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-defer-mmap@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-defer-mmap@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-defer-mmap@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-defer-mmap@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-defer-mmap@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-defer-mmap@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-defer-mmap@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-null@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-null@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_basic@twice-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate-race@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-invalidate@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-rebind@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_basic@twice-userptr-rebind@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-rebind@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_basic@twice-userptr-rebind@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14324_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#6011])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@kms_3d@basic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#6054]) +3 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#5993]) +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2328])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#610])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +15 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][20] -> [DMESG-WARN][21] ([Intel XE#5354])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2286])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2244])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#4422])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4422]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#776])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2293] / [Intel XE#2380]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2293]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2311]) +21 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4141]) +14 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#651])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +22 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [PASS][34] -> [ABORT][35] ([Intel XE#6740]) +1 other test abort
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-10/igt@kms_hdr@bpc-switch.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][36] ([Intel XE#6740])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6901])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2925])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#5020])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2938])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#718]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2392])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1406] / [Intel XE#2387])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1406])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#2234])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2413])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6503]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1499])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#2142]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4837])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4837]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6665])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#688])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1392]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6874]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6874]) +24 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#5007])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4943]) +23 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4943]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#586])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93]) -> ([PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [SKIP][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119]) ([Intel XE#378])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-2/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-1/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-3/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-1/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-3/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144]) -> ([PASS][145], [SKIP][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170]) ([Intel XE#2457])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-10/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-3/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-6/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-2/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-8/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-2/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-10/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-3/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-6/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-10/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#6964]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2427] / [Intel XE#6953])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2284]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#944])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][175] -> [FAIL][176] ([Intel XE#6569]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][177] -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][179] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [ABORT][181] ([Intel XE#6740]) -> [PASS][182] +5 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@kms_hdr@static-swap.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_hdr@static-swap.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [INCOMPLETE][183] ([Intel XE#1035]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-bmg:          [SKIP][185] -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [FAIL][187] ([Intel XE#5099]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-6/igt@kms_pm_rpm@i2c.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_pm_rpm@i2c.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [ABORT][189] ([Intel XE#3970]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [DMESG-WARN][191] ([Intel XE#7023]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][193] ([Intel XE#6353]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][195] ([Intel XE#5937]) -> [PASS][196] +4 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][197] ([Intel XE#3544]) -> [SKIP][198] ([Intel XE#3374] / [Intel XE#3544])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][199] ([Intel XE#1503]) -> [ABORT][200] ([Intel XE#6740])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][201] ([Intel XE#1729]) -> [SKIP][202] ([Intel XE#2426])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][203] ([Intel XE#2426]) -> [SKIP][204] ([Intel XE#2509])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6353
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8697 -> IGTPW_14324

  IGTPW_14324: 14324
  IGT_8697: 8697
  xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d: e9383891a008f23b432b7b3c4ca2d7dd0f49824d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/index.html

--===============0216848707189377411==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_basic: Enable dynamic su=
btest</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159958/">https://patchwork.freedesktop.org/series/159958/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14324/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14324/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8697_FULL -&gt; XEIGTPW_14324_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8697_FULL and XEIGTPW_14324=
_FULL:</p>
<h3>New IGT tests (715)</h3>
<ul>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race@=
vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@bcs0:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@ccs0:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@rcs0:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vcs0:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vcs1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vecs0=
:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate@vecs1=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@b=
cs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@c=
cs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@r=
cs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@v=
cs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@v=
cs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@v=
ecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@v=
ecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vecs0:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr@vecs1:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@bcs0:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@ccs0:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@rcs0:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@vcs0:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race@vecs0:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vecs0:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@vecs1:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind@ccs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-mmap@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate-race@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14324_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@kms_3d@basic.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel XE#=
6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@kms_async_flips@asyn=
c-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#=
6054</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@kms_async_flips@async-flip-=
with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_chamelium_frames@hdmi-cmp-pl=
anes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@kms_cursor_crc@cursor-random-128=
x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-fl=
ip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel=
 XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-10/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@k=
ms_hdr@bpc-switch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-=
a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@k=
ms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Int=
el XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-3/igt@kms_sharpness_filter@filter-modi=
fiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14324/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-extende=
d-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadat=
a-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_eudebug_online@debugger-reop=
en.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_eudebug_online@pagefault-one-=
of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-5/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-dy=
n-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_exec_system_allocator@many-64=
k-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_exec_system_allocator@many-ex=
ecqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +23 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8697/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8697/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8697/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8697/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8697/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8697/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
697/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8697/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8697/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/s=
hard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14324/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14324/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1432=
4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14324/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14324/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shar=
d-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4324/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-7/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14324/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8697/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8697/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8697/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8697/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8697/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8697/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/sh=
ard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_869=
7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
8697/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-9/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8697/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8697/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14324/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bm=
g-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1432=
4/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14324/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14324/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14324/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14324/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bm=
g-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14324/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14324/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-9/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14324/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">=
Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-9/igt@xe_peer2peer@read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Inte=
l XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_pm@s2idle-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14324/shard-bmg-1/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-b=
mg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) +1 othe=
r test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
dp2.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14324/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14324/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-9/igt@kms_hdr@static-swap.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/sh=
ard-bmg-8/igt@kms_hdr@static-swap.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1035">Intel XE#1035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14324/shard-bmg-4/igt@kms_plane@plane-panning-bottom-=
right-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pip=
e-a.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14324/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend=
@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-6/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5099">Intel XE#5099</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bm=
g-3/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_eng=
ine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-ev=
ict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-=
6/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engi=
ne_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">In=
tel XE#7023</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14324/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-multi-vma.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6353">Intel XE#6353</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/shard-lnl-4/igt@xe_exec_system_all=
ocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvf=
s-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5937">Intel XE#5937</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14324/shard-bmg-10/igt@xe_sriov_auto_provisioni=
ng@fair-allocation@numvfs-random.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4324/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14324/sha=
rd-bmg-3/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14324/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8697/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14324/shard-bmg-6/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8697 -&gt; IGTPW_14324</li>
</ul>
<p>IGTPW_14324: 14324<br />
  IGT_8697: 8697<br />
  xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d: e9383891a008f23b432b7b3=
c4ca2d7dd0f49824d</p>

</body>
</html>

--===============0216848707189377411==--
