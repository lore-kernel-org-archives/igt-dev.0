Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6668087057271257019=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 14 Jul 2022 11:48:26 -0000
Message-ID: <165779930660.7511.12164021944954562024@emeril.freedesktop.org>
References: <20220714105612.3025-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220714105612.3025-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Finvalid=5Fmode=3A_Avoid_usage_of_same_pipe_on_multiple_ou?=
 =?utf-8?q?tputs?=
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

--===============6668087057271257019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode: Avoid usage of same pipe on multiple outputs
URL   : https://patchwork.freedesktop.org/series/106345/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6582 -> IGTPW_7521
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7521 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7521, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html

Participating hosts (40 -> 40)
------------------------------

  Additional (3): fi-hsw-4770 bat-adln-1 fi-pnv-d510 
  Missing    (3): bat-rpls-1 fi-bxt-dsi bat-jsl-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7521:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-skl-6600u:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlm-1}:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  
Known issues
------------

  Here are the changes found in IGTPW_7521 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271]) +9 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-4770:        NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#3012])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][7] ([i915#4528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@vma:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][8] ([i915#6332])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-5557u/igt@i915_selftest@live@vma.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][9] ([i915#4817])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-hsw-4770:        NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][11] ([fdo#109271]) +42 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1072]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][13] ([fdo#109271] / [i915#2403] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][14] ([i915#2582]) -> [PASS][15] +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/bat-rpls-2/igt@fbdev@read.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/bat-rpls-2/igt@fbdev@read.html

  * igt@i915_selftest@live@execlists:
    - fi-bdw-gvtdvm:      [INCOMPLETE][16] ([i915#2940]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-ehl-2}:         [INCOMPLETE][18] -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-ehl-2/igt@i915_selftest@live@hangcheck.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-ehl-2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@migrate:
    - fi-bdw-5557u:       [INCOMPLETE][20] ([i915#6000]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-bdw-5557u/igt@i915_selftest@live@migrate.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-5557u/igt@i915_selftest@live@migrate.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][22] ([i915#6298]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6000]: https://gitlab.freedesktop.org/drm/intel/issues/6000
  [i915#6297]: https://gitlab.freedesktop.org/drm/intel/issues/6297
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6332]: https://gitlab.freedesktop.org/drm/intel/issues/6332


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6582 -> IGTPW_7521

  CI-20190529: 20190529
  CI_DRM_11877: e55cefc370de5a38ee848aa96082d9d9f4cacdb9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7521: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html
  IGT_6582: c7f7fabcd7c075bfee48cbb79b5990894743204d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html

--===============6668087057271257019==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode: Avoid usage of same pipe on multiple outputs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106345/">https://patchwork.freedesktop.org/series/106345/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6582 -&gt; IGTPW_7521</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7521 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7521, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html</p>
<h2>Participating hosts (40 -&gt; 40)</h2>
<p>Additional (3): fi-hsw-4770 bat-adln-1 fi-pnv-d510 <br />
  Missing    (3): bat-rpls-1 fi-bxt-dsi bat-jsl-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7521:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_suspend@basic-s0@smem:<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7521 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-5557u/igt@i915_selftest@live@vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6332">i915#6332</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-ehl-2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-ehl-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-bdw-5557u/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6000">i915#6000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bdw-5557u/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6582/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6582 -&gt; IGTPW_7521</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11877: e55cefc370de5a38ee848aa96082d9d9f4cacdb9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7521: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7521/index.html<br />
  IGT_6582: c7f7fabcd7c075bfee48cbb79b5990894743204d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6668087057271257019==--
