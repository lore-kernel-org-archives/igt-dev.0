Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7CF10F3DCE
	for <igt-dev@archiver.kernel.org>; Sat, 28 Mar 2026 12:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135B710E278;
	Sat, 28 Mar 2026 12:44:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5510E278;
 Sat, 28 Mar 2026 12:44:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4077180706094493992=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Verify_PTA_entries_contain?=
 =?utf-8?q?s_expected_values_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 28 Mar 2026 12:44:11 -0000
Message-ID: <177470185139.409333.3013940876863010784@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
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

--===============4077180706094493992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Verify PTA entries contains expected values (rev2)
URL   : https://patchwork.freedesktop.org/series/163910/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8834_FULL -> XEIGTPW_14874_FULL
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

  Here are the unknown changes that may have been introduced in XEIGTPW_14874_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pat@pt-pta-suspend} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-2/igt@xe_pat@pt-pta-suspend.html

  
New tests
---------

  New tests have been introduced between XEIGT_8834_FULL and XEIGTPW_14874_FULL:

### New IGT tests (3) ###

  * igt@xe_pat@pt-pta-check:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_pat@pt-pta-reset-gt:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@xe_pat@pt-pta-suspend:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14874_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#7340])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#7549])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][6] ([Intel XE#7340] / [Intel XE#7504]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][8] ([Intel XE#7675]) -> [SKIP][9] ([Intel XE#7675] / [Intel XE#7679]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7549]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7549
  [Intel XE#7675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679


Build changes
-------------

  * IGT: IGT_8834 -> IGTPW_14874
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-4811-d699fa2d9776038b13f7b8153738a850676d0641

  IGTPW_14874: 14874
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-4811-d699fa2d9776038b13f7b8153738a850676d0641: d699fa2d9776038b13f7b8153738a850676d0641

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/index.html

--===============4077180706094493992==
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
<tr><td><b>Series:</b></td><td>Verify PTA entries contains expected values (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163910/">https://patchwork.freedesktop.org/series/163910/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8834_FULL -&gt; XEIGTPW_14874_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14874_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_pat@pt-pta-suspend} (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-2/igt@xe_pat@pt-pta-suspend.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8834_FULL and XEIGTPW_14874_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pat@pt-pta-check:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-pta-reset-gt:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-pta-suspend:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14874_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7549">Intel XE#7549</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_dc@dc5-dpms:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675">Intel XE#7675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14874/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675">Intel XE#7675</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +7 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8834 -&gt; IGTPW_14874</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-4811-d699fa2d9776038b13f7b8153738a850676d0641</li>
</ul>
<p>IGTPW_14874: 14874<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-4811-d699fa2d9776038b13f7b8153738a850676d0641: d699fa2d9776038b13f7b8153738a850676d0641</p>

</body>
</html>

--===============4077180706094493992==--
