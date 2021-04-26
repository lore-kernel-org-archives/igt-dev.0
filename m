Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 26 Apr 2021 08:37:16 -0000
Message-ID: <161942623642.18666.7698205520605464966@emeril.freedesktop.org>
References: <20210426081208.12586-1-kunal1.joshi@intel.com>
In-Reply-To: <20210426081208.12586-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdCB0?=
 =?utf-8?q?iled_display_with_aid_of_chamelium=2E_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1356299176=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1356299176==
Content-Type: multipart/alternative;
 boundary="===============6218836541442724129=="

--===============6218836541442724129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test tiled display with aid of chamelium. (rev7)
URL   : https://patchwork.freedesktop.org/series/71393/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10005 -> IGTPW_5762
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5762 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5762, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5762:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  * {igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):
    - fi-bdw-5557u:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bdw-5557u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-7567u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-guc/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - {fi-hsw-gt1}:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-hsw-gt1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bdw-gvtdvm/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-hsw-4770/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cfl-8700k/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-icl-u2:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-icl-u2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-skl-6600u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-cml-u2:          NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cml-u2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-jsl-1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-apl-guc:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-apl-guc/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-snb-2520m/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-tgl-dsi/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bxt-dsi/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cfl-guc/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-cml-s:           NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cml-s/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-soraka/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-tgl-u2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-ehl-1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-ilk-650:         NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-ilk-650/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-kefka/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-snb-2600:        NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-snb-2600/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-tgl-y:           NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-tgl-y/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - {fi-rkl-11500t}:    NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-rkl-11500t/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-x1275/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-nick/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cfl-8109u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-ehl-2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-kbl-r:           NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-r/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  
#### Warnings ####

  * igt@kms_chamelium@vga-edid-read:
    - fi-icl-u2:          [SKIP][33] ([fdo#109309]) -> [SKIP][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10005 and IGTPW_5762:

### New IGT tests (1) ###

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - Statuses : 1 abort(s) 29 fail(s) 5 skip(s)
    - Exec time: [0.0, 0.56] s

  

Known issues
------------

  Here are the changes found in IGTPW_5762 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [PASS][35] -> [DMESG-FAIL][36] ([i915#2927])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bdw-gvtdvm/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-apl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html

  * {igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][39] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bwr-2160/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-kbl-7500u:       NOTRUN -> [{ABORT}][40] ([i915#1814])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-7500u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][41] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-pnv-d510/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][42] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-skl-6700k2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][43] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-elk-e7500/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][44] ([i915#1436])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-nick/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3276]: https://gitlab.freedesktop.org/drm/intel/issues/3276
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (43 -> 36)
------------------------------

  Additional (1): fi-rkl-11500t 
  Missing    (8): fi-ilk-m540 fi-bsw-n3050 fi-hsw-4200u fi-skl-guc fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6074 -> IGTPW_5762

  CI-20190529: 20190529
  CI_DRM_10005: 7a27cb7ac19a95d801c391044cea5274677e7744 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5762: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html
  IGT_6074: 3f43ae9fd22dc5a517786b984dc3aa717997664f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html

--===============6218836541442724129==
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
<tr><td><b>Series:</b></td><td>Test tiled display with aid of chamelium. (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/71393/">https://patchwork.freedesktop.org/series/71393/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10005 -&gt; IGTPW_5762</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5762 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5762, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5762:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bdw-5557u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-7567u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-guc/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-hsw-gt1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bdw-gvtdvm/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-hsw-4770/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cfl-8700k/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-icl-u2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-skl-6600u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cml-u2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-jsl-1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-apl-guc/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-snb-2520m/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-tgl-dsi/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bxt-dsi/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cfl-guc/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cml-s/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-soraka/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-tgl-u2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-ehl-1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-ilk-650/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-kefka/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-snb-2600/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-tgl-y/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>{fi-rkl-11500t}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-rkl-11500t/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-x1275/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-nick/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-cfl-8109u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-ehl-2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-r/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium@vga-edid-read:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10005 and IGTPW_5762:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>Statuses : 1 abort(s) 29 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5762 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bdw-gvtdvm/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):</p>
<ul>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bwr-2160/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-kbl-7500u/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">{ABORT}</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-pnv-d510/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-skl-6700k2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-elk-e7500/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 36)</h2>
<p>Additional (1): fi-rkl-11500t <br />
  Missing    (8): fi-ilk-m540 fi-bsw-n3050 fi-hsw-4200u fi-skl-guc fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6074 -&gt; IGTPW_5762</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10005: 7a27cb7ac19a95d801c391044cea5274677e7744 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5762: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5762/index.html<br />
  IGT_6074: 3f43ae9fd22dc5a517786b984dc3aa717997664f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium</p>

</body>
</html>

--===============6218836541442724129==--

--===============1356299176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1356299176==--
