Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420F2C52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 13:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CAF10E918;
	Fri,  9 Aug 2024 13:32:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D03510E911;
 Fri,  9 Aug 2024 13:32:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5200639384155898605=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_runner=3A_Allow_dynamically?=
 =?utf-8?q?_ignore_dmesg_errors_or_warnings_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Aug 2024 13:32:08 -0000
Message-ID: <172321032831.552689.11963789947714955317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
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

--===============5200639384155898605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Allow dynamically ignore dmesg errors or warnings (rev5)
URL   : https://patchwork.freedesktop.org/series/136494/
State : success

== Summary ==

CI Bug Log - changes from IGT_7964 -> IGTPW_11550
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/index.html

Participating hosts (37 -> 38)
------------------------------

  Additional (4): fi-cfl-8109u fi-kbl-8809g fi-bsw-n3050 fi-pnv-d510 
  Missing    (3): bat-mtlp-6 fi-snb-2520m fi-elk-e7500 

Known issues
------------

  Here are the changes found in IGTPW_11550 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-pnv-d510/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][5] +19 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][7] -> [DMESG-WARN][8] ([i915#11349] / [i915#11378])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7964/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][9] +30 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][10] +11 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-11:        [INCOMPLETE][11] ([i915#9413]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7964/bat-adlp-11/igt@i915_selftest@live@gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/bat-adlp-11/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-arls-5:         [DMESG-WARN][13] ([i915#11898]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7964/bat-arls-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/bat-arls-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#11898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11898
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7964 -> IGTPW_11550

  CI-20190529: 20190529
  CI_DRM_15204: 040fda7980e8fccde054bf16158538ff80223e36 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11550: 11550
  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/index.html

--===============5200639384155898605==
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
<tr><td><b>Series:</b></td><td>runner: Allow dynamically ignore dmesg errors or warnings (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136494/">https://patchwork.freedesktop.org/series/136494/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7964 -&gt; IGTPW_11550</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/index.html</p>
<h2>Participating hosts (37 -&gt; 38)</h2>
<p>Additional (4): fi-cfl-8109u fi-kbl-8809g fi-bsw-n3050 fi-pnv-d510 <br />
  Missing    (3): bat-mtlp-6 fi-snb-2520m fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11550 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> +32 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7964/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7964/bat-adlp-11/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/bat-adlp-11/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7964/bat-arls-5/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11898">i915#11898</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11550/bat-arls-5/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7964 -&gt; IGTPW_11550</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15204: 040fda7980e8fccde054bf16158538ff80223e36 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11550: 11550<br />
  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5200639384155898605==--
