Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6988344898340956811=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 27 Jan 2023 16:53:19 -0000
Message-ID: <167483839951.18992.15043499057147366912@emeril.freedesktop.org>
References: <20230127160813.139460-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230127160813.139460-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpower=3A_Sanity_check_power_measurement?=
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

--===============6988344898340956811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_power: Sanity check power measurement
URL   : https://patchwork.freedesktop.org/series/113436/
State : success

== Summary ==

CI Bug Log - changes from IGT_7140 -> IGTPW_8412
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html

Participating hosts (26 -> 24)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8412:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_power@sanity} (NEW):
    - {bat-jsl-3}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-jsl-3/igt@i915_power@sanity.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-jsl-1/igt@i915_power@sanity.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-rpls-1/igt@i915_selftest@live@reset.html

  
New tests
---------

  New tests have been introduced between IGT_7140 and IGTPW_8412:

### New IGT tests (1) ###

  * igt@i915_power@sanity:
    - Statuses : 19 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8412 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@i915_power@sanity} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][4] ([fdo#109271])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-blb-e6850/igt@i915_power@sanity.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][5] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-bsw-n3050/igt@i915_power@sanity.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][6] ([fdo#109271])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-bsw-nick/igt@i915_power@sanity.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][7] -> [DMESG-FAIL][8] ([i915#5334])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
    - fi-glk-j4005:       [PASS][9] -> [DMESG-FAIL][10] ([i915#5334])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - {bat-adlp-9}:       [INCOMPLETE][11] ([i915#4983]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [ABORT][13] ([i915#4983]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/bat-rpls-1/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [ABORT][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/bat-rpls-2/igt@i915_selftest@live@reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7140 -> IGTPW_8412

  CI-20190529: 20190529
  CI_DRM_12655: d9b0bc4a0e9edfcbf171e09d3743b7186cd801f7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8412: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html
  IGT_7140: ec87a6a636b9337ac9c8fec57350812bcb48fc09 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_power@sanity

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html

--===============6988344898340956811==
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
<tr><td><b>Series:</b></td><td>i915/i915_power: Sanity check power measurement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113436/">https://patchwork.freedesktop.org/series/113436/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7140 -&gt; IGTPW_8412</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html</p>
<h2>Participating hosts (26 -&gt; 24)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8412:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_power@sanity} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-jsl-3/igt@i915_power@sanity.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-jsl-1/igt@i915_power@sanity.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7140 and IGTPW_8412:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_power@sanity:<ul>
<li>Statuses : 19 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8412 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@i915_power@sanity} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-blb-e6850/igt@i915_power@sanity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-bsw-n3050/igt@i915_power@sanity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-bsw-nick/igt@i915_power@sanity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>{bat-adlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7140/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7140 -&gt; IGTPW_8412</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12655: d9b0bc4a0e9edfcbf171e09d3743b7186cd801f7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8412: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8412/index.html<br />
  IGT_7140: ec87a6a636b9337ac9c8fec57350812bcb48fc09 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_power@sanity</p>

</body>
</html>

--===============6988344898340956811==--
