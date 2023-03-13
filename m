Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4642702972896175964=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <adrinael@adrinael.net>
Date: Mon, 13 Mar 2023 10:22:14 -0000
Message-ID: <167870293421.1033.7040303934501586048@emeril.freedesktop.org>
References: <20230313094051.2395229-1-adrinael@adrinael.net>
In-Reply-To: <20230313094051.2395229-1-adrinael@adrinael.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZ2l0bGFi?=
 =?utf-8?q?-ci=3A_Remove_senseless_runner_restriction?=
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

--===============4642702972896175964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gitlab-ci: Remove senseless runner restriction
URL   : https://patchwork.freedesktop.org/series/115047/
State : success

== Summary ==

CI Bug Log - changes from IGT_7191 -> IGTPW_8594
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html

Participating hosts (36 -> 36)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_8594 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] ([i915#7911])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#7911] / [i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [PASS][5] -> [ABORT][6] ([i915#4983])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/bat-rpls-1/igt@i915_selftest@live@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][7] ([i915#3546]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
    - bat-dg2-11:         [PASS][8] -> [INCOMPLETE][9] ([i915#7908])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][10] ([i915#5334] / [i915#7872]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [ABORT][12] ([i915#4983] / [i915#7913]) -> [ABORT][13] ([i915#7913])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/bat-rpls-2/igt@i915_selftest@live@reset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7908]: https://gitlab.freedesktop.org/drm/intel/issues/7908
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7191 -> IGTPW_8594

  CI-20190529: 20190529
  CI_DRM_12842: a8c602a36e7019429967251dd72737795ee130aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html
  IGT_7191: a6766ee8a971366299671b06af8febc8192c0f74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html

--===============4642702972896175964==
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
<tr><td><b>Series:</b></td><td>gitlab-ci: Remove senseless runner restriction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115047/">https://patchwork.freedesktop.org/series/115047/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7191 -&gt; IGTPW_8594</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html</p>
<h2>Participating hosts (36 -&gt; 36)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8594 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7908">i915#7908</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7191 -&gt; IGTPW_8594</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12842: a8c602a36e7019429967251dd72737795ee130aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html<br />
  IGT_7191: a6766ee8a971366299671b06af8febc8192c0f74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4642702972896175964==--
