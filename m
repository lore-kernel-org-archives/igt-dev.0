Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0104113848045283912=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 01 Nov 2022 04:25:34 -0000
Message-ID: <166727673425.13549.2348862371731709111@emeril.freedesktop.org>
References: <20221031121730.32056-1-matthew.auld@intel.com>
In-Reply-To: <20221031121730.32056-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/query=3A_use_48B=5FADDRESS_in_upload?=
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

--===============0104113848045283912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/query: use 48B_ADDRESS in upload
URL   : https://patchwork.freedesktop.org/series/110319/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12324 -> IGTPW_8015
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-rkl-11600 

Known issues
------------

  Here are the changes found in IGTPW_8015 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] ([i915#4785])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - fi-cml-u2:          [PASS][3] -> [INCOMPLETE][4] ([i915#7379])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/fi-cml-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-cml-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#4312] / [i915#5594])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][6] ([i915#2582]) -> [PASS][7] +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-rpls-2/igt@fbdev@read.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlm-1}:       [DMESG-WARN][8] ([i915#2867]) -> [PASS][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [DMESG-WARN][10] ([i915#6687]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7379]: https://gitlab.freedesktop.org/drm/intel/issues/7379


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7031 -> IGTPW_8015

  CI-20190529: 20190529
  CI_DRM_12324: 486919adf4f568444937aae1ff6a1ffee1361a93 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html
  IGT_7031: 54abd9445f732b55556d4e612d24f50803515904 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html

--===============0104113848045283912==
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
<tr><td><b>Series:</b></td><td>tests/i915/query: use 48B_ADDRESS in upload</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110319/">https://patchwork.freedesktop.org/series/110319/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12324 -&gt; IGTPW_8015</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-rkl-11600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8015 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/fi-cml-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-cml-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7379">i915#7379</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7031 -&gt; IGTPW_8015</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12324: 486919adf4f568444937aae1ff6a1ffee1361a93 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html<br />
  IGT_7031: 54abd9445f732b55556d4e612d24f50803515904 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0104113848045283912==--
