Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32354C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FB410E29E;
	Fri, 14 Feb 2025 10:07:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764610E29E;
 Fri, 14 Feb 2025 10:07:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3142696263986580516=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_RFC_tests/intel/kms=5Ffro?=
 =?utf-8?q?ntbuffer=5Ftracking=3A_Introduce_plane-fbc-dr_test_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Feb 2025 10:07:30 -0000
Message-ID: <173952765061.1993330.3241535464146608320@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214091143.1265210-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250214091143.1265210-1-santhosh.reddy.guddati@intel.com>
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

--===============3142696263986580516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev9)
URL   : https://patchwork.freedesktop.org/series/138218/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8229 -> IGTPW_12595
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12595 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12595, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/index.html

Participating hosts (42 -> 38)
------------------------------

  Additional (2): fi-hsw-4770 fi-pnv-d510 
  Missing    (6): bat-rplp-1 bat-mtlp-9 bat-dg2-14 fi-snb-2520m fi-glk-j4005 bat-twl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12595:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@guc_hang:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-bsw-nick/igt@i915_selftest@live@guc_hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-bsw-nick/igt@i915_selftest@live@guc_hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_12595 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][4] +14 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@i915_selftest@live:
    - bat-twl-2:          [PASS][5] -> [ABORT][6] ([i915#12919] / [i915#13503])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-twl-2/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-twl-2/igt@i915_selftest@live.html
    - fi-bsw-nick:        [PASS][7] -> [ABORT][8] ([i915#12435])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-bsw-nick/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-bsw-nick/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_engines:
    - bat-twl-2:          [PASS][9] -> [ABORT][10] ([i915#12919])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-twl-2/igt@i915_selftest@live@gt_engines.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-twl-2/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][11] -> [DMESG-FAIL][12] ([i915#12061]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][13] ([i915#5190])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-pnv-d510:        NOTRUN -> [SKIP][14] +33 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][15] ([i915#1072]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-8700k:       [ABORT][16] ([i915#13508]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_fence@basic-await@vecs0:
    - bat-rpls-4:         [DMESG-WARN][18] ([i915#13400]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-rpls-4/igt@gem_exec_fence@basic-await@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-rpls-4/igt@gem_exec_fence@basic-await@vecs0.html

  * igt@i915_selftest@live:
    - bat-jsl-3:          [INCOMPLETE][20] ([i915#12445] / [i915#13241]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-jsl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-jsl-3:          [INCOMPLETE][22] ([i915#12445]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html

  
#### Warnings ####

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [ABORT][24] ([i915#13465]) -> [ABORT][25] ([i915#13679]) +1 other test abort
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-atsm-1/igt@i915_selftest@live@mman.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-dg1-6:          [SKIP][26] ([i915#12311] / [i915#3637]) -> [SKIP][27] ([i915#12311] / [i915#13682] / [i915#3637]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-plain-flip:
    - bat-dg1-6:          [SKIP][28] ([i915#12311]) -> [SKIP][29] ([i915#12311] / [i915#13682])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-plain-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-dg1-6/igt@kms_flip@basic-plain-flip.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13241]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465
  [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503
  [i915#13508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13508
  [i915#13679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13679
  [i915#13682]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13682
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8229 -> IGTPW_12595
  * Linux: CI_DRM_16123 -> CI_DRM_16134

  CI-20190529: 20190529
  CI_DRM_16123: 4af00c2e09da0269f3f329e660b6417037041bea @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16134: 57457d93f156d8b4bdff8d138127d81b8f97d8c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12595: 12595
  IGT_8229: 8229

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/index.html

--===============3142696263986580516==
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
<tr><td><b>Series:</b></td><td>RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138218/">https://patchwork.freedesktop.org/series/138218/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8229 -&gt; IGTPW_12595</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12595 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12595, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Additional (2): fi-hsw-4770 fi-pnv-d510 <br />
  Missing    (6): bat-rplp-1 bat-mtlp-9 bat-dg2-14 fi-snb-2520m fi-glk-j4005 bat-twl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12595:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@guc_hang:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-bsw-nick/igt@i915_selftest@live@guc_hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-bsw-nick/igt@i915_selftest@live@guc_hang.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12595 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503">i915#13503</a>)</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-bsw-nick/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435">i915#12435</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-twl-2/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-twl-2/igt@i915_selftest@live@gt_engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13508">i915#13508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-rpls-4/igt@gem_exec_fence@basic-await@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-rpls-4/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241">i915#13241</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-jsl-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-atsm-1/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465">i915#13465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-atsm-1/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13679">i915#13679</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13682">i915#13682</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12595/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13682">i915#13682</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8229 -&gt; IGTPW_12595</li>
<li>Linux: CI_DRM_16123 -&gt; CI_DRM_16134</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16123: 4af00c2e09da0269f3f329e660b6417037041bea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16134: 57457d93f156d8b4bdff8d138127d81b8f97d8c9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12595: 12595<br />
  IGT_8229: 8229</p>

</body>
</html>

--===============3142696263986580516==--
