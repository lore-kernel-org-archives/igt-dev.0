Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E72DC30658
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 05:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210C310E058;
	Fri,  5 Jul 2024 05:46:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B44510E058;
 Fri,  5 Jul 2024 05:46:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2865813740465794948=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fgetfb=3A_Skip_g?=
 =?utf-8?q?etfb2-accept-ccs_subtest_on_Xe2_platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jul 2024 05:46:46 -0000
Message-ID: <172015840629.29931.16005588393954023525@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705044515.700219-1-pranay.samala@intel.com>
In-Reply-To: <20240705044515.700219-1-pranay.samala@intel.com>
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

--===============2865813740465794948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_getfb: Skip getfb2-accept-ccs subtest on Xe2 platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/135150/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15034 -> IGTPW_11373
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/index.html

Participating hosts (42 -> 38)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (5): bat-kbl-2 fi-snb-2520m bat-atsm-1 bat-dg2-11 bat-arls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11373:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-apl-1}:        [DMESG-WARN][1] ([i915#180]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15034 and IGTPW_11373:

### New IGT tests (16) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 0.85] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.74, 0.79] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 0.88] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 0.86] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.82, 0.83] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.74, 0.77] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.80, 0.89] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 0.88] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [1.14, 1.33] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.14] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [1.11, 1.24] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.10] s

  * igt@kms_flip@basic-plain-flip@a-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.86, 1.05] s

  * igt@kms_flip@basic-plain-flip@b-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 0.83] s

  * igt@kms_flip@basic-plain-flip@c-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 0.82] s

  * igt@kms_flip@basic-plain-flip@d-dp3:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 0.84] s

  

Known issues
------------

  Here are the changes found in IGTPW_11373 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] +30 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@sanitycheck:
    - {bat-apl-1}:        [DMESG-WARN][6] ([i915#11328]) -> [PASS][7] +46 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-kbl-7567u:       [DMESG-WARN][8] ([i915#11328]) -> [PASS][9] +43 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][10] ([i915#180]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_busy@basic@flip.html
    - {bat-apl-1}:        [DMESG-WARN][12] ([i915#180] / [i915#1982]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@kms_busy@basic@flip.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-kbl-7567u:       [DMESG-WARN][14] ([i915#10062] / [i915#180] / [i915#9925]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {bat-apl-1}:        [DMESG-WARN][16] ([i915#10062] / [i915#180]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - {bat-apl-1}:        [DMESG-WARN][18] ([i915#180]) -> [PASS][19] +33 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [DMESG-WARN][20] ([i915#7507]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][22] ([i915#180] / [i915#9925]) -> [PASS][23] +36 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10062]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062
  [i915#11328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11328
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7916 -> IGTPW_11373

  CI-20190529: 20190529
  CI_DRM_15034: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11373: 11373
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/index.html

--===============2865813740465794948==
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
<tr><td><b>Series:</b></td><td>tests/kms_getfb: Skip getfb2-accept-ccs subtest on Xe2 platforms (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135150/">https://patchwork.freedesktop.org/series/135150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15034 -&gt; IGTPW_11373</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (5): bat-kbl-2 fi-snb-2520m bat-atsm-1 bat-dg2-11 bat-arls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11373:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15034 and IGTPW_11373:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.74, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.82, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.74, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.80, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.14, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.08, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.11, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.08, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.86, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 0.84] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11373 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11328">i915#11328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +46 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11328">i915#11328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> +43 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@kms_busy@basic@flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062">i915#10062</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062">i915#10062</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11373/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7916 -&gt; IGTPW_11373</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15034: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11373: 11373<br />
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2865813740465794948==--
