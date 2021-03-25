Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Mar 2021 11:52:59 -0000
Message-ID: <161667317952.15544.4950678187767549683@emeril.freedesktop.org>
References: <20210324181735.1669-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210324181735.1669-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_tests/kms=5Fcursor=5Fcrc=3A_Re?=
 =?utf-8?q?move_the_max=5Fw=3D=3Dmax=5Fh_requirement?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0893693695=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0893693695==
Content-Type: multipart/alternative;
 boundary="===============6494331439889024286=="

--===============6494331439889024286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/kms_cursor_crc: Remove the max_w==max_h requirement
URL   : https://patchwork.freedesktop.org/series/88405/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9891 -> IGTPW_5657
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5657:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_5657 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_basic@create-close:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-tgl-y/igt@gem_basic@create-close.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-tgl-y/igt@gem_basic@create-close.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [PASS][5] -> [DMESG-FAIL][6] ([i915#2927])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][7] ([i915#1436])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][8] ([i915#402]) -> [PASS][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (47 -> 41)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6046 -> IGTPW_5657

  CI-20190529: 20190529
  CI_DRM_9891: 01ae394353f8aab102794ec9922f707d41c42ba0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5657: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html
  IGT_6046: e76039273b1524147c43dba061756f06003d56ae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_cursor_crc@pipe-a-cursor-32x10-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-64x21-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-128x42-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-256x85-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-512x170-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-a-cursor-max-size-random
+igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-128x42-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-256x85-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-b-cursor-max-size-random
+igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-64x21-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-128x42-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-256x85-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-c-cursor-max-size-random
+igt@kms_cursor_crc@pipe-c-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-d-cursor-32x10-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-64x21-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-128x42-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-d-cursor-max-size-random
+igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-e-cursor-32x10-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-64x21-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-128x42-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-256x85-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-512x170-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-e-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-e-cursor-max-size-random
+igt@kms_cursor_crc@pipe-e-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-f-cursor-32x10-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-64x21-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-128x42-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-256x85-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-512x170-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-f-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-f-cursor-max-size-random
+igt@kms_cursor_crc@pipe-f-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-max-size-sliding

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html

--===============6494331439889024286==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/kms_cursor_crc: Remove the max_w==max_h requirement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88405/">https://patchwork.freedesktop.org/series/88405/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9891 -&gt; IGTPW_5657</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5657:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5657 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_basic@create-close:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-tgl-y/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-tgl-y/igt@gem_basic@create-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_self_import@basic-with_one_bo_two_files:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9891/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 41)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6046 -&gt; IGTPW_5657</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9891: 01ae394353f8aab102794ec9922f707d41c42ba0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5657: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5657/index.html<br />
  IGT_6046: e76039273b1524147c43dba061756f06003d56ae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_cursor_crc@pipe-a-cursor-32x10-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-64x21-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-128x42-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-256x85-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-512x170-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-max-size-random<br />
+igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-128x42-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-256x85-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-max-size-offscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-max-size-random<br />
+igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-64x21-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-128x42-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-256x85-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-max-size-random<br />
+igt@kms_cursor_crc@pipe-c-cursor-max-size-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-64x21-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-128x42-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-max-size-random<br />
+igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-max-size-sliding<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-64x21-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-128x42-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-256x85-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-512x170-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-max-size-offscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-max-size-onscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-max-size-random<br />
+igt@kms_cursor_crc@pipe-e-cursor-max-size-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-max-size-sliding<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-64x21-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-128x42-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-256x85-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-512x170-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-max-size-offscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-max-size-onscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-max-size-random<br />
+igt@kms_cursor_crc@pipe-f-cursor-max-size-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-max-size-sliding</p>

</body>
</html>

--===============6494331439889024286==--

--===============0893693695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0893693695==--
