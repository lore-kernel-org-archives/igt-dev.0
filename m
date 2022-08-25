Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3944286634551072243=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 25 Aug 2022 11:22:26 -0000
Message-ID: <166142654635.24642.3291768876252775514@emeril.freedesktop.org>
References: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Add_max-size_test_back_=28rev3=29?=
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

--===============3944286634551072243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Add max-size test back (rev3)
URL   : https://patchwork.freedesktop.org/series/107096/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12024 -> IGTPW_7688
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html

Participating hosts (35 -> 35)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_7688 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][1] -> [INCOMPLETE][2] ([i915#3303] / [i915#4785])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4] ([i915#6298])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@runner@aborted:
    - fi-hsw-g3258:       NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#4312] / [i915#6246])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/fi-hsw-g3258/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6380]: https://gitlab.freedesktop.org/drm/intel/issues/6380
  [i915#6523]: https://gitlab.freedesktop.org/drm/intel/issues/6523
  [i915#6530]: https://gitlab.freedesktop.org/drm/intel/issues/6530


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6636 -> IGTPW_7688

  CI-20190529: 20190529
  CI_DRM_12024: 656b7e74f416705f11953d30cda518a98f18ba2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7688: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_cursor_crc@cursor-offscreen-32x10
+igt@kms_cursor_crc@cursor-offscreen-32x32
+igt@kms_cursor_crc@cursor-offscreen-64x21
+igt@kms_cursor_crc@cursor-offscreen-64x64
+igt@kms_cursor_crc@cursor-offscreen-128x42
+igt@kms_cursor_crc@cursor-offscreen-128x128
+igt@kms_cursor_crc@cursor-offscreen-256x85
+igt@kms_cursor_crc@cursor-offscreen-256x256
+igt@kms_cursor_crc@cursor-offscreen-512x170
+igt@kms_cursor_crc@cursor-offscreen-512x512
+igt@kms_cursor_crc@cursor-offscreen-max-size
+igt@kms_cursor_crc@cursor-onscreen-32x10
+igt@kms_cursor_crc@cursor-onscreen-32x32
+igt@kms_cursor_crc@cursor-onscreen-64x21
+igt@kms_cursor_crc@cursor-onscreen-64x64
+igt@kms_cursor_crc@cursor-onscreen-128x42
+igt@kms_cursor_crc@cursor-onscreen-128x128
+igt@kms_cursor_crc@cursor-onscreen-256x85
+igt@kms_cursor_crc@cursor-onscreen-256x256
+igt@kms_cursor_crc@cursor-onscreen-512x170
+igt@kms_cursor_crc@cursor-onscreen-512x512
+igt@kms_cursor_crc@cursor-onscreen-max-size
+igt@kms_cursor_crc@cursor-random-32x10
+igt@kms_cursor_crc@cursor-random-32x32
+igt@kms_cursor_crc@cursor-random-64x21
+igt@kms_cursor_crc@cursor-random-64x64
+igt@kms_cursor_crc@cursor-random-128x42
+igt@kms_cursor_crc@cursor-random-128x128
+igt@kms_cursor_crc@cursor-random-256x85
+igt@kms_cursor_crc@cursor-random-256x256
+igt@kms_cursor_crc@cursor-random-512x170
+igt@kms_cursor_crc@cursor-random-512x512
+igt@kms_cursor_crc@cursor-random-max-size
+igt@kms_cursor_crc@cursor-rapid-movement-32x10
+igt@kms_cursor_crc@cursor-rapid-movement-32x32
+igt@kms_cursor_crc@cursor-rapid-movement-64x21
+igt@kms_cursor_crc@cursor-rapid-movement-64x64
+igt@kms_cursor_crc@cursor-rapid-movement-128x42
+igt@kms_cursor_crc@cursor-rapid-movement-128x128
+igt@kms_cursor_crc@cursor-rapid-movement-256x85
+igt@kms_cursor_crc@cursor-rapid-movement-256x256
+igt@kms_cursor_crc@cursor-rapid-movement-512x170
+igt@kms_cursor_crc@cursor-rapid-movement-512x512
+igt@kms_cursor_crc@cursor-rapid-movement-max-size
+igt@kms_cursor_crc@cursor-sliding-32x10
+igt@kms_cursor_crc@cursor-sliding-32x32
+igt@kms_cursor_crc@cursor-sliding-64x21
+igt@kms_cursor_crc@cursor-sliding-64x64
+igt@kms_cursor_crc@cursor-sliding-128x42
+igt@kms_cursor_crc@cursor-sliding-128x128
+igt@kms_cursor_crc@cursor-sliding-256x85
+igt@kms_cursor_crc@cursor-sliding-256x256
+igt@kms_cursor_crc@cursor-sliding-512x170
+igt@kms_cursor_crc@cursor-sliding-512x512
+igt@kms_cursor_crc@cursor-sliding-max-size
-igt@kms_cursor_crc@cursor-offscreen
-igt@kms_cursor_crc@cursor-onscreen
-igt@kms_cursor_crc@cursor-random
-igt@kms_cursor_crc@cursor-rapid-movement
-igt@kms_cursor_crc@cursor-sliding

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html

--===============3944286634551072243==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Add max-size test back (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107096/">https://patchwork.freedesktop.org/series/107096/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12024 -&gt; IGTPW_7688</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7688 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6636 -&gt; IGTPW_7688</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12024: 656b7e74f416705f11953d30cda518a98f18ba2e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7688: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7688/index.html<br />
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_cursor_crc@cursor-offscreen-32x10<br />
+igt@kms_cursor_crc@cursor-offscreen-32x32<br />
+igt@kms_cursor_crc@cursor-offscreen-64x21<br />
+igt@kms_cursor_crc@cursor-offscreen-64x64<br />
+igt@kms_cursor_crc@cursor-offscreen-128x42<br />
+igt@kms_cursor_crc@cursor-offscreen-128x128<br />
+igt@kms_cursor_crc@cursor-offscreen-256x85<br />
+igt@kms_cursor_crc@cursor-offscreen-256x256<br />
+igt@kms_cursor_crc@cursor-offscreen-512x170<br />
+igt@kms_cursor_crc@cursor-offscreen-512x512<br />
+igt@kms_cursor_crc@cursor-offscreen-max-size<br />
+igt@kms_cursor_crc@cursor-onscreen-32x10<br />
+igt@kms_cursor_crc@cursor-onscreen-32x32<br />
+igt@kms_cursor_crc@cursor-onscreen-64x21<br />
+igt@kms_cursor_crc@cursor-onscreen-64x64<br />
+igt@kms_cursor_crc@cursor-onscreen-128x42<br />
+igt@kms_cursor_crc@cursor-onscreen-128x128<br />
+igt@kms_cursor_crc@cursor-onscreen-256x85<br />
+igt@kms_cursor_crc@cursor-onscreen-256x256<br />
+igt@kms_cursor_crc@cursor-onscreen-512x170<br />
+igt@kms_cursor_crc@cursor-onscreen-512x512<br />
+igt@kms_cursor_crc@cursor-onscreen-max-size<br />
+igt@kms_cursor_crc@cursor-random-32x10<br />
+igt@kms_cursor_crc@cursor-random-32x32<br />
+igt@kms_cursor_crc@cursor-random-64x21<br />
+igt@kms_cursor_crc@cursor-random-64x64<br />
+igt@kms_cursor_crc@cursor-random-128x42<br />
+igt@kms_cursor_crc@cursor-random-128x128<br />
+igt@kms_cursor_crc@cursor-random-256x85<br />
+igt@kms_cursor_crc@cursor-random-256x256<br />
+igt@kms_cursor_crc@cursor-random-512x170<br />
+igt@kms_cursor_crc@cursor-random-512x512<br />
+igt@kms_cursor_crc@cursor-random-max-size<br />
+igt@kms_cursor_crc@cursor-rapid-movement-32x10<br />
+igt@kms_cursor_crc@cursor-rapid-movement-32x32<br />
+igt@kms_cursor_crc@cursor-rapid-movement-64x21<br />
+igt@kms_cursor_crc@cursor-rapid-movement-64x64<br />
+igt@kms_cursor_crc@cursor-rapid-movement-128x42<br />
+igt@kms_cursor_crc@cursor-rapid-movement-128x128<br />
+igt@kms_cursor_crc@cursor-rapid-movement-256x85<br />
+igt@kms_cursor_crc@cursor-rapid-movement-256x256<br />
+igt@kms_cursor_crc@cursor-rapid-movement-512x170<br />
+igt@kms_cursor_crc@cursor-rapid-movement-512x512<br />
+igt@kms_cursor_crc@cursor-rapid-movement-max-size<br />
+igt@kms_cursor_crc@cursor-sliding-32x10<br />
+igt@kms_cursor_crc@cursor-sliding-32x32<br />
+igt@kms_cursor_crc@cursor-sliding-64x21<br />
+igt@kms_cursor_crc@cursor-sliding-64x64<br />
+igt@kms_cursor_crc@cursor-sliding-128x42<br />
+igt@kms_cursor_crc@cursor-sliding-128x128<br />
+igt@kms_cursor_crc@cursor-sliding-256x85<br />
+igt@kms_cursor_crc@cursor-sliding-256x256<br />
+igt@kms_cursor_crc@cursor-sliding-512x170<br />
+igt@kms_cursor_crc@cursor-sliding-512x512<br />
+igt@kms_cursor_crc@cursor-sliding-max-size<br />
-igt@kms_cursor_crc@cursor-offscreen<br />
-igt@kms_cursor_crc@cursor-onscreen<br />
-igt@kms_cursor_crc@cursor-random<br />
-igt@kms_cursor_crc@cursor-rapid-movement<br />
-igt@kms_cursor_crc@cursor-sliding</p>

</body>
</html>

--===============3944286634551072243==--
