Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7596167615113745560=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 07 Jan 2023 23:51:46 -0000
Message-ID: <167313550635.6275.13571490063115627972@emeril.freedesktop.org>
References: <20230107011127.39537-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230107011127.39537-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IFBN?=
 =?utf-8?q?U_freq_verification_with_SLPC_=28rev6=29?=
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

--===============7596167615113745560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix PMU freq verification with SLPC (rev6)
URL   : https://patchwork.freedesktop.org/series/111282/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12556 -> IGTPW_8311
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): bat-rpls-2 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8311 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_freq@sysfs:
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-ilk-650/igt@gem_ctx_freq@sysfs.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][2] ([fdo#109271]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-blb-e6850/igt@gem_ctx_freq@sysfs.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-pnv-d510/igt@gem_ctx_freq@sysfs.html

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][4] -> [FAIL][5] ([i915#7229])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12556/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-n3050:       [PASS][6] -> [FAIL][7] ([i915#6298])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12556/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@perf_pmu@frequency:
    - fi-elk-e7500:       NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-elk-e7500/igt@perf_pmu@frequency.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][9] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-n3050/igt@perf_pmu@frequency.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-nick/igt@perf_pmu@frequency.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-kefka/igt@perf_pmu@frequency.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - {bat-rpls-1}:       [INCOMPLETE][12] ([i915#4983]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12556/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7110 -> IGTPW_8311

  CI-20190529: 20190529
  CI_DRM_12556: ac04152253dccfb02dcedfa0c57443122cf79314 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8311: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html
  IGT_7110: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@universal-plane-pipe-a-functional
+igt@kms_universal_plane@universal-plane-pipe-b-functional
+igt@kms_universal_plane@universal-plane-pipe-c-functional
+igt@kms_universal_plane@universal-plane-pipe-d-functional
+igt@kms_universal_plane@universal-plane-pipe-e-functional
+igt@kms_universal_plane@universal-plane-pipe-f-functional
-igt@kms_universal_plane@test-disable-primary-red-sprite-a
-igt@kms_universal_plane@test-disable-primary-red-sprite-b
-igt@kms_universal_plane@test-disable-primary-red-sprite-c
-igt@kms_universal_plane@test-disable-primary-red-sprite-d
-igt@kms_universal_plane@test-disable-primary-red-sprite-e
-igt@kms_universal_plane@test-disable-primary-red-sprite-f
-igt@kms_universal_plane@test-explicitly-disable-primary-a
-igt@kms_universal_plane@test-explicitly-disable-primary-b
-igt@kms_universal_plane@test-explicitly-disable-primary-c
-igt@kms_universal_plane@test-explicitly-disable-primary-d
-igt@kms_universal_plane@test-explicitly-disable-primary-e
-igt@kms_universal_plane@test-explicitly-disable-primary-f
-igt@kms_universal_plane@test-legacy-atomic-interfaces-a
-igt@kms_universal_plane@test-legacy-atomic-interfaces-b
-igt@kms_universal_plane@test-legacy-atomic-interfaces-c
-igt@kms_universal_plane@test-legacy-atomic-interfaces-d
-igt@kms_universal_plane@test-legacy-atomic-interfaces-e
-igt@kms_universal_plane@test-legacy-atomic-interfaces-f
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-a
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-b
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-c
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-d
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-e
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-f
-igt@kms_universal_plane@test-re-enable-primary-with-blue-a
-igt@kms_universal_plane@test-re-enable-primary-with-blue-b
-igt@kms_universal_plane@test-re-enable-primary-with-blue-c
-igt@kms_universal_plane@test-re-enable-primary-with-blue-d
-igt@kms_universal_plane@test-re-enable-primary-with-blue-e
-igt@kms_universal_plane@test-re-enable-primary-with-blue-f
-igt@kms_universal_plane@test-set-primary-completely-offscreen-a
-igt@kms_universal_plane@test-set-primary-completely-offscreen-b
-igt@kms_universal_plane@test-set-primary-completely-offscreen-c
-igt@kms_universal_plane@test-set-primary-completely-offscreen-d
-igt@kms_universal_plane@test-set-primary-completely-offscreen-e
-igt@kms_universal_plane@test-set-primary-completely-offscreen-f
-igt@kms_universal_plane@test-universal-api-with-crtc-off-a
-igt@kms_universal_plane@test-universal-api-with-crtc-off-b
-igt@kms_universal_plane@test-universal-api-with-crtc-off-c
-igt@kms_universal_plane@test-universal-api-with-crtc-off-d
-igt@kms_universal_plane@test-universal-api-with-crtc-off-e
-igt@kms_universal_plane@test-universal-api-with-crtc-off-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html

--===============7596167615113745560==
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
<tr><td><b>Series:</b></td><td>Fix PMU freq verification with SLPC (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111282/">https://patchwork.freedesktop.org/series/111282/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12556 -&gt; IGTPW_8311</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): bat-rpls-2 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8311 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_freq@sysfs:</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-ilk-650/igt@gem_ctx_freq@sysfs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-blb-e6850/igt@gem_ctx_freq@sysfs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-pnv-d510/igt@gem_ctx_freq@sysfs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12556/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12556/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-elk-e7500/igt@perf_pmu@frequency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-n3050/igt@perf_pmu@frequency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-nick/igt@perf_pmu@frequency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/fi-bsw-kefka/igt@perf_pmu@frequency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12556/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7110 -&gt; IGTPW_8311</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12556: ac04152253dccfb02dcedfa0c57443122cf79314 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8311: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8311/index.html<br />
  IGT_7110: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-f-functional<br />
-igt@kms_universal_plane@test-disable-primary-red-sprite-a<br />
-igt@kms_universal_plane@test-disable-primary-red-sprite-b<br />
-igt@kms_universal_plane@test-disable-primary-red-sprite-c<br />
-igt@kms_universal_plane@test-disable-primary-red-sprite-d<br />
-igt@kms_universal_plane@test-disable-primary-red-sprite-e<br />
-igt@kms_universal_plane@test-disable-primary-red-sprite-f<br />
-igt@kms_universal_plane@test-explicitly-disable-primary-a<br />
-igt@kms_universal_plane@test-explicitly-disable-primary-b<br />
-igt@kms_universal_plane@test-explicitly-disable-primary-c<br />
-igt@kms_universal_plane@test-explicitly-disable-primary-d<br />
-igt@kms_universal_plane@test-explicitly-disable-primary-e<br />
-igt@kms_universal_plane@test-explicitly-disable-primary-f<br />
-igt@kms_universal_plane@test-legacy-atomic-interfaces-a<br />
-igt@kms_universal_plane@test-legacy-atomic-interfaces-b<br />
-igt@kms_universal_plane@test-legacy-atomic-interfaces-c<br />
-igt@kms_universal_plane@test-legacy-atomic-interfaces-d<br />
-igt@kms_universal_plane@test-legacy-atomic-interfaces-e<br />
-igt@kms_universal_plane@test-legacy-atomic-interfaces-f<br />
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-a<br />
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-b<br />
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-c<br />
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-d<br />
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-e<br />
-igt@kms_universal_plane@test-legacy-modeset-to-yellow-fb-f<br />
-igt@kms_universal_plane@test-re-enable-primary-with-blue-a<br />
-igt@kms_universal_plane@test-re-enable-primary-with-blue-b<br />
-igt@kms_universal_plane@test-re-enable-primary-with-blue-c<br />
-igt@kms_universal_plane@test-re-enable-primary-with-blue-d<br />
-igt@kms_universal_plane@test-re-enable-primary-with-blue-e<br />
-igt@kms_universal_plane@test-re-enable-primary-with-blue-f<br />
-igt@kms_universal_plane@test-set-primary-completely-offscreen-a<br />
-igt@kms_universal_plane@test-set-primary-completely-offscreen-b<br />
-igt@kms_universal_plane@test-set-primary-completely-offscreen-c<br />
-igt@kms_universal_plane@test-set-primary-completely-offscreen-d<br />
-igt@kms_universal_plane@test-set-primary-completely-offscreen-e<br />
-igt@kms_universal_plane@test-set-primary-completely-offscreen-f<br />
-igt@kms_universal_plane@test-universal-api-with-crtc-off-a<br />
-igt@kms_universal_plane@test-universal-api-with-crtc-off-b<br />
-igt@kms_universal_plane@test-universal-api-with-crtc-off-c<br />
-igt@kms_universal_plane@test-universal-api-with-crtc-off-d<br />
-igt@kms_universal_plane@test-universal-api-with-crtc-off-e<br />
-igt@kms_universal_plane@test-universal-api-with-crtc-off-f</p>

</body>
</html>

--===============7596167615113745560==--
