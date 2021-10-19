Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2153796358442524011=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 Oct 2021 13:29:33 -0000
Message-ID: <163465017378.5187.1132271593174791474@emeril.freedesktop.org>
References: <20211019122042.1699646-1-apoorva1.singh@intel.com>
In-Reply-To: <20211019122042.1699646-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fcreate=3A_Add_support_for_local_memory_=28rev2=29?=
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
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2153796358442524011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_create: Add support for local memory (rev2)
URL   : https://patchwork.freedesktop.org/series/95411/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10759 -> IGTPW_6332
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html

New tests
---------

  New tests have been introduced between CI_DRM_10759 and IGTPW_6332:

### New IGT tests (1) ###

  * igt@gem_exec_create@basic@smem:
    - Statuses : 33 pass(s)
    - Exec time: [2.03, 2.23] s

  

Known issues
------------

  Here are the changes found in IGTPW_6332 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - fi-cfl-8109u:       [FAIL][1] ([i915#4165]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [DMESG-WARN][3] ([i915#295]) -> [PASS][4] +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [DMESG-WARN][5] ([i915#295]) -> [FAIL][6] ([i915#2546])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#4165]: https://gitlab.freedesktop.org/drm/intel/issues/4165


Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-bsw-cyan bat-dg1-6 fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6255 -> IGTPW_6332

  CI-20190529: 20190529
  CI_DRM_10759: 7d20db527045a6b88c80aed1df662e9ccf323a77 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6332: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html
  IGT_6255: 9b0881254557edeaf273b2196309fc4e22ea0312 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html

--===============2153796358442524011==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_create: Add support for local memory (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95411/">https://patchwork.freedesktop.org/series/95411/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10759 -&gt; IGTPW_6332</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10759 and IGTPW_6332:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_exec_create@basic@smem:<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [2.03, 2.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6332 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4165">i915#4165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-bsw-cyan bat-dg1-6 fi-snb-2600 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6255 -&gt; IGTPW_6332</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10759: 7d20db527045a6b88c80aed1df662e9ccf323a77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6332: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html<br />
  IGT_6255: 9b0881254557edeaf273b2196309fc4e22ea0312 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2153796358442524011==--
