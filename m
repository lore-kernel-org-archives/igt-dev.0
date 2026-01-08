Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E45BD148BE
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 07:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26F910E30D;
	Thu,  8 Jan 2026 07:46:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A8410E30D;
 Thu,  8 Jan 2026 07:46:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1748114213948935743=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_xe=5Fpat=3A_add_compression?=
 =?utf-8?q?_subtests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 Jan 2026 07:46:54 -0000
Message-ID: <176785841401.135415.3124623794901613541@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108065933.409757-1-x.wang@intel.com>
In-Reply-To: <20260108065933.409757-1-x.wang@intel.com>
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

--===============1748114213948935743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_pat: add compression subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/159722/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8692_BAT -> XEIGTPW_14314_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14314_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14314_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14314_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pat@bo-wb-comp-1way-bind} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-adlp-7/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-lnl-2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-lnl-2/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-ptl-2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-2/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-atsm-2/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-ptl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-1/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-vm/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-lnl-1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-lnl-1/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-bmg-2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-bmg-2/igt@xe_pat@bo-wb-comp-1way-bind.html

  * igt@xe_pat@pat-index-xe2@blt:
    - bat-ptl-1:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html
    - bat-ptl-vm:         [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html
    - bat-ptl-2:          [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-ptl-2/igt@xe_pat@pat-index-xe2@blt.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-2/igt@xe_pat@pat-index-xe2@blt.html

  * {igt@xe_pat@prime-external-import-comp} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-dg2-oem2/igt@xe_pat@prime-external-import-comp.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-adlp-vm/igt@xe_pat@prime-external-import-comp.html

  
New tests
---------

  New tests have been introduced between XEIGT_8692_BAT and XEIGTPW_14314_BAT:

### New IGT tests (3) ###

  * igt@xe_pat@bo-wb-comp-1way-bind:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@prime-external-import-comp:
    - Statuses : 6 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_pat@userptr-comp:
    - Statuses : 6 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.06] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14314_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][17] -> [TIMEOUT][18] ([Intel XE#6506])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][19] -> [FAIL][20] ([Intel XE#6519])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8692 -> IGTPW_14314
  * Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -> xe-4344-bbd2596084d7d562841571575239ef867c69bdce

  IGTPW_14314: 14314
  IGT_8692: 8692
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f
  xe-4344-bbd2596084d7d562841571575239ef867c69bdce: bbd2596084d7d562841571575239ef867c69bdce

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/index.html

--===============1748114213948935743==
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
<tr><td><b>Series:</b></td><td>xe_pat: add compression subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159722/">https://patchwork.freedesktop.org/series/159722/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8692_BAT -&gt; XEIGTPW_14314_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14314_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14314_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14314_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pat@bo-wb-comp-1way-bind} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-adlp-7/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a> +2 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-lnl-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-atsm-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a> +2 other tests skip</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-1/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-vm/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-lnl-1/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-bmg-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@blt:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html">FAIL</a> +2 other tests fail</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html">FAIL</a> +2 other tests fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-ptl-2/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-ptl-2/igt@xe_pat@pat-index-xe2@blt.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@prime-external-import-comp} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-dg2-oem2/igt@xe_pat@prime-external-import-comp.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-adlp-vm/igt@xe_pat@prime-external-import-comp.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8692_BAT and XEIGTPW_14314_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pat@bo-wb-comp-1way-bind:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-comp:</p>
<ul>
<li>Statuses : 6 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-comp:</p>
<ul>
<li>Statuses : 6 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14314_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14314/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8692 -&gt; IGTPW_14314</li>
<li>Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -&gt; xe-4344-bbd2596084d7d562841571575239ef867c69bdce</li>
</ul>
<p>IGTPW_14314: 14314<br />
  IGT_8692: 8692<br />
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f<br />
  xe-4344-bbd2596084d7d562841571575239ef867c69bdce: bbd2596084d7d562841571575239ef867c69bdce</p>

</body>
</html>

--===============1748114213948935743==--
