Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0472517260414866946=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Tue, 28 Jun 2022 17:55:18 -0000
Message-ID: <165643891868.14504.5161991103268193614@emeril.freedesktop.org>
References: <20220628133554.37768-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220628133554.37768-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fmmap=5Fwrite=5Fcrc=3A_IGT_test_Cleanup_=28rev3=29?=
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

--===============0472517260414866946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_mmap_write_crc: IGT test Cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/105241/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11820 -> IGTPW_7425
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7425 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7425, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): bat-dg2-9 
  Missing    (1): fi-hsw-4770 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7425:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bdw-gvtdvm:      [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-bdw-gvtdvm/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-bdw-gvtdvm/igt@i915_selftest@live@late_gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_7425 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@runner@aborted:
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][5] ([i915#4312])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-bdw-gvtdvm/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [DMESG-WARN][6] ([i915#3576]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       [DMESG-FAIL][8] ([i915#3674]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-bdw-5557u/igt@i915_selftest@live@gtt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@kms_busy@basic@modeset:
    - {bat-adln-1}:       [DMESG-WARN][10] ([i915#3576]) -> [PASS][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/bat-adln-1/igt@kms_busy@basic@modeset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/bat-adln-1/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][12] ([i915#3576]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][14] ([i915#402]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#6299]: https://gitlab.freedesktop.org/drm/intel/issues/6299


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6549 -> IGTPW_7425

  CI-20190529: 20190529
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7425: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html

--===============0472517260414866946==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_mmap_write_crc: IGT test Cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105241/">https://patchwork.freedesktop.org/series/105241/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11820 -&gt; IGTPW_7425</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7425 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7425, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): bat-dg2-9 <br />
  Missing    (1): fi-hsw-4770 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7425:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@late_gt_pm:<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-bdw-gvtdvm/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-bdw-gvtdvm/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7425 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-bdw-gvtdvm/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/bat-adln-1/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/bat-adln-1/igt@kms_busy@basic@modeset.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6549 -&gt; IGTPW_7425</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7425: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html<br />
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0472517260414866946==--
