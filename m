Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3507460547281926277=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Date: Fri, 08 Sep 2023 19:18:22 -0000
Message-ID: <169420070241.14896.15682482918777177241@emeril.freedesktop.org>
References: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3hl?=
 =?utf-8?q?=5Fspin=3A_introduced_fixed_duration_xe=5Fspin_=28rev4=29?=
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

--===============3507460547281926277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_spin: introduced fixed duration xe_spin (rev4)
URL   : https://patchwork.freedesktop.org/series/122624/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7477 -> IGTPW_9758
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9758 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9758, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9758:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_9758 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][3] -> [DMESG-FAIL][4] ([i915#5334])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg2-11:         [PASS][5] -> [INCOMPLETE][6] ([i915#7609] / [i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html

  
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7477 -> IGTPW_9758

  CI-20190529: 20190529
  CI_DRM_13613: 25ec37710fd81562fd25eccebaac156d9334ff0c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9758: 9758
  IGT_7477: 7477


Testlist changes
----------------

+igt@xe_spin_batch@spin-fixed-duration

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html

--===============3507460547281926277==
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
<tr><td><b>Series:</b></td><td>lib/xe_spin: introduced fixed duration xe_spin (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122624/">https://patchwork.freedesktop.org/series/122624/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7477 -&gt; IGTPW_9758</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9758 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9758, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9758:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9758 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7477 -&gt; IGTPW_9758</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13613: 25ec37710fd81562fd25eccebaac156d9334ff0c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9758: 9758<br />
  IGT_7477: 7477</p>
<h2>Testlist changes</h2>
<p>+igt@xe_spin_batch@spin-fixed-duration</p>

</body>
</html>

--===============3507460547281926277==--
