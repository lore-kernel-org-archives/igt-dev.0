Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0174508326006862052=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Wed, 22 Nov 2023 14:31:19 -0000
Message-ID: <170066347992.4728.1770735690743759359@emeril.freedesktop.org>
References: <20231120100151.1792953-1-kunal1.joshi@intel.com>
In-Reply-To: <20231120100151.1792953-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYWRkZWQg?=
 =?utf-8?q?new_subtest_simultaneous-modeset_=28rev4=29?=
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

--===============0174508326006862052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: added new subtest simultaneous-modeset (rev4)
URL   : https://patchwork.freedesktop.org/series/125631/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13910 -> IGTPW_10240
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html

Participating hosts (38 -> 36)
------------------------------

  Additional (1): bat-dg1-7 
  Missing    (3): bat-rpls-1 fi-snb-2520m bat-mtlp-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10240:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-mtlp-6:         NOTRUN -> [CRASH][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-mtlp-6/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-dg2-9:          NOTRUN -> [CRASH][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-9/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-11:        NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adlp-11/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8109u:       NOTRUN -> [CRASH][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adls-5:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adls-5/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-dg1-5:          NOTRUN -> [CRASH][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-5/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-dg1-7:          NOTRUN -> [CRASH][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-glk-j4005:       NOTRUN -> [CRASH][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-9:         NOTRUN -> [CRASH][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adlp-9/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-7567u:       NOTRUN -> [CRASH][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-kbl-7567u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8700k:       NOTRUN -> [CRASH][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html
    - {bat-dg2-14}:       NOTRUN -> [CRASH][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-14/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-elk-e7500:       NOTRUN -> [CRASH][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-elk-e7500/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-bsw-nick:        NOTRUN -> [CRASH][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlm-1:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adlm-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13910 and IGTPW_10240:

### New IGT tests (1) ###

  * igt@kms_big_joiner@simultaneous-modeset:
    - Statuses : 12 crash(s) 8 pass(s) 15 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10240 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-dg1-7:          NOTRUN -> [SKIP][18] ([i915#1849] / [i915#2582])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-dg1-7:          NOTRUN -> [SKIP][19] ([i915#2582]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@fbdev@write.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][20] -> [INCOMPLETE][21] ([i915#8797] / [i915#9275])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13910/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_mmap@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][22] ([i915#4083])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][23] ([i915#4077]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][24] ([i915#4079]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#6621])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][26] ([i915#4212]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][27] ([i915#4215])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][28] ([i915#6078])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-atsm-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-cfl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-kbl-x1275/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-kbl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ilk-650:         NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][35] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-pnv-d510/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-kbl-2:          NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-kbl-2/igt@kms_big_joiner@simultaneous-modeset.html

  * igt@kms_busy@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][38] ([i915#1845] / [i915#4303])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_busy@basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg1-7:          NOTRUN -> [SKIP][39] ([i915#3637] / [i915#4078]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - bat-dg1-7:          NOTRUN -> [SKIP][40] ([i915#4078])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-7:          NOTRUN -> [SKIP][41] ([fdo#109285])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][42] ([i915#4078] / [i915#4342])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg1-7:          NOTRUN -> [SKIP][43] ([i915#433])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-dg1-7:          NOTRUN -> [SKIP][44] ([i915#1845]) +10 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg1-7:          NOTRUN -> [SKIP][45] ([i915#1845] / [i915#4078]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][46] ([i915#1845] / [i915#9197])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-7:          NOTRUN -> [SKIP][47] ([i915#3555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg1-7:          NOTRUN -> [SKIP][48] ([i915#1845] / [i915#3708])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg1-7:          NOTRUN -> [SKIP][49] ([i915#3708] / [i915#4077]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-dg1-7:          NOTRUN -> [SKIP][50] ([i915#3708]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@prime_vgem@basic-fence-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9648]: https://gitlab.freedesktop.org/drm/intel/issues/9648
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7595 -> IGTPW_10240

  CI-20190529: 20190529
  CI_DRM_13910: a6fa1fefc44d92897a3be86430dde647f665f3a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10240: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_big_joiner@simultaneous-modeset
-igt@sriov_basic@bind-unbind-vf
-igt@sriov_basic@enable-vfs-autoprobe-off
-igt@sriov_basic@enable-vfs-autoprobe-on
-igt@sriov_basic@enable-vfs-bind-all-unbind-all
-igt@sriov_basic@enable-vfs-bind-unbind-each

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html

--===============0174508326006862052==
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
<tr><td><b>Series:</b></td><td>added new subtest simultaneous-modeset (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125631/">https://patchwork.freedesktop.org/series/125631/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13910 -&gt; IGTPW_10240</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Additional (1): bat-dg1-7 <br />
  Missing    (3): bat-rpls-1 fi-snb-2520m bat-mtlp-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10240:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-mtlp-6/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-9/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adlp-11/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adls-5/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-5/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adlp-9/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-kbl-7567u/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-14/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-elk-e7500/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-adlm-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13910 and IGTPW_10240:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_big_joiner@simultaneous-modeset:<ul>
<li>Statuses : 12 crash(s) 8 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10240 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13910/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8797">i915#8797</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-atsm-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-cfl-guc/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-kbl-x1275/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-kbl-guc/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-pnv-d510/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-kbl-2/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7595 -&gt; IGTPW_10240</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13910: a6fa1fefc44d92897a3be86430dde647f665f3a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10240: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10240/index.html<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@simultaneous-modeset<br />
-igt@sriov_basic@bind-unbind-vf<br />
-igt@sriov_basic@enable-vfs-autoprobe-off<br />
-igt@sriov_basic@enable-vfs-autoprobe-on<br />
-igt@sriov_basic@enable-vfs-bind-all-unbind-all<br />
-igt@sriov_basic@enable-vfs-bind-unbind-each</p>

</body>
</html>

--===============0174508326006862052==--
