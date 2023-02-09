Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4024262820026588436=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Thu, 09 Feb 2023 12:43:52 -0000
Message-ID: <167594663212.20201.11365712311948310509@emeril.freedesktop.org>
References: <20230209115039.34441-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230209115039.34441-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=3A_Add_stress_/_race_exercises_=28rev2=29?=
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

--===============4024262820026588436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/perf: Add stress / race exercises (rev2)
URL   : https://patchwork.freedesktop.org/series/113522/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12721 -> IGTPW_8475
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8475 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8475, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8475:

### IGT changes ###

#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [INCOMPLETE][1] ([i915#7156] / [i915#7913]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_8475 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-cfl-guc:         NOTRUN -> [SKIP][3] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-cfl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-cfl-guc:         [DMESG-FAIL][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-cfl-guc/igt@dmabuf@all-tests@dma_fence.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-cfl-guc/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-cfl-guc:         [ABORT][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-cfl-guc/igt@dmabuf@all-tests@sanitycheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-cfl-guc/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_selftest@live@dmabuf:
    - fi-bsw-nick:        [DMESG-FAIL][8] ([i915#7562] / [i915#7913]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][10] ([i915#5334]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [ABORT][12] ([i915#4983] / [i915#7911]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/bat-rpls-1/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/bat-rpls-1/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#7156]: https://gitlab.freedesktop.org/drm/intel/issues/7156
  [i915#7562]: https://gitlab.freedesktop.org/drm/intel/issues/7562
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7155 -> IGTPW_8475

  CI-20190529: 20190529
  CI_DRM_12721: e1f9df7a92c1e3da1009afa74dc1d08ef95c3d7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8475: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html
  IGT_7155: 75c508d4e19c65683d4060cb3a772df600aaf23e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_ctx_exec@barrier-race
+igt@kms_draw_crc@draw-method
-igt@kms_draw_crc@draw-method-blt
-igt@kms_draw_crc@draw-method-mmap-cpu
-igt@kms_draw_crc@draw-method-mmap-gtt
-igt@kms_draw_crc@draw-method-mmap-wc
-igt@kms_draw_crc@draw-method-pwrite
-igt@kms_draw_crc@draw-method-render

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html

--===============4024262820026588436==
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
<tr><td><b>Series:</b></td><td>tests/i915/perf: Add stress / race exercises (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113522/">https://patchwork.freedesktop.org/series/113522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12721 -&gt; IGTPW_8475</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8475 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8475, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8475:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7156">i915#7156</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8475 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium_hpd@common-hpd-after-suspend:<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-cfl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-cfl-guc/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-cfl-guc/igt@dmabuf@all-tests@dma_fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-cfl-guc/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-cfl-guc/igt@dmabuf@all-tests@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7562">i915#7562</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12721/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7155 -&gt; IGTPW_8475</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12721: e1f9df7a92c1e3da1009afa74dc1d08ef95c3d7c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8475: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8475/index.html<br />
  IGT_7155: 75c508d4e19c65683d4060cb3a772df600aaf23e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_ctx_exec@barrier-race<br />
+igt@kms_draw_crc@draw-method<br />
-igt@kms_draw_crc@draw-method-blt<br />
-igt@kms_draw_crc@draw-method-mmap-cpu<br />
-igt@kms_draw_crc@draw-method-mmap-gtt<br />
-igt@kms_draw_crc@draw-method-mmap-wc<br />
-igt@kms_draw_crc@draw-method-pwrite<br />
-igt@kms_draw_crc@draw-method-render</p>

</body>
</html>

--===============4024262820026588436==--
