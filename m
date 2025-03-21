Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A53C28B30
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 01:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EBB10E0D7;
	Fri, 21 Mar 2025 01:48:36 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89E410E0D7;
 Fri, 21 Mar 2025 01:48:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3302816764106948877=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/igt=5Fpsr=3A_Fix_PSR_?=
 =?utf-8?q?active_check_for_DisplayPort_connectors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Mar 2025 01:48:34 -0000
Message-ID: <174252171487.61676.17906629420501637607@18a75f3d1eae>
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

--===============3302816764106948877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_psr: Fix PSR active check for DisplayPort connectors
URL   : https://patchwork.freedesktop.org/series/146563/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8277 -> IGTPW_12807
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12807 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12807, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/index.html

Participating hosts (42 -> 42)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12807:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-skl-6600u:       [PASS][1] -> [WARN][2] +3 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
    - bat-adlp-6:         [PASS][3] -> [WARN][4] +3 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move@edp-1:
    - bat-mtlp-9:         [PASS][5] -> [CRASH][6] +2 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html
    - bat-arlh-3:         [PASS][7] -> [CRASH][8] +2 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-twl-1:          [PASS][9] -> [WARN][10] +3 other tests warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-twl-1:          [PASS][11] -> [CRASH][12] +3 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
    - bat-adlp-6:         [PASS][13] -> [CRASH][14] +3 other tests crash
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html
    - fi-skl-6600u:       [PASS][15] -> [CRASH][16] +3 other tests crash
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-twl-2:          [PASS][17] -> [WARN][18] +3 other tests warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-mtlp-9:         [PASS][19] -> [WARN][20] +2 other tests warn
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-arlh-3:         [PASS][21] -> [WARN][22] +2 other tests warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff@edp-1:
    - bat-twl-2:          [PASS][23] -> [CRASH][24] +3 other tests crash
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr-primary-page-flip:
    - {bat-jsl-4}:        [PASS][25] -> [WARN][26] +3 other tests warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-jsl-4/igt@kms_psr@psr-primary-page-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-jsl-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - {bat-jsl-4}:        [PASS][27] -> [CRASH][28] +3 other tests crash
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-jsl-4/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-jsl-4/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12807 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][29] -> [DMESG-FAIL][30] ([i915#12061]) +1 other test dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-9:          [ABORT][31] ([i915#13465] / [i915#13571]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][33] ([i915#13494]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [DMESG-FAIL][35] ([i915#12061]) -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8277 -> IGTPW_12807
  * Linux: CI_DRM_16296 -> CI_DRM_16297

  CI-20190529: 20190529
  CI_DRM_16296: 2695de3e236e7acf43a2cf431e31635585873fc4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16297: fc4903798c88068aaf2d5055b87017efb94e25f1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12807: 12807
  IGT_8277: 8277

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/index.html

--===============3302816764106948877==
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
<tr><td><b>Series:</b></td><td>lib/igt_psr: Fix PSR active check for DisplayPort connectors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146563/">https://patchwork.freedesktop.org/series/146563/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8277 -&gt; IGTPW_12807</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12807 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12807, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12807:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">WARN</a> +3 other tests warn</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html">WARN</a> +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move@edp-1:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move@edp-1.html">CRASH</a> +2 other tests crash</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-arlh-3/igt@kms_psr@psr-cursor-plane-move@edp-1.html">CRASH</a> +2 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-1/igt@kms_psr@psr-primary-page-flip.html">WARN</a> +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-adlp-6/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/fi-skl-6600u/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +3 other tests warn</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +2 other tests warn</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-arlh-3/igt@kms_psr@psr-sprite-plane-onoff.html">WARN</a> +2 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff@edp-1:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-twl-2/igt@kms_psr@psr-sprite-plane-onoff@edp-1.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>{bat-jsl-4}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-jsl-4/igt@kms_psr@psr-primary-page-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-jsl-4/igt@kms_psr@psr-primary-page-flip.html">WARN</a> +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>{bat-jsl-4}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-jsl-4/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-jsl-4/igt@kms_psr@psr-primary-page-flip@edp-1.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12807 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465">i915#13465</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571">i915#13571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8277/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12807/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8277 -&gt; IGTPW_12807</li>
<li>Linux: CI_DRM_16296 -&gt; CI_DRM_16297</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16296: 2695de3e236e7acf43a2cf431e31635585873fc4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16297: fc4903798c88068aaf2d5055b87017efb94e25f1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12807: 12807<br />
  IGT_8277: 8277</p>

</body>
</html>

--===============3302816764106948877==--
