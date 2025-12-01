Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D23D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 23:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA1910E4D8;
	Mon,  1 Dec 2025 23:45:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5E610E4D8;
 Mon,  1 Dec 2025 23:45:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5698131160584773768=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fvm=3A_Add_?=
 =?utf-8?q?drm=5Fxe=5Fvm=5Fget=5Fproperty_tests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Dec 2025 23:45:52 -0000
Message-ID: <176463275245.46619.1116742422354665508@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201184729.164799-6-jonathan.cavitt@intel.com>
In-Reply-To: <20251201184729.164799-6-jonathan.cavitt@intel.com>
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

--===============5698131160584773768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add drm_xe_vm_get_property tests (rev5)
URL   : https://patchwork.freedesktop.org/series/146986/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8647_BAT -> XEIGTPW_14137_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14137_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14137_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14137_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_queue_property@invalid-property:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-vm:        [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-1:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-vm:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-2:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-1:          [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-2:          [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14137_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][23] -> [TIMEOUT][24] ([Intel XE#6506])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][25] -> [FAIL][26] ([Intel XE#6519])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8647 -> IGTPW_14137
  * Linux: xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6 -> xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65

  IGTPW_14137: a3d721baa0609759f6ab677bae983675865c0d4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8647: 8647
  xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6: 4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6
  xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65: 639f325d8cbdc690de963db2fe5840444ac7ea65

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/index.html

--===============5698131160584773768==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add drm_xe_vm_get_property tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146986/">https://patchwork.freedesktop.org/series/146986/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8647_BAT -&gt; XEIGTPW_14137_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14137_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14137_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14137_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14137_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8647/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14137/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8647 -&gt; IGTPW_14137</li>
<li>Linux: xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6 -&gt; xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65</li>
</ul>
<p>IGTPW_14137: a3d721baa0609759f6ab677bae983675865c0d4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8647: 8647<br />
  xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6: 4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6<br />
  xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65: 639f325d8cbdc690de963db2fe5840444ac7ea65</p>

</body>
</html>

--===============5698131160584773768==--
