Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Feb 2021 13:21:03 -0000
Message-ID: <161348166320.32283.5488483928571909863@emeril.freedesktop.org>
References: <20210216114007.122175-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210216114007.122175-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev21=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1195933565=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1195933565==
Content-Type: multipart/alternative;
 boundary="===============1402532786787762814=="

--===============1402532786787762814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev21)
URL   : https://patchwork.freedesktop.org/series/82954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9778 -> IGTPW_5513
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5513:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@allocator-basic-reserve} (NEW):
    - fi-glk-dsi:         NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-glk-dsi/igt@gem_softpin@allocator-basic-reserve.html
    - fi-cml-s:           NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cml-s/igt@gem_softpin@allocator-basic-reserve.html
    - fi-cfl-guc:         NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cfl-guc/igt@gem_softpin@allocator-basic-reserve.html
    - fi-kbl-soraka:      NOTRUN -> [WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-soraka/igt@gem_softpin@allocator-basic-reserve.html
    - {fi-ehl-1}:         NOTRUN -> [WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ehl-1/igt@gem_softpin@allocator-basic-reserve.html
    - fi-skl-6700k2:      NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-skl-6700k2/igt@gem_softpin@allocator-basic-reserve.html
    - fi-bsw-n3050:       NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bsw-n3050/igt@gem_softpin@allocator-basic-reserve.html
    - fi-tgl-u2:          NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-u2/igt@gem_softpin@allocator-basic-reserve.html
    - fi-cml-u2:          NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cml-u2/igt@gem_softpin@allocator-basic-reserve.html
    - {fi-jsl-1}:         NOTRUN -> [WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-jsl-1/igt@gem_softpin@allocator-basic-reserve.html
    - fi-cfl-8700k:       NOTRUN -> [WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cfl-8700k/igt@gem_softpin@allocator-basic-reserve.html
    - fi-bxt-dsi:         NOTRUN -> [WARN][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bxt-dsi/igt@gem_softpin@allocator-basic-reserve.html
    - fi-skl-6600u:       NOTRUN -> [WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-skl-6600u/igt@gem_softpin@allocator-basic-reserve.html
    - fi-cfl-8109u:       NOTRUN -> [WARN][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cfl-8109u/igt@gem_softpin@allocator-basic-reserve.html
    - {fi-tgl-dsi}:       NOTRUN -> [WARN][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-dsi/igt@gem_softpin@allocator-basic-reserve.html
    - fi-bsw-nick:        NOTRUN -> [WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bsw-nick/igt@gem_softpin@allocator-basic-reserve.html
    - fi-icl-y:           NOTRUN -> [WARN][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-icl-y/igt@gem_softpin@allocator-basic-reserve.html
    - fi-apl-guc:         NOTRUN -> [WARN][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-apl-guc/igt@gem_softpin@allocator-basic-reserve.html
    - {fi-ehl-2}:         NOTRUN -> [WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ehl-2/igt@gem_softpin@allocator-basic-reserve.html
    - fi-kbl-r:           NOTRUN -> [WARN][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-r/igt@gem_softpin@allocator-basic-reserve.html
    - fi-bdw-5557u:       NOTRUN -> [WARN][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bdw-5557u/igt@gem_softpin@allocator-basic-reserve.html
    - fi-kbl-7500u:       NOTRUN -> [WARN][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-7500u/igt@gem_softpin@allocator-basic-reserve.html
    - fi-kbl-x1275:       NOTRUN -> [WARN][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-x1275/igt@gem_softpin@allocator-basic-reserve.html
    - fi-bsw-kefka:       NOTRUN -> [WARN][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bsw-kefka/igt@gem_softpin@allocator-basic-reserve.html
    - fi-kbl-guc:         NOTRUN -> [WARN][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-guc/igt@gem_softpin@allocator-basic-reserve.html
    - {fi-rkl-11500t}:    NOTRUN -> [WARN][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-rkl-11500t/igt@gem_softpin@allocator-basic-reserve.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9778 and IGTPW_5513:

### New IGT tests (2) ###

  * igt@gem_softpin@allocator-basic:
    - Statuses : 27 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.06] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses : 1 dmesg-warn(s) 9 skip(s) 26 warn(s)
    - Exec time: [0.0, 1.16] s

  

Known issues
------------

  Here are the changes found in IGTPW_5513 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [PASS][27] -> [DMESG-WARN][28] ([i915#2411] / [i915#402])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * {igt@gem_softpin@allocator-basic} (NEW):
    - fi-byt-j1900:       NOTRUN -> [SKIP][29] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-byt-j1900/igt@gem_softpin@allocator-basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-pnv-d510/igt@gem_softpin@allocator-basic.html
    - {fi-hsw-gt1}:       NOTRUN -> [SKIP][31] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-hsw-gt1/igt@gem_softpin@allocator-basic.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-snb-2520m/igt@gem_softpin@allocator-basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ivb-3770/igt@gem_softpin@allocator-basic.html
    - fi-snb-2600:        NOTRUN -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-snb-2600/igt@gem_softpin@allocator-basic.html

  * {igt@gem_softpin@allocator-basic-reserve} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][35] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-elk-e7500/igt@gem_softpin@allocator-basic-reserve.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html
    - fi-ilk-650:         NOTRUN -> [SKIP][37] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html
    - fi-tgl-y:           NOTRUN -> [DMESG-WARN][38] ([i915#402])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@gem_softpin@allocator-basic-reserve.html

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-kbl-soraka/igt@i915_module_load@reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][41] -> [INCOMPLETE][42] ([i915#142] / [i915#2405])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [PASS][43] -> [DMESG-WARN][44] ([i915#402])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  * igt@runner@aborted:
    - fi-byt-j1900:       NOTRUN -> [FAIL][45] ([i915#1814] / [i915#2505])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-byt-j1900/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][46] ([i915#402]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][48] ([i915#1372]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 39)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6004 -> IGTPW_5513

  CI-20190529: 20190529
  CI_DRM_9778: b5716c4364252ef29432da4bb14c9e4149d2d4ce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5513: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html
  IGT_6004: fe9ac2aeffc1828c6d61763a611a44fbd450aa96 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_allocator@alloc-simple
+igt@api_intel_allocator@execbuf-with-allocator
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
+igt@api_intel_bb@bb-with-allocator
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html

--===============1402532786787762814==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev21)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9778 -&gt; IGTPW_5513</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5513:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@allocator-basic-reserve} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-glk-dsi/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cml-s/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cfl-guc/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-soraka/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ehl-1/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-skl-6700k2/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bsw-n3050/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-u2/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cml-u2/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-jsl-1/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cfl-8700k/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bxt-dsi/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-skl-6600u/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-cfl-8109u/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-dsi/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bsw-nick/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-icl-y/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-apl-guc/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ehl-2/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-r/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bdw-5557u/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-7500u/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-x1275/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-bsw-kefka/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-guc/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
<li>
<p>{fi-rkl-11500t}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-rkl-11500t/igt@gem_softpin@allocator-basic-reserve.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9778 and IGTPW_5513:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 27 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 9 skip(s) 26 warn(s)</li>
<li>Exec time: [0.0, 1.16] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5513 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@allocator-basic} (NEW):</p>
<ul>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-byt-j1900/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-pnv-d510/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-hsw-gt1/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-snb-2520m/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ivb-3770/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-snb-2600/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@allocator-basic-reserve} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-elk-e7500/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@gem_softpin@allocator-basic-reserve.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-byt-j1900/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9778/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 39)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6004 -&gt; IGTPW_5513</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9778: b5716c4364252ef29432da4bb14c9e4149d2d4ce @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5513: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5513/index.html<br />
  IGT_6004: fe9ac2aeffc1828c6d61763a611a44fbd450aa96 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_allocator@alloc-simple<br />
+igt@api_intel_allocator@execbuf-with-allocator<br />
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
+igt@api_intel_bb@bb-with-allocator<br />
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

--===============1402532786787762814==--

--===============1195933565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1195933565==--
