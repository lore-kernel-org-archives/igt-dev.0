Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1019263135508864530=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 30 Oct 2023 09:11:29 -0000
Message-ID: <169865708910.25482.4150272229136807133@emeril.freedesktop.org>
References: <20231030075815.26761-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231030075815.26761-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Ffrontbuffer=5Ftracking=3A_Extend_the_test_to_enable_FBC_f?=
 =?utf-8?q?or_each_plane_=28rev6=29?=
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

--===============1019263135508864530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev6)
URL   : https://patchwork.freedesktop.org/series/123724/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7563 -> IGTPW_10082
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10082 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10082, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html

Participating hosts (40 -> 36)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (5): bat-kbl-2 fi-bsw-n3050 bat-dg2-8 fi-snb-2520m bat-mtlp-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10082:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-11:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8109u:       [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
    - bat-adln-1:         [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-ivb-3770:        [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
    - fi-ilk-650:         [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-ilk-650/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-ilk-650/igt@kms_frontbuffer_tracking@basic.html
    - bat-jsl-1:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-tgl-1115g4:      [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-6:         [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html
    - fi-skl-6600u:       [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-skl-6600u/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-skl-6600u/igt@kms_frontbuffer_tracking@basic.html
    - fi-apl-guc:         [PASS][20] -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-apl-guc/igt@kms_frontbuffer_tracking@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-apl-guc/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg1-5:          [PASS][22] -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg1-5/igt@kms_frontbuffer_tracking@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg1-5/igt@kms_frontbuffer_tracking@basic.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-pnv-d510/igt@kms_frontbuffer_tracking@basic.html
    - fi-glk-j4005:       [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-glk-j4005/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-glk-j4005/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-9:         [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html
    - fi-skl-guc:         [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-11:         [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg2-11/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg2-11/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-soraka:      [PASS][33] -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-7567u:       [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8700k:       [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html
    - bat-rplp-1:         [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rplp-1/igt@kms_frontbuffer_tracking@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rplp-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-rkl-11600:       [PASS][41] -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-guc:         [PASS][43] -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html
    - bat-jsl-3:          [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-jsl-3/igt@kms_frontbuffer_tracking@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-jsl-3/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-elk-e7500:       [SKIP][47] ([fdo#109271]) -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html
    - fi-blb-e6850:       [SKIP][49] ([fdo#109271]) -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-blb-e6850/igt@kms_frontbuffer_tracking@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-blb-e6850/igt@kms_frontbuffer_tracking@basic.html
    - fi-bsw-nick:        [FAIL][51] ([i915#9276]) -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-dg2-14}:       [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_10082 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][55] -> [DMESG-FAIL][56] ([i915#5334])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-dg1-5:          [PASS][57] -> [ABORT][58] ([i915#4817] / [i915#8213])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#5190])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-11:        [PASS][60] -> [DMESG-WARN][61] ([i915#6868])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_busy@basic@modeset.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp5:
    - bat-adlp-11:        [PASS][62] -> [DMESG-FAIL][63] ([i915#6868])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html

  * igt@kms_flip@basic-flip-vs-dpms@d-dp5:
    - bat-adlp-11:        [PASS][64] -> [FAIL][65] ([i915#6121])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp5.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp5.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-11:        NOTRUN -> [SKIP][66] ([i915#3637])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - fi-hsw-4770:        NOTRUN -> [SKIP][67] ([fdo#109271]) +12 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][68] -> [ABORT][69] ([i915#8668])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][70] ([i915#8841]) +6 other tests dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][71] ([fdo#109271]) +28 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [TIMEOUT][73] ([i915#6794] / [i915#7392]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rpls-1/igt@i915_selftest@live@mman.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-1:         [WARN][75] ([i915#8747]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7563 -> IGTPW_10082

  CI-20190529: 20190529
  CI_DRM_13809: 4949f524796f1292c50b35c85c428362b2baccbc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10082: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html
  IGT_7563: 3f58d866798c3d7896789903f92997f2312b2305 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_frontbuffer_tracking@plane-fbc-rte

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html

--===============1019263135508864530==
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
<tr><td><b>Series:</b></td><td>tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123724/">https://patchwork.freedesktop.org/series/123724/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7563 -&gt; IGTPW_10082</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10082 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10082, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (5): bat-kbl-2 fi-bsw-n3050 bat-dg2-8 fi-snb-2520m bat-mtlp-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10082:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-ilk-650/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-ilk-650/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-skl-6600u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-skl-6600u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-apl-guc/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-apl-guc/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg1-5/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg1-5/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-pnv-d510/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-glk-j4005/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-glk-j4005/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg2-11/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg2-11/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rplp-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rplp-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-jsl-3/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-jsl-3/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-blb-e6850/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-blb-e6850/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10082 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7563/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8747">i915#8747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7563 -&gt; IGTPW_10082</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13809: 4949f524796f1292c50b35c85c428362b2baccbc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10082: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10082/index.html<br />
  IGT_7563: 3f58d866798c3d7896789903f92997f2312b2305 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_frontbuffer_tracking@plane-fbc-rte</p>

</body>
</html>

--===============1019263135508864530==--
