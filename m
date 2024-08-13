Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55097C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 17:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258110E3A8;
	Tue, 13 Aug 2024 17:02:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E562E10E3A7;
 Tue, 13 Aug 2024 17:02:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2363668139869899670=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_intel-gfx-fw-info=3A_Hide_raw_dump_behind_a_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Aug 2024 17:02:47 -0000
Message-ID: <172356856793.614286.14401536001333742022@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813152141.3151865-1-lucas.demarchi@intel.com>
In-Reply-To: <20240813152141.3151865-1-lucas.demarchi@intel.com>
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

--===============2363668139869899670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] intel-gfx-fw-info: Hide raw dump behind a flag
URL   : https://patchwork.freedesktop.org/series/137249/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7967_BAT -> XEIGTPW_11569_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11569_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11569_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11569_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11569_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][3] -> [SKIP][4] ([Intel XE#1885])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-lnl-1:          [PASS][5] -> [FAIL][6] ([Intel XE#886])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - bat-lnl-1:          [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#1620] / [Intel XE#1760]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-lnl-1:          [PASS][9] -> [SKIP][10] ([Intel XE#2423]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-lnl-1:          [PASS][11] -> [SKIP][12] ([Intel XE#2351]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-lnl-2:          [PASS][15] -> [SKIP][16] ([Intel XE#2229])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@cpu-caching:
    - bat-lnl-1:          [PASS][17] -> [SKIP][18] ([Intel XE#1130]) +170 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_mmap@cpu-caching.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-lnl-1:          [FAIL][19] ([Intel XE#886]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][21] ([Intel XE#1091]) -> [SKIP][22] ([Intel XE#2423]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-lnl-1:          [SKIP][23] ([Intel XE#688]) -> [SKIP][24] ([Intel XE#1130]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          [SKIP][25] ([Intel XE#1416]) -> [SKIP][26] ([Intel XE#1130])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_mmap@vram.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][27] ([Intel XE#1420]) -> [SKIP][28] ([Intel XE#1130])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          [SKIP][29] ([Intel XE#977]) -> [SKIP][30] ([Intel XE#1130])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][31] ([Intel XE#979]) -> [SKIP][32] ([Intel XE#1130])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7967 -> IGTPW_11569
  * Linux: xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78 -> xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b

  IGTPW_11569: 11569
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78: bb06cec392c188bc980be5cee9a85240ce866b78
  xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b: 4d1d605f5ff966b0df757c683e396a9f3e77171b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/index.html

--===============2363668139869899670==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] intel-gfx-fw-info: Hide raw dump behind a flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137249/">https://patchwork.freedesktop.org/series/137249/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7967_BAT -&gt; XEIGTPW_11569_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11569_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11569_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11569_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11569_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_mmap@cpu-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_mmap@cpu-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +170 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7967/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11569/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7967 -&gt; IGTPW_11569</li>
<li>Linux: xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78 -&gt; xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b</li>
</ul>
<p>IGTPW_11569: 11569<br />
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78: bb06cec392c188bc980be5cee9a85240ce866b78<br />
  xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b: 4d1d605f5ff966b0df757c683e396a9f3e77171b</p>

</body>
</html>

--===============2363668139869899670==--
