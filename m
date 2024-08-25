Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29EEC5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480B210E0FC;
	Sun, 25 Aug 2024 18:45:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2C10E0FC;
 Sun, 25 Aug 2024 18:45:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6823849749567542268=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_test_to_validate_fallba?=
 =?utf-8?q?ck_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 25 Aug 2024 18:45:20 -0000
Message-ID: <172461152008.782795.12935643286009569599@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
In-Reply-To: <20240825181424.4034541-1-kunal1.joshi@intel.com>
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

--===============6823849749567542268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev4)
URL   : https://patchwork.freedesktop.org/series/134660/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15288 -> IGTPW_11632
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11632 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11632, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (2): fi-cfl-8109u fi-kbl-8809g 
  Missing    (5): bat-dg1-7 fi-tgl-1115g4 fi-snb-2520m fi-glk-j4005 fi-blb-e6850 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11632:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-rkl-11600/igt@kms_fallback@dp-fallback.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@kms_fallback@dp-fallback.html
    - bat-arls-2:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-2/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-mtlp-8/igt@kms_fallback@dp-fallback.html
    - bat-dg2-8:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-8/igt@kms_fallback@dp-fallback.html
    - bat-adls-6:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adls-6/igt@kms_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-jsl-1/igt@kms_fallback@dp-fallback.html
    - bat-arls-1:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-1/igt@kms_fallback@dp-fallback.html
    - bat-adlp-6:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlp-6/igt@kms_fallback@dp-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arlh-2/igt@kms_fallback@dp-fallback.html
    - bat-adlp-9:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlp-9/igt@kms_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-twl-2/igt@kms_fallback@dp-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-11/igt@kms_fallback@dp-fallback.html
    - bat-rpls-4:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-rpls-4/igt@kms_fallback@dp-fallback.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-7567u/igt@kms_fallback@dp-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-twl-1/igt@kms_fallback@dp-fallback.html
    - bat-apl-1:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-apl-1/igt@kms_fallback@dp-fallback.html
    - bat-dg2-14:         NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-14/igt@kms_fallback@dp-fallback.html
    - bat-arls-5:         NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-5/igt@kms_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-rplp-1/igt@kms_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15288 and IGTPW_11632:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 7 fail(s) 27 skip(s)
    - Exec time: [0.0, 10.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_11632 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][21] ([i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][22] ([i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][23] ([i915#4613]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][24] ([i915#4613]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [PASS][25] -> [DMESG-WARN][26] ([i915#11621] / [i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][27] -> [DMESG-WARN][28] ([i915#11349])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-2/igt@i915_selftest@live@hangcheck.html
    - bat-adlm-1:         [PASS][29] -> [INCOMPLETE][30] ([i915#9413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-adlm-1/igt@i915_selftest@live@hangcheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlm-1/igt@i915_selftest@live@hangcheck.html
    - bat-arls-1:         [PASS][31] -> [DMESG-WARN][32] ([i915#11349])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-1/igt@i915_selftest@live@hangcheck.html
    - bat-dg2-11:         [PASS][33] -> [DMESG-FAIL][34] ([i915#9500])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [PASS][35] -> [DMESG-WARN][36] ([i915#11621]) +31 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-apl-1/igt@i915_selftest@live@requests.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-apl-1/igt@i915_selftest@live@requests.html

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-guc/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][38] ([i915#9792])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-mtlp-6/igt@kms_fallback@dp-fallback.html
    - bat-dg2-9:          NOTRUN -> [SKIP][39] ([i915#9197])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-9/igt@kms_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][41] ([i915#10470])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlp-11/igt@kms_fallback@dp-fallback.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-ivb-3770/igt@kms_fallback@dp-fallback.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-guc/igt@kms_fallback@dp-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-ilk-650/igt@kms_fallback@dp-fallback.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-bsw-n3050/igt@kms_fallback@dp-fallback.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-pnv-d510/igt@kms_fallback@dp-fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-kbl-2/igt@kms_fallback@dp-fallback.html
    - bat-adlm-1:         NOTRUN -> [SKIP][49] ([i915#9900])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlm-1/igt@kms_fallback@dp-fallback.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][50] +31 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][51] +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7990 -> IGTPW_11632

  CI-20190529: 20190529
  CI_DRM_15288: 5626fe5d6eeb0949727861375b27d67ee71feaa7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11632: 11632
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/index.html

--===============6823849749567542268==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15288 -&gt; IGTPW_11632</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11632 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11632, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (2): fi-cfl-8109u fi-kbl-8809g <br />
  Missing    (5): bat-dg1-7 fi-tgl-1115g4 fi-snb-2520m fi-glk-j4005 fi-blb-e6850 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11632:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-rkl-11600/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-mtlp-8/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-8/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adls-6/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-jsl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arlh-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlp-9/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-twl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-11/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-rpls-4/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-7567u/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-twl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-apl-1/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-14/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-5/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-rplp-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15288 and IGTPW_11632:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 7 fail(s) 27 skip(s)</li>
<li>Exec time: [0.0, 10.43] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11632 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-apl-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-apl-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15288/bat-apl-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-apl-1/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fallback@dp-fallback (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-mtlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-dg2-9/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlp-11/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-ivb-3770/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-ilk-650/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-bsw-n3050/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-pnv-d510/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-kbl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/bat-adlm-1/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11632/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7990 -&gt; IGTPW_11632</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15288: 5626fe5d6eeb0949727861375b27d67ee71feaa7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11632: 11632<br />
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6823849749567542268==--
