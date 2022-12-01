Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7774842240607315329=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 01 Dec 2022 14:42:37 -0000
Message-ID: <166990575785.14636.4105832181688597315@emeril.freedesktop.org>
References: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_random_allocator_and_improve_reloc_one?=
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

--===============7774842240607315329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove random allocator and improve reloc one
URL   : https://patchwork.freedesktop.org/series/111533/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7078 -> IGTPW_8180
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8180 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8180, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (2): bat-adlp-6 fi-pnv-d510 
  Missing    (2): fi-ilk-m540 fi-rkl-11600 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8180:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@fds:
    - fi-adl-ddr5:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-adl-ddr5/igt@gem_exec_parallel@engines@fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-adl-ddr5/igt@gem_exec_parallel@engines@fds.html
    - fi-rkl-guc:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-rkl-guc/igt@gem_exec_parallel@engines@fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-rkl-guc/igt@gem_exec_parallel@engines@fds.html
    - bat-dg1-6:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg1-6/igt@gem_exec_parallel@engines@fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg1-6/igt@gem_exec_parallel@engines@fds.html
    - bat-adlp-4:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adlp-4/igt@gem_exec_parallel@engines@fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@gem_exec_parallel@engines@fds.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@fds:
    - {bat-dg1-7}:        [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg1-7/igt@gem_exec_parallel@engines@fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg1-7/igt@gem_exec_parallel@engines@fds.html
    - {bat-adln-1}:       [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adln-1/igt@gem_exec_parallel@engines@fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adln-1/igt@gem_exec_parallel@engines@fds.html
    - {bat-rplp-1}:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rplp-1/igt@gem_exec_parallel@engines@fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rplp-1/igt@gem_exec_parallel@engines@fds.html
    - {bat-dg2-9}:        [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg2-9/igt@gem_exec_parallel@engines@fds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg2-9/igt@gem_exec_parallel@engines@fds.html
    - {bat-rpls-2}:       [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rpls-2/igt@gem_exec_parallel@engines@fds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rpls-2/igt@gem_exec_parallel@engines@fds.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-6/igt@gem_exec_parallel@engines@fds.html
    - {bat-dg2-11}:       [PASS][20] -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg2-11/igt@gem_exec_parallel@engines@fds.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg2-11/igt@gem_exec_parallel@engines@fds.html
    - {bat-atsm-1}:       [PASS][22] -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-atsm-1/igt@gem_exec_parallel@engines@fds.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-atsm-1/igt@gem_exec_parallel@engines@fds.html
    - {bat-dg2-8}:        [PASS][24] -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg2-8/igt@gem_exec_parallel@engines@fds.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg2-8/igt@gem_exec_parallel@engines@fds.html
    - {bat-adlm-1}:       [PASS][26] -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adlm-1/igt@gem_exec_parallel@engines@fds.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlm-1/igt@gem_exec_parallel@engines@fds.html

  
Known issues
------------

  Here are the changes found in IGTPW_8180 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][28] ([i915#7156])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][29] -> [INCOMPLETE][30] ([i915#4785])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - bat-adlp-4:         NOTRUN -> [SKIP][31] ([fdo#111827])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlp-4:         NOTRUN -> [SKIP][32] ([i915#3546])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][33] ([fdo#109271]) +44 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][34] ([i915#2582]) -> [PASS][35] +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rpls-2/igt@fbdev@read.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rpls-2/igt@fbdev@read.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [INCOMPLETE][36] ([i915#7308] / [i915#7348]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [INCOMPLETE][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][40] ([i915#4983]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rpls-2/igt@i915_selftest@live@reset.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7156]: https://gitlab.freedesktop.org/drm/intel/issues/7156
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7535]: https://gitlab.freedesktop.org/drm/intel/issues/7535


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7078 -> IGTPW_8180

  CI-20190529: 20190529
  CI_DRM_12459: 7d2ea1515d919f6e630c7f0f216bc0498322c3aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8180: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html
  IGT_7078: 71bce31c26998d5d53cff3138049261fd6c4fbaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@api_intel_allocator@random-allocator
-igt@api_intel_allocator@reserve
-igt@api_intel_allocator@reuse
-igt@api_intel_bb@blit-noreloc-keep-cache-random
-igt@api_intel_bb@blit-noreloc-purge-cache-random
-igt@api_intel_bb@object-noreloc-keep-cache-random
-igt@api_intel_bb@object-noreloc-purge-cache-random

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html

--===============7774842240607315329==
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
<tr><td><b>Series:</b></td><td>Remove random allocator and improve reloc one</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111533/">https://patchwork.freedesktop.org/series/111533/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7078 -&gt; IGTPW_8180</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8180 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8180, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (2): bat-adlp-6 fi-pnv-d510 <br />
  Missing    (2): fi-ilk-m540 fi-rkl-11600 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8180:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-adl-ddr5/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-adl-ddr5/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-rkl-guc/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-rkl-guc/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg1-6/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg1-6/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adlp-4/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>
<p>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg1-7/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg1-7/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adln-1/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adln-1/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rplp-1/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rplp-1/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg2-9/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg2-9/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rpls-2/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rpls-2/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-6/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg2-11/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg2-11/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-atsm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-atsm-1/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-atsm-1/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-dg2-8/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-dg2-8/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adlm-1/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlm-1/igt@gem_exec_parallel@engines@fds.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8180 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7156">i915#7156</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/fi-kbl-soraka/igt@i915_selftest@live@requests.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7078/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7078 -&gt; IGTPW_8180</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12459: 7d2ea1515d919f6e630c7f0f216bc0498322c3aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8180: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8180/index.html<br />
  IGT_7078: 71bce31c26998d5d53cff3138049261fd6c4fbaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@api_intel_allocator@random-allocator<br />
-igt@api_intel_allocator@reserve<br />
-igt@api_intel_allocator@reuse<br />
-igt@api_intel_bb@blit-noreloc-keep-cache-random<br />
-igt@api_intel_bb@blit-noreloc-purge-cache-random<br />
-igt@api_intel_bb@object-noreloc-keep-cache-random<br />
-igt@api_intel_bb@object-noreloc-purge-cache-random</p>

</body>
</html>

--===============7774842240607315329==--
