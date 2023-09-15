Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5417354047703176189=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 15 Sep 2023 08:42:55 -0000
Message-ID: <169476737502.32040.3729828951019613783@emeril.freedesktop.org>
References: <20230915070409.2225500-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230915070409.2225500-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/pm=3A_Separate_display_specific_tests_from_i915=5Fpm=5Frp?=
 =?utf-8?q?m?=
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

--===============5417354047703176189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/pm: Separate display specific tests from i915_pm_rpm
URL   : https://patchwork.freedesktop.org/series/123750/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7489 -> IGTPW_9798
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9798 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9798, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9798:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-soraka/igt@i915_selftest@live@late_gt_pm.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-adls-5:         NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adls-5/igt@kms_pm_rpm@module-reload.html
    - fi-apl-guc:         NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-apl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-dg1-5:          NOTRUN -> [WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-dg1-5/igt@kms_pm_rpm@module-reload.html
    - bat-atsm-1:         NOTRUN -> [WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-atsm-1/igt@kms_pm_rpm@module-reload.html
    - fi-glk-j4005:       NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html
    - bat-adlp-9:         NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adlp-9/igt@kms_pm_rpm@module-reload.html
    - fi-skl-guc:         NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-skl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-11:         NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-dg2-11/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-soraka:      NOTRUN -> [WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-soraka/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8109u:       NOTRUN -> [WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-8809g:       NOTRUN -> [WARN][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-8809g/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-nick:        NOTRUN -> [WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-bsw-nick/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-guc:         NOTRUN -> [WARN][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-adlm-1:         NOTRUN -> [WARN][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adlm-1/igt@kms_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      NOTRUN -> [WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-n3050:       NOTRUN -> [WARN][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-guc:         NOTRUN -> [WARN][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-cfl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-6:         NOTRUN -> [WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-9:          NOTRUN -> [WARN][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-dg2-9/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-x1275:       NOTRUN -> [WARN][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-x1275/igt@kms_pm_rpm@module-reload.html
    - fi-hsw-4770:        NOTRUN -> [WARN][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-8:         NOTRUN -> [WARN][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html
    - bat-jsl-1:          NOTRUN -> [WARN][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-jsl-1/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8700k:       NOTRUN -> [WARN][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-cfl-8700k/igt@kms_pm_rpm@module-reload.html
    - bat-rpls-1:         NOTRUN -> [WARN][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-rpls-1/igt@kms_pm_rpm@module-reload.html
    - bat-kbl-2:          NOTRUN -> [WARN][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-kbl-2/igt@kms_pm_rpm@module-reload.html
    - fi-rkl-11600:       NOTRUN -> [WARN][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-rkl-11600/igt@kms_pm_rpm@module-reload.html
    - fi-skl-6600u:       NOTRUN -> [WARN][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-skl-6600u/igt@kms_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between IGT_7489 and IGTPW_9798:

### New IGT tests (3) ###

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 abort(s) 29 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-rte:
    - Statuses : 29 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@module-reload:
    - Statuses : 5 skip(s) 28 warn(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9798 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][30] ([fdo#109271]) +13 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][31] ([i915#8841]) +6 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - bat-adln-1:         NOTRUN -> [ABORT][32] ([i915#8668])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][33] ([fdo#109271]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][34] ([fdo#109271]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         NOTRUN -> [SKIP][35] ([fdo#109271]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][36] ([fdo#109271]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-blb-e6850/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][37] ([fdo#109271]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][39] ([i915#8668]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7489/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7489 -> IGTPW_9798

  CI-20190529: 20190529
  CI_DRM_13635: c6b7f865a77a75af03c3b68baa4cf7eb66c1c6d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html
  IGT_7489: c31111635650e76263faee031292290b1a393f2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pm_rpm@basic-pci-d3-state
+igt@kms_pm_rpm@basic-rte
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
+igt@kms_pm_rpm@dpms-non-lpsp
+igt@kms_pm_rpm@drm-resources-equal
+igt@kms_pm_rpm@fences
+igt@kms_pm_rpm@fences-dpms
+igt@kms_pm_rpm@i2c
+igt@kms_pm_rpm@legacy-planes
+igt@kms_pm_rpm@legacy-planes-dpms
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-non-lpsp
+igt@kms_pm_rpm@modeset-non-lpsp-stress
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-pc8-residency-stress
+igt@kms_pm_rpm@modeset-stress-extra-wait
+igt@kms_pm_rpm@module-reload
+igt@kms_pm_rpm@pc8-residency
+igt@kms_pm_rpm@pm-caching
+igt@kms_pm_rpm@pm-tiling
+igt@kms_pm_rpm@system-suspend-modeset
+igt@kms_pm_rpm@universal-planes
+igt@kms_pm_rpm@universal-planes-dpms
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
-igt@i915_pm_rpm@cursor
-igt@i915_pm_rpm@cursor-dpms
-igt@i915_pm_rpm@dpms-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
-igt@i915_pm_rpm@dpms-non-lpsp
-igt@i915_pm_rpm@drm-resources-equal
-igt@i915_pm_rpm@fences
-igt@i915_pm_rpm@fences-dpms
-igt@i915_pm_rpm@i2c
-igt@i915_pm_rpm@legacy-planes
-igt@i915_pm_rpm@legacy-planes-dpms
-igt@i915_pm_rpm@modeset-lpsp
-igt@i915_pm_rpm@modeset-lpsp-stress
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-non-lpsp
-igt@i915_pm_rpm@modeset-non-lpsp-stress
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-pc8-residency-stress
-igt@i915_pm_rpm@modeset-stress-extra-wait
-igt@i915_pm_rpm@pc8-residency
-igt@i915_pm_rpm@pm-caching
-igt@i915_pm_rpm@pm-tiling
-igt@i915_pm_rpm@system-suspend-modeset
-igt@i915_pm_rpm@universal-planes
-igt@i915_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html

--===============5417354047703176189==
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
<tr><td><b>Series:</b></td><td>tests/intel/pm: Separate display specific tests from i915_pm_rpm</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123750/">https://patchwork.freedesktop.org/series/123750/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7489 -&gt; IGTPW_9798</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9798 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9798, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9798:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-soraka/igt@i915_selftest@live@late_gt_pm.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adls-5/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-apl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-dg1-5/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-atsm-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adlp-9/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-skl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-dg2-11/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-soraka/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-8809g/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-bsw-nick/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adlm-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-cfl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-dg2-9/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-kbl-x1275/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-jsl-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-cfl-8700k/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-rpls-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-kbl-2/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-rkl-11600/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-skl-6600u/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7489 and IGTPW_9798:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 1 abort(s) 29 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 29 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 5 skip(s) 28 warn(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9798 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-blb-e6850/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7489/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7489 -&gt; IGTPW_9798</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13635: c6b7f865a77a75af03c3b68baa4cf7eb66c1c6d5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9798/index.html<br />
  IGT_7489: c31111635650e76263faee031292290b1a393f2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pm_rpm@basic-pci-d3-state<br />
+igt@kms_pm_rpm@basic-rte<br />
+igt@kms_pm_rpm@cursor<br />
+igt@kms_pm_rpm@cursor-dpms<br />
+igt@kms_pm_rpm@dpms-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@kms_pm_rpm@dpms-non-lpsp<br />
+igt@kms_pm_rpm@drm-resources-equal<br />
+igt@kms_pm_rpm@fences<br />
+igt@kms_pm_rpm@fences-dpms<br />
+igt@kms_pm_rpm@i2c<br />
+igt@kms_pm_rpm@legacy-planes<br />
+igt@kms_pm_rpm@legacy-planes-dpms<br />
+igt@kms_pm_rpm@modeset-lpsp<br />
+igt@kms_pm_rpm@modeset-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-non-lpsp<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
+igt@kms_pm_rpm@modeset-stress-extra-wait<br />
+igt@kms_pm_rpm@module-reload<br />
+igt@kms_pm_rpm@pc8-residency<br />
+igt@kms_pm_rpm@pm-caching<br />
+igt@kms_pm_rpm@pm-tiling<br />
+igt@kms_pm_rpm@system-suspend-modeset<br />
+igt@kms_pm_rpm@universal-planes<br />
+igt@kms_pm_rpm@universal-planes-dpms<br />
-igt@i915_pm_rpm@basic-pci-d3-state<br />
-igt@i915_pm_rpm@basic-rte<br />
-igt@i915_pm_rpm@cursor<br />
-igt@i915_pm_rpm@cursor-dpms<br />
-igt@i915_pm_rpm@dpms-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@i915_pm_rpm@dpms-non-lpsp<br />
-igt@i915_pm_rpm@drm-resources-equal<br />
-igt@i915_pm_rpm@fences<br />
-igt@i915_pm_rpm@fences-dpms<br />
-igt@i915_pm_rpm@i2c<br />
-igt@i915_pm_rpm@legacy-planes<br />
-igt@i915_pm_rpm@legacy-planes-dpms<br />
-igt@i915_pm_rpm@modeset-lpsp<br />
-igt@i915_pm_rpm@modeset-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-non-lpsp<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
-igt@i915_pm_rpm@modeset-stress-extra-wait<br />
-igt@i915_pm_rpm@pc8-residency<br />
-igt@i915_pm_rpm@pm-caching<br />
-igt@i915_pm_rpm@pm-tiling<br />
-igt@i915_pm_rpm@system-suspend-modeset<br />
-igt@i915_pm_rpm@universal-planes<br />
-igt@i915_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============5417354047703176189==--
