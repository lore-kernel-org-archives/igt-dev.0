Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B008AD1118A
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 17:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2711610E6A7;
	Wed, 26 Nov 2025 17:24:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2710E6AC;
 Wed, 26 Nov 2025 17:24:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1472238239223753364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/debugfs=3A_Move?=
 =?utf-8?q?_VRAM_MM_checks_from_root_to_tile-dir_validation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Nov 2025 17:24:42 -0000
Message-ID: <176417788273.31997.17056534028624038888@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126155545.51113-1-piotr.piorkowski@intel.com>
In-Reply-To: <20251126155545.51113-1-piotr.piorkowski@intel.com>
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

--===============1472238239223753364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/debugfs: Move VRAM MM checks from root to tile-dir validation
URL   : https://patchwork.freedesktop.org/series/158118/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8639_BAT -> XEIGTPW_14120_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14120_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_debugfs@tile-dir}:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-atsm-2/igt@xe_debugfs@tile-dir.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-atsm-2/igt@xe_debugfs@tile-dir.html

  * {igt@xe_debugfs@tile-dir@tile-0}:
    - bat-bmg-2:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html
    - bat-bmg-1:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_debugfs@tile-dir@tile-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_debugfs@tile-dir@tile-0.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14120_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][9] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        NOTRUN -> [SKIP][10] ([Intel XE#688])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][11] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vm:        NOTRUN -> [SKIP][12] ([Intel XE#2229] / [Intel XE#5488])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-vm:        NOTRUN -> [SKIP][13] ([Intel XE#1008] / [Intel XE#5591])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        NOTRUN -> [SKIP][14] ([Intel XE#977])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-vm:        NOTRUN -> [SKIP][15] ([Intel XE#2838] / [Intel XE#979])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vm:        NOTRUN -> [SKIP][16] ([Intel XE#979])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][17] -> [TIMEOUT][18] ([Intel XE#6506])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][19] ([Intel XE#6520]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8639 -> IGTPW_14120
  * Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -> xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b

  IGTPW_14120: 14120
  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca6fe1c3522c6ddc86b
  xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b: 3736d8f8cd5565a7146345cbdf103a4dcff5e55b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/index.html

--===============1472238239223753364==
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
<tr><td><b>Series:</b></td><td>tests/intel/debugfs: Move VRAM MM checks from root to tile-dir validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158118/">https://patchwork.freedesktop.org/series/158118/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8639_BAT -&gt; XEIGTPW_14120_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14120_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_debugfs@tile-dir}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-atsm-2/igt@xe_debugfs@tile-dir.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-atsm-2/igt@xe_debugfs@tile-dir.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_debugfs@tile-dir@tile-0}:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_debugfs@tile-dir@tile-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_debugfs@tile-dir@tile-0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14120_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8639 -&gt; IGTPW_14120</li>
<li>Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -&gt; xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b</li>
</ul>
<p>IGTPW_14120: 14120<br />
  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca6fe1c3522c6ddc86b<br />
  xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b: 3736d8f8cd5565a7146345cbdf103a4dcff5e55b</p>

</body>
</html>

--===============1472238239223753364==--
