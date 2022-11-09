Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5860119288842547210=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 09 Nov 2022 01:00:08 -0000
Message-ID: <166795560801.3405.4754708377172654846@emeril.freedesktop.org>
References: <20221108235724.126287-1-mcanal@igalia.com>
In-Reply-To: <20221108235724.126287-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVjNEIElH?=
 =?utf-8?q?T_Tests_Updates?=
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

--===============5860119288842547210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: V3D IGT Tests Updates
URL   : https://patchwork.freedesktop.org/series/110681/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12356 -> IGTPW_8073
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html

Participating hosts (42 -> 39)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (4): fi-ctg-p8600 fi-ilk-m540 fi-bdw-samus bat-adlp-6 

Known issues
------------

  Here are the changes found in IGTPW_8073 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-bsw-nick/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][2] ([fdo#109271] / [fdo#111827])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - fi-bsw-nick:        NOTRUN -> [SKIP][3] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rpls-2}:       [DMESG-WARN][4] ([i915#6434]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [DMESG-WARN][6] ([i915#6687]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][8] ([i915#5334]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][10] ([i915#4785]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@hugepages:
    - fi-bsw-nick:        [DMESG-FAIL][12] ([i915#6217]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/fi-bsw-nick/igt@i915_selftest@live@hugepages.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-bsw-nick/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [DMESG-FAIL][14] ([i915#6997]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/bat-adln-1/igt@i915_selftest@live@slpc.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/bat-adln-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6217]: https://gitlab.freedesktop.org/drm/intel/issues/6217
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7125]: https://gitlab.freedesktop.org/drm/intel/issues/7125
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7048 -> IGTPW_8073

  CI-20190529: 20190529
  CI_DRM_12356: 1278975de8debde9eb1f5d86fd2fbe533361e456 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8073: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html
  IGT_7048: 5edd5c539f1fdf1c02157bf43fa1fd22d4ad2c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@v3d_create_bo@create-bo-0
+igt@v3d_create_bo@create-bo-4096
+igt@v3d_create_bo@create-bo-zeroed
+igt@v3d_perfmon@create-perfmon-0
+igt@v3d_perfmon@create-perfmon-exceed
+igt@v3d_perfmon@create-perfmon-invalid-counters
+igt@v3d_perfmon@create-single-perfmon
+igt@v3d_perfmon@create-two-perfmon
+igt@v3d_perfmon@destroy-invalid-perfmon
+igt@v3d_perfmon@destroy-valid-perfmon
+igt@v3d_perfmon@get-values-invalid-pad
+igt@v3d_perfmon@get-values-invalid-perfmon
+igt@v3d_perfmon@get-values-invalid-pointer
+igt@v3d_perfmon@get-values-valid-perfmon

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html

--===============5860119288842547210==
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
<tr><td><b>Series:</b></td><td>V3D IGT Tests Updates</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110681/">https://patchwork.freedesktop.org/series/110681/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12356 -&gt; IGTPW_8073</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (4): fi-ctg-p8600 fi-ilk-m540 fi-bdw-samus bat-adlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8073 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-bsw-nick/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6434">i915#6434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/fi-bsw-nick/igt@i915_selftest@live@hugepages.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6217">i915#6217</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/fi-bsw-nick/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7048 -&gt; IGTPW_8073</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12356: 1278975de8debde9eb1f5d86fd2fbe533361e456 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8073: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8073/index.html<br />
  IGT_7048: 5edd5c539f1fdf1c02157bf43fa1fd22d4ad2c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@v3d_create_bo@create-bo-0<br />
+igt@v3d_create_bo@create-bo-4096<br />
+igt@v3d_create_bo@create-bo-zeroed<br />
+igt@v3d_perfmon@create-perfmon-0<br />
+igt@v3d_perfmon@create-perfmon-exceed<br />
+igt@v3d_perfmon@create-perfmon-invalid-counters<br />
+igt@v3d_perfmon@create-single-perfmon<br />
+igt@v3d_perfmon@create-two-perfmon<br />
+igt@v3d_perfmon@destroy-invalid-perfmon<br />
+igt@v3d_perfmon@destroy-valid-perfmon<br />
+igt@v3d_perfmon@get-values-invalid-pad<br />
+igt@v3d_perfmon@get-values-invalid-perfmon<br />
+igt@v3d_perfmon@get-values-invalid-pointer<br />
+igt@v3d_perfmon@get-values-valid-perfmon</p>

</body>
</html>

--===============5860119288842547210==--
