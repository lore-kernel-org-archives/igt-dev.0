Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 10 Mar 2021 13:12:39 -0000
Message-ID: <161538195978.2308.4419268837837000567@emeril.freedesktop.org>
References: <20210310203640.6149-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210310203640.6149-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbusy=3A_Limit_the_execution_to_two_pipes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1223891768=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1223891768==
Content-Type: multipart/alternative;
 boundary="===============7320272457434788184=="

--===============7320272457434788184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_busy: Limit the execution to two pipes
URL   : https://patchwork.freedesktop.org/series/87829/
State : success

== Summary ==

CI Bug Log - changes from IGT_6028 -> IGTPW_5589
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html

New tests
---------

  New tests have been introduced between IGT_6028 and IGTPW_5589:

### New IGT tests (4) ###

  * igt@kms_busy@basic@flip-pipe-a:
    - Statuses : 1 dmesg-warn(s) 29 pass(s)
    - Exec time: [0.43, 2.51] s

  * igt@kms_busy@basic@flip-pipe-b:
    - Statuses : 1 dmesg-warn(s) 21 pass(s)
    - Exec time: [0.23, 1.91] s

  * igt@kms_busy@basic@modeset-pipe-a:
    - Statuses : 1 dmesg-warn(s) 26 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.43] s

  * igt@kms_busy@basic@modeset-pipe-b:
    - Statuses : 1 dmesg-warn(s) 18 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_5589 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2] ([i915#155])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [PASS][3] -> [TIMEOUT][4] ([i915#2502] / [i915#3145]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  * igt@i915_selftest@live@client:
    - fi-glk-dsi:         [PASS][5] -> [DMESG-FAIL][6] ([i915#3047])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-glk-dsi/igt@i915_selftest@live@client.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-glk-dsi/igt@i915_selftest@live@client.html

  * {igt@kms_busy@basic@flip-pipe-a} (NEW):
    - fi-glk-dsi:         NOTRUN -> [DMESG-WARN][7] ([i915#3143]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-glk-dsi/igt@kms_busy@basic@flip-pipe-a.html

  * {igt@kms_busy@basic@modeset-pipe-a} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-bwr-2160/igt@kms_busy@basic@modeset-pipe-a.html

  * {igt@kms_busy@basic@modeset-pipe-b} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-elk-e7500/igt@kms_busy@basic@modeset-pipe-b.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-pnv-d510/igt@kms_busy@basic@modeset-pipe-b.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       [PASS][11] -> [DMESG-WARN][12] ([i915#2868])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][13] ([i915#1602] / [i915#2029] / [i915#2369])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][14] ([i915#3145]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#3004]: https://gitlab.freedesktop.org/drm/intel/issues/3004
  [i915#3047]: https://gitlab.freedesktop.org/drm/intel/issues/3047
  [i915#3143]: https://gitlab.freedesktop.org/drm/intel/issues/3143
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (47 -> 40)
------------------------------

  Missing    (7): fi-ilk-m540 fi-ehl-1 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6028 -> IGTPW_5589

  CI-20190529: 20190529
  CI_DRM_9844: 3108bcbbbf191b3b5e624f21348c306010725a02 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html
  IGT_6028: f3109d1e3b554903df9109e1e4d10c881b3f811b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_busy@extended-modeset-hang-newfb
+igt@kms_busy@extended-modeset-hang-newfb-with-reset
+igt@kms_busy@extended-modeset-hang-oldfb
+igt@kms_busy@extended-modeset-hang-oldfb-with-reset
+igt@kms_busy@extended-pageflip-hang-newfb
+igt@kms_busy@extended-pageflip-hang-oldfb
+igt@kms_busy@extended-pageflip-modeset-hang-oldfb
-igt@kms_busy@basic-flip-pipe-a
-igt@kms_busy@basic-flip-pipe-b
-igt@kms_busy@basic-flip-pipe-c
-igt@kms_busy@basic-flip-pipe-d
-igt@kms_busy@basic-flip-pipe-e
-igt@kms_busy@basic-flip-pipe-f
-igt@kms_busy@basic-modeset-pipe-a
-igt@kms_busy@basic-modeset-pipe-b
-igt@kms_busy@basic-modeset-pipe-c
-igt@kms_busy@basic-modeset-pipe-d
-igt@kms_busy@basic-modeset-pipe-e
-igt@kms_busy@basic-modeset-pipe-f
-igt@kms_busy@extended-modeset-hang-newfb-pipe-a
-igt@kms_busy@extended-modeset-hang-newfb-pipe-b
-igt@kms_busy@extended-modeset-hang-newfb-pipe-c
-igt@kms_busy@extended-modeset-hang-newfb-pipe-d
-igt@kms_busy@extended-modeset-hang-newfb-pipe-e
-igt@kms_busy@extended-modeset-hang-newfb-pipe-f
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-a
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-b
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-c
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-d
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-e
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-f
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-a
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-b
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-c
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-d
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-e
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-f
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-a
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-b
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-c
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-d
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-e
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-f
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-a
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-b
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-c
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-d
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-e
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-f
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-a
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-b
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-c
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-d
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-e
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-f
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-a
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-b
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-c
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-d
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-e
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html

--===============7320272457434788184==
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
<tr><td><b>Series:</b></td><td>tests/kms_busy: Limit the execution to two pipes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87829/">https://patchwork.freedesktop.org/series/87829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6028 -&gt; IGTPW_5589</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6028 and IGTPW_5589:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_busy@basic@flip-pipe-a:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 29 pass(s)</li>
<li>Exec time: [0.43, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip-pipe-b:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 21 pass(s)</li>
<li>Exec time: [0.23, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset-pipe-a:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 26 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset-pipe-b:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 18 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.43] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5589 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-glk-dsi/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-glk-dsi/igt@i915_selftest@live@client.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3047">i915#3047</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_busy@basic@flip-pipe-a} (NEW):</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-glk-dsi/igt@kms_busy@basic@flip-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_busy@basic@modeset-pipe-a} (NEW):</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-bwr-2160/igt@kms_busy@basic@modeset-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_busy@basic@modeset-pipe-b} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-elk-e7500/igt@kms_busy@basic@modeset-pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-pnv-d510/igt@kms_busy@basic@modeset-pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_tiled_fence_blits@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 40)</h2>
<p>Missing    (7): fi-ilk-m540 fi-ehl-1 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6028 -&gt; IGTPW_5589</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9844: 3108bcbbbf191b3b5e624f21348c306010725a02 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html<br />
  IGT_6028: f3109d1e3b554903df9109e1e4d10c881b3f811b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_busy@extended-modeset-hang-newfb<br />
+igt@kms_busy@extended-modeset-hang-newfb-with-reset<br />
+igt@kms_busy@extended-modeset-hang-oldfb<br />
+igt@kms_busy@extended-modeset-hang-oldfb-with-reset<br />
+igt@kms_busy@extended-pageflip-hang-newfb<br />
+igt@kms_busy@extended-pageflip-hang-oldfb<br />
+igt@kms_busy@extended-pageflip-modeset-hang-oldfb<br />
-igt@kms_busy@basic-flip-pipe-a<br />
-igt@kms_busy@basic-flip-pipe-b<br />
-igt@kms_busy@basic-flip-pipe-c<br />
-igt@kms_busy@basic-flip-pipe-d<br />
-igt@kms_busy@basic-flip-pipe-e<br />
-igt@kms_busy@basic-flip-pipe-f<br />
-igt@kms_busy@basic-modeset-pipe-a<br />
-igt@kms_busy@basic-modeset-pipe-b<br />
-igt@kms_busy@basic-modeset-pipe-c<br />
-igt@kms_busy@basic-modeset-pipe-d<br />
-igt@kms_busy@basic-modeset-pipe-e<br />
-igt@kms_busy@basic-modeset-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-f<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-f<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-f<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-f</p>

</body>
</html>

--===============7320272457434788184==--

--===============1223891768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1223891768==--
