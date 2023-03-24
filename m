Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6081323765044597508=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Date: Fri, 24 Mar 2023 08:47:19 -0000
Message-ID: <167964763965.30852.7794474780918863579@emeril.freedesktop.org>
References: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_KUnit_=28rev3=29?=
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

--===============6081323765044597508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce KUnit (rev3)
URL   : https://patchwork.freedesktop.org/series/114612/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7216 -> IGTPW_8677
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8677 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8677, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8677:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_8677 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][3] ([i915#6687] / [i915#7978])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][4] -> [ABORT][5] ([i915#7911] / [i915#7913])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [PASS][6] -> [DMESG-WARN][7] ([i915#8073])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [DMESG-WARN][8] ([i915#7699]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-dg2-11/igt@i915_selftest@live@migrate.html
    - bat-atsm-1:         [DMESG-FAIL][10] ([i915#7699]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][12] ([i915#4983]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-rpls-1/igt@i915_selftest@live@reset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8073]: https://gitlab.freedesktop.org/drm/intel/issues/8073


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7216 -> IGTPW_8677

  CI-20190529: 20190529
  CI_DRM_12907: 3e6be7c63e438996c88d6ba51a7d3025c56086d0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8677: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html
  IGT_7216: 0682c2b07c7eab2bf384899c3da3cc7f08083847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@drm_buddy@all-tests
-igt@drm_mm@all-tests

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html

--===============6081323765044597508==
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
<tr><td><b>Series:</b></td><td>Introduce KUnit (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114612/">https://patchwork.freedesktop.org/series/114612/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7216 -&gt; IGTPW_8677</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8677 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8677, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8677:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8677 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8073">i915#8073</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-atsm-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7216/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7216 -&gt; IGTPW_8677</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12907: 3e6be7c63e438996c88d6ba51a7d3025c56086d0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8677: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8677/index.html<br />
  IGT_7216: 0682c2b07c7eab2bf384899c3da3cc7f08083847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@drm_buddy@all-tests<br />
-igt@drm_mm@all-tests</p>

</body>
</html>

--===============6081323765044597508==--
