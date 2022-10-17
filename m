Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3989342678683445485=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Mon, 17 Oct 2022 01:24:54 -0000
Message-ID: <166596989407.13570.14598587127815187319@emeril.freedesktop.org>
References: <20221017004936.574303-1-alex.hung@amd.com>
In-Reply-To: <20221017004936.574303-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2CV2=5D_tests/kms=5Funiversal=5Fplane=3A_?=
 =?utf-8?q?turn_off_pipe_when_primary_plane_is_off?=
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

--===============3989342678683445485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,V2] tests/kms_universal_plane: turn off pipe when primary plane is off
URL   : https://patchwork.freedesktop.org/series/109748/
State : success

== Summary ==

CI Bug Log - changes from IGT_7016 -> IGTPW_7967
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7967 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [PASS][1] -> [INCOMPLETE][2] ([i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bxt-dsi:         [PASS][3] -> [DMESG-FAIL][4] ([i915#5334])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-glk-j4005/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-icl-u2:          NOTRUN -> [SKIP][8] ([fdo#111827])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][9] -> [FAIL][10] ([i915#6298])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@runner@aborted:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][11] ([fdo#109271] / [i915#4312])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bsw-kefka/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - {bat-rplp-1}:       [DMESG-WARN][12] ([i915#7077]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@execlists:
    - fi-glk-j4005:       [INCOMPLETE][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-glk-j4005/igt@i915_selftest@live@execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-glk-j4005/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][16] ([i915#4785]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-icl-u2:          [INCOMPLETE][18] ([i915#4890]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-icl-u2/igt@i915_selftest@live@sanitycheck.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-icl-u2/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][20] ([i915#6367]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-bdw-5557u:       [INCOMPLETE][22] ([i915#146] / [i915#6712]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6596]: https://gitlab.freedesktop.org/drm/intel/issues/6596
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6712]: https://gitlab.freedesktop.org/drm/intel/issues/6712
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7016 -> IGTPW_7967

  CI-20190529: 20190529
  CI_DRM_12242: 075a81b1efd29300194bdf7877e08b6dbe3079d9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7967: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html

--===============3989342678683445485==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,V2] tests/kms_universal_plane: turn off pipe when primary plane is off</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109748/">https://patchwork.freedesktop.org/series/109748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7016 -&gt; IGTPW_7967</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7967 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-glk-j4005/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-glk-j4005/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-glk-j4005/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-icl-u2/igt@i915_selftest@live@sanitycheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-icl-u2/igt@i915_selftest@live@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7016/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6712">i915#6712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7016 -&gt; IGTPW_7967</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12242: 075a81b1efd29300194bdf7877e08b6dbe3079d9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7967: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7967/index.html<br />
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3989342678683445485==--
