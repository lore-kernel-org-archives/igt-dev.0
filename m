Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0579523571663875976=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Tue, 12 Apr 2022 17:05:50 -0000
Message-ID: <164978315020.18366.17843006600449527940@emeril.freedesktop.org>
References: <20220406170659.898333-1-alex.hung@amd.com>
In-Reply-To: <20220406170659.898333-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Skip_kms_test_cases_for_DCC_and_DCC=5FRETILE_=28rev3=29?=
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

--===============0579523571663875976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Skip kms test cases for DCC and DCC_RETILE (rev3)
URL   : https://patchwork.freedesktop.org/series/102357/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11477 -> IGTPW_6904
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html

Participating hosts (49 -> 46)
------------------------------

  Additional (4): bat-rpls-1 fi-bxt-dsi bat-jsl-2 bat-hsw-1 
  Missing    (7): shard-tglu bat-dg2-8 fi-bsw-cyan fi-bsw-kefka shard-rkl shard-dg1 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6904:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_lmem_swapping@verify-random:
    - {bat-rpls-1}:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/bat-rpls-1/igt@gem_lmem_swapping@verify-random.html

  
Known issues
------------

  Here are the changes found in IGTPW_6904 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bxt-dsi:         NOTRUN -> [DMESG-WARN][2] ([i915#5437])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html
    - fi-cml-u2:          NOTRUN -> [DMESG-WARN][3] ([i915#5437])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_huc_copy@huc-copy:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html
    - fi-cml-u2:          NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-cml-u2:          NOTRUN -> [SKIP][6] ([i915#4613]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][8] ([i915#5685])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-cml-u2:          NOTRUN -> [SKIP][9] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-cml-u2:          NOTRUN -> [SKIP][12] ([fdo#109278]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][13] ([fdo#109271]) +13 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html
    - fi-cml-u2:          NOTRUN -> [SKIP][14] ([fdo#109285])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-cfl-8109u:       [PASS][15] -> [DMESG-WARN][16] ([i915#5341] / [i915#62])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cml-u2:          NOTRUN -> [SKIP][17] ([fdo#109278] / [i915#533])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#533])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-cfl-8109u:       [PASS][19] -> [DMESG-WARN][20] ([i915#62]) +10 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][21] ([fdo#109271]) +14 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bdw-5557u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cml-u2:          NOTRUN -> [SKIP][22] ([i915#3555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-cml-u2:          NOTRUN -> [SKIP][23] ([i915#3301])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-cml-u2:          NOTRUN -> [FAIL][24] ([i915#4312] / [i915#5257])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@runner@aborted.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][25] ([i915#4312] / [i915#5257])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-cml-u2:          [INCOMPLETE][26] ([i915#5680]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-cml-u2/igt@gem_exec_suspend@basic-s3@smem.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@gem_exec_suspend@basic-s3@smem.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-7567u:       [DMESG-WARN][28] ([i915#5577]) -> [DMESG-WARN][29] ([i915#5437])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-soraka:      [DMESG-WARN][30] ([i915#5437]) -> [DMESG-WARN][31] ([i915#1982] / [i915#5437])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5437]: https://gitlab.freedesktop.org/drm/intel/issues/5437
  [i915#5535]: https://gitlab.freedesktop.org/drm/intel/issues/5535
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5577]: https://gitlab.freedesktop.org/drm/intel/issues/5577
  [i915#5680]: https://gitlab.freedesktop.org/drm/intel/issues/5680
  [i915#5685]: https://gitlab.freedesktop.org/drm/intel/issues/5685
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6415 -> IGTPW_6904

  CI-20190529: 20190529
  CI_DRM_11477: 3e999ce5dcc2d39d18f6eedeaa3237246eae629c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html

--===============0579523571663875976==
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
<tr><td><b>Series:</b></td><td>tests/kms: Skip kms test cases for DCC and DCC_RETILE (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102357/">https://patchwork.freedesktop.org/series/102357/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11477 -&gt; IGTPW_6904</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html</p>
<h2>Participating hosts (49 -&gt; 46)</h2>
<p>Additional (4): bat-rpls-1 fi-bxt-dsi bat-jsl-2 bat-hsw-1 <br />
  Missing    (7): shard-tglu bat-dg2-8 fi-bsw-cyan fi-bsw-kefka shard-rkl shard-dg1 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6904:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_lmem_swapping@verify-random:<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/bat-rpls-1/igt@gem_lmem_swapping@verify-random.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6904 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>)</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5685">i915#5685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bdw-5557u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3@smem:<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-cml-u2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5680">i915#5680</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-cml-u2/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6904</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11477: 3e999ce5dcc2d39d18f6eedeaa3237246eae629c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6904/index.html<br />
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0579523571663875976==--
