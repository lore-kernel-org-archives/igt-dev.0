Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5017850685801818287=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Thu, 29 Dec 2022 21:16:57 -0000
Message-ID: <167234861717.3304.12639477678718279233@emeril.freedesktop.org>
References: <20221229192714.40806-1-markyacoub@chromium.org>
In-Reply-To: <20221229192714.40806-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdGlu?=
 =?utf-8?q?g_headers_in_CI_=28rev2=29?=
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

--===============5017850685801818287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: testing headers in CI (rev2)
URL   : https://patchwork.freedesktop.org/series/112294/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12529 -> IGTPW_8283
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): fi-rkl-11600 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8283:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][1] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][5] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html
    - bat-dg1-6:          NOTRUN -> [SKIP][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - {bat-adln-1}:       NOTRUN -> [SKIP][7] +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - {bat-adlp-9}:       NOTRUN -> [SKIP][8] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][9] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - {bat-dg1-7}:        NOTRUN -> [SKIP][10] +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][11] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [SKIP][12] +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
    - fi-icl-u2:          NOTRUN -> [SKIP][13] +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-icl-u2/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-atsm-1}:       NOTRUN -> [SKIP][14] +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-jsl-3}:        NOTRUN -> [SKIP][15] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][16] +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][17] +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - bat-adlp-4:         NOTRUN -> [SKIP][18] +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][19] +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][20] +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12529 and IGTPW_8283:

### New IGT tests (9) ###

  * igt@kms_chamelium_edid@dp-edid-read:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - Statuses : 1 pass(s) 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@vga-edid-read:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@dp-crc-fast:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - Statuses : 1 pass(s) 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - Statuses : 1 pass(s) 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - Statuses : 1 pass(s) 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8283 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][21] ([fdo#109271]) +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][22] ([fdo#109271]) +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bwr-2160/igt@kms_chamelium_edid@dp-edid-read.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][23] ([fdo#109271]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-pnv-d510/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][24] ([fdo#109271]) +8 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][25] ([fdo#109271]) +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][26] ([fdo#109271]) +8 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][27] ([fdo#109271]) +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][28] ([fdo#109271]) +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][29] ([fdo#109271]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][30] ([fdo#109271]) +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][31] ([fdo#109271]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [SKIP][32] ([fdo#109271]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][33] ([fdo#109271]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][34] ([fdo#109271]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][35] ([fdo#109271]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][37] ([fdo#109271]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-skl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][39] ([fdo#109271]) +8 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-hsw-4770/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][40] ([fdo#109271]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][41] ([fdo#109271]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][42] ([fdo#109271]) +8 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-nick/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][43] -> [FAIL][44] ([i915#6298])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - {bat-adln-1}:       [DMESG-WARN][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/bat-adln-1/igt@i915_pm_rpm@basic-rte.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adln-1/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@migrate:
    - {bat-adlp-9}:       [DMESG-FAIL][47] ([i915#7699]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/bat-adlp-9/igt@i915_selftest@live@migrate.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-9/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][49] ([i915#6367]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7104 -> IGTPW_8283

  CI-20190529: 20190529
  CI_DRM_12529: 0ca1a1772701d5c3350d8736080e528e2f2f413e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8283: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html
  IGT_7104: fe5def13049225967770eaaf19ec01ef80e2adc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html

--===============5017850685801818287==
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
<tr><td><b>Series:</b></td><td>testing headers in CI (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112294/">https://patchwork.freedesktop.org/series/112294/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12529 -&gt; IGTPW_8283</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): fi-rkl-11600 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8283:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>{bat-adlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-icl-u2/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12529 and IGTPW_8283:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>Statuses : 1 pass(s) 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8283 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bwr-2160/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-pnv-d510/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@dp-crc-fast} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-hsw-4770/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-nick/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/bat-adln-1/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adln-1/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-adlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/bat-adlp-9/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-adlp-9/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12529/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7104 -&gt; IGTPW_8283</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12529: 0ca1a1772701d5c3350d8736080e528e2f2f413e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8283: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8283/index.html<br />
  IGT_7104: fe5def13049225967770eaaf19ec01ef80e2adc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5017850685801818287==--
