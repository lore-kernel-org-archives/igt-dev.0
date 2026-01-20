Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC447D2ECFD
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 02:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3C010E545;
	Tue, 20 Jan 2026 02:22:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D42610E185;
 Tue, 20 Jan 2026 02:22:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4151005694321174085=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_lib/igt=5Fkms=3A_Increase_MAX=5FNUM=5FCOLOROPS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jan 2026 02:22:30 -0000
Message-ID: <176887575020.169325.1093949645346537806@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119224237.561000-1-alex.hung@amd.com>
In-Reply-To: <20260119224237.561000-1-alex.hung@amd.com>
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

--===============4151005694321174085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
URL   : https://patchwork.freedesktop.org/series/160322/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8706_BAT -> XEIGTPW_14374_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14374_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14374_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-ptl-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14374_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@tile-dir:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-atsm-2/igt@xe_debugfs@tile-dir.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-atsm-2/igt@xe_debugfs@tile-dir.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - bat-bmg-3:          NOTRUN -> [FAIL][3] +20 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_pat@pat-index-all:
    - bat-adlp-7:         [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-adlp-7/igt@xe_pat@pat-index-all.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-adlp-7/igt@xe_pat@pat-index-all.html

  * igt@xe_pat@pat-sanity:
    - bat-dg2-oem2:       [PASS][6] -> [FAIL][7] +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-dg2-oem2/igt@xe_pat@pat-sanity.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-dg2-oem2/igt@xe_pat@pat-sanity.html
    - bat-adlp-vm:        [PASS][8] -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-adlp-vm/igt@xe_pat@pat-sanity.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-adlp-vm/igt@xe_pat@pat-sanity.html

  
New tests
---------

  New tests have been introduced between XEIGT_8706_BAT and XEIGTPW_14374_BAT:

### New IGT tests (2) ###

  * igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14374_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-2:          NOTRUN -> [SKIP][10] ([Intel XE#5765])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-ptl-2:          NOTRUN -> [SKIP][11] ([Intel XE#5774] / [Intel XE#5907] / [Intel XE#6203])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@kms_dsc@dsc-basic.html

  * igt@xe_debugfs@tile-dir@tile-0:
    - bat-bmg-2:          [PASS][12] -> [FAIL][13] ([Intel XE#6791]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html
    - bat-bmg-1:          [PASS][14] -> [FAIL][15] ([Intel XE#6791]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html

  * igt@xe_evict@evict-beng-small:
    - bat-ptl-2:          NOTRUN -> [SKIP][16] ([Intel XE#5764]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-ptl-2:          NOTRUN -> [SKIP][17] ([Intel XE#5775]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-2:          NOTRUN -> [SKIP][18] ([Intel XE#5776])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-all:
    - bat-ptl-1:          [PASS][19] -> [FAIL][20] ([Intel XE#6997]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-ptl-1/igt@xe_pat@pat-index-all.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-1/igt@xe_pat@pat-index-all.html
    - bat-ptl-vm:         [PASS][21] -> [FAIL][22] ([Intel XE#6997]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-ptl-vm/igt@xe_pat@pat-index-all.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-vm/igt@xe_pat@pat-index-all.html
    - bat-lnl-1:          [PASS][23] -> [FAIL][24] ([Intel XE#6997]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-lnl-1/igt@xe_pat@pat-index-all.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-lnl-1/igt@xe_pat@pat-index-all.html
    - bat-bmg-2:          [PASS][25] -> [FAIL][26] ([Intel XE#6997]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-2/igt@xe_pat@pat-index-all.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-2/igt@xe_pat@pat-index-all.html
    - bat-bmg-1:          [PASS][27] -> [FAIL][28] ([Intel XE#6997]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-1/igt@xe_pat@pat-index-all.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-1/igt@xe_pat@pat-index-all.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-2:          NOTRUN -> [SKIP][29] ([Intel XE#5777])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-2:          NOTRUN -> [SKIP][30] ([Intel XE#5771])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-2:          NOTRUN -> [SKIP][31] ([Intel XE#5780])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sanity:
    - bat-lnl-2:          [PASS][32] -> [FAIL][33] ([Intel XE#6997]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-lnl-2/igt@xe_pat@pat-sanity.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-lnl-2/igt@xe_pat@pat-sanity.html
    - bat-ptl-2:          NOTRUN -> [FAIL][34] ([Intel XE#6997]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-sanity.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][35] ([Intel XE#6566]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][36] -> [FAIL][37] ([Intel XE#6520])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - bat-bmg-3:          [INCOMPLETE][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#6791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6791
  [Intel XE#6997]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997


Build changes
-------------

  * IGT: IGT_8706 -> IGTPW_14374
  * Linux: xe-4408-ce23d0a333e80437caeac552d098b1f241ff2926 -> xe-4410-d5c98420766570dc019dc42dfbbe5a1061c03085

  IGTPW_14374: 14374
  IGT_8706: 8706
  xe-4408-ce23d0a333e80437caeac552d098b1f241ff2926: ce23d0a333e80437caeac552d098b1f241ff2926
  xe-4410-d5c98420766570dc019dc42dfbbe5a1061c03085: d5c98420766570dc019dc42dfbbe5a1061c03085

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/index.html

--===============4151005694321174085==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160322/">https://patchwork.freedesktop.org/series/160322/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8706_BAT -&gt; XEIGTPW_14374_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14374_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14374_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-ptl-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14374_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_debugfs@tile-dir:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-atsm-2/igt@xe_debugfs@tile-dir.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-atsm-2/igt@xe_debugfs@tile-dir.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-adlp-7/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-adlp-7/igt@xe_pat@pat-index-all.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sanity:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-dg2-oem2/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-dg2-oem2/igt@xe_pat@pat-sanity.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-adlp-vm/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-adlp-vm/igt@xe_pat@pat-sanity.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8706_BAT and XEIGTPW_14374_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14374_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774">Intel XE#5774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203">Intel XE#6203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@tile-dir@tile-0:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6791">Intel XE#6791</a>) +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6791">Intel XE#6791</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-ptl-1/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-1/igt@xe_pat@pat-index-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-ptl-vm/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-vm/igt@xe_pat@pat-index-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-lnl-1/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-lnl-1/igt@xe_pat@pat-index-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-2/igt@xe_pat@pat-index-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-1/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-1/igt@xe_pat@pat-index-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sanity:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-lnl-2/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-lnl-2/igt@xe_pat@pat-sanity.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-ptl-2/igt@xe_pat@pat-sanity.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6997">Intel XE#6997</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8706/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14374/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8706 -&gt; IGTPW_14374</li>
<li>Linux: xe-4408-ce23d0a333e80437caeac552d098b1f241ff2926 -&gt; xe-4410-d5c98420766570dc019dc42dfbbe5a1061c03085</li>
</ul>
<p>IGTPW_14374: 14374<br />
  IGT_8706: 8706<br />
  xe-4408-ce23d0a333e80437caeac552d098b1f241ff2926: ce23d0a333e80437caeac552d098b1f241ff2926<br />
  xe-4410-d5c98420766570dc019dc42dfbbe5a1061c03085: d5c98420766570dc019dc42dfbbe5a1061c03085</p>

</body>
</html>

--===============4151005694321174085==--
