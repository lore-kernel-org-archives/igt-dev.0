Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6909112910294377852=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Oct 2023 23:48:01 -0000
Message-ID: <169810488121.19838.5776427480718805657@emeril.freedesktop.org>
References: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW1wcm92?=
 =?utf-8?q?e_IGT_runner_dry-run_logic?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6909112910294377852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve IGT runner dry-run logic
URL   : https://patchwork.freedesktop.org/series/125391/
State : success

== Summary ==

CI Bug Log - changes from IGT_7551 -> IGTPW_10039
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html

Participating hosts (36 -> 32)
------------------------------

  Missing    (4): fi-hsw-4770 bat-kbl-2 fi-bsw-n3050 bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_10039 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-dg2-9:          NOTRUN -> [SKIP][1] ([i915#1845] / [i915#9197])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [INCOMPLETE][2] ([i915#9275]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][4] ([i915#8668]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7551 -> IGTPW_10039

  CI-20190529: 20190529
  CI_DRM_13777: 1b4fd688d213556268c50f853746c94c9a0cfee7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10039: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_mmap@cpu-caching-coh
-igt@xe_pat@pat-index-all
-igt@xe_pat@pat-index-common
-igt@xe_pat@pat-index-xe2
-igt@xe_pat@pat-index-xehpc
-igt@xe_pat@pat-index-xelp
-igt@xe_pat@pat-index-xelpg
-igt@xe_pat@userptr-coh-none

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html

--===============6909112910294377852==
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
<tr><td><b>Series:</b></td><td>Improve IGT runner dry-run logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125391/">https://patchwork.freedesktop.org/series/125391/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7551 -&gt; IGTPW_10039</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html</p>
<h2>Participating hosts (36 -&gt; 32)</h2>
<p>Missing    (4): fi-hsw-4770 bat-kbl-2 fi-bsw-n3050 bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10039 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc:<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7551 -&gt; IGTPW_10039</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13777: 1b4fd688d213556268c50f853746c94c9a0cfee7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10039: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10039/index.html<br />
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_mmap@cpu-caching-coh<br />
-igt@xe_pat@pat-index-all<br />
-igt@xe_pat@pat-index-common<br />
-igt@xe_pat@pat-index-xe2<br />
-igt@xe_pat@pat-index-xehpc<br />
-igt@xe_pat@pat-index-xelp<br />
-igt@xe_pat@pat-index-xelpg<br />
-igt@xe_pat@userptr-coh-none</p>

</body>
</html>

--===============6909112910294377852==--

