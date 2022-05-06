Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0171712184253032129=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Fri, 06 May 2022 05:45:29 -0000
Message-ID: <165181592932.18816.1228091877607372907@emeril.freedesktop.org>
References: <20220506041533.23131-1-karthik.b.s@intel.com>
In-Reply-To: <20220506041533.23131-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Update_logic_to_calculate_test_duration?=
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

--===============0171712184253032129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Update logic to calculate test duration
URL   : https://patchwork.freedesktop.org/series/103655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11614 -> IGTPW_7047
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7047 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7047, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-adlm-1 
  Missing    (2): fi-bsw-cyan fi-icl-u2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7047:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@gt_mocs:
    - {bat-adlm-1}:       NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-adlm-1/igt@i915_selftest@live@gt_mocs.html

  
Known issues
------------

  Here are the changes found in IGTPW_7047 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@perf:
    - fi-tgl-1115g4:      [PASS][4] -> [DMESG-WARN][5] ([i915#2867]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-tgl-1115g4/igt@i915_selftest@live@perf.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-tgl-1115g4/igt@i915_selftest@live@perf.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - bat-adlp-4:         [PASS][7] -> [DMESG-WARN][8] ([i915#3576]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][9] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][10] ([i915#4391]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [DMESG-WARN][12] ([i915#3576]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][14] ([i915#2940] / [i915#5801]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5329]: https://gitlab.freedesktop.org/drm/intel/issues/5329
  [i915#5401]: https://gitlab.freedesktop.org/drm/intel/issues/5401
  [i915#5509]: https://gitlab.freedesktop.org/drm/intel/issues/5509
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5801]: https://gitlab.freedesktop.org/drm/intel/issues/5801


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6467 -> IGTPW_7047

  CI-20190529: 20190529
  CI_DRM_11614: b34f19b38e76292c5ac846fb9a8d4d0c4036dd78 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7047: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html

--===============0171712184253032129==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Update logic to calculate test duration</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103655/">https://patchwork.freedesktop.org/series/103655/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11614 -&gt; IGTPW_7047</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7047 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7047, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-adlm-1 <br />
  Missing    (2): fi-bsw-cyan fi-icl-u2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7047:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@gt_mocs:<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-adlm-1/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7047 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-tgl-1115g4/igt@i915_selftest@live@perf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-tgl-1115g4/igt@i915_selftest@live@perf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5801">i915#5801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6467 -&gt; IGTPW_7047</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11614: b34f19b38e76292c5ac846fb9a8d4d0c4036dd78 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7047: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7047/index.html<br />
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0171712184253032129==--
