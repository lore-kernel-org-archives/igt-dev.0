Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1463299695820592920=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Sat, 25 Nov 2023 17:26:52 -0000
Message-ID: <170093321250.14415.85819108034401938@emeril.freedesktop.org>
References: <20231125162013.2421478-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231125162013.2421478-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgT3B0aW1p?=
 =?utf-8?q?ze_kms_tesplan_documentation_=28rev5=29?=
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

--===============1463299695820592920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Optimize kms tesplan documentation (rev5)
URL   : https://patchwork.freedesktop.org/series/123697/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13923 -> IGTPW_10268
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10268 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10268, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/index.html

Participating hosts (38 -> 32)
------------------------------

  Missing    (6): bat-kbl-2 bat-dg1-5 bat-adlm-1 fi-snb-2520m bat-adlp-6 bat-mtlp-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10268:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - bat-adls-5:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr_primary_mmap_gtt}:
    - fi-rkl-11600:       [SKIP][5] ([i915#9673]) -> [SKIP][6] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-dg1-7:          [SKIP][7] ([i915#9673]) -> [SKIP][8] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-dg1-7/igt@kms_psr@psr_primary_mmap_gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-dg1-7/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-adlp-9:         [SKIP][9] ([i915#9673]) -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-adlp-9/igt@kms_psr@psr_primary_mmap_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-adlp-9/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-dg2-11:         [SKIP][11] ([i915#9673]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html
    - fi-tgl-1115g4:      [SKIP][13] ([i915#9673]) -> [SKIP][14] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-mtlp-6:         [SKIP][15] ([i915#9673]) -> [SKIP][16] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html

  * {igt@kms_psr@psr_sprite_plane_onoff}:
    - bat-dg2-9:          [SKIP][17] ([i915#9673]) -> [SKIP][18] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html

  
Known issues
------------

  Here are the changes found in IGTPW_10268 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][19] ([i915#5334]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
    - fi-glk-j4005:       [DMESG-FAIL][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-glk-j4005:       [ABORT][23] ([i915#8213]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-glk-j4005/igt@i915_suspend@basic-s2idle-without-i915.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-glk-j4005/igt@i915_suspend@basic-s2idle-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7603 -> IGTPW_10268

  CI-20190529: 20190529
  CI_DRM_13923: 6f80addbbb74cb31eade6cca2109327add88b374 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10268: 10268
  IGT_7603: 2ddd8cac90d4333943cd017319514949b047821b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/index.html

--===============1463299695820592920==
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
<tr><td><b>Series:</b></td><td>Optimize kms tesplan documentation (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123697/">https://patchwork.freedesktop.org/series/123697/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13923 -&gt; IGTPW_10268</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10268 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10268, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/index.html</p>
<h2>Participating hosts (38 -&gt; 32)</h2>
<p>Missing    (6): bat-kbl-2 bat-dg1-5 bat-adlm-1 fi-snb-2520m bat-adlp-6 bat-mtlp-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10268:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr_primary_mmap_gtt}:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-dg1-7/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-dg1-7/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-adlp-9/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-adlp-9/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_plane_onoff}:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10268 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13923/fi-glk-j4005/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10268/fi-glk-j4005/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7603 -&gt; IGTPW_10268</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13923: 6f80addbbb74cb31eade6cca2109327add88b374 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10268: 10268<br />
  IGT_7603: 2ddd8cac90d4333943cd017319514949b047821b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1463299695820592920==--
