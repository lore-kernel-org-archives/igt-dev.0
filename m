Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB886C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 20:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CA410E05C;
	Sun, 25 Aug 2024 20:35:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E010E05C;
 Sun, 25 Aug 2024 20:35:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1582309756508987436=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C01/14=5D_lib/igt=5Fkms=3A_add_enum_for_link_rate_and_lane_co?=
 =?utf-8?q?unt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 25 Aug 2024 20:35:26 -0000
Message-ID: <172461812620.782809.12938138677022273701@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

--===============1582309756508987436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/14] lib/igt_kms: add enum for link rate and lane count
URL   : https://patchwork.freedesktop.org/series/137761/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15288 -> IGTPW_11633
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11633 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11633, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (3): fi-kbl-8809g fi-cfl-8109u fi-elk-e7500 
  Missing    (3): fi-blb-e6850 bat-dg2-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11633:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-rkl-11600/igt@kms_fallback@dp-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-tgl-1115g4/igt@kms_fallback@dp-fallback.html
    - bat-arls-2:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arls-2/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-mtlp-8/igt@kms_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-jsl-1/igt@kms_fallback@dp-fallback.html
    - bat-arls-1:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arls-1/igt@kms_fallback@dp-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arlh-2/igt@kms_fallback@dp-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-dg1-7/igt@kms_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-twl-2/igt@kms_fallback@dp-fallback.html
    - bat-rpls-4:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-rpls-4/igt@kms_fallback@dp-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-twl-1/igt@kms_fallback@dp-fallback.html
    - bat-dg2-14:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-dg2-14/igt@kms_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-rplp-1/igt@kms_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15288 and IGTPW_11633:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 8 pass(s) 29 skip(s)
    - Exec time: [0.0, 16.34] s

  

Known issues
------------

  Here are the changes found in IGTPW_11633 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][14] ([i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][15] ([i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][16] ([i915#4613]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][17] ([i915#4613]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][18] -> [DMESG-WARN][19] ([i915#11349])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-guc/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][21] ([i915#9792])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-mtlp-6/igt@kms_fallback@dp-fallback.html
    - bat-dg2-9:          NOTRUN -> [SKIP][22] ([i915#9197])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-dg2-9/igt@kms_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][24] ([i915#10470])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-adlp-11/igt@kms_fallback@dp-fallback.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-ivb-3770/igt@kms_fallback@dp-fallback.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-guc/igt@kms_fallback@dp-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-ilk-650/igt@kms_fallback@dp-fallback.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-bsw-n3050/igt@kms_fallback@dp-fallback.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-pnv-d510/igt@kms_fallback@dp-fallback.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-glk-j4005/igt@kms_fallback@dp-fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-kbl-2/igt@kms_fallback@dp-fallback.html
    - bat-adlm-1:         NOTRUN -> [SKIP][33] ([i915#9900])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-adlm-1/igt@kms_fallback@dp-fallback.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][34] +31 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][35] +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-elk-e7500:       NOTRUN -> [SKIP][36] +25 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7990 -> IGTPW_11633

  CI-20190529: 20190529
  CI_DRM_15288: 5626fe5d6eeb0949727861375b27d67ee71feaa7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11633: 11633
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/index.html

--===============1582309756508987436==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/14] lib/igt_kms: add enum for link rate and lane count</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137761/">https://patchwork.freedesktop.org/series/137761/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15288 -&gt; IGTPW_11633</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11633 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11633, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (3): fi-kbl-8809g fi-cfl-8109u fi-elk-e7500 <br />
  Missing    (3): fi-blb-e6850 bat-dg2-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11633:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-rkl-11600/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-tgl-1115g4/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arls-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-mtlp-8/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-jsl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arls-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arlh-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-dg1-7/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-twl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-rpls-4/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-twl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-dg2-14/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-rplp-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15288 and IGTPW_11633:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 8 pass(s) 29 skip(s)</li>
<li>Exec time: [0.0, 16.34] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11633 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fallback@dp-fallback (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-mtlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-dg2-9/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-adlp-11/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-ivb-3770/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-ilk-650/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-bsw-n3050/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-pnv-d510/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-glk-j4005/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-kbl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/bat-adlm-1/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11633/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7990 -&gt; IGTPW_11633</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15288: 5626fe5d6eeb0949727861375b27d67ee71feaa7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11633: 11633<br />
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1582309756508987436==--
