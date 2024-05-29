Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042EFC25B7C
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 05:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94852113095;
	Wed, 29 May 2024 05:11:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E386112234;
 Wed, 29 May 2024 05:11:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4051884642355964214=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Enable_fbdev_tests_on_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 May 2024 05:11:45 -0000
Message-ID: <171695950518.2232184.1864325678415588805@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
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

--===============4051884642355964214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable fbdev tests on XE
URL   : https://patchwork.freedesktop.org/series/134106/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14828 -> IGTPW_11200
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html

Participating hosts (37 -> 40)
------------------------------

  Additional (5): bat-kbl-2 fi-kbl-8809g fi-elk-e7500 bat-jsl-3 bat-arls-3 
  Missing    (2): fi-glk-j4005 fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_11200 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-3:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-3:          NOTRUN -> [SKIP][4] ([i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - bat-jsl-3:          NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][6] +39 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@uncore:
    - bat-atsm-1:         [PASS][8] -> [INCOMPLETE][9] ([i915#11200])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14828/bat-atsm-1/igt@i915_selftest@live@uncore.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-atsm-1/igt@i915_selftest@live@uncore.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-3:          NOTRUN -> [SKIP][10] ([i915#4103]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][11] +30 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9886])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-3:          NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - fi-elk-e7500:       NOTRUN -> [SKIP][14] +24 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-3:          NOTRUN -> [SKIP][15] ([i915#3555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@runner@aborted:
    - bat-arls-3:         NOTRUN -> [FAIL][16] ([i915#11189])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-arls-3/igt@runner@aborted.html

  
  [i915#11189]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11189
  [i915#11200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11200
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7871 -> IGTPW_11200

  CI-20190529: 20190529
  CI_DRM_14828: abaeae202dfb4e361edd660a124e22178340725d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11200: 11200
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html

--===============4051884642355964214==
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
<tr><td><b>Series:</b></td><td>Enable fbdev tests on XE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134106/">https://patchwork.freedesktop.org/series/134106/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14828 -&gt; IGTPW_11200</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html</p>
<h2>Participating hosts (37 -&gt; 40)</h2>
<p>Additional (5): bat-kbl-2 fi-kbl-8809g fi-elk-e7500 bat-jsl-3 bat-arls-3 <br />
  Missing    (2): fi-glk-j4005 fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11200 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@uncore:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14828/bat-atsm-1/igt@i915_selftest@live@uncore.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-atsm-1/igt@i915_selftest@live@uncore.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11200">i915#11200</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> +30 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-arls-3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11189">i915#11189</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7871 -&gt; IGTPW_11200</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14828: abaeae202dfb4e361edd660a124e22178340725d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11200: 11200<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4051884642355964214==--
