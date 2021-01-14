Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 Jan 2021 13:05:18 -0000
Message-ID: <161062951898.19649.16132520598801449453@emeril.freedesktop.org>
References: <20210114122233.32906-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210114122233.32906-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev15=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1301323628=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1301323628==
Content-Type: multipart/alternative;
 boundary="===============5499395053016802517=="

--===============5499395053016802517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev15)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9607 -> IGTPW_5390
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5390 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5390, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5390:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_5390 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-tgl-y/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-tgl-y/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-snb-2600:        [PASS][5] -> [DMESG-WARN][6] ([i915#2772])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][7] ([i915#1436])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-bsw-nick/igt@runner@aborted.html
    - fi-snb-2600:        NOTRUN -> [FAIL][8] ([i915#698])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-snb-2600/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2772]: https://gitlab.freedesktop.org/drm/intel/issues/2772
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698


Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-ctg-p8600 fi-dg1-1 fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5957 -> IGTPW_5390

  CI-20190529: 20190529
  CI_DRM_9607: 1cd1433e50924f963a31d50a0bfcccb1f872544f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5390: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html
  IGT_5957: 2a2b3418f7458dfa1fac255cc5c71603f617690a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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
+igt@gem_softpin@allocator-basic
+igt@gem_softpin@allocator-fork
+igt@gem_softpin@allocator-nopin
-igt@api_intel_bb@check-canonical

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html

--===============5499395053016802517==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9607 -&gt; IGTPW_5390</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5390 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5390, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5390:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5390 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-tgl-y/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-tgl-y/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2772">i915#2772</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-snb-2600/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/698">i915#698</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_vgem@basic-fence-flip:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9607/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-ctg-p8600 fi-dg1-1 fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5957 -&gt; IGTPW_5390</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9607: 1cd1433e50924f963a31d50a0bfcccb1f872544f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5390: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5390/index.html<br />
  IGT_5957: 2a2b3418f7458dfa1fac255cc5c71603f617690a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
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
+igt@gem_softpin@allocator-basic<br />
+igt@gem_softpin@allocator-fork<br />
+igt@gem_softpin@allocator-nopin<br />
-igt@api_intel_bb@check-canonical</p>

</body>
</html>

--===============5499395053016802517==--

--===============1301323628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1301323628==--
