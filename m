Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0310556838996828505=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Mon, 20 Nov 2023 16:20:14 -0000
Message-ID: <170049721434.29474.17789538784460127569@emeril.freedesktop.org>
References: <20231120100151.1792953-1-kunal1.joshi@intel.com>
In-Reply-To: <20231120100151.1792953-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYWRkZWQg?=
 =?utf-8?q?new_subtest_simultaneous-modeset_=28rev3=29?=
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

--===============0310556838996828505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: added new subtest simultaneous-modeset (rev3)
URL   : https://patchwork.freedesktop.org/series/125631/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13897 -> IGTPW_10216
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/index.html

Participating hosts (32 -> 32)
------------------------------

  Additional (3): fi-kbl-soraka fi-rkl-11600 fi-pnv-d510 
  Missing    (3): bat-dg2-9 fi-snb-2520m bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10216:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [CRASH][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-guc:         NOTRUN -> [CRASH][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-cfl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-mtlp-6/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ilk-650:         NOTRUN -> [CRASH][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-jsl-1:          NOTRUN -> [CRASH][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-jsl-1/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-6:         NOTRUN -> [CRASH][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-adlp-6/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-guc:         NOTRUN -> [CRASH][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-soraka:      NOTRUN -> [CRASH][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@kms_big_joiner@simultaneous-modeset.html
    - {bat-dg2-14}:       NOTRUN -> [CRASH][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-dg2-14/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-bsw-nick:        NOTRUN -> [CRASH][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlm-1:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-adlm-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-rkl-11600:       NOTRUN -> [CRASH][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13897 and IGTPW_10216:

### New IGT tests (1) ###

  * igt@kms_big_joiner@simultaneous-modeset:
    - Statuses : 10 crash(s) 6 pass(s) 15 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10216 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] ([i915#9318])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][16] ([fdo#109271]) +26 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-pnv-d510/igt@gem_lmem_swapping@basic.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#4613]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][19] ([i915#3282])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][20] ([i915#1886])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][21] ([i915#6078])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-atsm-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-x1275/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-hsw-4770/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-ivb-3770/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-7567u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-kbl-2:          NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-kbl-2/igt@kms_big_joiner@simultaneous-modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][33] ([i915#4103]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][34] ([fdo#109271]) +9 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][35] ([i915#3555] / [i915#3840])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][36] ([fdo#109285] / [i915#4098])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][37] ([i915#3555] / [i915#4098])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][38] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_contexts:
    - fi-hsw-4770:        [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-hsw-4770/igt@i915_selftest@live@gt_contexts.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-hsw-4770/igt@i915_selftest@live@gt_contexts.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][41] ([i915#5334]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-bsw-nick:        [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][45] ([IGT#3]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][47] ([i915#8668]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9648]: https://gitlab.freedesktop.org/drm/intel/issues/9648
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7595 -> IGTPW_10216

  CI-20190529: 20190529
  CI_DRM_13897: 0fd67203ab470ec012404449b037a1a44da62c41 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10216: 10216
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_big_joiner@simultaneous-modeset
-igt@kms_vrr@cmrr

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/index.html

--===============0310556838996828505==
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
<tr><td><b>Series:</b></td><td>added new subtest simultaneous-modeset (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125631/">https://patchwork.freedesktop.org/series/125631/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13897 -&gt; IGTPW_10216</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/index.html</p>
<h2>Participating hosts (32 -&gt; 32)</h2>
<p>Additional (3): fi-kbl-soraka fi-rkl-11600 fi-pnv-d510 <br />
  Missing    (3): bat-dg2-9 fi-snb-2520m bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10216:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-cfl-guc/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-mtlp-6/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-jsl-1/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-adlp-6/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-dg2-14/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-adlm-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13897 and IGTPW_10216:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_big_joiner@simultaneous-modeset:<ul>
<li>Statuses : 10 crash(s) 6 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10216 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 other tests skip</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-atsm-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-x1275/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-hsw-4770/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-ivb-3770/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-guc/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-7567u/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-kbl-2/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-hsw-4770/igt@i915_selftest@live@gt_contexts.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-hsw-4770/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13897/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10216/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7595 -&gt; IGTPW_10216</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13897: 0fd67203ab470ec012404449b037a1a44da62c41 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10216: 10216<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@simultaneous-modeset<br />
-igt@kms_vrr@cmrr</p>

</body>
</html>

--===============0310556838996828505==--
