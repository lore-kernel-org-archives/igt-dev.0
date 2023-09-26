Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2774722669058392201=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 26 Sep 2023 15:14:32 -0000
Message-ID: <169574127268.20980.18265166557358254417@emeril.freedesktop.org>
References: <20230926130054.6-1-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_uAPI_Ali?=
 =?utf-8?q?gnment_-_take_1_=28rev2=29?=
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

--===============2774722669058392201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - take 1 (rev2)
URL   : https://patchwork.freedesktop.org/series/123916/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7503_BAT -> XEIGTPW_9881_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in XEIGTPW_9881_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] ([Intel XE#716]) +12 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_psr@primary_page_flip.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][2] -> [FAIL][3] ([Intel XE#716]) +127 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][4] -> [FAIL][5] ([Intel XE#716]) +177 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][6] -> [FAIL][7] ([Intel XE#716]) +155 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][8] ([Intel XE#623]) -> [FAIL][9] ([Intel XE#716])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][10] ([Intel XE#624]) -> [FAIL][11] ([Intel XE#716])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][12] ([Intel XE#609]) -> [FAIL][13] ([Intel XE#716]) +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][14] ([i915#6077]) -> [FAIL][15] ([Intel XE#716]) +33 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][16] ([Intel XE#609]) -> [FAIL][17] ([Intel XE#716]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         [SKIP][18] ([Intel XE#274] / [Intel XE#539]) -> [FAIL][19] ([Intel XE#716]) +5 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][20] ([Intel XE#539]) -> [FAIL][21] ([Intel XE#716]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][22] ([Intel XE#423]) -> [FAIL][23] ([Intel XE#716])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][24] ([Intel XE#423]) -> [FAIL][25] ([Intel XE#716])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][26] ([Intel XE#275]) -> [FAIL][27] ([Intel XE#716]) +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][28] ([Intel XE#277] / [Intel XE#540]) -> [FAIL][29] ([Intel XE#716]) +2 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][30] ([i915#5274]) -> [FAIL][31] ([Intel XE#716])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][32] ([Intel XE#608]) -> [FAIL][33] ([Intel XE#716])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [INCOMPLETE][34] ([Intel XE#632]) -> [FAIL][35] ([Intel XE#716])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         [SKIP][36] ([Intel XE#540]) -> [FAIL][37] ([Intel XE#716])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][38] ([Intel XE#400]) -> [FAIL][39] ([Intel XE#716])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         [SKIP][40] ([Intel XE#537] / [i915#1836]) -> [FAIL][41] ([Intel XE#716]) +6 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][42] ([Intel XE#273]) -> [FAIL][43] ([Intel XE#716])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_prop_blob@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         [SKIP][44] ([i915#1072]) -> [FAIL][45] ([Intel XE#716]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_psr@cursor_plane_move.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][46] ([i915#1072]) -> [FAIL][47] ([Intel XE#716]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         [SKIP][48] ([Intel XE#672]) -> [FAIL][49] ([Intel XE#716])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_compute@compute-square.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_compute@compute-square.html
    - bat-dg2-oem2:       [SKIP][50] ([Intel XE#672]) -> [FAIL][51] ([Intel XE#716])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         [SKIP][52] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][53] ([Intel XE#716]) +15 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][54] ([Intel XE#288]) -> [FAIL][55] ([Intel XE#716]) +17 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][56] ([Intel XE#288]) -> [FAIL][57] ([Intel XE#716]) +17 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][58] ([Intel XE#288]) -> [FAIL][59] ([Intel XE#716]) +17 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][60] ([Intel XE#255]) -> [FAIL][61] ([Intel XE#716])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         [SKIP][62] ([Intel XE#255]) -> [FAIL][63] ([Intel XE#716])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][64] ([Intel XE#263]) -> [FAIL][65] ([Intel XE#716])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_mmap@vram.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_mmap@vram.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/273
  [Intel XE#274]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/274
  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#716]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/716
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7503 -> IGTPW_9881

  IGTPW_9881: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html
  IGT_7503: 7503
  xe-396-fc8ec3c56efa5c15b630ddc17c89100440fe03ef: fc8ec3c56efa5c15b630ddc17c89100440fe03ef

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/index.html

--===============2774722669058392201==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - take 1 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123916/">https://patchwork.freedesktop.org/series/123916/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7503_BAT -&gt; XEIGTPW_9881_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9881_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +127 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +177 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +155 other tests fail</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/274">Intel XE#274</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_dsc@dsc-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/275">Intel XE#275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/273">Intel XE#273</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_prop_blob@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_compute@compute-square.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_compute@compute-square.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7503/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9881/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7503 -&gt; IGTPW_9881</li>
</ul>
<p>IGTPW_9881: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html<br />
  IGT_7503: 7503<br />
  xe-396-fc8ec3c56efa5c15b630ddc17c89100440fe03ef: fc8ec3c56efa5c15b630ddc17c89100440fe03ef</p>

</body>
</html>

--===============2774722669058392201==--
