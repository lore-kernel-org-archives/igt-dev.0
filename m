Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Nov 2020 12:25:19 -0000
Message-ID: <160630711929.8877.15310826567830928188@emeril.freedesktop.org>
References: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=3A_verify_non_zero_reason_field_in_OA_reports?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0541803408=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0541803408==
Content-Type: multipart/alternative;
 boundary="===============1089127071689655637=="

--===============1089127071689655637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/perf: verify non zero reason field in OA reports
URL   : https://patchwork.freedesktop.org/series/84258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9389 -> IGTPW_5226
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html

Known issues
------------

  Here are the changes found in IGTPW_5226 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982] / [k.org#205379])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-u2/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][5] -> [INCOMPLETE][6] ([i915#1037] / [i915#2276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-icl-y/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-icl-y/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][11] ([i915#1982]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - fi-tgl-y:           [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [DMESG-WARN][15] ([i915#402]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2276]: https://gitlab.freedesktop.org/drm/intel/issues/2276
  [i915#2417]: https://gitlab.freedesktop.org/drm/intel/issues/2417
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5870 -> IGTPW_5226

  CI-20190529: 20190529
  CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@non-zero-reason

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html

--===============1089127071689655637==
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
<tr><td><b>Series:</b></td><td>tests/i915/perf: verify non zero reason field in OA reports</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84258/">https://patchwork.freedesktop.org/series/84258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9389 -&gt; IGTPW_5226</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5226 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-u2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-icl-y/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2276">i915#2276</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5870 -&gt; IGTPW_5226</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html<br />
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@perf@non-zero-reason</p>

</body>
</html>

--===============1089127071689655637==--

--===============0541803408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0541803408==--
