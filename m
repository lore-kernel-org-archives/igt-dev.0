Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA780C87FC9
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 10:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4FA10E12D;
	Mon, 28 Jul 2025 10:35:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C9910E12D;
 Mon, 28 Jul 2025 10:35:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0316075219337807610=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv3=2C1/5=5D_tests/kms=5Fasync=5Fflips=3A_Fix_suspend-resum?=
 =?utf-8?q?e_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 28 Jul 2025 10:35:49 -0000
Message-ID: <175369894932.193750.16660805257654301180@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
In-Reply-To: <20250723055353.1137242-1-karthik.b.s@intel.com>
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

--===============0316075219337807610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/5] tests/kms_async_flips: Fix suspend-resume subtest
URL   : https://patchwork.freedesktop.org/series/151976/
State : success

== Summary ==

CI Bug Log - changes from IGT_8473 -> IGTPW_13511
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8473 and IGTPW_13511:

### New IGT tests (5) ###

  * igt@kms_dsc@dsc-basic@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_dsc@dsc-basic@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_dsc@dsc-basic@pipe-c-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a1:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.69] s

  

Known issues
------------

  Here are the changes found in IGTPW_13511 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][1] -> [ABORT][2] ([i915#12904]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-apl-1/igt@dmabuf@all-tests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][3] -> [ABORT][4] ([i915#13494])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-mtlp-9/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - fi-hsw-4770:        [PASS][5] -> [INCOMPLETE][6] ([i915#14393]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-hsw-4770/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-hsw-4770/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][7] ([i915#13929])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-rpls-4:         [PASS][8] -> [FAIL][9] ([i915#10826]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - bat-dg2-9:          [PASS][10] -> [FAIL][11] ([i915#10826]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-dg2-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-dg2-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][12] ([i915#12061]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-mtlp-8/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [INCOMPLETE][14] ([i915#14564] / [i915#14566]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-atsm-1/igt@i915_selftest@live@requests.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-atsm-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][16] ([i915#13735]) -> [PASS][17] +79 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][18] ([i915#12061]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][20] ([i915#13735] / [i915#180]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][22] ([i915#13735] / [i915#13890] / [i915#180]) -> [PASS][23] +52 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [INCOMPLETE][24] ([i915#12061]) -> [DMESG-FAIL][25] ([i915#12061] / [i915#13929])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-atsm-1/igt@i915_selftest@live.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14393
  [i915#14564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564
  [i915#14566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14566
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8473 -> IGTPW_13511

  CI-20190529: 20190529
  CI_DRM_16911: 3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13511: 13511
  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/index.html

--===============0316075219337807610==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/5] tests/kms_async_flips: Fix suspend-resume subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151976/">https://patchwork.freedesktop.org/series/151976/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8473 -&gt; IGTPW_13511</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8473 and IGTPW_13511:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.69] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13511 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-apl-1/igt@dmabuf@all-tests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-mtlp-9/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-hsw-4770/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14393">i915#14393</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-dg2-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-dg2-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564">i915#14564</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14566">i915#14566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +52 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8473/bat-atsm-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13511/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8473 -&gt; IGTPW_13511</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16911: 3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13511: 13511<br />
  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0316075219337807610==--
