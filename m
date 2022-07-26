Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2165149096879524093=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <petri.latvala@intel.com>
Date: Tue, 26 Jul 2022 08:07:48 -0000
Message-ID: <165882286877.21571.8630389320003752191@emeril.freedesktop.org>
References: <20220726072802.708006-1-petri.latvala@intel.com>
In-Reply-To: <20220726072802.708006-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_Avoid_the_name_=22all=22?=
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

--===============2165149096879524093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: Avoid the name "all"
URL   : https://patchwork.freedesktop.org/series/106707/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11943 -> IGTPW_7561
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html

Participating hosts (33 -> 33)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (1): fi-bdw-samus 

New tests
---------

  New tests have been introduced between CI_DRM_11943 and IGTPW_7561:

### New IGT tests (9) ###

  * igt@dmabuf@all-tests:
    - Statuses :
    - Exec time: [None] s

  * igt@dmabuf@all-tests@dma_fence:
    - Statuses : 30 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@dmabuf@all-tests@dma_fence_chain:
    - Statuses : 30 pass(s)
    - Exec time: [5.19, 7.18] s

  * igt@dmabuf@all-tests@dma_fence_unwrap:
    - Statuses : 30 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@dmabuf@all-tests@dma_resv:
    - Statuses : 30 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@dmabuf@all-tests@sanitycheck:
    - Statuses : 30 pass(s)
    - Exec time: [0.02, 0.21] s

  * igt@gem_busy@busy@all-engines:
    - Statuses : 33 pass(s)
    - Exec time: [0.01, 0.29] s

  * igt@gem_wait@busy@all-engines:
    - Statuses : 33 pass(s)
    - Exec time: [0.51, 0.60] s

  * igt@gem_wait@wait@all-engines:
    - Statuses : 33 pass(s)
    - Exec time: [1.01, 1.09] s

  

Known issues
------------

  Here are the changes found in IGTPW_7561 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-snb-2520m:       NOTRUN -> [SKIP][2] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4] ([i915#6298])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-snb-2520m:       NOTRUN -> [SKIP][5] ([fdo#109271]) +21 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@coherency:
    - {bat-dg2-9}:        [DMESG-WARN][6] ([i915#5763]) -> [PASS][7] +9 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/bat-dg2-9/igt@i915_selftest@live@coherency.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/bat-dg2-9/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-ehl-2}:         [INCOMPLETE][8] ([i915#5153] / [i915#6106]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-ehl-2/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-ehl-2/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6598 -> IGTPW_7561

  CI-20190529: 20190529
  CI_DRM_11943: fedf33eeec77c1a0dfb243eacdbce82ca0ffa704 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7561: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html
  IGT_6598: 97e103419021d0863db527e3f2cf39ccdd132db5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@dmabuf@all-tests
+igt@drm_buddy@all-tests
+igt@drm_mm@all-tests
+igt@gem_exec_gttfill@all-engines
+igt@gem_sync@wait-all
+igt@kms_selftest@all-tests
-igt@dmabuf@all
-igt@drm_buddy@all
-igt@drm_mm@all
-igt@gem_exec_gttfill@all
-igt@gem_sync@all
-igt@kms_selftest@all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html

--===============2165149096879524093==
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
<tr><td><b>Series:</b></td><td>tests: Avoid the name &quot;all&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106707/">https://patchwork.freedesktop.org/series/106707/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11943 -&gt; IGTPW_7561</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html</p>
<h2>Participating hosts (33 -&gt; 33)</h2>
<p>Additional (1): fi-snb-2520m <br />
  Missing    (1): fi-bdw-samus </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11943 and IGTPW_7561:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>Statuses : 30 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>Statuses : 30 pass(s)</li>
<li>Exec time: [5.19, 7.18] s</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_unwrap:</p>
<ul>
<li>Statuses : 30 pass(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_resv:</p>
<ul>
<li>Statuses : 30 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>Statuses : 30 pass(s)</li>
<li>Exec time: [0.02, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.01, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all-engines:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.51, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all-engines:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [1.01, 1.09] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7561 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/bat-dg2-9/igt@i915_selftest@live@coherency.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/bat-dg2-9/igt@i915_selftest@live@coherency.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-ehl-2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5153">i915#5153</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6106">i915#6106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/fi-ehl-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6598 -&gt; IGTPW_7561</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11943: fedf33eeec77c1a0dfb243eacdbce82ca0ffa704 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7561: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7561/index.html<br />
  IGT_6598: 97e103419021d0863db527e3f2cf39ccdd132db5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@dmabuf@all-tests<br />
+igt@drm_buddy@all-tests<br />
+igt@drm_mm@all-tests<br />
+igt@gem_exec_gttfill@all-engines<br />
+igt@gem_sync@wait-all<br />
+igt@kms_selftest@all-tests<br />
-igt@dmabuf@all<br />
-igt@drm_buddy@all<br />
-igt@drm_mm@all<br />
-igt@gem_exec_gttfill@all<br />
-igt@gem_sync@all<br />
-igt@kms_selftest@all</p>

</body>
</html>

--===============2165149096879524093==--
