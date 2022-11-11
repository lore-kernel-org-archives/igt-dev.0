Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4221762619482932992=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alaa Emad" <aemad@igalia.com>
Date: Fri, 11 Nov 2022 09:59:23 -0000
Message-ID: <166816076308.871.16673370482046205716@emeril.freedesktop.org>
References: <cover.1668154709.git.aemad@igalia.com>
In-Reply-To: <cover.1668154709.git.aemad@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Funiversal=5Fplane=3A_divide_=60functional=5Ftest=5Fpipe?=
 =?utf-8?q?=60_to_mini-subtests?=
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

--===============4221762619482932992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_universal_plane: divide `functional_test_pipe` to mini-subtests
URL   : https://patchwork.freedesktop.org/series/110797/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12369 -> IGTPW_8086
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (2): fi-ctg-p8600 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_8086 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#7056])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][4] ([i915#2867]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [DMESG-WARN][6] ([i915#6687]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][8] ([i915#4785]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][10] ([i915#6367]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6949]: https://gitlab.freedesktop.org/drm/intel/issues/6949
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7056]: https://gitlab.freedesktop.org/drm/intel/issues/7056
  [i915#7058]: https://gitlab.freedesktop.org/drm/intel/issues/7058
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7433]: https://gitlab.freedesktop.org/drm/intel/issues/7433
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7050 -> IGTPW_8086

  CI-20190529: 20190529
  CI_DRM_12369: cdcedc1a52e4f4ec01a8f8c51065d651c31bea87 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8086: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@test-disable-primary-red-sprite-a
+igt@kms_universal_plane@test-disable-primary-red-sprite-b
+igt@kms_universal_plane@test-disable-primary-red-sprite-c
+igt@kms_universal_plane@test-disable-primary-red-sprite-d
+igt@kms_universal_plane@test-disable-primary-red-sprite-e
+igt@kms_universal_plane@test-disable-primary-red-sprite-f
+igt@kms_universal_plane@test-explicitly-disable-primary-a
+igt@kms_universal_plane@test-explicitly-disable-primary-b
+igt@kms_universal_plane@test-explicitly-disable-primary-c
+igt@kms_universal_plane@test-explicitly-disable-primary-d
+igt@kms_universal_plane@test-explicitly-disable-primary-e
+igt@kms_universal_plane@test-explicitly-disable-primary-f
+igt@kms_universal_plane@test-legacy-atomic-interfaces-a
+igt@kms_universal_plane@test-legacy-atomic-interfaces-b
+igt@kms_universal_plane@test-legacy-atomic-interfaces-c
+igt@kms_universal_plane@test-legacy-atomic-interfaces-d
+igt@kms_universal_plane@test-legacy-atomic-interfaces-e
+igt@kms_universal_plane@test-legacy-atomic-interfaces-f
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-a
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-b
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-c
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-d
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-e
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-f
+igt@kms_universal_plane@test-re-enable-primary-with-blue-a
+igt@kms_universal_plane@test-re-enable-primary-with-blue-b
+igt@kms_universal_plane@test-re-enable-primary-with-blue-c
+igt@kms_universal_plane@test-re-enable-primary-with-blue-d
+igt@kms_universal_plane@test-re-enable-primary-with-blue-e
+igt@kms_universal_plane@test-re-enable-primary-with-blue-f
+igt@kms_universal_plane@test-set-primary-completely-offscreen-a
+igt@kms_universal_plane@test-set-primary-completely-offscreen-b
+igt@kms_universal_plane@test-set-primary-completely-offscreen-c
+igt@kms_universal_plane@test-set-primary-completely-offscreen-d
+igt@kms_universal_plane@test-set-primary-completely-offscreen-e
+igt@kms_universal_plane@test-set-primary-completely-offscreen-f
+igt@kms_universal_plane@test-universal-api-with-crtc-off-a
+igt@kms_universal_plane@test-universal-api-with-crtc-off-b
+igt@kms_universal_plane@test-universal-api-with-crtc-off-c
+igt@kms_universal_plane@test-universal-api-with-crtc-off-d
+igt@kms_universal_plane@test-universal-api-with-crtc-off-e
+igt@kms_universal_plane@test-universal-api-with-crtc-off-f
-igt@kms_universal_plane@universal-plane-pipe-a-functional
-igt@kms_universal_plane@universal-plane-pipe-b-functional
-igt@kms_universal_plane@universal-plane-pipe-c-functional
-igt@kms_universal_plane@universal-plane-pipe-d-functional
-igt@kms_universal_plane@universal-plane-pipe-e-functional
-igt@kms_universal_plane@universal-plane-pipe-f-functional

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html

--===============4221762619482932992==
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
<tr><td><b>Series:</b></td><td>tests/kms_universal_plane: divide `functional_test_pipe` to mini-subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110797/">https://patchwork.freedesktop.org/series/110797/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12369 -&gt; IGTPW_8086</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (2): fi-ctg-p8600 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8086 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7056">i915#7056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12369/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7050 -&gt; IGTPW_8086</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12369: cdcedc1a52e4f4ec01a8f8c51065d651c31bea87 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8086: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8086/index.html<br />
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@test-disable-primary-red-sprite-a<br />
+igt@kms_universal_plane@test-disable-primary-red-sprite-b<br />
+igt@kms_universal_plane@test-disable-primary-red-sprite-c<br />
+igt@kms_universal_plane@test-disable-primary-red-sprite-d<br />
+igt@kms_universal_plane@test-disable-primary-red-sprite-e<br />
+igt@kms_universal_plane@test-disable-primary-red-sprite-f<br />
+igt@kms_universal_plane@test-explicitly-disable-primary-a<br />
+igt@kms_universal_plane@test-explicitly-disable-primary-b<br />
+igt@kms_universal_plane@test-explicitly-disable-primary-c<br />
+igt@kms_universal_plane@test-explicitly-disable-primary-d<br />
+igt@kms_universal_plane@test-explicitly-disable-primary-e<br />
+igt@kms_universal_plane@test-explicitly-disable-primary-f<br />
+igt@kms_universal_plane@test-legacy-atomic-interfaces-a<br />
+igt@kms_universal_plane@test-legacy-atomic-interfaces-b<br />
+igt@kms_universal_plane@test-legacy-atomic-interfaces-c<br />
+igt@kms_universal_plane@test-legacy-atomic-interfaces-d<br />
+igt@kms_universal_plane@test-legacy-atomic-interfaces-e<br />
+igt@kms_universal_plane@test-legacy-atomic-interfaces-f<br />
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-a<br />
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-b<br />
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-c<br />
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-d<br />
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-e<br />
+igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-f<br />
+igt@kms_universal_plane@test-re-enable-primary-with-blue-a<br />
+igt@kms_universal_plane@test-re-enable-primary-with-blue-b<br />
+igt@kms_universal_plane@test-re-enable-primary-with-blue-c<br />
+igt@kms_universal_plane@test-re-enable-primary-with-blue-d<br />
+igt@kms_universal_plane@test-re-enable-primary-with-blue-e<br />
+igt@kms_universal_plane@test-re-enable-primary-with-blue-f<br />
+igt@kms_universal_plane@test-set-primary-completely-offscreen-a<br />
+igt@kms_universal_plane@test-set-primary-completely-offscreen-b<br />
+igt@kms_universal_plane@test-set-primary-completely-offscreen-c<br />
+igt@kms_universal_plane@test-set-primary-completely-offscreen-d<br />
+igt@kms_universal_plane@test-set-primary-completely-offscreen-e<br />
+igt@kms_universal_plane@test-set-primary-completely-offscreen-f<br />
+igt@kms_universal_plane@test-universal-api-with-crtc-off-a<br />
+igt@kms_universal_plane@test-universal-api-with-crtc-off-b<br />
+igt@kms_universal_plane@test-universal-api-with-crtc-off-c<br />
+igt@kms_universal_plane@test-universal-api-with-crtc-off-d<br />
+igt@kms_universal_plane@test-universal-api-with-crtc-off-e<br />
+igt@kms_universal_plane@test-universal-api-with-crtc-off-f<br />
-igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-f-functional</p>

</body>
</html>

--===============4221762619482932992==--
