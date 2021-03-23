Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Mar 2021 18:46:31 -0000
Message-ID: <161652519197.20052.3638761928540361300@emeril.freedesktop.org>
References: <20210318222124.970997-1-lyude@redhat.com>
In-Reply-To: <20210318222124.970997-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Test_32x32_cursors_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1377768552=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1377768552==
Content-Type: multipart/alternative;
 boundary="===============3675524238576621832=="

--===============3675524238576621832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test 32x32 cursors (rev2)
URL   : https://patchwork.freedesktop.org/series/88144/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9885 -> IGTPW_5647
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html

Known issues
------------

  Here are the changes found in IGTPW_5647 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][1] ([i915#2947])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-8809g/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@gem_tiled_blits@basic:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-tgl-y/igt@gem_tiled_blits@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-tgl-y/igt@gem_tiled_blits@basic.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][4] ([i915#2947])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-8809g/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#2411] / [i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][7] ([i915#402]) -> [PASS][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][9] ([i915#2502] / [i915#3145]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  * igt@i915_selftest@live@client:
    - fi-glk-dsi:         [DMESG-FAIL][11] ([i915#3047]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-glk-dsi/igt@i915_selftest@live@client.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-glk-dsi/igt@i915_selftest@live@client.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-FAIL][13] ([i915#165]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-glk-dsi:         [DMESG-WARN][15] ([i915#1982] / [i915#3143]) -> [DMESG-WARN][16] ([i915#3143])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2947]: https://gitlab.freedesktop.org/drm/intel/issues/2947
  [i915#3047]: https://gitlab.freedesktop.org/drm/intel/issues/3047
  [i915#3143]: https://gitlab.freedesktop.org/drm/intel/issues/3143
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (48 -> 42)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6042 -> IGTPW_5647

  CI-20190529: 20190529
  CI_DRM_9885: 370158d493f88d52f5aae76794228f47dd04cfe3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5647: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html
  IGT_6042: 529e182e30117d083ac0693011f1af04357d0115 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x10-random
+igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x32-random
+igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x10-random
+igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x32-random
+igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x10-random
+igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x32-random
+igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x10-random
+igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x32-random
+igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-e-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x10-random
+igt@kms_cursor_crc@pipe-e-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-e-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x32-random
+igt@kms_cursor_crc@pipe-e-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-f-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x10-random
+igt@kms_cursor_crc@pipe-f-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-f-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x32-random
+igt@kms_cursor_crc@pipe-f-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-32x32-sliding

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html

--===============3675524238576621832==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Test 32x32 cursors (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88144/">https://patchwork.freedesktop.org/series/88144/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9885 -&gt; IGTPW_5647</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5647 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-8809g/igt@amdgpu/amd_prime@amd-to-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2947">i915#2947</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-tgl-y/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-tgl-y/igt@gem_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2947">i915#2947</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-glk-dsi/igt@i915_selftest@live@client.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3047">i915#3047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-glk-dsi/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9885/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (48 -&gt; 42)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6042 -&gt; IGTPW_5647</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9885: 370158d493f88d52f5aae76794228f47dd04cfe3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5647: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5647/index.html<br />
  IGT_6042: 529e182e30117d083ac0693011f1af04357d0115 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-sliding</p>

</body>
</html>

--===============3675524238576621832==--

--===============1377768552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1377768552==--
