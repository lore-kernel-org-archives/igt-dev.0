Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2478890459388432530=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 19 Dec 2022 13:55:07 -0000
Message-ID: <167145810710.5874.11365601777876638941@emeril.freedesktop.org>
References: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IGlu?=
 =?utf-8?q?valid_usage_of_put=5Foffset=28=29_=28rev2=29?=
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

--===============2478890459388432530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix invalid usage of put_offset() (rev2)
URL   : https://patchwork.freedesktop.org/series/112056/
State : success

== Summary ==

CI Bug Log - changes from IGT_7099 -> IGTPW_8247
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html

Participating hosts (42 -> 43)
------------------------------

  Additional (1): fi-hsw-4770 

Known issues
------------

  Here are the changes found in IGTPW_8247 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271]) +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][2] -> [DMESG-FAIL][3] ([i915#5334])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-n3050:       [PASS][4] -> [DMESG-FAIL][5] ([i915#6217])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-hsw-4770:        NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1072]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][8] ([fdo#109271] / [i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-bsw-n3050/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][9] ([i915#7229]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6217]: https://gitlab.freedesktop.org/drm/intel/issues/6217
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7099 -> IGTPW_8247

  CI-20190529: 20190529
  CI_DRM_12515: 25905f33e9cb1630d94ce04688d5a6c756f96e9d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html
  IGT_7099: 62e8be3ca2935a079de4fabd4923df58278a9ed0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_exercise_blt@fast-copy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html

--===============2478890459388432530==
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
<tr><td><b>Series:</b></td><td>Fix invalid usage of put_offset() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112056/">https://patchwork.freedesktop.org/series/112056/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7099 -&gt; IGTPW_8247</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html</p>
<h2>Participating hosts (42 -&gt; 43)</h2>
<p>Additional (1): fi-hsw-4770 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8247 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6217">i915#6217</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7099 -&gt; IGTPW_8247</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12515: 25905f33e9cb1630d94ce04688d5a6c756f96e9d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html<br />
  IGT_7099: 62e8be3ca2935a079de4fabd4923df58278a9ed0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_exercise_blt@fast-copy</p>

</body>
</html>

--===============2478890459388432530==--
