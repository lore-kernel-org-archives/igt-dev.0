Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6799648227081114584=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 27 Jun 2022 11:37:54 -0000
Message-ID: <165632987402.11791.2928224193681406870@emeril.freedesktop.org>
References: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fedge=5Fwalk=3A_Fix_test_requirement_to_avoid_SKI?=
 =?utf-8?b?UHMgKHJldjIp?=
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

--===============6799648227081114584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_edge_walk: Fix test requirement to avoid SKIPs (rev2)
URL   : https://patchwork.freedesktop.org/series/105574/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11809 -> IGTPW_7394
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (1): fi-hsw-4770 
  Missing    (2): fi-icl-u2 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7394:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@perf:
    - {bat-adln-1}:       NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-adln-1/igt@i915_selftest@live@perf.html

  
Known issues
------------

  Here are the changes found in IGTPW_7394 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-4770:        NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#3012])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          [PASS][3] -> [INCOMPLETE][4] ([i915#4418])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271]) +9 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-hsw-4770:        NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1072]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@client:
    - {bat-adln-1}:       [DMESG-FAIL][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adln-1/igt@i915_selftest@live@client.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-adln-1/igt@i915_selftest@live@client.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          [DMESG-WARN][10] ([i915#402]) -> [PASS][11] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/fi-tgl-u2/igt@kms_busy@basic@flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-tgl-u2/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][12] ([i915#3576]) -> [PASS][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6542 -> IGTPW_7394

  CI-20190529: 20190529
  CI_DRM_11809: 5a602421b7141011b90e2b2c3d8dab98d5253f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html

--===============6799648227081114584==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_edge_walk: Fix test requirement to avoid SKIPs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105574/">https://patchwork.freedesktop.org/series/105574/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11809 -&gt; IGTPW_7394</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (1): fi-hsw-4770 <br />
  Missing    (2): fi-icl-u2 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7394:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@perf:<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-adln-1/igt@i915_selftest@live@perf.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7394 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adln-1/igt@i915_selftest@live@client.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-adln-1/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/fi-tgl-u2/igt@kms_busy@basic@flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6542 -&gt; IGTPW_7394</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11809: 5a602421b7141011b90e2b2c3d8dab98d5253f7c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html<br />
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6799648227081114584==--
