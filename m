Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9079661868098604666=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Mon, 06 Nov 2023 08:50:29 -0000
Message-ID: <169926062986.20423.4852752285871598806@emeril.freedesktop.org>
References: <20231106071215.1271281-1-kunal1.joshi@intel.com>
In-Reply-To: <20231106071215.1271281-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYWRkZWQg?=
 =?utf-8?q?new_subtest_simultaneous-modeset_=28rev2=29?=
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

--===============9079661868098604666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: added new subtest simultaneous-modeset (rev2)
URL   : https://patchwork.freedesktop.org/series/125631/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13839 -> IGTPW_10119
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/index.html

Participating hosts (32 -> 29)
------------------------------

  Additional (1): fi-hsw-4770 
  Missing    (4): fi-kbl-soraka bat-jsl-1 fi-snb-2520m bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10119:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [CRASH][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-guc:         NOTRUN -> [CRASH][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-cfl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-mtlp-6:         NOTRUN -> [CRASH][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-mtlp-6/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8109u:       NOTRUN -> [CRASH][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-rpls-1:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-rpls-1/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-6:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-adlp-6/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-jsl-3:          NOTRUN -> [CRASH][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-jsl-3/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-glk-j4005:       NOTRUN -> [CRASH][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-guc:         NOTRUN -> [CRASH][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-7567u:       NOTRUN -> [CRASH][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-7567u/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adln-1:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-adln-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-elk-e7500:       NOTRUN -> [CRASH][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-elk-e7500/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-rplp-1:         NOTRUN -> [CRASH][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-rplp-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-rkl-11600:       NOTRUN -> [CRASH][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13839 and IGTPW_10119:

### New IGT tests (1) ###

  * igt@kms_big_joiner@simultaneous-modeset:
    - Statuses : 11 crash(s) 3 pass(s) 14 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10119 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-11:         [PASS][15] -> [FAIL][16] ([fdo#103375]) +7 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13839/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#5190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-x1275/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-ivb-3770/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ilk-650:         NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-apl-guc:         NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-apl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-pnv-d510/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - fi-hsw-4770:        NOTRUN -> [SKIP][28] ([fdo#109271]) +13 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][29] ([i915#1845] / [i915#9197]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][30] ([i915#8841]) +6 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][32] ([IGT#3]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13839/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][34] ([i915#8668]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13839/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7573 -> IGTPW_10119

  CI-20190529: 20190529
  CI_DRM_13839: 5a2c88b2399683ca157fa8d01683353fbe53d424 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10119: 10119
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_big_joiner@simultaneous-modeset
-igt@kms_frontbuffer_tracking@plane-fbc-rte

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/index.html

--===============9079661868098604666==
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
<tr><td><b>Series:</b></td><td>added new subtest simultaneous-modeset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125631/">https://patchwork.freedesktop.org/series/125631/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13839 -&gt; IGTPW_10119</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/index.html</p>
<h2>Participating hosts (32 -&gt; 29)</h2>
<p>Additional (1): fi-hsw-4770 <br />
  Missing    (4): fi-kbl-soraka bat-jsl-1 fi-snb-2520m bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10119:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-cfl-guc/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-mtlp-6/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-rpls-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-adlp-6/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-jsl-3/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-7567u/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-adln-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-elk-e7500/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-rplp-1/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13839 and IGTPW_10119:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_big_joiner@simultaneous-modeset:<ul>
<li>Statuses : 11 crash(s) 3 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10119 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13839/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-x1275/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-ivb-3770/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-guc/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-apl-guc/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-pnv-d510/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13839/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13839/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10119/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7573 -&gt; IGTPW_10119</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13839: 5a2c88b2399683ca157fa8d01683353fbe53d424 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10119: 10119<br />
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@simultaneous-modeset<br />
-igt@kms_frontbuffer_tracking@plane-fbc-rte</p>

</body>
</html>

--===============9079661868098604666==--
