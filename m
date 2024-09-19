Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38AECE8D4C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 04:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A59510E25F;
	Thu, 19 Sep 2024 04:41:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D6310E25F;
 Thu, 19 Sep 2024 04:41:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4034426539695876135=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpsr=3A_DP?=
 =?utf-8?q?2=2E1_PR_IGT_Fixes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Sep 2024 04:41:41 -0000
Message-ID: <172672090178.1029008.2934387014148851477@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
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

--===============4034426539695876135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr: DP2.1 PR IGT Fixes (rev5)
URL   : https://patchwork.freedesktop.org/series/138157/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15403 -> IGTPW_11731
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-kbl-2 fi-cfl-8109u fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11731 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2] ([i915#12102])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@fbdev@read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@fbdev@read.html

  * igt@gem_lmem_swapping@basic:
    - bat-atsm-1:         [PASS][3] -> [DMESG-WARN][4] ([i915#9795]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-atsm-1/igt@gem_lmem_swapping@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-atsm-1/igt@gem_lmem_swapping@basic.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - bat-arls-1:         [DMESG-WARN][5] ([i915#12102]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@fbdev@eof.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@fbdev@eof.html

  * igt@i915_selftest@live:
    - bat-arls-1:         [DMESG-WARN][7] ([i915#10341] / [i915#12133]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@i915_selftest@live.html
    - bat-arlh-2:         [INCOMPLETE][9] ([i915#10341] / [i915#12133]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arlh-2/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arlh-2/igt@i915_selftest@live.html
    - bat-arls-2:         [ABORT][11] ([i915#12175]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-2/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [DMESG-WARN][13] ([i915#11349]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - bat-arlh-2:         [INCOMPLETE][15] ([i915#11981]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arlh-2/igt@i915_selftest@live@slpc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arlh-2/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][17] ([i915#12061]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-arls-2:         [ABORT][19] ([i915#12061]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-2/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-2/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [INCOMPLETE][21] ([i915#11320]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - bat-arls-5:         [DMESG-WARN][23] ([i915#11637]) -> [DMESG-WARN][24] ([i915#11637] / [i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-5/igt@i915_module_load@reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-5/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][25] ([i915#10341]) -> [DMESG-WARN][26] ([i915#10341])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-mtlp-8/igt@i915_selftest@live.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-mtlp-8:         [DMESG-FAIL][27] ([i915#9500]) -> [DMESG-WARN][28] ([i915#11349])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#11786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11786
  [i915#11981]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11981
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12175
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9795]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9795


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8013 -> IGTPW_11731

  CI-20190529: 20190529
  CI_DRM_15403: 5c43f7fc693a421b6bd029a255d5c940c0072187 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11731: 11731
  IGT_8013: 8013

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/index.html

--===============4034426539695876135==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr: DP2.1 PR IGT Fixes (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138157/">https://patchwork.freedesktop.org/series/138157/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15403 -&gt; IGTPW_11731</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-kbl-2 fi-cfl-8109u fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11731 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-atsm-1/igt@gem_lmem_swapping@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-atsm-1/igt@gem_lmem_swapping@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9795">i915#9795</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@fbdev@eof.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arlh-2/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12175">i915#12175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arlh-2/igt@i915_selftest@live@slpc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11981">i915#11981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arlh-2/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15403/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11731/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8013 -&gt; IGTPW_11731</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15403: 5c43f7fc693a421b6bd029a255d5c940c0072187 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11731: 11731<br />
  IGT_8013: 8013</p>

</body>
</html>

--===============4034426539695876135==--
