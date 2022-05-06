Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3868813222571465969=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Fri, 06 May 2022 07:06:56 -0000
Message-ID: <165182081637.18816.13642665689485323789@emeril.freedesktop.org>
References: <20220506054100.27458-1-karthik.b.s@intel.com>
In-Reply-To: <20220506054100.27458-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Flowres=3A_Convert_test_to_dynamic?=
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

--===============3868813222571465969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_lowres: Convert test to dynamic
URL   : https://patchwork.freedesktop.org/series/103660/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11614 -> IGTPW_7049
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-rpls-1 fi-bsw-cyan fi-hsw-4770 

Known issues
------------

  Here are the changes found in IGTPW_7049 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@coherency:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2] ([i915#5674] / [i915#5685])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bdw-5557u/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@vma:
    - fi-bdw-5557u:       [PASS][3] -> [INCOMPLETE][4] ([i915#5681])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@vma.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bdw-5557u/igt@i915_selftest@live@vma.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-4:         [PASS][7] -> [DMESG-WARN][8] ([i915#3576]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][9] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][10] ([i915#4391]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [DMESG-WARN][12] ([i915#3576]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][14] ([i915#2940] / [i915#5801]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][16] ([i915#3921]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][18] ([i915#3576]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#5674]: https://gitlab.freedesktop.org/drm/intel/issues/5674
  [i915#5681]: https://gitlab.freedesktop.org/drm/intel/issues/5681
  [i915#5685]: https://gitlab.freedesktop.org/drm/intel/issues/5685
  [i915#5801]: https://gitlab.freedesktop.org/drm/intel/issues/5801


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6467 -> IGTPW_7049

  CI-20190529: 20190529
  CI_DRM_11614: b34f19b38e76292c5ac846fb9a8d4d0c4036dd78 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7049: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_lowres@tiling-4
+igt@kms_plane_lowres@tiling-none
+igt@kms_plane_lowres@tiling-x
+igt@kms_plane_lowres@tiling-y
+igt@kms_plane_lowres@tiling-yf
-igt@kms_plane_lowres@pipe-a-tiling-4
-igt@kms_plane_lowres@pipe-a-tiling-none
-igt@kms_plane_lowres@pipe-a-tiling-x
-igt@kms_plane_lowres@pipe-a-tiling-y
-igt@kms_plane_lowres@pipe-a-tiling-yf
-igt@kms_plane_lowres@pipe-b-tiling-4
-igt@kms_plane_lowres@pipe-b-tiling-none
-igt@kms_plane_lowres@pipe-b-tiling-x
-igt@kms_plane_lowres@pipe-b-tiling-y
-igt@kms_plane_lowres@pipe-b-tiling-yf
-igt@kms_plane_lowres@pipe-c-tiling-4
-igt@kms_plane_lowres@pipe-c-tiling-none
-igt@kms_plane_lowres@pipe-c-tiling-x
-igt@kms_plane_lowres@pipe-c-tiling-y
-igt@kms_plane_lowres@pipe-c-tiling-yf
-igt@kms_plane_lowres@pipe-d-tiling-4
-igt@kms_plane_lowres@pipe-d-tiling-none
-igt@kms_plane_lowres@pipe-d-tiling-x
-igt@kms_plane_lowres@pipe-d-tiling-y
-igt@kms_plane_lowres@pipe-d-tiling-yf
-igt@kms_plane_lowres@pipe-e-tiling-4
-igt@kms_plane_lowres@pipe-e-tiling-none
-igt@kms_plane_lowres@pipe-e-tiling-x
-igt@kms_plane_lowres@pipe-e-tiling-y
-igt@kms_plane_lowres@pipe-e-tiling-yf
-igt@kms_plane_lowres@pipe-f-tiling-4
-igt@kms_plane_lowres@pipe-f-tiling-none
-igt@kms_plane_lowres@pipe-f-tiling-x
-igt@kms_plane_lowres@pipe-f-tiling-y
-igt@kms_plane_lowres@pipe-f-tiling-yf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html

--===============3868813222571465969==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_lowres: Convert test to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103660/">https://patchwork.freedesktop.org/series/103660/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11614 -&gt; IGTPW_7049</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-rpls-1 fi-bsw-cyan fi-hsw-4770 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7049 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bdw-5557u/igt@i915_selftest@live@coherency.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5674">i915#5674</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5685">i915#5685</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bdw-5557u/igt@i915_selftest@live@vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5681">i915#5681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5801">i915#5801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6467 -&gt; IGTPW_7049</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11614: b34f19b38e76292c5ac846fb9a8d4d0c4036dd78 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7049: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7049/index.html<br />
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_lowres@tiling-4<br />
+igt@kms_plane_lowres@tiling-none<br />
+igt@kms_plane_lowres@tiling-x<br />
+igt@kms_plane_lowres@tiling-y<br />
+igt@kms_plane_lowres@tiling-yf<br />
-igt@kms_plane_lowres@pipe-a-tiling-4<br />
-igt@kms_plane_lowres@pipe-a-tiling-none<br />
-igt@kms_plane_lowres@pipe-a-tiling-x<br />
-igt@kms_plane_lowres@pipe-a-tiling-y<br />
-igt@kms_plane_lowres@pipe-a-tiling-yf<br />
-igt@kms_plane_lowres@pipe-b-tiling-4<br />
-igt@kms_plane_lowres@pipe-b-tiling-none<br />
-igt@kms_plane_lowres@pipe-b-tiling-x<br />
-igt@kms_plane_lowres@pipe-b-tiling-y<br />
-igt@kms_plane_lowres@pipe-b-tiling-yf<br />
-igt@kms_plane_lowres@pipe-c-tiling-4<br />
-igt@kms_plane_lowres@pipe-c-tiling-none<br />
-igt@kms_plane_lowres@pipe-c-tiling-x<br />
-igt@kms_plane_lowres@pipe-c-tiling-y<br />
-igt@kms_plane_lowres@pipe-c-tiling-yf<br />
-igt@kms_plane_lowres@pipe-d-tiling-4<br />
-igt@kms_plane_lowres@pipe-d-tiling-none<br />
-igt@kms_plane_lowres@pipe-d-tiling-x<br />
-igt@kms_plane_lowres@pipe-d-tiling-y<br />
-igt@kms_plane_lowres@pipe-d-tiling-yf<br />
-igt@kms_plane_lowres@pipe-e-tiling-4<br />
-igt@kms_plane_lowres@pipe-e-tiling-none<br />
-igt@kms_plane_lowres@pipe-e-tiling-x<br />
-igt@kms_plane_lowres@pipe-e-tiling-y<br />
-igt@kms_plane_lowres@pipe-e-tiling-yf<br />
-igt@kms_plane_lowres@pipe-f-tiling-4<br />
-igt@kms_plane_lowres@pipe-f-tiling-none<br />
-igt@kms_plane_lowres@pipe-f-tiling-x<br />
-igt@kms_plane_lowres@pipe-f-tiling-y<br />
-igt@kms_plane_lowres@pipe-f-tiling-yf</p>

</body>
</html>

--===============3868813222571465969==--
