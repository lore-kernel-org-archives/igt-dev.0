Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4023948781602756402=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Tue, 11 Apr 2023 12:27:35 -0000
Message-ID: <168121605579.13173.2270255937774303048@emeril.freedesktop.org>
References: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_Improve_CTM_tests?=
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

--===============4023948781602756402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Improve CTM tests
URL   : https://patchwork.freedesktop.org/series/116300/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12987 -> IGTPW_8776
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html

Participating hosts (35 -> 34)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8776:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@ctm-signed} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg1-7/igt@kms_color@ctm-signed.html
    - bat-rpls-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@kms_color@ctm-signed.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12987 and IGTPW_8776:

### New IGT tests (24) ###

  * igt@kms_color@ctm-signed:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-a-dp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-a-vga-1:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-b-vga-1:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-c-dp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-c-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-d-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8776 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color@ctm-0-50:
    - bat-dg1-7:          NOTRUN -> [SKIP][3] ([i915#3546]) +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg1-7/igt@kms_color@ctm-0-50.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#3546]) +7 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-nick/igt@kms_color@ctm-0-50.html

  * igt@kms_color@ctm-0-75:
    - bat-rpls-2:         NOTRUN -> [SKIP][5] ([i915#1849] / [i915#3546]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:
    - fi-elk-e7500:       NOTRUN -> [SKIP][6] ([fdo#109271]) +19 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-elk-e7500/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_color@ctm-blue-to-red:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#3546]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-n3050/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@ctm-green-to-red:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#3546]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-x1275/igt@kms_color@ctm-green-to-red.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#3546]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-8809g/igt@kms_color@ctm-green-to-red.html

  * igt@kms_color@ctm-max:
    - fi-kbl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#3546]) +7 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-guc/igt@kms_color@ctm-max.html

  * igt@kms_color@ctm-max@pipe-a-vga-1:
    - fi-ilk-650:         NOTRUN -> [SKIP][11] ([fdo#109271]) +19 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-ilk-650/igt@kms_color@ctm-max@pipe-a-vga-1.html

  * igt@kms_color@ctm-negative:
    - bat-rpls-2:         NOTRUN -> [SKIP][12] ([i915#3546]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@kms_color@ctm-negative.html
    - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#3546] / [i915#5354]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg2-11/igt@kms_color@ctm-negative.html

  * {igt@kms_color@ctm-signed} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][14] ([i915#5354])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg2-11/igt@kms_color@ctm-signed.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-x1275/igt@kms_color@ctm-signed.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-8809g/igt@kms_color@ctm-signed.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-nick/igt@kms_color@ctm-signed.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-guc/igt@kms_color@ctm-signed.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-n3050/igt@kms_color@ctm-signed.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-kbl-2/igt@kms_color@ctm-signed.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][21] -> [FAIL][22] ([i915#7932]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12987/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
#### Warnings ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [DMESG-FAIL][23] ([i915#6997] / [i915#7913]) -> [DMESG-FAIL][24] ([i915#6367] / [i915#7913])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12987/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7249 -> IGTPW_8776

  CI-20190529: 20190529
  CI_DRM_12987: 603a179375a194085e1462cf1c24f2a0006dd72b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8776: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html
  IGT_7249: 44cc06fb6a20c8907f696ca61ba87e152b3dcd11 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_color@ctm-signed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html

--===============4023948781602756402==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Improve CTM tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116300/">https://patchwork.freedesktop.org/series/116300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12987 -&gt; IGTPW_8776</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8776:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@ctm-signed} (NEW):</p>
<ul>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg1-7/igt@kms_color@ctm-signed.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@kms_color@ctm-signed.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12987 and IGTPW_8776:</p>
<h3>New IGT tests (24)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8776 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg1-7/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-nick/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-elk-e7500/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-n3050/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-x1275/igt@kms_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-8809g/igt@kms_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-guc/igt@kms_color@ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-vga-1:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-ilk-650/igt@kms_color@ctm-max@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg2-11/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-signed} (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg2-11/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-x1275/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-8809g/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-nick/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-kbl-guc/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/fi-bsw-n3050/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-kbl-2/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12987/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12987/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7249 -&gt; IGTPW_8776</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12987: 603a179375a194085e1462cf1c24f2a0006dd72b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8776: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8776/index.html<br />
  IGT_7249: 44cc06fb6a20c8907f696ca61ba87e152b3dcd11 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_color@ctm-signed</p>

</body>
</html>

--===============4023948781602756402==--
