Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3775714863619201197=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Date: Thu, 13 Jul 2023 16:23:09 -0000
Message-ID: <168926538967.14984.18158890242858392551@emeril.freedesktop.org>
References: <20230712133059.34021-1-hersenxs.wu@amd.com>
In-Reply-To: <20230712133059.34021-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu/amd=5Fpsr=3A_Fix_eDP_PSR1_test_failure_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3775714863619201197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_psr: Fix eDP PSR1 test failure (rev3)
URL   : https://patchwork.freedesktop.org/series/120619/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13383 -> IGTPW_9404
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9404 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        NOTRUN -> [ABORT][1] ([i915#8011])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-dg2-9:          [PASS][2] -> [INCOMPLETE][3] ([i915#7793])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-dg2-9/igt@gem_exec_suspend@basic-s3@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-dg2-9/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_pm_rpm@module-reload:
    - fi-rkl-11600:       [PASS][4] -> [FAIL][5] ([i915#7940])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-jsl-1:          [PASS][6] -> [DMESG-FAIL][7] ([i915#5334])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][8] -> [DMESG-FAIL][9] ([i915#8497])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [PASS][10] -> [ABORT][11] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-rpls-1/igt@i915_selftest@live@reset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rpls-1/igt@i915_selftest@live@reset.html
    - bat-rpls-2:         [PASS][12] -> [ABORT][13] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-rpls-2/igt@i915_selftest@live@reset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-8:         [PASS][14] -> [DMESG-WARN][15] ([i915#6367])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-mtlp-8/igt@i915_selftest@live@slpc.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-adlm-1:         NOTRUN -> [SKIP][16] ([i915#7828])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#1845] / [i915#5354]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlm-1:         NOTRUN -> [SKIP][18] ([i915#1845])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         NOTRUN -> [ABORT][19] ([i915#8434] / [i915#8442] / [i915#8668])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [FAIL][20] ([i915#7940]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [FAIL][22] ([i915#7940]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [INCOMPLETE][24] ([i915#7156] / [i915#7913]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [DMESG-FAIL][26] ([i915#7059]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@migrate:
    - bat-atsm-1:         [DMESG-FAIL][28] ([i915#7699] / [i915#7913]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlm-1:         [INCOMPLETE][30] ([i915#4983] / [i915#7677]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-adlm-1/igt@i915_selftest@live@workarounds.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlm-1/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [ABORT][32] ([i915#4423]) -> [DMESG-WARN][33] ([i915#4423])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-adlp-11/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlp-11/igt@i915_module_load@load.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         [ABORT][34] ([i915#8712]) -> [SKIP][35] ([i915#1072])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7156]: https://gitlab.freedesktop.org/drm/intel/issues/7156
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7677]: https://gitlab.freedesktop.org/drm/intel/issues/7677
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7793]: https://gitlab.freedesktop.org/drm/intel/issues/7793
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7386 -> IGTPW_9404

  CI-20190529: 20190529
  CI_DRM_13383: d08a48cfbc24191eb55119f6931e0b3aad5ca673 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9404: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html
  IGT_7386: 54dc25efaf10d87962f95be9b1d1a8f0f907912b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html

--===============3775714863619201197==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_psr: Fix eDP PSR1 test failure (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120619/">https://patchwork.freedesktop.org/series/120619/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13383 -&gt; IGTPW_9404</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9404 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-dg2-9/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-dg2-9/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7793">i915#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-mtlp-8/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8434">i915#8434</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7156">i915#7156</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-atsm-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-adlm-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7677">i915#7677</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlm-1/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13383/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7386 -&gt; IGTPW_9404</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13383: d08a48cfbc24191eb55119f6931e0b3aad5ca673 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9404: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9404/index.html<br />
  IGT_7386: 54dc25efaf10d87962f95be9b1d1a8f0f907912b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3775714863619201197==--
