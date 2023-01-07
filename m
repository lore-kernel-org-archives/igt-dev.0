Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7972726698531931636=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alaa Emad" <aemad@igalia.com>
Date: Sat, 07 Jan 2023 14:12:18 -0000
Message-ID: <167310073871.6275.912788617467811223@emeril.freedesktop.org>
References: <cover.1673098992.git.aemad@igalia.com>
In-Reply-To: <cover.1673098992.git.aemad@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Funiversal=5Fplane=3A_divide_=60functional=5Ftest=5Fpipe?=
 =?utf-8?q?=60_to_mini-subtests_=28rev2=29?=
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

--===============7972726698531931636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_universal_plane: divide `functional_test_pipe` to mini-subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/110797/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12554 -> IGTPW_8310
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-kbl-soraka bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8310 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-kbl-7567u:       [PASS][1] -> [INCOMPLETE][2] ([i915#4817])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4] ([i915#6298])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-n3050:       [PASS][5] -> [FAIL][6] ([i915#6298])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][7] ([i915#7229]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [DMESG-FAIL][9] ([i915#7699]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [INCOMPLETE][11] ([i915#6257]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/bat-rpls-1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - {bat-adln-1}:       [INCOMPLETE][13] ([i915#7467]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/bat-adln-1/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/bat-adln-1/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [FAIL][15] ([fdo#103375]) -> [INCOMPLETE][16] ([i915#4817])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7467]: https://gitlab.freedesktop.org/drm/intel/issues/7467
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7110 -> IGTPW_8310

  CI-20190529: 20190529
  CI_DRM_12554: 77b21315725079a0f62117b62ab9e6fc3c5b325d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html
  IGT_7110: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html

--===============7972726698531931636==
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
<tr><td><b>Series:</b></td><td>tests/kms_universal_plane: divide `functional_test_pipe` to mini-subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110797/">https://patchwork.freedesktop.org/series/110797/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12554 -&gt; IGTPW_8310</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-kbl-soraka bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8310 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/bat-adlp-4/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/bat-rpls-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/bat-adln-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7467">i915#7467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/bat-adln-1/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12554/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7110 -&gt; IGTPW_8310</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12554: 77b21315725079a0f62117b62ab9e6fc3c5b325d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8310/index.html<br />
  IGT_7110: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============7972726698531931636==--
