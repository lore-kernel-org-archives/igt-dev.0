Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 09:10:12 -0000
Message-ID: <160983781245.13808.12546474774379516074@emeril.freedesktop.org>
References: <20210105081048.14389-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210105081048.14389-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev13=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1743726152=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1743726152==
Content-Type: multipart/alternative;
 boundary="===============6434662756208460172=="

--===============6434662756208460172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev13)
URL   : https://patchwork.freedesktop.org/series/82954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9544 -> IGTPW_5350
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html

Known issues
------------

  Here are the changes found in IGTPW_5350 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-WARN][2] ([i915#2826])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-kbl-soraka/igt@i915_selftest@live@gem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-kbl-soraka/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4] ([i915#2369] / [i915#794])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  * igt@runner@aborted:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][7] ([i915#1436] / [i915#2295])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-kbl-soraka/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][8] ([i915#402]) -> [PASS][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_selftest@live@blt:
    - fi-snb-2600:        [DMESG-FAIL][10] ([i915#1409]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-snb-2600/igt@i915_selftest@live@blt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-snb-2600/igt@i915_selftest@live@blt.html

  
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2826]: https://gitlab.freedesktop.org/drm/intel/issues/2826
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Participating hosts (42 -> 36)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5942 -> IGTPW_5350

  CI-20190529: 20190529
  CI_DRM_9544: b950eb2b863a3e5de7b9647aa037ed50d7dd687c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5350: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_allocator@alloc-simple
+igt@api_intel_allocator@fork-simple-once
+igt@api_intel_allocator@fork-simple-stress
+igt@api_intel_allocator@fork-simple-stress-signal
+igt@api_intel_allocator@print
+igt@api_intel_allocator@random-allocator
+igt@api_intel_allocator@reopen
+igt@api_intel_allocator@reopen-fork
+igt@api_intel_allocator@reserve
+igt@api_intel_allocator@reserve-simple
+igt@api_intel_allocator@reuse
+igt@api_intel_allocator@simple-allocator
+igt@api_intel_allocator@two-level-inception
+igt@api_intel_allocator@two-level-inception-interruptible
+igt@api_intel_bb@add-remove-objects
+igt@api_intel_bb@blit-noreloc-keep-cache-random
+igt@api_intel_bb@blit-noreloc-purge-cache-random
+igt@api_intel_bb@destroy-bb
+igt@api_intel_bb@object-noreloc-keep-cache-random
+igt@api_intel_bb@object-noreloc-keep-cache-simple
+igt@api_intel_bb@object-noreloc-purge-cache-random
+igt@api_intel_bb@object-noreloc-purge-cache-simple
+igt@api_intel_bb@object-reloc-keep-cache
+igt@api_intel_bb@object-reloc-purge-cache
+igt@api_intel_bb@purge-bb
+igt@api_intel_bb@reset-bb
-igt@api_intel_bb@check-canonical

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html

--===============6434662756208460172==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9544 -&gt; IGTPW_5350</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5350 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-kbl-soraka/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-kbl-soraka/igt@i915_selftest@live@gem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2826">i915#2826</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@blt:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9544/fi-snb-2600/igt@i915_selftest@live@blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1409">i915#1409</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/fi-snb-2600/igt@i915_selftest@live@blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 36)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5942 -&gt; IGTPW_5350</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9544: b950eb2b863a3e5de7b9647aa037ed50d7dd687c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5350: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5350/index.html<br />
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_allocator@alloc-simple<br />
+igt@api_intel_allocator@fork-simple-once<br />
+igt@api_intel_allocator@fork-simple-stress<br />
+igt@api_intel_allocator@fork-simple-stress-signal<br />
+igt@api_intel_allocator@print<br />
+igt@api_intel_allocator@random-allocator<br />
+igt@api_intel_allocator@reopen<br />
+igt@api_intel_allocator@reopen-fork<br />
+igt@api_intel_allocator@reserve<br />
+igt@api_intel_allocator@reserve-simple<br />
+igt@api_intel_allocator@reuse<br />
+igt@api_intel_allocator@simple-allocator<br />
+igt@api_intel_allocator@two-level-inception<br />
+igt@api_intel_allocator@two-level-inception-interruptible<br />
+igt@api_intel_bb@add-remove-objects<br />
+igt@api_intel_bb@blit-noreloc-keep-cache-random<br />
+igt@api_intel_bb@blit-noreloc-purge-cache-random<br />
+igt@api_intel_bb@destroy-bb<br />
+igt@api_intel_bb@object-noreloc-keep-cache-random<br />
+igt@api_intel_bb@object-noreloc-keep-cache-simple<br />
+igt@api_intel_bb@object-noreloc-purge-cache-random<br />
+igt@api_intel_bb@object-noreloc-purge-cache-simple<br />
+igt@api_intel_bb@object-reloc-keep-cache<br />
+igt@api_intel_bb@object-reloc-purge-cache<br />
+igt@api_intel_bb@purge-bb<br />
+igt@api_intel_bb@reset-bb<br />
-igt@api_intel_bb@check-canonical</p>

</body>
</html>

--===============6434662756208460172==--

--===============1743726152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1743726152==--
