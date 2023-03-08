Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5881786542916551512=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 08 Mar 2023 08:30:02 -0000
Message-ID: <167826420281.20410.5894663101323051281@emeril.freedesktop.org>
References: <20230308075334.944622-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230308075334.944622-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW5pdGlh?=
 =?utf-8?q?l_Xe_test_suite_=28rev8=29?=
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

--===============5881786542916551512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial Xe test suite (rev8)
URL   : https://patchwork.freedesktop.org/series/112191/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12827 -> IGTPW_8574
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html

Participating hosts (35 -> 34)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8574 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#7911] / [i915#7913])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         NOTRUN -> [ABORT][3] ([i915#4983])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/bat-rpls-1/igt@i915_selftest@live@reset.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [DMESG-WARN][4] ([i915#8073]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [ABORT][6] ([i915#4983] / [i915#7694] / [i915#7911] / [i915#7981]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/bat-rpls-1/igt@i915_selftest@live@requests.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - bat-dg1-5:          [FAIL][8] ([fdo#103375]) -> [PASS][9] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#7694]: https://gitlab.freedesktop.org/drm/intel/issues/7694
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8073]: https://gitlab.freedesktop.org/drm/intel/issues/8073


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7183 -> IGTPW_8574

  CI-20190529: 20190529
  CI_DRM_12827: b794b8d84dc0470ee58467386f41870e81a86580 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8574: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html
  IGT_7183: 3434cef8be4e487644a740039ad15123cd094526 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html

--===============5881786542916551512==
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
<tr><td><b>Series:</b></td><td>Initial Xe test suite (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112191/">https://patchwork.freedesktop.org/series/112191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12827 -&gt; IGTPW_8574</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8574 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8073">i915#8073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7694">i915#7694</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12827/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7183 -&gt; IGTPW_8574</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12827: b794b8d84dc0470ee58467386f41870e81a86580 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8574: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8574/index.html<br />
  IGT_7183: 3434cef8be4e487644a740039ad15123cd094526 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5881786542916551512==--
