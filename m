Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5568081173232184452=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Thu, 02 Nov 2023 07:52:07 -0000
Message-ID: <169891152778.28160.5450728363489653028@emeril.freedesktop.org>
References: <20231102062304.1204625-1-kunal1.joshi@intel.com>
In-Reply-To: <20231102062304.1204625-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYWRkIG5l?=
 =?utf-8?q?w_subtests_for_dark_screen_detection?=
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

--===============5568081173232184452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add new subtests for dark screen detection
URL   : https://patchwork.freedesktop.org/series/125880/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13827 -> IGTPW_10099
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10099 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][3] ([i915#3546]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271]) +29 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7568 -> IGTPW_10099

  CI-20190529: 20190529
  CI_DRM_13827: 6b6ae2eb530c47cb1b27a085d6413af039c57d30 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10099: 10099
  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pipe_crc_basic@darkscreen-read-crc
+igt@kms_pipe_crc_basic@negative-darkscreen-read-crc
-igt@xe_compute@ccs-mode-basic
-igt@xe_compute@ccs-mode-compute-kernel

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html

--===============5568081173232184452==
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
<tr><td><b>Series:</b></td><td>add new subtests for dark screen detection</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125880/">https://patchwork.freedesktop.org/series/125880/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13827 -&gt; IGTPW_10099</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10099 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7568 -&gt; IGTPW_10099</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13827: 6b6ae2eb530c47cb1b27a085d6413af039c57d30 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10099: 10099<br />
  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pipe_crc_basic@darkscreen-read-crc<br />
+igt@kms_pipe_crc_basic@negative-darkscreen-read-crc<br />
-igt@xe_compute@ccs-mode-basic<br />
-igt@xe_compute@ccs-mode-compute-kernel</p>

</body>
</html>

--===============5568081173232184452==--
