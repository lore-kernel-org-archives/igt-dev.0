Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3FC28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 03:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C2910E0D7;
	Wed, 26 Mar 2025 03:43:24 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA2410E0D7;
 Wed, 26 Mar 2025 03:43:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4279580922224089888=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/igt=5Fpsr=3A_Fix_PSR_?=
 =?utf-8?q?active_check_for_DisplayPort_connectors_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Mar 2025 03:43:23 -0000
Message-ID: <174296060303.3802.5745287852504680289@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
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

--===============4279580922224089888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_psr: Fix PSR active check for DisplayPort connectors (rev3)
URL   : https://patchwork.freedesktop.org/series/146563/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8284 -> IGTPW_12834
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12834 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12834, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12834:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-skl-6600u:       [PASS][1] -> [WARN][2] +3 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
    - bat-adlp-6:         [PASS][3] -> [WARN][4] +3 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move@edp-1:
    - bat-mtlp-8:         [PASS][5] -> [CRASH][6] +2 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-8/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-8/igt@kms_psr@psr-cursor-plane-move@edp-1.html
    - bat-mtlp-9:         [PASS][7] -> [CRASH][8] +2 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html
    - bat-arlh-3:         [PASS][9] -> [CRASH][10] +2 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-twl-1:          [PASS][11] -> [WARN][12] +3 other tests warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-twl-1:          [PASS][13] -> [CRASH][14] +3 other tests crash
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
    - bat-adlp-6:         [PASS][15] -> [CRASH][16] +3 other tests crash
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html
    - fi-skl-6600u:       [PASS][17] -> [CRASH][18] +3 other tests crash
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-twl-2:          [PASS][19] -> [WARN][20] +3 other tests warn
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-mtlp-9:         [PASS][21] -> [WARN][22] +2 other tests warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-mtlp-8:         [PASS][23] -> [WARN][24] +2 other tests warn
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-8/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-arlh-3:         [PASS][25] -> [WARN][26] +2 other tests warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff@edp-1:
    - bat-twl-2:          [PASS][27] -> [CRASH][28] +3 other tests crash
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12834 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][29] -> [INCOMPLETE][30] ([i915#12904]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-rplp-1:         [PASS][31] -> [INCOMPLETE][32] ([i915#9413]) +1 other test incomplete
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-rplp-1/igt@i915_selftest@live.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-rplp-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][33] -> [DMESG-WARN][34] ([i915#13735]) +132 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][35] -> [DMESG-FAIL][36] ([i915#12061]) +1 other test dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [PASS][37] -> [DMESG-FAIL][38] ([i915#12061]) +1 other test dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8284 -> IGTPW_12834

  CI-20190529: 20190529
  CI_DRM_16320: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12834: 12834
  IGT_8284: 8284

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/index.html

--===============4279580922224089888==
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
<tr><td><b>Series:</b></td><td>lib/igt_psr: Fix PSR active check for DisplayPort connectors (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146563/">https://patchwork.freedesktop.org/series/146563/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8284 -&gt; IGTPW_12834</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12834 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12834, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12834:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">WARN</a> +3 other tests warn</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html">WARN</a> +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move@edp-1:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-8/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-8/igt@kms_psr@psr-cursor-plane-move@edp-1.html">CRASH</a> +2 other tests crash</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html">CRASH</a> +2 other tests crash</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html">CRASH</a> +2 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html">WARN</a> +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +3 other tests warn</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +2 other tests warn</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-8/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-8/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +2 other tests warn</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +2 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff@edp-1:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12834 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-rplp-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-rplp-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +132 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12834/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8284 -&gt; IGTPW_12834</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16320: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12834: 12834<br />
  IGT_8284: 8284</p>

</body>
</html>

--===============4279580922224089888==--
