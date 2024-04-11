Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB864C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6621310E853;
	Thu, 11 Apr 2024 14:05:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05FB10E853;
 Thu, 11 Apr 2024 14:05:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8770839286527855639=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Fix_name_collisions_in_Core?=
 =?utf-8?q?_test_documentation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Piecielska" <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Apr 2024 14:05:23 -0000
Message-ID: <171284432391.1340510.10239193041077521797@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
In-Reply-To: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
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

--===============8770839286527855639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix name collisions in Core test documentation (rev3)
URL   : https://patchwork.freedesktop.org/series/132206/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14565 -> IGTPW_11009
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/index.html

Participating hosts (35 -> 32)
------------------------------

  Additional (1): bat-jsl-1 
  Missing    (4): fi-kbl-7567u bat-dg2-11 fi-cfl-8109u bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_11009 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-adlp-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@reset:
    - bat-dg2-9:          [PASS][5] -> [ABORT][6] ([i915#10366])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-dg2-9/igt@i915_selftest@live@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-dg2-9/igt@i915_selftest@live@reset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#4103]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9886])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][10] ([i915#3555])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [FAIL][11] ([i915#10378]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
    - bat-dg2-8:          [FAIL][13] ([i915#10378]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_module_load@reload:
    - bat-adlp-6:         [ABORT][15] ([i915#10801]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-adlp-6/igt@i915_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-adlp-6/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hugepages:
    - bat-arls-2:         [ABORT][17] ([i915#10802]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-arls-2/igt@i915_selftest@live@hugepages.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-arls-2/igt@i915_selftest@live@hugepages.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10801]: https://gitlab.freedesktop.org/drm/intel/issues/10801
  [i915#10802]: https://gitlab.freedesktop.org/drm/intel/issues/10802
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7805 -> IGTPW_11009

  CI-20190529: 20190529
  CI_DRM_14565: c78b22309803333fd56f8e4e4bc403c706c0491e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11009: 11009
  IGT_7805: 7805

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/index.html

--===============8770839286527855639==
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
<tr><td><b>Series:</b></td><td>Fix name collisions in Core test documentation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132206/">https://patchwork.freedesktop.org/series/132206/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14565 -&gt; IGTPW_11009</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/index.html</p>
<h2>Participating hosts (35 -&gt; 32)</h2>
<p>Additional (1): bat-jsl-1 <br />
  Missing    (4): fi-kbl-7567u bat-dg2-11 fi-cfl-8109u bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11009 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-dg2-9/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-dg2-9/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-adlp-6/igt@i915_module_load@reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10801">i915#10801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-adlp-6/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14565/bat-arls-2/igt@i915_selftest@live@hugepages.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10802">i915#10802</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11009/bat-arls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7805 -&gt; IGTPW_11009</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14565: c78b22309803333fd56f8e4e4bc403c706c0491e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11009: 11009<br />
  IGT_7805: 7805</p>

</body>
</html>

--===============8770839286527855639==--
