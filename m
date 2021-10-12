Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8212495348530683211=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 Oct 2021 05:47:37 -0000
Message-ID: <163401765732.14286.4333371009390798533@emeril.freedesktop.org>
References: <20211012050122.21907-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20211012050122.21907-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fsuspend=3A_Add_support_for_local_memory?=
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8212495348530683211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_suspend: Add support for local memory
URL   : https://patchwork.freedesktop.org/series/95706/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10720 -> IGTPW_6309
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6309 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6309, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6309:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_suspend@basic-s0@smem} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-icl-y:           [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-icl-y/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-icl-y/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10720 and IGTPW_6309:

### New IGT tests (2) ###

  * igt@gem_exec_suspend@basic-s0@smem:
    - Statuses : 1 incomplete(s) 31 pass(s)
    - Exec time: [0.0, 20.39] s

  * igt@gem_exec_suspend@basic-s3@smem:
    - Statuses : 31 pass(s)
    - Exec time: [1.24, 13.60] s

  

Known issues
------------

  Here are the changes found in IGTPW_6309 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-compute:
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] ([fdo#109271]) +49 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-elk-e7500/igt@amdgpu/amd_basic@cs-compute.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][5] ([fdo#109271]) +23 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - fi-cfl-8109u:       [PASS][6] -> [FAIL][7] ([i915#4165]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][8] -> [DMESG-WARN][9] ([i915#4269])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [PASS][10] -> [DMESG-WARN][11] ([i915#295]) +18 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#4165]: https://gitlab.freedesktop.org/drm/intel/issues/4165
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269


Participating hosts (35 -> 34)
------------------------------

  Additional (1): fi-elk-e7500 
  Missing    (2): fi-kbl-soraka fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6242 -> IGTPW_6309

  CI-20190529: 20190529
  CI_DRM_10720: 8a8d1f74b64edddbbb43fa4be5e438a12ba70707 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6309: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html
  IGT_6242: 721fd85ee95225ed5df322f7182bdfa9b86a3e68 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html

--===============8212495348530683211==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_suspend: Add support for local memory</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95706/">https://patchwork.freedesktop.org/series/95706/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10720 -&gt; IGTPW_6309</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6309 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6309, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6309:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_suspend@basic-s0@smem} (NEW):</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-icl-y/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-icl-y/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10720 and IGTPW_6309:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>Statuses : 1 incomplete(s) 31 pass(s)</li>
<li>Exec time: [0.0, 20.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [1.24, 13.60] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6309 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-compute:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-elk-e7500/igt@amdgpu/amd_basic@cs-compute.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4165">i915#4165</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10720/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) +18 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Additional (1): fi-elk-e7500 <br />
  Missing    (2): fi-kbl-soraka fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6242 -&gt; IGTPW_6309</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10720: 8a8d1f74b64edddbbb43fa4be5e438a12ba70707 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6309: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6309/index.html<br />
  IGT_6242: 721fd85ee95225ed5df322f7182bdfa9b86a3e68 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8212495348530683211==--
