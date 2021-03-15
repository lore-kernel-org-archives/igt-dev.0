Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 15 Mar 2021 17:59:46 -0000
Message-ID: <161583118695.30953.16137404994204685009@emeril.freedesktop.org>
References: <20210315165842.64488-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210315165842.64488-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev26=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2012033723=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2012033723==
Content-Type: multipart/alternative;
 boundary="===============1051367338569111556=="

--===============1051367338569111556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev26)
URL   : https://patchwork.freedesktop.org/series/82954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9857 -> IGTPW_5601
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9857 and IGTPW_5601:

### New IGT tests (2) ###

  * igt@gem_softpin@allocator-basic:
    - Statuses : 27 pass(s) 10 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses : 27 pass(s) 10 skip(s)
    - Exec time: [0.0, 1.06] s

  

Known issues
------------

  Here are the changes found in IGTPW_5601 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [PASS][1] -> [TIMEOUT][2] ([i915#3145])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  * {igt@gem_softpin@allocator-basic} (NEW):
    - fi-byt-j1900:       NOTRUN -> [SKIP][3] ([fdo#109271]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-byt-j1900/igt@gem_softpin@allocator-basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-pnv-d510/igt@gem_softpin@allocator-basic.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][5] ([fdo#109271]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-bwr-2160/igt@gem_softpin@allocator-basic.html
    - {fi-hsw-gt1}:       NOTRUN -> [SKIP][6] ([fdo#109271]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-hsw-gt1/igt@gem_softpin@allocator-basic.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][7] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-snb-2520m/igt@gem_softpin@allocator-basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-ivb-3770/igt@gem_softpin@allocator-basic.html
    - fi-snb-2600:        NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-snb-2600/igt@gem_softpin@allocator-basic.html

  * {igt@gem_softpin@allocator-basic-reserve} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-elk-e7500/igt@gem_softpin@allocator-basic-reserve.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html
    - fi-ilk-650:         NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-8809g:       [PASS][13] -> [TIMEOUT][14] ([i915#2502] / [i915#3145])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-kbl-8809g/igt@gem_tiled_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-kbl-8809g/igt@gem_tiled_blits@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [TIMEOUT][15] ([i915#3145]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@client:
    - fi-glk-dsi:         [DMESG-FAIL][17] ([i915#3047]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-glk-dsi/igt@i915_selftest@live@client.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-glk-dsi/igt@i915_selftest@live@client.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#3047]: https://gitlab.freedesktop.org/drm/intel/issues/3047
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6032 -> IGTPW_5601

  CI-20190529: 20190529
  CI_DRM_9857: 0f9254e98a162e962fa4b9517645c4be44367e27 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5601: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html
  IGT_6032: f3fd2cc23455929d0ef276e05e02416b86a6db91 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_allocator@alloc-simple
+igt@api_intel_allocator@execbuf-with-allocator
+igt@api_intel_allocator@fork-simple-once
+igt@api_intel_allocator@fork-simple-stress
+igt@api_intel_allocator@fork-simple-stress-signal
+igt@api_intel_allocator@open-vm
+igt@api_intel_allocator@random-allocator
+igt@api_intel_allocator@reloc-allocator
+igt@api_intel_allocator@reopen
+igt@api_intel_allocator@reopen-fork
+igt@api_intel_allocator@reserve
+igt@api_intel_allocator@reserve-simple
+igt@api_intel_allocator@reuse
+igt@api_intel_allocator@simple-allocator
+igt@api_intel_allocator@standalone
+igt@api_intel_allocator@two-level-inception
+igt@api_intel_allocator@two-level-inception-interruptible
+igt@api_intel_bb@add-remove-objects
+igt@api_intel_bb@bb-with-allocator
+igt@api_intel_bb@bb-with-vm
+igt@api_intel_bb@blit-noreloc-keep-cache-random
+igt@api_intel_bb@blit-noreloc-purge-cache-random
+igt@api_intel_bb@destroy-bb
+igt@api_intel_bb@last-page
+igt@api_intel_bb@object-noreloc-keep-cache-random
+igt@api_intel_bb@object-noreloc-keep-cache-simple
+igt@api_intel_bb@object-noreloc-purge-cache-random
+igt@api_intel_bb@object-noreloc-purge-cache-simple
+igt@api_intel_bb@object-reloc-keep-cache
+igt@api_intel_bb@object-reloc-purge-cache
+igt@api_intel_bb@purge-bb
+igt@api_intel_bb@reset-bb
+igt@gem_softpin@allocator-basic
+igt@gem_softpin@allocator-basic-reserve
+igt@gem_softpin@allocator-fork
+igt@gem_softpin@allocator-nopin
+igt@gem_softpin@allocator-nopin-reserve
-igt@api_intel_bb@check-canonical

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html

--===============1051367338569111556==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev26)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9857 -&gt; IGTPW_5601</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9857 and IGTPW_5601:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 27 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 27 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 1.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5601 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>)</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@allocator-basic} (NEW):</p>
<ul>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-byt-j1900/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-pnv-d510/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-bwr-2160/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-hsw-gt1/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-snb-2520m/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-ivb-3770/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-snb-2600/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@allocator-basic-reserve} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-elk-e7500/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-kbl-8809g/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-kbl-8809g/igt@gem_tiled_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/fi-glk-dsi/igt@i915_selftest@live@client.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3047">i915#3047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/fi-glk-dsi/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6032 -&gt; IGTPW_5601</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9857: 0f9254e98a162e962fa4b9517645c4be44367e27 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5601: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html<br />
  IGT_6032: f3fd2cc23455929d0ef276e05e02416b86a6db91 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_allocator@alloc-simple<br />
+igt@api_intel_allocator@execbuf-with-allocator<br />
+igt@api_intel_allocator@fork-simple-once<br />
+igt@api_intel_allocator@fork-simple-stress<br />
+igt@api_intel_allocator@fork-simple-stress-signal<br />
+igt@api_intel_allocator@open-vm<br />
+igt@api_intel_allocator@random-allocator<br />
+igt@api_intel_allocator@reloc-allocator<br />
+igt@api_intel_allocator@reopen<br />
+igt@api_intel_allocator@reopen-fork<br />
+igt@api_intel_allocator@reserve<br />
+igt@api_intel_allocator@reserve-simple<br />
+igt@api_intel_allocator@reuse<br />
+igt@api_intel_allocator@simple-allocator<br />
+igt@api_intel_allocator@standalone<br />
+igt@api_intel_allocator@two-level-inception<br />
+igt@api_intel_allocator@two-level-inception-interruptible<br />
+igt@api_intel_bb@add-remove-objects<br />
+igt@api_intel_bb@bb-with-allocator<br />
+igt@api_intel_bb@bb-with-vm<br />
+igt@api_intel_bb@blit-noreloc-keep-cache-random<br />
+igt@api_intel_bb@blit-noreloc-purge-cache-random<br />
+igt@api_intel_bb@destroy-bb<br />
+igt@api_intel_bb@last-page<br />
+igt@api_intel_bb@object-noreloc-keep-cache-random<br />
+igt@api_intel_bb@object-noreloc-keep-cache-simple<br />
+igt@api_intel_bb@object-noreloc-purge-cache-random<br />
+igt@api_intel_bb@object-noreloc-purge-cache-simple<br />
+igt@api_intel_bb@object-reloc-keep-cache<br />
+igt@api_intel_bb@object-reloc-purge-cache<br />
+igt@api_intel_bb@purge-bb<br />
+igt@api_intel_bb@reset-bb<br />
+igt@gem_softpin@allocator-basic<br />
+igt@gem_softpin@allocator-basic-reserve<br />
+igt@gem_softpin@allocator-fork<br />
+igt@gem_softpin@allocator-nopin<br />
+igt@gem_softpin@allocator-nopin-reserve<br />
-igt@api_intel_bb@check-canonical</p>

</body>
</html>

--===============1051367338569111556==--

--===============2012033723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2012033723==--
