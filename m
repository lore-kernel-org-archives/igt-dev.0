Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1433520230521276494=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Tue, 07 Jun 2022 10:59:20 -0000
Message-ID: <165459956050.8647.13781739301284937413@emeril.freedesktop.org>
References: <20220530083913.23871-1-karthik.b.s@intel.com>
In-Reply-To: <20220530083913.23871-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Convert_test_to_dynamic_=28rev4=29?=
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

--===============1433520230521276494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_joiner: Convert test to dynamic (rev4)
URL   : https://patchwork.freedesktop.org/series/103207/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11730 -> IGTPW_7245
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7245 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7245, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (2): bat-adlm-1 fi-rkl-11600 
  Missing    (3): bat-adln-1 fi-hsw-g3258 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7245:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@memory_region:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bdw-5557u/igt@i915_selftest@live@memory_region.html

  
Known issues
------------

  Here are the changes found in IGTPW_7245 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-rkl-11600:       NOTRUN -> [SKIP][3] ([i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#3282])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([i915#3012])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][6] -> [INCOMPLETE][7] ([i915#5847])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][8] -> [INCOMPLETE][9] ([i915#4785])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][10] -> [DMESG-FAIL][11] ([i915#4528])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][12] ([i915#5982])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] ([fdo#111827]) +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#4070] / [i915#4103]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][15] ([fdo#109285] / [i915#4098])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#4070] / [i915#533])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#1072]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#3555] / [i915#4098])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][19] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-11600:       NOTRUN -> [SKIP][20] ([fdo#109295] / [i915#3301] / [i915#3708])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][21] ([fdo#109271] / [i915#4312] / [i915#5594])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-hsw-4770/igt@runner@aborted.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][22] ([fdo#109271] / [i915#3428] / [i915#4312])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bsw-n3050/igt@runner@aborted.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][23] ([i915#2029] / [i915#4312])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-skl-6600u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][24] ([i915#5122]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_hangman@error-state-basic:
    - fi-skl-guc:         [DMESG-WARN][26] -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-skl-guc/igt@i915_hangman@error-state-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-skl-guc/igt@i915_hangman@error-state-basic.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-bdw-5557u:       [INCOMPLETE][28] ([i915#5502]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5502]: https://gitlab.freedesktop.org/drm/intel/issues/5502
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#5847]: https://gitlab.freedesktop.org/drm/intel/issues/5847
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6162]: https://gitlab.freedesktop.org/drm/intel/issues/6162


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6510 -> IGTPW_7245

  CI-20190529: 20190529
  CI_DRM_11730: 5e7f37992081d4600d6329a745ab7edb2ee42bcd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html
  IGT_6510: dacfa80158d586cd0fe322f25f5275f224a946dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html

--===============1433520230521276494==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_joiner: Convert test to dynamic (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103207/">https://patchwork.freedesktop.org/series/103207/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11730 -&gt; IGTPW_7245</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7245 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7245, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (2): bat-adlm-1 fi-rkl-11600 <br />
  Missing    (3): bat-adln-1 fi-hsw-g3258 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7245:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@memory_region:<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bdw-5557u/igt@i915_selftest@live@memory_region.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7245 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5847">i915#5847</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-skl-guc/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-skl-guc/igt@i915_hangman@error-state-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5502">i915#5502</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6510 -&gt; IGTPW_7245</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11730: 5e7f37992081d4600d6329a745ab7edb2ee42bcd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html<br />
  IGT_6510: dacfa80158d586cd0fe322f25f5275f224a946dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1433520230521276494==--
