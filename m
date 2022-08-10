Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4588247376450330007=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 10 Aug 2022 14:23:53 -0000
Message-ID: <166014143345.12354.1811098663805137134@emeril.freedesktop.org>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Convert_tests_to_dynamic?=
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

--===============4588247376450330007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/107119/
State : success

== Summary ==

CI Bug Log - changes from IGT_6620 -> IGTPW_7631
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html

Participating hosts (30 -> 29)
------------------------------

  Additional (1): fi-cfl-8109u 
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u 

Known issues
------------

  Here are the changes found in IGTPW_7631 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][4] -> [INCOMPLETE][5] ([i915#3303] / [i915#4785])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@objects:
    - fi-kbl-soraka:      [PASS][6] -> [INCOMPLETE][7] ([i915#6155])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-kbl-soraka/igt@i915_selftest@live@objects.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-kbl-soraka/igt@i915_selftest@live@objects.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-pnv-d510:        NOTRUN -> [SKIP][8] ([fdo#109271])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-apl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-apl-guc:         NOTRUN -> [SKIP][11] ([fdo#109271]) +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@kms_force_connector_basic@force-connector-state.html

  * igt@prime_vgem@basic-userptr:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][12] ([fdo#109271]) +10 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][13] ([i915#4312] / [i915#5257])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-kbl-soraka/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][14] ([fdo#109271] / [i915#4312] / [i915#6246])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [INCOMPLETE][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][17] ([i915#4528]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-pnv-d510/igt@i915_selftest@live@requests.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#6155]: https://gitlab.freedesktop.org/drm/intel/issues/6155
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6620 -> IGTPW_7631

  CI-20190529: 20190529
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7631: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html
  IGT_6620: 90549cfba1606b695fe60f78ef87b7d54586eab7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_cursor@overlay
+igt@kms_plane_cursor@primary
+igt@kms_plane_cursor@viewport
-igt@kms_plane_cursor@pipe-a-overlay-size-64
-igt@kms_plane_cursor@pipe-a-overlay-size-128
-igt@kms_plane_cursor@pipe-a-overlay-size-256
-igt@kms_plane_cursor@pipe-a-primary-size-64
-igt@kms_plane_cursor@pipe-a-primary-size-128
-igt@kms_plane_cursor@pipe-a-primary-size-256
-igt@kms_plane_cursor@pipe-a-viewport-size-64
-igt@kms_plane_cursor@pipe-a-viewport-size-128
-igt@kms_plane_cursor@pipe-a-viewport-size-256
-igt@kms_plane_cursor@pipe-b-overlay-size-64
-igt@kms_plane_cursor@pipe-b-overlay-size-128
-igt@kms_plane_cursor@pipe-b-overlay-size-256
-igt@kms_plane_cursor@pipe-b-primary-size-64
-igt@kms_plane_cursor@pipe-b-primary-size-128
-igt@kms_plane_cursor@pipe-b-primary-size-256
-igt@kms_plane_cursor@pipe-b-viewport-size-64
-igt@kms_plane_cursor@pipe-b-viewport-size-128
-igt@kms_plane_cursor@pipe-b-viewport-size-256
-igt@kms_plane_cursor@pipe-c-overlay-size-64
-igt@kms_plane_cursor@pipe-c-overlay-size-128
-igt@kms_plane_cursor@pipe-c-overlay-size-256
-igt@kms_plane_cursor@pipe-c-primary-size-64
-igt@kms_plane_cursor@pipe-c-primary-size-128
-igt@kms_plane_cursor@pipe-c-primary-size-256
-igt@kms_plane_cursor@pipe-c-viewport-size-64
-igt@kms_plane_cursor@pipe-c-viewport-size-128
-igt@kms_plane_cursor@pipe-c-viewport-size-256
-igt@kms_plane_cursor@pipe-d-overlay-size-64
-igt@kms_plane_cursor@pipe-d-overlay-size-128
-igt@kms_plane_cursor@pipe-d-overlay-size-256
-igt@kms_plane_cursor@pipe-d-primary-size-64
-igt@kms_plane_cursor@pipe-d-primary-size-128
-igt@kms_plane_cursor@pipe-d-primary-size-256
-igt@kms_plane_cursor@pipe-d-viewport-size-64
-igt@kms_plane_cursor@pipe-d-viewport-size-128
-igt@kms_plane_cursor@pipe-d-viewport-size-256
-igt@kms_plane_cursor@pipe-e-overlay-size-64
-igt@kms_plane_cursor@pipe-e-overlay-size-128
-igt@kms_plane_cursor@pipe-e-overlay-size-256
-igt@kms_plane_cursor@pipe-e-primary-size-64
-igt@kms_plane_cursor@pipe-e-primary-size-128
-igt@kms_plane_cursor@pipe-e-primary-size-256
-igt@kms_plane_cursor@pipe-e-viewport-size-64
-igt@kms_plane_cursor@pipe-e-viewport-size-128
-igt@kms_plane_cursor@pipe-e-viewport-size-256
-igt@kms_plane_cursor@pipe-f-overlay-size-64
-igt@kms_plane_cursor@pipe-f-overlay-size-128
-igt@kms_plane_cursor@pipe-f-overlay-size-256
-igt@kms_plane_cursor@pipe-f-primary-size-64
-igt@kms_plane_cursor@pipe-f-primary-size-128
-igt@kms_plane_cursor@pipe-f-primary-size-256
-igt@kms_plane_cursor@pipe-f-viewport-size-64
-igt@kms_plane_cursor@pipe-f-viewport-size-128
-igt@kms_plane_cursor@pipe-f-viewport-size-256

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html

--===============4588247376450330007==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Convert tests to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107119/">https://patchwork.freedesktop.org/series/107119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6620 -&gt; IGTPW_7631</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html</p>
<h2>Participating hosts (30 -&gt; 29)</h2>
<p>Additional (1): fi-cfl-8109u <br />
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7631 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-kbl-soraka/igt@i915_selftest@live@objects.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-kbl-soraka/igt@i915_selftest@live@objects.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6155">i915#6155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-cfl-8109u/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6620 -&gt; IGTPW_7631</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7631: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html<br />
  IGT_6620: 90549cfba1606b695fe60f78ef87b7d54586eab7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_cursor@overlay<br />
+igt@kms_plane_cursor@primary<br />
+igt@kms_plane_cursor@viewport<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-a-primary-size-64<br />
-igt@kms_plane_cursor@pipe-a-primary-size-128<br />
-igt@kms_plane_cursor@pipe-a-primary-size-256<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-b-primary-size-64<br />
-igt@kms_plane_cursor@pipe-b-primary-size-128<br />
-igt@kms_plane_cursor@pipe-b-primary-size-256<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-c-primary-size-64<br />
-igt@kms_plane_cursor@pipe-c-primary-size-128<br />
-igt@kms_plane_cursor@pipe-c-primary-size-256<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-d-primary-size-64<br />
-igt@kms_plane_cursor@pipe-d-primary-size-128<br />
-igt@kms_plane_cursor@pipe-d-primary-size-256<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-e-primary-size-64<br />
-igt@kms_plane_cursor@pipe-e-primary-size-128<br />
-igt@kms_plane_cursor@pipe-e-primary-size-256<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-f-primary-size-64<br />
-igt@kms_plane_cursor@pipe-f-primary-size-128<br />
-igt@kms_plane_cursor@pipe-f-primary-size-256<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-256</p>

</body>
</html>

--===============4588247376450330007==--
