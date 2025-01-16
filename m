Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E3DC02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 15:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087810E9AC;
	Thu, 16 Jan 2025 15:20:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245F110E9B4;
 Thu, 16 Jan 2025 15:20:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0248293597726158798=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv1=2C1/1=5D_tests/xe=5Feudebug=3A_refactor_exec-queue-plac?=
 =?utf-8?q?ements_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jan 2025 15:20:22 -0000
Message-ID: <173704082214.268103.929367669917326896@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116125522.146533-1-jan.sokolowski@intel.com>
In-Reply-To: <20250116125522.146533-1-jan.sokolowski@intel.com>
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

--===============0248293597726158798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v1,1/1] tests/xe_eudebug: refactor exec-queue-placements test
URL   : https://patchwork.freedesktop.org/series/143606/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8195 -> IGTPW_12448
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12448 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12448, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-atsm-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12448:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@guc_hang:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arlh-2/igt@i915_selftest@live@guc_hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arlh-2/igt@i915_selftest@live@guc_hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_12448 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12904]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-apl-1/igt@dmabuf@all-tests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-arlh-2:         [PASS][7] -> [INCOMPLETE][8] ([i915#12445])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arlh-2/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-6:         [PASS][9] -> [INCOMPLETE][10] ([i915#9413])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-adlp-6/igt@i915_selftest@live@gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-adlp-6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][11] -> [DMESG-FAIL][12] ([i915#12061]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [PASS][13] -> [DMESG-FAIL][14] ([i915#12061]) +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-adlp-6:         [ABORT][17] ([i915#13399]) -> [INCOMPLETE][18] ([i915#9413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-adlp-6/igt@i915_selftest@live.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-adlp-6/igt@i915_selftest@live.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8195 -> IGTPW_12448
  * Linux: CI_DRM_15966 -> CI_DRM_15967

  CI-20190529: 20190529
  CI_DRM_15966: 2334d1179d652eb4032fcb0d8e6f53cbc6a1011c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15967: 50d15a728295807727a2642284d639fc71ecaa15 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12448: 2fd03025a2eca2200fa611c818989a6f6b77295a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8195: 8195

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/index.html

--===============0248293597726158798==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v1,1/1] tests/xe_eudebug: refactor exec-queue-placements test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143606/">https://patchwork.freedesktop.org/series/143606/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8195 -&gt; IGTPW_12448</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12448 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12448, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-atsm-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12448:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@guc_hang:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arlh-2/igt@i915_selftest@live@guc_hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arlh-2/igt@i915_selftest@live@guc_hang.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12448 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-adlp-6/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-adlp-6/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8195/bat-adlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399">i915#13399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12448/bat-adlp-6/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8195 -&gt; IGTPW_12448</li>
<li>Linux: CI_DRM_15966 -&gt; CI_DRM_15967</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15966: 2334d1179d652eb4032fcb0d8e6f53cbc6a1011c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15967: 50d15a728295807727a2642284d639fc71ecaa15 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12448: 2fd03025a2eca2200fa611c818989a6f6b77295a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8195: 8195</p>

</body>
</html>

--===============0248293597726158798==--
