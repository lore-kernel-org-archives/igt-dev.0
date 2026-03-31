Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D1610F9307
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 23:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7010E2C8;
	Tue, 31 Mar 2026 23:10:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2DE10E2C8;
 Tue, 31 Mar 2026 23:10:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0689219713358739131=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Fvm=3A_Add?=
 =?utf-8?q?_drm=5Fxe=5Fvm=5Fget=5Fproperty_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Mar 2026 23:10:34 -0000
Message-ID: <177499863449.420767.17898330326793819765@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331155700.7245-6-jonathan.cavitt@intel.com>
In-Reply-To: <20260331155700.7245-6-jonathan.cavitt@intel.com>
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

--===============0689219713358739131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add drm_xe_vm_get_property tests
URL   : https://patchwork.freedesktop.org/series/164178/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8839_FULL -> XEIGTPW_14894_FULL
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

  New tests have been introduced between XEIGT_8839_FULL and XEIGTPW_14894_FULL:

### New IGT tests (5) ###

  * igt@xe_vm@vm-get-property-exercise:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_vm@vm-get-property-invalid-property:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_vm@vm-get-property-invalid-reserved:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_vm@vm-get-property-invalid-size:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_vm@vm-get-property-invalid-vm-id:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14894_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#4227]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_exec_multi_queue@many-queues-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#6874])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-close-fd.html

  
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874


Build changes
-------------

  * IGT: IGT_8839 -> IGTPW_14894
  * Linux: xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d -> xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c

  IGTPW_14894: 79344dc528de888d73c98c74480b4030d8b25739 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8839: 8839
  xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d: e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d
  xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/index.html

--===============0689219713358739131==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add drm_xe_vm_get_property tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164178/">https://patchwork.freedesktop.org/series/164178/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8839_FULL -&gt; XEIGTPW_14894_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8839_FULL and XEIGTPW_14894_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_vm@vm-get-property-exercise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-property:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-reserved:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-size:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-vm-id:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14894_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14894/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8839 -&gt; IGTPW_14894</li>
<li>Linux: xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d -&gt; xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c</li>
</ul>
<p>IGTPW_14894: 79344dc528de888d73c98c74480b4030d8b25739 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8839: 8839<br />
  xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d: e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d<br />
  xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c</p>

</body>
</html>

--===============0689219713358739131==--
