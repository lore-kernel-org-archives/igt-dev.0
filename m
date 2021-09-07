Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1164640712392274122=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Sep 2021 17:00:31 -0000
Message-ID: <163103403131.24493.12225424402425101660@emeril.freedesktop.org>
References: <20210907160012.21601-1-ramalingam.c@intel.com>
In-Reply-To: <20210907160012.21601-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fprime=3A_Sharing_BO_with_smem_as_placement?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1164640712392274122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_prime: Sharing BO with smem as placement
URL   : https://patchwork.freedesktop.org/series/94446/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10557 -> IGTPW_6205
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6205 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6205, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6205:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-tgl-y:           NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-tgl-y/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10557 and IGTPW_6205:

### New IGT tests (8) ###

  * igt@kms_flip@basic-flip-vs-dpms@d-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_flip@basic-plain-flip@d-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - Statuses : 28 pass(s) 7 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - Statuses : 28 pass(s) 7 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - Statuses : 23 pass(s) 12 skip(s)
    - Exec time: [0.0, 2.74] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - Statuses : 3 pass(s) 32 skip(s)
    - Exec time: [0.0, 3.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_6205 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][2] ([fdo#109271]) +26 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [PASS][4] -> [DMESG-WARN][5] ([i915#3958])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10557/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [PASS][6] -> [DMESG-FAIL][7] ([i915#3987])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10557/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#533])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3958]: https://gitlab.freedesktop.org/drm/intel/issues/3958
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (47 -> 38)
------------------------------

  Additional (1): fi-kbl-x1275 
  Missing    (10): fi-kbl-soraka fi-ilk-m540 bat-adls-5 bat-dg1-6 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bsw-kefka fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6198 -> IGTPW_6205

  CI-20190529: 20190529
  CI_DRM_10557: e8f764006582e44658833c07aef79c8c4b1a0758 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6205: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html
  IGT_6198: 0f17f38c3e5e2139e59f1458c149bb7a93c88bbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html

--===============1164640712392274122==
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
<tr><td><b>Series:</b></td><td>tests/kms_prime: Sharing BO with smem as placement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94446/">https://patchwork.freedesktop.org/series/94446/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10557 -&gt; IGTPW_6205</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6205 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6205, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6205:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-tgl-y/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10557 and IGTPW_6205:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>Statuses : 28 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>Statuses : 28 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>Statuses : 23 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 3.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6205 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10557/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3958">i915#3958</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10557/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-x1275 <br />
  Missing    (10): fi-kbl-soraka fi-ilk-m540 bat-adls-5 bat-dg1-6 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bsw-kefka fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6198 -&gt; IGTPW_6205</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10557: e8f764006582e44658833c07aef79c8c4b1a0758 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6205: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6205/index.html<br />
  IGT_6198: 0f17f38c3e5e2139e59f1458c149bb7a93c88bbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1164640712392274122==--
