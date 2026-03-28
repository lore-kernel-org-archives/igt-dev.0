Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2C310F3DEA
	for <igt-dev@archiver.kernel.org>; Sat, 28 Mar 2026 15:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1A310E3B4;
	Sat, 28 Mar 2026 15:53:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF62510E3B4;
 Sat, 28 Mar 2026 15:53:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1853316364261776384=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Fsriov=5Fv?=
 =?utf-8?q?fio=3A_Add_basic_VFIO_coverage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 28 Mar 2026 15:53:12 -0000
Message-ID: <177471319282.409333.4292398388167854218@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
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

--===============1853316364261776384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sriov_vfio: Add basic VFIO coverage (rev2)
URL   : https://patchwork.freedesktop.org/series/163480/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8834_FULL -> XEIGTPW_14875_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14875_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_sriov_vfio@region-info} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-1/igt@xe_sriov_vfio@region-info.html

  
New tests
---------

  New tests have been introduced between XEIGT_8834_FULL and XEIGTPW_14875_FULL:

### New IGT tests (4) ###

  * igt@xe_sriov_vfio@bind-unbind-vfs:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_sriov_vfio@load-unload-xe-vfio-pci:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_sriov_vfio@open-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_sriov_vfio@region-info:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14875_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#301]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#5625])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][6] ([Intel XE#7675]) -> [SKIP][7] ([Intel XE#7675] / [Intel XE#7679]) +7 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679


Build changes
-------------

  * IGT: IGT_8834 -> IGTPW_14875
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-4812-7556ae31e73dcad3716592bbdfd19068164c6a0e

  IGTPW_14875: 14875
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-4812-7556ae31e73dcad3716592bbdfd19068164c6a0e: 7556ae31e73dcad3716592bbdfd19068164c6a0e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/index.html

--===============1853316364261776384==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sriov_vfio: Add basic VFIO coverage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163480/">https://patchwork.freedesktop.org/series/163480/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8834_FULL -&gt; XEIGTPW_14875_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14875_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_sriov_vfio@region-info} (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-1/igt@xe_sriov_vfio@region-info.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8834_FULL and XEIGTPW_14875_FULL:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@load-unload-xe-vfio-pci:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@region-info:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14875_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675">Intel XE#7675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14875/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675">Intel XE#7675</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +7 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8834 -&gt; IGTPW_14875</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-4812-7556ae31e73dcad3716592bbdfd19068164c6a0e</li>
</ul>
<p>IGTPW_14875: 14875<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-4812-7556ae31e73dcad3716592bbdfd19068164c6a0e: 7556ae31e73dcad3716592bbdfd19068164c6a0e</p>

</body>
</html>

--===============1853316364261776384==--
