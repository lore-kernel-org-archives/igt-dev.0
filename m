Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0415325813598687441=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Wed, 20 Apr 2022 00:26:33 -0000
Message-ID: <165041439392.24581.4676236792984267494@emeril.freedesktop.org>
References: <20220419234339.181-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220419234339.181-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbWVzb246?=
 =?utf-8?q?_Move_MSM-specific_tests_to_their_own_subdirectory?=
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

--===============0415325813598687441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: meson: Move MSM-specific tests to their own subdirectory
URL   : https://patchwork.freedesktop.org/series/102844/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11521 -> IGTPW_6950
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6950 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6950, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html

Participating hosts (49 -> 46)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (4): fi-ctg-p8600 bat-adlm-1 fi-bsw-cyan fi-hsw-4200u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6950:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@ring_submission:
    - bat-dg1-5:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/bat-dg1-5/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_6950 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271]) +9 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][6] ([i915#3921])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#533])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][10] ([fdo#109271]) +14 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-bdw-5557u/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          [DMESG-WARN][11] ([i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11521/fi-tgl-u2/igt@kms_busy@basic@flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-tgl-u2/igt@kms_busy@basic@flip.html
    - {bat-adlp-6}:       [DMESG-WARN][13] ([i915#3576]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11521/bat-adlp-6/igt@kms_busy@basic@flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/bat-adlp-6/igt@kms_busy@basic@flip.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [INCOMPLETE][15] -> [DMESG-FAIL][16] ([i915#4494] / [i915#4957])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11521/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6440 -> IGTPW_6950

  CI-20190529: 20190529
  CI_DRM_11521: 8565f65625322bc4dde5354d63d62a06164c4f15 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6950: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html
  IGT_6440: 04262fc75ff3ec42f4db0c929d46b7cd5083911f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@msm/msm_mapping@ring
+igt@msm/msm_mapping@shadow
+igt@msm/msm_mapping@sqefw
+igt@msm/msm_recovery@gpu-fault
+igt@msm/msm_recovery@hangcheck
+igt@msm/msm_recovery@iova-fault
+igt@msm/msm_submit@empty-submit
+igt@msm/msm_submit@invalid-cmd-idx-submit
+igt@msm/msm_submit@invalid-cmd-type-submit
+igt@msm/msm_submit@invalid-duplicate-bo-submit
+igt@msm/msm_submit@invalid-flags-submit
+igt@msm/msm_submit@invalid-in-fence-submit
+igt@msm/msm_submit@invalid-queue-submit
+igt@msm/msm_submit@valid-submit
-igt@msm_mapping@ring
-igt@msm_mapping@shadow
-igt@msm_mapping@sqefw
-igt@msm_recovery@gpu-fault
-igt@msm_recovery@hangcheck
-igt@msm_recovery@iova-fault
-igt@msm_submit@empty-submit
-igt@msm_submit@invalid-cmd-idx-submit
-igt@msm_submit@invalid-cmd-type-submit
-igt@msm_submit@invalid-duplicate-bo-submit
-igt@msm_submit@invalid-flags-submit
-igt@msm_submit@invalid-in-fence-submit
-igt@msm_submit@invalid-queue-submit
-igt@msm_submit@valid-submit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html

--===============0415325813598687441==
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
<tr><td><b>Series:</b></td><td>meson: Move MSM-specific tests to their own subdirectory</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102844/">https://patchwork.freedesktop.org/series/102844/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11521 -&gt; IGTPW_6950</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6950 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6950, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html</p>
<h2>Participating hosts (49 -&gt; 46)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (4): fi-ctg-p8600 bat-adlm-1 fi-bsw-cyan fi-hsw-4200u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6950:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@ring_submission:<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/bat-dg1-5/igt@i915_selftest@live@ring_submission.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6950 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-bdw-5557u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11521/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/fi-tgl-u2/igt@kms_busy@basic@flip.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11521/bat-adlp-6/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/bat-adlp-6/igt@kms_busy@basic@flip.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11521/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6440 -&gt; IGTPW_6950</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11521: 8565f65625322bc4dde5354d63d62a06164c4f15 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6950: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6950/index.html<br />
  IGT_6440: 04262fc75ff3ec42f4db0c929d46b7cd5083911f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@msm/msm_mapping@ring<br />
+igt@msm/msm_mapping@shadow<br />
+igt@msm/msm_mapping@sqefw<br />
+igt@msm/msm_recovery@gpu-fault<br />
+igt@msm/msm_recovery@hangcheck<br />
+igt@msm/msm_recovery@iova-fault<br />
+igt@msm/msm_submit@empty-submit<br />
+igt@msm/msm_submit@invalid-cmd-idx-submit<br />
+igt@msm/msm_submit@invalid-cmd-type-submit<br />
+igt@msm/msm_submit@invalid-duplicate-bo-submit<br />
+igt@msm/msm_submit@invalid-flags-submit<br />
+igt@msm/msm_submit@invalid-in-fence-submit<br />
+igt@msm/msm_submit@invalid-queue-submit<br />
+igt@msm/msm_submit@valid-submit<br />
-igt@msm_mapping@ring<br />
-igt@msm_mapping@shadow<br />
-igt@msm_mapping@sqefw<br />
-igt@msm_recovery@gpu-fault<br />
-igt@msm_recovery@hangcheck<br />
-igt@msm_recovery@iova-fault<br />
-igt@msm_submit@empty-submit<br />
-igt@msm_submit@invalid-cmd-idx-submit<br />
-igt@msm_submit@invalid-cmd-type-submit<br />
-igt@msm_submit@invalid-duplicate-bo-submit<br />
-igt@msm_submit@invalid-flags-submit<br />
-igt@msm_submit@invalid-in-fence-submit<br />
-igt@msm_submit@invalid-queue-submit<br />
-igt@msm_submit@valid-submit</p>

</body>
</html>

--===============0415325813598687441==--
