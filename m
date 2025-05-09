Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36848C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 13:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FC510E25F;
	Fri,  9 May 2025 13:24:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B1D10E25F;
 Fri,  9 May 2025 13:24:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6782592423167154587=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fflip=3A_Improve?=
 =?utf-8?q?_frame_timing_checks_for_high_refresh_rates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 May 2025 13:24:09 -0000
Message-ID: <174679704974.63953.16692735066555151851@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
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

--===============6782592423167154587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Improve frame timing checks for high refresh rates (rev2)
URL   : https://patchwork.freedesktop.org/series/148796/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8359_BAT -> XEIGTPW_13104_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13104_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13104_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13104_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13104_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2463]) +86 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-adlp-vf/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - bat-bmg-1:          NOTRUN -> [SKIP][3] ([Intel XE#2316]) +23 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#1421]) +42 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#310]) +23 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#310]) +16 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-adlp-7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#2316]) +42 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - bat-lnl-1:          NOTRUN -> [SKIP][8] ([Intel XE#1421]) +23 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - bat-lnl-2:          NOTRUN -> [SKIP][9] ([Intel XE#2235] / [Intel XE#2482]) +40 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - bat-bmg-2:          NOTRUN -> [SKIP][10] ([Intel XE#2482]) +40 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#1024]) +86 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-atsm-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - bat-bmg-2:          NOTRUN -> [SKIP][12] ([Intel XE#4882]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-2/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][13] ([Intel XE#301]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@flip-vs-expired-vblank.html
    - bat-lnl-1:          NOTRUN -> [FAIL][14] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - bat-lnl-1:          NOTRUN -> [FAIL][15] ([Intel XE#301]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][16] ([Intel XE#301] / [Intel XE#3321])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@flip-vs-expired-vblank@d-dp3.html

  * igt@kms_flip@flip-vs-suspend:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][17] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-interruptible:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#1024]) +86 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-pvc-2/igt@kms_flip@plain-flip-interruptible.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#4882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882


Build changes
-------------

  * IGT: IGT_8359 -> IGTPW_13104
  * Linux: xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246 -> xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9

  IGTPW_13104: 0073c7f82d663abce9d62eb21e32529af12ed4e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246: 2862c51f227a36e59ee4a9bb90b690c9855a6246
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/index.html

--===============6782592423167154587==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Improve frame timing checks for high refresh rates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148796/">https://patchwork.freedesktop.org/series/148796/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8359_BAT -&gt; XEIGTPW_13104_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13104_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13104_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13104_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13104_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-adlp-vf/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-1/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-adlp-7/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-atsm-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-bmg-2/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882">Intel XE#4882</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@flip-vs-expired-vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-dg2-oem2/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13104/bat-pvc-2/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +86 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8359 -&gt; IGTPW_13104</li>
<li>Linux: xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246 -&gt; xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9</li>
</ul>
<p>IGTPW_13104: 0073c7f82d663abce9d62eb21e32529af12ed4e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246: 2862c51f227a36e59ee4a9bb90b690c9855a6246<br />
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9</p>

</body>
</html>

--===============6782592423167154587==--
