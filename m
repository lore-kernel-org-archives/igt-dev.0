Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD3CD11183
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 06:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3D710E07F;
	Mon,  4 Nov 2024 06:39:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117DB10E07F;
 Mon,  4 Nov 2024 06:39:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4631590747368893909=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_scripts/generate=5Figa64=5F?=
 =?utf-8?q?codes=3A_prevent_objcopy_from_modifying_the_input_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeff Dagenais" <jeff.dagenais@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 06:39:53 -0000
Message-ID: <173070239306.1390299.1888583966717986023@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030184054.73065-1-jdagenais@tesla.com>
In-Reply-To: <20241030184054.73065-1-jdagenais@tesla.com>
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

--===============4631590747368893909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/generate_iga64_codes: prevent objcopy from modifying the input file
URL   : https://patchwork.freedesktop.org/series/140771/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8091 -> IGTPW_12015
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12015 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12015, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html

Participating hosts (46 -> 44)
------------------------------

  Missing    (2): fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12015:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@nb-await@vecs0:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html

  
New tests
---------

  New tests have been introduced between IGT_8091 and IGTPW_12015:

### New IGT tests (1) ###

  * igt@debugfs_test@basic-hwmon:
    - Statuses : 7 pass(s) 36 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_12015 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-twl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12133] / [i915#9413])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-twl-1/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-twl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-1:          [PASS][5] -> [INCOMPLETE][6] ([i915#9413])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-twl-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@reset:
    - bat-atsm-1:         [PASS][7] -> [ABORT][8] ([i915#12133])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-atsm-1/igt@i915_selftest@live@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-atsm-1/igt@i915_selftest@live@reset.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][9] -> [DMESG-WARN][10] ([i915#12253])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await:
    - bat-dg2-14:         [FAIL][11] ([i915#12660]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-dg2-14/igt@gem_exec_fence@basic-await.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-dg2-14/igt@gem_exec_fence@basic-await.html

  * igt@i915_selftest@live:
    - bat-mtlp-6:         [DMESG-WARN][13] ([i915#10341] / [i915#12133]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-mtlp-6/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-mtlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-mtlp-6:         [DMESG-WARN][15] ([i915#11349] / [i915#12133]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12660]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12660
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8091 -> IGTPW_12015
  * Linux: CI_DRM_15616 -> CI_DRM_15620

  CI-20190529: 20190529
  CI_DRM_15616: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15620: 9c4962db90300e1d8daca8ed54195bc31d0ee932 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12015: 12015
  IGT_8091: 8091

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html

--===============4631590747368893909==
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
<tr><td><b>Series:</b></td><td>scripts/generate_iga64_codes: prevent objcopy from modifying the input file</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140771/">https://patchwork.freedesktop.org/series/140771/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8091 -&gt; IGTPW_12015</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12015 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12015, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html</p>
<h2>Participating hosts (46 -&gt; 44)</h2>
<p>Missing    (2): fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12015:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_fence@nb-await@vecs0:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8091 and IGTPW_12015:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@debugfs_test@basic-hwmon:<ul>
<li>Statuses : 7 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12015 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-twl-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-atsm-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-atsm-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-dg2-14/igt@gem_exec_fence@basic-await.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12660">i915#12660</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-dg2-14/igt@gem_exec_fence@basic-await.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-mtlp-6/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8091 -&gt; IGTPW_12015</li>
<li>Linux: CI_DRM_15616 -&gt; CI_DRM_15620</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15616: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15620: 9c4962db90300e1d8daca8ed54195bc31d0ee932 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12015: 12015<br />
  IGT_8091: 8091</p>

</body>
</html>

--===============4631590747368893909==--
