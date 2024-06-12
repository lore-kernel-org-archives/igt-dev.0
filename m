Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF10FC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 10:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDE410E1B0;
	Wed, 12 Jun 2024 10:18:54 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B3910E03B;
 Wed, 12 Jun 2024 10:18:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8182650171287533984=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/gpgpu=3A_add_shader_suppor?=
 =?utf-8?q?t_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jun 2024 10:18:52 -0000
Message-ID: <171818753213.68617.8043397927356476587@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
In-Reply-To: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
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

--===============8182650171287533984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpgpu: add shader support (rev7)
URL   : https://patchwork.freedesktop.org/series/133020/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7882_BAT -> XEIGTPW_11252_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11252_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11252_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11252_BAT prevented too many machines from booting.

  Additional (1): bat-pvc-2 
  Missing    (4): bat-atsm-2 bat-dg2-oem2 bat-lnl-1 bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_11252_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][1] ([i915#6077]) +30 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][2] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1024] / [Intel XE#784])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#540]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#1024] / [Intel XE#783])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#829]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#780])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#1024]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          NOTRUN -> [FAIL][10] ([Intel XE#1000]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][11] ([Intel XE#482]) +3 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#1021]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#255])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#532])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#977]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#976])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#979])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#531])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7882 -> IGTPW_11252
  * Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -> xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552

  IGTPW_11252: 11252
  IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3
  xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552: 86b413568d7dbde6078f6c40341f5ae1ae63c552

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/index.html

--===============8182650171287533984==
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
<tr><td><b>Series:</b></td><td>lib/gpgpu: add shader support (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133020/">https://patchwork.freedesktop.org/series/133020/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7882_BAT -&gt; XEIGTPW_11252_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11252_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11252_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11252_BAT prevented too many machines from booting.</p>
<p>Additional (1): bat-pvc-2 <br />
  Missing    (4): bat-atsm-2 bat-dg2-oem2 bat-lnl-1 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11252_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7882 -&gt; IGTPW_11252</li>
<li>Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -&gt; xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552</li>
</ul>
<p>IGTPW_11252: 11252<br />
  IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3<br />
  xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552: 86b413568d7dbde6078f6c40341f5ae1ae63c552</p>

</body>
</html>

--===============8182650171287533984==--
