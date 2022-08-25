Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6581320561151926443=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Thu, 25 Aug 2022 09:26:16 -0000
Message-ID: <166141957613.24644.16812505606676011007@emeril.freedesktop.org>
References: <20220825012206.2747503-1-alex.hung@amd.com>
In-Reply-To: <20220825012206.2747503-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_tests/kms=5Funiversal=5Fplane=3A_Enabl?=
 =?utf-8?q?e_gen9=5Ftest=5Fpipe_for_all_devices?=
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

--===============6581320561151926443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/kms_universal_plane: Enable gen9_test_pipe for all devices
URL   : https://patchwork.freedesktop.org/series/107723/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12023 -> IGTPW_7685
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (2): bat-rpls-2 bat-dg2-11 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7685:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-dg2-10}:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg2-10/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_7685 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ringfill@basic-all:
    - bat-dg1-6:          [PASS][2] -> [DMESG-FAIL][3] ([i915#6011])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg1-6/igt@gem_ringfill@basic-all.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg1-6/igt@gem_ringfill@basic-all.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          [PASS][4] -> [INCOMPLETE][5] ([i915#4418])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][6] ([i915#6598] / [i915#6601])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-dg2-10}:       [DMESG-WARN][7] ([i915#6677]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg2-10/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg2-10/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][9] ([i915#4528]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][11] ([i915#6298]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
#### Warnings ####

  * igt@runner@aborted:
    - bat-dg1-6:          [FAIL][13] ([i915#4312] / [i915#5257]) -> [FAIL][14] ([i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg1-6/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg1-6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6523]: https://gitlab.freedesktop.org/drm/intel/issues/6523
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6642]: https://gitlab.freedesktop.org/drm/intel/issues/6642
  [i915#6677]: https://gitlab.freedesktop.org/drm/intel/issues/6677


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6636 -> IGTPW_7685

  CI-20190529: 20190529
  CI_DRM_12023: 108a64715bc95676fda71b620d448149797743b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7685: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html

--===============6581320561151926443==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/kms_universal_plane: Enable gen9_test_pipe for all devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107723/">https://patchwork.freedesktop.org/series/107723/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12023 -&gt; IGTPW_7685</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (2): bat-rpls-2 bat-dg2-11 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7685:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{bat-dg2-10}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg2-10/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7685 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg1-6/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg1-6/igt@gem_ringfill@basic-all.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6601">i915#6601</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-dg2-10}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg2-10/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6677">i915#6677</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg2-10/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12023/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6636 -&gt; IGTPW_7685</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12023: 108a64715bc95676fda71b620d448149797743b9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7685: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7685/index.html<br />
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f</p>

</body>
</html>

--===============6581320561151926443==--
