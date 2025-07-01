Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31979C83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 12:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA8B10E58E;
	Tue,  1 Jul 2025 12:12:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300810E59D;
 Tue,  1 Jul 2025 12:12:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1489978274169782284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_fast-feedback=2Etestlist?=
 =?utf-8?q?=3A_Reorder_dmabuf_and_i915=5Fselftest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Jul 2025 12:12:57 -0000
Message-ID: <175137197759.123904.17158519728581962035@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250701103405.23478-1-peter.senna@linux.intel.com>
In-Reply-To: <20250701103405.23478-1-peter.senna@linux.intel.com>
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

--===============1489978274169782284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fast-feedback.testlist: Reorder dmabuf and i915_selftest
URL   : https://patchwork.freedesktop.org/series/151009/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8432 -> IGTPW_13379
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13379 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13379, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/index.html

Participating hosts (45 -> 41)
------------------------------

  Missing    (4): bat-apl-1 fi-pnv-d510 fi-snb-2520m bat-adlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13379:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_13379 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - fi-rkl-11600:       [PASS][3] -> [SKIP][4] ([i915#2582]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-ivb-3770:        [PASS][5] -> [SKIP][6] ([i915#1849])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-ivb-3770/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-ivb-3770/igt@fbdev@info.html
    - fi-rkl-11600:       [PASS][7] -> [SKIP][8] ([i915#1849] / [i915#2582])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@info.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@fbdev@info.html

  * igt@fbdev@read:
    - fi-ivb-3770:        [PASS][9] -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-ivb-3770/igt@fbdev@read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-ivb-3770/igt@fbdev@read.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][11] -> [DMESG-WARN][12] ([i915#13494])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-mtlp-9/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-jsl-1:          [PASS][13] -> [DMESG-WARN][14] ([i915#13827]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-jsl-1/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][15] -> [DMESG-FAIL][16] ([i915#12061])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-rkl-11600:       [PASS][17] -> [SKIP][18] ([i915#3637]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-rkl-11600:       [PASS][19] -> [SKIP][20] ([i915#1849] / [i915#5354])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-rkl-11600:       [PASS][21] -> [SKIP][22] ([i915#11190]) +13 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-rkl-11600:       [PASS][23] -> [SKIP][24] ([i915#3708])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - bat-dg2-14:         [ABORT][25] ([i915#14201]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live@execlists.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-dg2-14/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][27] ([i915#13735]) -> [PASS][28] +82 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][29] ([i915#13735] / [i915#13890]) -> [PASS][30] +49 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-14:         [ABORT][31] ([i915#14201]) -> [DMESG-FAIL][32] ([i915#12061])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-dg2-14/igt@i915_selftest@live.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-rkl-11600:       [SKIP][33] ([i915#4103]) -> [SKIP][34] ([i915#11190]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-rkl-11600:       [SKIP][35] ([i915#3555] / [i915#3840]) -> [SKIP][36] ([i915#11190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_dsc@dsc-basic.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13827]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13827
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8432 -> IGTPW_13379
  * Linux: CI_DRM_16777 -> CI_DRM_16780

  CI-20190529: 20190529
  CI_DRM_16777: d9007d535ea106181346f9988c97aa73a9cdfb86 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16780: 9f3690735949ad5f24ece89cf2e91c2750ea580f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13379: d41e836364d69a2e0b6494b244a637844e24cb33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/index.html

--===============1489978274169782284==
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
<tr><td><b>Series:</b></td><td>fast-feedback.testlist: Reorder dmabuf and i915_selftest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151009/">https://patchwork.freedesktop.org/series/151009/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8432 -&gt; IGTPW_13379</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13379 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13379, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/index.html</p>
<h2>Participating hosts (45 -&gt; 41)</h2>
<p>Missing    (4): bat-apl-1 fi-pnv-d510 fi-snb-2520m bat-adlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13379:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13379 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-ivb-3770/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-ivb-3770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-ivb-3770/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-ivb-3770/igt@fbdev@read.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-jsl-1/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13827">i915#13827</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-dg2-14/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +82 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/bat-dg2-14/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13379/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8432 -&gt; IGTPW_13379</li>
<li>Linux: CI_DRM_16777 -&gt; CI_DRM_16780</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16777: d9007d535ea106181346f9988c97aa73a9cdfb86 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16780: 9f3690735949ad5f24ece89cf2e91c2750ea580f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13379: d41e836364d69a2e0b6494b244a637844e24cb33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1489978274169782284==--
