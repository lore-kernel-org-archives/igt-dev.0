Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33FDD2F33D
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 16:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127C10E35D;
	Tue, 13 Jan 2026 16:06:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B510E35D;
 Tue, 13 Jan 2026 16:06:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0172700575984375661=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fbas?=
 =?utf-8?q?ic=3A_Enable_dynamic_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jan 2026 16:06:36 -0000
Message-ID: <176832039652.150541.2914758916238900227@a3b018990fe9>
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

--===============0172700575984375661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_basic: Enable dynamic subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/159958/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8699_BAT -> XEIGTPW_14333_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

New tests
---------

  New tests have been introduced between XEIGT_8699_BAT and XEIGTPW_14333_BAT:

### New IGT tests (105) ###

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
    - Exec time: [0.00, 0.02] s

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

  Here are the changes found in XEIGTPW_14333_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14333/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8699 -> IGTPW_14333
  * Linux: xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5 -> xe-4377-2ea51667c07c23307c4337bcccf28a2efb232007

  IGTPW_14333: 14333
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5: 7907558010710b0829258fc6a7bbcbb8783b8aa5
  xe-4377-2ea51667c07c23307c4337bcccf28a2efb232007: 2ea51667c07c23307c4337bcccf28a2efb232007

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14333/index.html

--===============0172700575984375661==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_basic: Enable dynamic subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159958/">https://patchwork.freedesktop.org/series/159958/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14333/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14333/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8699_BAT -&gt; XEIGTPW_14333_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8699_BAT and XEIGTPW_14333_BAT:</p>
<h3>New IGT tests (105)</h3>
<ul>
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
<li>Exec time: [0.00, 0.02] s</li>
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
<p>Here are the changes found in XEIGTPW_14333_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8699/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14333/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8699 -&gt; IGTPW_14333</li>
<li>Linux: xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5 -&gt; xe-4377-2ea51667c07c23307c4337bcccf28a2efb232007</li>
</ul>
<p>IGTPW_14333: 14333<br />
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5: 7907558010710b0829258fc6a7bbcbb8783b8aa5<br />
  xe-4377-2ea51667c07c23307c4337bcccf28a2efb232007: 2ea51667c07c23307c4337bcccf28a2efb232007</p>

</body>
</html>

--===============0172700575984375661==--
