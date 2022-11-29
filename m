Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6363177349520077726=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 29 Nov 2022 10:06:56 -0000
Message-ID: <166971641657.23271.12377603918547937410@emeril.freedesktop.org>
References: <20221129084710.1151876-1-jani.nikula@intel.com>
In-Reply-To: <20221129084710.1151876-1-jani.nikula@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?intel=5Fvbt=5Fdecode=3A_decode_VBT_MIPI_sequence_v4_native_flag?=
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

--===============6363177349520077726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_vbt_decode: decode VBT MIPI sequence v4 native flag
URL   : https://patchwork.freedesktop.org/series/111425/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12441 -> IGTPW_8167
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html

Participating hosts (35 -> 34)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (2): bat-rpls-2 fi-rkl-11600 

Known issues
------------

  Here are the changes found in IGTPW_8167 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - bat-adlp-4:         NOTRUN -> [SKIP][1] ([fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlp-4:         NOTRUN -> [SKIP][2] ([i915#3546])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][3] ([i915#7229]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][5] ([i915#2867]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [DMESG-FAIL][7] ([i915#5591]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [INCOMPLETE][9] ([i915#7308] / [i915#7348]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-adlp-4/igt@i915_selftest@live@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7074 -> IGTPW_8167

  CI-20190529: 20190529
  CI_DRM_12441: 72fca6c11d0f5c628a6251f7bc420838c89d6acc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8167: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html
  IGT_7074: a7403583f1baee0548d86d1f2c9bb078384f997a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html

--===============6363177349520077726==
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
<tr><td><b>Series:</b></td><td>tools/intel_vbt_decode: decode VBT MIPI sequence v4 native flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111425/">https://patchwork.freedesktop.org/series/111425/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12441 -&gt; IGTPW_8167</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (2): bat-rpls-2 fi-rkl-11600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8167 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7074 -&gt; IGTPW_8167</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12441: 72fca6c11d0f5c628a6251f7bc420838c89d6acc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8167: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8167/index.html<br />
  IGT_7074: a7403583f1baee0548d86d1f2c9bb078384f997a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6363177349520077726==--
