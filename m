Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2836470034087229239=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Thu, 05 May 2022 12:15:56 -0000
Message-ID: <165175295625.7657.442075873919514873@emeril.freedesktop.org>
References: <20220505110354.30768-1-anshuman.gupta@intel.com>
In-Reply-To: <20220505110354.30768-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRDNDb2xk?=
 =?utf-8?q?_Tool_=26_IGT_=28rev4=29?=
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

--===============2836470034087229239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: D3Cold Tool & IGT (rev4)
URL   : https://patchwork.freedesktop.org/series/102780/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11610 -> IGTPW_7043
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7043 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7043, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html

Participating hosts (43 -> 41)
------------------------------

  Additional (3): bat-adlm-1 bat-dg2-9 bat-dg1-5 
  Missing    (5): bat-dg2-8 fi-bsw-cyan fi-icl-u2 bat-rpls-1 bat-rpls-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7043:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-4:         NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@i915_selftest@live@gt_lrc.html

  
Known issues
------------

  Here are the changes found in IGTPW_7043 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - bat-dg1-5:          NOTRUN -> [SKIP][2] ([i915#2582]) +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@fbdev@write.html

  * igt@gem_mmap@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][3] ([i915#4083])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][4] ([i915#4077]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][5] ([i915#4079]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg1-5:          NOTRUN -> [SKIP][6] ([i915#1155])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          NOTRUN -> [INCOMPLETE][7] ([i915#4418])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][8] ([i915#3921])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][9] ([i915#4215])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg1-5:          NOTRUN -> [SKIP][10] ([i915#4212]) +7 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_busy@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][11] ([i915#4303])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_busy@basic.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         [PASS][12] -> [DMESG-WARN][13] ([i915#3576])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-4/igt@kms_busy@basic@flip.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - bat-dg1-5:          NOTRUN -> [SKIP][15] ([fdo#111827]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][16] ([i915#4103] / [i915#4213]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-dg1-5:          NOTRUN -> [SKIP][17] ([i915#4078]) +23 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-5:          NOTRUN -> [SKIP][18] ([fdo#109285])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg1-5:          NOTRUN -> [SKIP][19] ([i915#1072] / [i915#4078]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-5:          NOTRUN -> [SKIP][20] ([i915#3555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg1-5:          NOTRUN -> [SKIP][21] ([i915#3708] / [i915#4077]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-userptr:
    - bat-dg1-5:          NOTRUN -> [SKIP][22] ([i915#3708] / [i915#4873])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - bat-dg1-5:          NOTRUN -> [SKIP][23] ([i915#3708]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@prime_vgem@basic-write.html

  * igt@runner@aborted:
    - bat-dg1-5:          NOTRUN -> [FAIL][24] ([i915#4312] / [i915#5257])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][25] ([i915#5122]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [INCOMPLETE][27] -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_migrate:
    - fi-bdw-5557u:       [INCOMPLETE][29] ([i915#5716]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/fi-bdw-5557u/igt@i915_selftest@live@gem_migrate.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-bdw-5557u/igt@i915_selftest@live@gem_migrate.html

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [INCOMPLETE][31] ([i915#3303] / [i915#5370]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][33] ([i915#3576]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
    - bat-adlp-4:         [DMESG-WARN][35] ([i915#3576]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5171]: https://gitlab.freedesktop.org/drm/intel/issues/5171
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5181]: https://gitlab.freedesktop.org/drm/intel/issues/5181
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5370]: https://gitlab.freedesktop.org/drm/intel/issues/5370
  [i915#5606]: https://gitlab.freedesktop.org/drm/intel/issues/5606
  [i915#5703]: https://gitlab.freedesktop.org/drm/intel/issues/5703
  [i915#5716]: https://gitlab.freedesktop.org/drm/intel/issues/5716
  [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
  [i915#5801]: https://gitlab.freedesktop.org/drm/intel/issues/5801


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6465 -> IGTPW_7043

  CI-20190529: 20190529
  CI_DRM_11610: c0acb508f6f2581929400eeef6c0a94e925ae264 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7043: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html
  IGT_6465: f6bb4399881a806fbff75ce3df89b60286d55917 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_rpm@d3cold-basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html

--===============2836470034087229239==
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
<tr><td><b>Series:</b></td><td>D3Cold Tool &amp; IGT (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102780/">https://patchwork.freedesktop.org/series/102780/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11610 -&gt; IGTPW_7043</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7043 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7043, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Additional (3): bat-adlm-1 bat-dg2-9 bat-dg1-5 <br />
  Missing    (5): bat-dg2-8 fi-bsw-cyan fi-icl-u2 bat-rpls-1 bat-rpls-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7043:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7043 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-4/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-dg1-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_migrate:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/fi-bdw-5557u/igt@i915_selftest@live@gem_migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5716">i915#5716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-bdw-5557u/igt@i915_selftest@live@gem_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5370">i915#5370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11610/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6465 -&gt; IGTPW_7043</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11610: c0acb508f6f2581929400eeef6c0a94e925ae264 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7043: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7043/index.html<br />
  IGT_6465: f6bb4399881a806fbff75ce3df89b60286d55917 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_rpm@d3cold-basic</p>

</body>
</html>

--===============2836470034087229239==--
