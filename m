Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5317410838021609941=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 17 Jun 2022 17:56:51 -0000
Message-ID: <165548861171.20133.3419611886535269533@emeril.freedesktop.org>
References: <20220610090910.4089211-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610090910.4089211-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_IGT_test_cleanup_=28rev5=29?=
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

--===============5317410838021609941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_legacy: IGT test cleanup (rev5)
URL   : https://patchwork.freedesktop.org/series/104973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11776 -> IGTPW_7338
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html

Participating hosts (35 -> 33)
------------------------------

  Missing    (2): fi-bdw-samus fi-skl-6600u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7338:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - {fi-ehl-2}:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11776 and IGTPW_7338:

### New IGT tests (7) ###

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 8 pass(s) 3 skip(s)
    - Exec time: [0.00, 2.25] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 8 pass(s) 3 skip(s)
    - Exec time: [0.00, 2.31] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 8 pass(s) 3 skip(s)
    - Exec time: [0.00, 2.30] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 11 pass(s)
    - Exec time: [0.93, 1.44] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 11 pass(s)
    - Exec time: [0.95, 2.31] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 11 pass(s)
    - Exec time: [0.95, 2.27] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7338 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][2] ([i915#4528])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-blb-e6850/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][3] -> [DMESG-FAIL][4] ([i915#4528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][5] -> [INCOMPLETE][6] ([i915#5982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][7] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][8] ([fdo#109271]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-8809g/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][9] ([fdo#109271]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bsw-nick/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#4103])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][11] ([i915#4103])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][15] ([i915#4103])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][18] ([i915#4103])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-skl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][22] ([fdo#109271]) +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor:
    - fi-kbl-guc:         NOTRUN -> [SKIP][23] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor@atomic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][24] ([fdo#109271]) +8 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic.html

  * {igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][25] ([fdo#109271]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][26] ([fdo#109271]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-before-cursor.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:
    - fi-elk-e7500:       NOTRUN -> [SKIP][27] ([fdo#109271]) +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-bsw-n3050:       [PASS][28] -> [FAIL][29] ([i915#2122])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][30] ([fdo#109271] / [i915#2403] / [i915#4312])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][31] ([i915#4528]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-blb-e6850/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][33] ([i915#3303] / [i915#4785]) -> [INCOMPLETE][34] ([i915#4785])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6536 -> IGTPW_7338

  CI-20190529: 20190529
  CI_DRM_11776: ac17a5249380aaabe5d1eaebd9b3a2eedc08ccdc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html
  IGT_6536: e3de4d32b7a509635fbff4d5131c05a7767699f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 18 lines
--- 96 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html

--===============5317410838021609941==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: IGT test cleanup (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104973/">https://patchwork.freedesktop.org/series/104973/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11776 -&gt; IGTPW_7338</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html</p>
<h2>Participating hosts (35 -&gt; 33)</h2>
<p>Missing    (2): fi-bdw-samus fi-skl-6600u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7338:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:<ul>
<li>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11776 and IGTPW_7338:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 8 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 8 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 8 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.93, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.95, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.95, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7338 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-blb-e6850/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-8809g/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bsw-nick/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor@atomic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11776/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6536 -&gt; IGTPW_7338</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11776: ac17a5249380aaabe5d1eaebd9b3a2eedc08ccdc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7338/index.html<br />
  IGT_6536: e3de4d32b7a509635fbff4d5131c05a7767699f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 18 lines<br />
--- 96 lines</p>

</body>
</html>

--===============5317410838021609941==--
