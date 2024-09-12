Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDEEED621
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 16:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A5710E049;
	Thu, 12 Sep 2024 16:47:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB710E049;
 Thu, 12 Sep 2024 16:47:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2637932218483663734=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_relax_doc_generation_for_no?=
 =?utf-8?q?n-compiled_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 16:47:28 -0000
Message-ID: <172615964889.992784.16208773286999246769@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
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

--===============2637932218483663734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: relax doc generation for non-compiled tests
URL   : https://patchwork.freedesktop.org/series/138584/
State : success

== Summary ==

CI Bug Log - changes from IGT_8014 -> IGTPW_11733
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/index.html

Participating hosts (40 -> 35)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (6): bat-dg1-7 bat-arlh-3 fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 fi-elk-e7500 

Known issues
------------

  Here are the changes found in IGTPW_11733 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] +39 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live:
    - bat-arls-1:         [PASS][3] -> [DMESG-WARN][4] ([i915#10341] / [i915#12133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-1/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [PASS][5] -> [DMESG-WARN][6] ([i915#11349])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [PASS][7] -> [INCOMPLETE][8] ([i915#9413]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-adlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arls-2:         [DMESG-WARN][9] ([i915#10341] / [i915#12133]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-2/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [DMESG-WARN][11] ([i915#11349]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [INCOMPLETE][13] ([i915#11320]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Warnings ####

  * igt@fbdev@read:
    - bat-arls-1:         [DMESG-WARN][15] ([i915#12102]) -> [DMESG-FAIL][16] ([i915#12102])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-1/igt@fbdev@read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-1/igt@fbdev@read.html

  * igt@i915_module_load@reload:
    - bat-arls-5:         [DMESG-WARN][17] ([i915#11637]) -> [DMESG-WARN][18] ([i915#11637] / [i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-5/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-5/igt@i915_module_load@reload.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8014 -> IGTPW_11733

  CI-20190529: 20190529
  CI_DRM_15406: 7fc279c7cf796102479291b06b2969d3c27deeb8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11733: c42d108b0d13af728ed563d1ee3c825572e7d086 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8014: 98173eeaa9d688090abe1e180f855f47e5bad9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/index.html

--===============2637932218483663734==
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
<tr><td><b>Series:</b></td><td>relax doc generation for non-compiled tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138584/">https://patchwork.freedesktop.org/series/138584/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8014 -&gt; IGTPW_11733</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/index.html</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (6): bat-dg1-7 bat-arlh-3 fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11733 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-1/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-adlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-adlp-9/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-2/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-1/igt@fbdev@read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8014/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11733/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8014 -&gt; IGTPW_11733</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15406: 7fc279c7cf796102479291b06b2969d3c27deeb8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11733: c42d108b0d13af728ed563d1ee3c825572e7d086 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8014: 98173eeaa9d688090abe1e180f855f47e5bad9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2637932218483663734==--
