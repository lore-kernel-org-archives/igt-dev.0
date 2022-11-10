Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5600062263840502038=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Thu, 10 Nov 2022 18:24:39 -0000
Message-ID: <166810467922.16952.14025113851011576389@emeril.freedesktop.org>
References: <20221107171845.3663446-1-markyacoub@chromium.org>
In-Reply-To: <20221107171845.3663446-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Add_new_EDID_Resolution_List_test_=28rev2=29?=
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

--===============5600062263840502038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Chamelium: Add new EDID Resolution List test (rev2)
URL   : https://patchwork.freedesktop.org/series/110614/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12365 -> IGTPW_8084
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html

Participating hosts (41 -> 36)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (6): fi-rkl-11600 fi-ctg-p8600 fi-hsw-4770 fi-pnv-d510 fi-kbl-8809g fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_8084 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bdw-gvtdvm:      [PASS][1] -> [INCOMPLETE][2] ([i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4] ([i915#6298])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@runner@aborted:
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][5] ([i915#4312])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-bdw-gvtdvm/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][6] ([i915#2867]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-skl-guc:         [DMESG-FAIL][8] ([i915#5334]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/fi-skl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-skl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [DMESG-FAIL][10] ([i915#6997]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/bat-adln-1/igt@i915_selftest@live@slpc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/bat-adln-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6856]: https://gitlab.freedesktop.org/drm/intel/issues/6856
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7125]: https://gitlab.freedesktop.org/drm/intel/issues/7125
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7050 -> IGTPW_8084

  CI-20190529: 20190529
  CI_DRM_12365: 1bda5b0abc8a0d9d53d9fec1a390dc93e2b0ba57 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8084: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_chamelium@dp-edid-resolution-list
+igt@kms_chamelium@dp-edid-stress-resolution
-igt@kms_chamelium@dp-edid-stress-resolution-4k
-igt@kms_chamelium@dp-edid-stress-resolution-non-4k
-igt@kms_chamelium@hdmi-edid-stress-resolution-4k
-igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html

--===============5600062263840502038==
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
<tr><td><b>Series:</b></td><td>Chamelium: Add new EDID Resolution List test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110614/">https://patchwork.freedesktop.org/series/110614/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12365 -&gt; IGTPW_8084</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (6): fi-rkl-11600 fi-ctg-p8600 fi-hsw-4770 fi-pnv-d510 fi-kbl-8809g fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8084 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-bdw-gvtdvm/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/fi-skl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/fi-skl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7050 -&gt; IGTPW_8084</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12365: 1bda5b0abc8a0d9d53d9fec1a390dc93e2b0ba57 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8084: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html<br />
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_chamelium@dp-edid-resolution-list<br />
+igt@kms_chamelium@dp-edid-stress-resolution<br />
-igt@kms_chamelium@dp-edid-stress-resolution-4k<br />
-igt@kms_chamelium@dp-edid-stress-resolution-non-4k<br />
-igt@kms_chamelium@hdmi-edid-stress-resolution-4k<br />
-igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k</p>

</body>
</html>

--===============5600062263840502038==--
