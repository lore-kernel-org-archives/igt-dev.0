Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C4AC624D0
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 19:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5C310EEB5;
	Tue,  1 Sep 2026 19:16:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401B10EE9D;
 Tue,  1 Sep 2026 19:15:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2182482780357849863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fbas?=
 =?utf-8?q?ic=3A_Timeline_syncobj_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Sep 2026 19:15:31 -0000
Message-ID: <178829013127.109472.9494071574322464980@61270ab9df2a>
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

--===============2182482780357849863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_basic: Timeline syncobj coverage
URL   : https://patchwork.freedesktop.org/series/173084/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9079_BAT -> XEIGTPW_15759_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_9079_BAT and XEIGTPW_15759_BAT:

### New IGT tests (36) ###

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-basic-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-null-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@xe_exec_basic@multigpu-once-null-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@multigpu-once-userptr-timeline:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9079 -> IGTPW_15759

  IGTPW_15759: 9753605647431f6c3d39e89f058472664fd7bc4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9079: 9079
  xe-5668-b8f17b16c0f8638b9df4f090511e3ae97210eb77: b8f17b16c0f8638b9df4f090511e3ae97210eb77

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/index.html

--===============2182482780357849863==
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
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15759/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9079_BAT -&gt; XEIGTPW_15759_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9079_BAT and XEIGTPW_15759_BAT:</p>
<h3>New IGT tests (36)</h3>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-timeline:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9079 -&gt; IGTPW_15759</li>
</ul>
<p>IGTPW_15759: 9753605647431f6c3d39e89f058472664fd7bc4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9079: 9079<br />
  xe-5668-b8f17b16c0f8638b9df4f090511e3ae97210eb77: b8f17b16c0f8638b9df4f090511e3ae97210eb77</p>

</body>
</html>

--===============2182482780357849863==--
