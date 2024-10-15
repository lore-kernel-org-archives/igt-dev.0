Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8595CFC505
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 02:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073E10E126;
	Tue, 15 Oct 2024 02:00:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197EF10E4F2;
 Tue, 15 Oct 2024 02:00:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4050474634235859146=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/vmwgfx=3A_Add_test_th?=
 =?utf-8?q?at_draws_triangle_without_using_3d_commands=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maaz Mombasawala" <maaz.mombasawala@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Oct 2024 02:00:06 -0000
Message-ID: <172895760609.1267586.1612467006610317108@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
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

--===============4050474634235859146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/vmwgfx: Add test that draws triangle without using 3d commands. (rev2)
URL   : https://patchwork.freedesktop.org/series/139588/
State : success

== Summary ==

CI Bug Log - changes from IGT_8072 -> IGTPW_11908
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/index.html

Participating hosts (44 -> 41)
------------------------------

  Missing    (3): bat-jsl-1 fi-snb-2520m bat-jsl-3 

Known issues
------------

  Here are the changes found in IGTPW_11908 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][1] -> [ABORT][2] ([i915#12133])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-arlh-2/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][3] -> [ABORT][4] ([i915#12061])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  * igt@runner@aborted:
    - bat-dg2-14:         NOTRUN -> [FAIL][5] ([i915#12292])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-dg2-14/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-adlp-6:         [DMESG-WARN][6] ([i915#12253]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-adlp-6/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-adlp-6/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [DMESG-WARN][8] ([i915#11621] / [i915#180] / [i915#1982]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][10] ([i915#11621]) -> [PASS][11] +81 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][12] ([i915#12216]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][14] ([i915#180]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][16] ([i915#11621] / [i915#180]) -> [PASS][17] +51 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8072 -> IGTPW_11908
  * Linux: CI_DRM_15534 -> CI_DRM_15536

  CI-20190529: 20190529
  CI_DRM_15534: 892fd600df8dbadaf4a31ca9f857e17bd322696b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15536: f6087efed4047ae323633876dc9b3222bee4ec41 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11908: 11908
  IGT_8072: 8072

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/index.html

--===============4050474634235859146==
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
<tr><td><b>Series:</b></td><td>tests/vmwgfx: Add test that draws triangle without using 3d commands. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139588/">https://patchwork.freedesktop.org/series/139588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8072 -&gt; IGTPW_11908</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Missing    (3): bat-jsl-1 fi-snb-2520m bat-jsl-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11908 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-arlh-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-dg2-14/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292">i915#12292</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-adlp-6/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-adlp-6/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8072/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11908/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8072 -&gt; IGTPW_11908</li>
<li>Linux: CI_DRM_15534 -&gt; CI_DRM_15536</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15534: 892fd600df8dbadaf4a31ca9f857e17bd322696b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15536: f6087efed4047ae323633876dc9b3222bee4ec41 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11908: 11908<br />
  IGT_8072: 8072</p>

</body>
</html>

--===============4050474634235859146==--
